// MK3Reboot.cpp : Defines the entry point for the application.
//

#pragma warning(disable:4996)
#pragma warning(disable:4018)
#pragma warning(disable:4244)


#include "framework.h"
#include "MK3Reboot.h"
#include "timeapi.h"
#include "stdafx.h"
#include "stdio.h"
#include "types.h"
#include <xaudio2.h>

#include <Xinput.h>
#pragma comment(lib, "Xinput.lib")
#pragma comment(lib, "Xinput9_1_0.lib")

#include "ini.h"
#include <string>
#include <vector>

#include "FileCache.h"

extern "C"
{
#include "psxlib.h"
#include "MKPAL.H"
};

#define MAX_LOADSTRING 100
#define MAX_TEXTURES 256

// internal virtual screen size
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240

// Settings
static uint16_t* CustomShaderHints = nullptr;
static uint16_t* CustomShaderMap = nullptr;
static uint16_t* CustomShaderParamsX = nullptr;
static uint16_t* CustomShaderParamsY = nullptr;
static uint16_t* CustomShaderParamsZ = nullptr;
static uint16_t NumCharShaders = 0;
static uint16_t NumShaderMaps = 0;

static uint16_t* Fighters4X = nullptr;
static uint16_t Fighters4XCount = 0;

bool IsFighter4X(uint16_t id)
{
	for (size_t i = 0; i < Fighters4XCount; i++)
	{
		if (Fighters4X[i] == id) return true;

	}
	return false;
}

static uint16_t Mode4X = 1;
static uint16_t NoSound = 0;
static uint16_t ScreenWidth, ScreenHeight;

typedef struct
{
	uint64_t rectid;
	uint32_t overlays[2];
	int16_t offsetx, offsety;
	uint16_t width, height;
	uint16_t flags;
	BMPINFO anim;
	BMPINFO image4x[2];
}SpecialBMP;
//xddttttt

class Bitmap24_256x256_Base
{
public:
	uint32_t id, flags;
	uint8_t withdata;

	Bitmap24_256x256_Base() :
		id(0),
		flags(0),
		withdata(0)
	{

	}
};

class Bitmap24_256x256_Data : public Bitmap24_256x256_Base
{
public:
	uint8_t pixels[256 * 256 * 3];
	StaticArray<uint16_t> rects;

	Bitmap24_256x256_Data() : 
		rects(256)
	{
		clear();
	}	

	void clear() 
	{
		memset(pixels, 0, sizeof(pixels));
		rects.Clear();
		id = 0;
		flags = 0;
		withdata = 1;
	}
};

extern "C"
{
	extern WORD editmode = 0;// 2 | 0x40;
	extern WORD testmode = 0;// 2 | 0x40 | 0x100;// | 2;// 2 | 0x80;

	extern WORD* _fade_table;
	extern WORD* get_pal(WORD clut_id);
	extern WORD c_fatal, f_fade;

	extern WORD allow_fade = 0;
	extern WORD drone_ver;
	extern WORD f_one_win;	
	extern WORD map_same[], f_samemap;

	extern const char* lcdfightlist_arr2[];
	extern short ochar_voice_groups[2][32];

	extern short f_pause;				/* flag: TRUE: game paused */

	extern WORD char_texture_type[2];
}

const char* FSReadFolder = "arcade";
uint64_t FSMaxFileSize = 2 * 1024;

void ParseFileName(TCHAR* FileNameStr, uint64_t FileName, uint8_t Hint)
{
	uint32_t dd = FileName;

	switch (Hint)
	{
	case 1:
		if (dd < 1000)
		{
			sprintf(FileNameStr, "%s/fx%d.bmp", FSReadFolder, dd);
		}
		else
		{
			sprintf(FileNameStr, "%s/%d%d/%d.bmp", FSReadFolder, (dd / 10000), (dd / 1000) % 10, dd % 1000);
		}
		return;
	case 2:
	case 2 | 4:
		sprintf(FileNameStr, "%s/objects4x/%d.%s", FSReadFolder,dd, Hint == 2 ? "tga" : "png");
		return;
	case 3:
	case 3 | 4:
		sprintf(FileNameStr, "%s/objects4x/%I64x.%s", FSReadFolder, FileName, Hint == 3 ? "tga" : "png");
		return;
	}

	FileNameStr[0] = '\0';
}

FileCache FileSystem("MK3RebootCache-%d.bin", ParseFileName);

// Global Variables:
HINSTANCE g_hInst = nullptr; // current instance
HWND g_hWnd = nullptr;
TCHAR g_szTitle[MAX_LOADSTRING]; // The title bar text
TCHAR g_szWindowClass[MAX_LOADSTRING]; // the main window class name
D3D_DRIVER_TYPE g_driverType = D3D_DRIVER_TYPE_NULL;
D3D_FEATURE_LEVEL g_featureLevel = D3D_FEATURE_LEVEL_11_0;
ID3D11Device* g_pd3dDevice = nullptr;
ID3D11DeviceContext* g_pImmediateContext = nullptr;
IDXGISwapChain* g_pSwapChain = nullptr;
ID3D11RenderTargetView* g_pRenderTargetView = nullptr;
ID3D11RenderTargetView* g_pRenderTargetView0 = nullptr;
ID3D11ShaderResourceView* g_pRenderTargetShaderView = nullptr;
ID3D11VertexShader* g_pVertexShader = nullptr;
ID3D11PixelShader* g_pPixelShader8 = nullptr;
ID3D11PixelShader* g_pPixelShaderBG = nullptr;
ID3D11PixelShader* g_pPixelShader32[64] = { nullptr };
ID3D11PixelShader* g_pPixelShaderPP = nullptr;
ID3D11InputLayout* g_pVertexLayout = nullptr;
ID3D11Buffer* g_pVertexBuffer = nullptr;
ID3D11Buffer* g_pConstantBuffer = nullptr;
ID3D11BlendState* g_pAlphaBlendingEnabledState = nullptr;
ID3D11BlendState* g_pAlphaBlendingDisabledState = nullptr;
ID3D11SamplerState* g_sampleStates[3] = {nullptr,nullptr};
ID3D11Texture2D* g_renderTargetTex = nullptr;
ID3D11Texture2D* g_renderTargetStaging = nullptr;
ID3D11Texture2D* g_renderTargetStagingBig = nullptr;

XMMATRIX g_World;
XMMATRIX g_View;
XMMATRIX g_Projection;

static ConstantBuffer cb;

// Forward declarations of functions included in this code module:
ATOM MyRegisterClass(HINSTANCE hInstance);
BOOL InitInstance(HINSTANCE, int, int width, int height);
LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);
HRESULT CompileShaderFromFile(WCHAR*, LPCSTR, LPCSTR, ID3DBlob**);
HRESULT InitDevice();
void CleanupDevice();
int isRunning = 1;
int g_InsideRender = 0;
BYTE keyState[256] = { 0 };

POLY_FT4 poly4x[256] = { 0 };
DWORD poly4xcount = 0;

#define TPAGE_SZ 256
#define IMAGE_UPSCALE 4

#define TPAGE_COUNT 32
#define TPAGE_PALETTE TPAGE_COUNT
#define TPAGE_FILTER (TPAGE_COUNT+1)
#define TPAGE_4X_OFFSET (TPAGE_COUNT+2)
#define TPAGE_EXTRA (TPAGE_4X_OFFSET+TPAGE_COUNT)
#define TPAGE_EXTRA_COUNT 8
#define TPAGE_TOTAL (TPAGE_EXTRA+TPAGE_EXTRA_COUNT)

#define P1PAGE_INDEX 40

#define MAX_SND_CHANNELS 32
#define MAX_44K_CHANNELS 8

#define RECTID_MASK 0xffffffffffffff00

extern "C" EMSOUNDOBJ sndobj[MAX_SOUND_OBJS];
IXAudio2SourceVoice* soundChannels11[MAX_SND_CHANNELS] = { 0 };
IXAudio2SourceVoice* soundChannels44[MAX_44K_CHANNELS] = { 0 };

typedef struct
{
	ID3D11Texture2D* texture;
	ID3D11ShaderResourceView* textureView;
	uint32_t size,bits,shader_hint,bghint;	
	uint8_t* data;
}TPage;

static TPage Pages[TPAGE_TOTAL] = { 0 };

static void InitTPage(int ti,int bts, int sz)
{	
	if (ti < 0 || ti >= TPAGE_TOTAL || Pages[ti].data) return;

	Pages[ti].data = (BYTE*)calloc(sz * sz * bts / 32,4);
	Pages[ti].bits = bts;
	Pages[ti].size = sz;
}

uint16_t* gameKeys[2];

extern "C" void MK3_Init();
extern "C" void MK3_Update();
extern "C" int MK3_Render(int fps);

void DrawQuadUV(int t, int p, float x, float y, float w, float h, int sx, int sy, int sw, int sh,int flags,int);
void DrawQuad(int x, int y, int w, int h, BYTE color[]);
int CreateD3DTexture(int w, int h, void* data,int flags,int slot);
bool LoadTextureBmp(uint64_t FileID, BMPINFO* info, DWORD* Palette8888);
bool LoadTextureTGAorPNG(uint64_t FileID, uint8_t Hint, BMPINFO* info);

static DWORD AllPAlettes[256 * 256];

typedef struct
{
	union
	{
		struct
		{
			uint8_t r, g, b, a;
		};

		DWORD dw;
	};
} DW_RGBA;



inline DWORD LerpColor3(DWORD a, DWORD b, float lerp)
{
	float lerp1 = 1.0f - lerp;
	DW_RGBA A, B, R;
	A.dw = a;
	B.dw = b;

	R.r = A.r * lerp + B.r * lerp1;
	R.g = A.g * lerp + B.g * lerp1;
	R.b = A.b * lerp + B.b * lerp1;
	R.a = 255;
	return R.dw;
}

inline uint8_t LuminColor(DW_RGBA a)
{
	float gray = 0.2 * a.r + 0.7 * a.g + 0.1 * a.b;
	return gray;
}

inline uint8_t GrayColor(DWORD a)
{
	DW_RGBA A;
	A.dw = a;
	float gray = 0.299 * A.r + 0.587 * A.g + 0.114 * A.b;
	return gray;
}

DWORD MultColor3(DWORD a, float scale)
{
	DW_RGBA A, R;
	A.dw = a;
	R.r = A.r * scale;
	R.g = A.g * scale;
	R.b = A.b * scale;
	return R.dw;
}

void Palette565To8888(u_short* srcpal, BYTE* dest, int nelem)
{
	BYTE* dst = dest;
	*dst++ = 0x00;
	*dst++ = 0x00;
	*dst++ = 0x00;
	*dst++ = 0x00;

	for (size_t i = 1; i < nelem; i++)
	{
		u_short c = srcpal[i];
		*dst++ = ((c >> 0) & 31) << 3;// * 255 / 31;
		*dst++ = ((c >> 5) & 31) << 3;// * 255 / 31;
		*dst++ = ((c >> 10) & 31) << 3;// * 255 / 31;
		*dst++ = 0xff;
	}

	for (size_t i = nelem; i < 256; i++)
	{
		*dst++ = 0xff;
		*dst++ = 0xff;
		*dst++ = 0xff;
		*dst++ = 0xff;
	}
}

bool Save32BitBmp(const char* filename, DWORD* src, int w, int h)
{
	static BYTE palette[256 * 4];
	FILE* f = fopen(filename, "wb");

	if (f == nullptr) return false;

	int pitch = w * 4;
	int padsize = (4 - (pitch % 4)) % 4;
	int filesize = 54 + (pitch + padsize) * h;

	unsigned char bmpfileheader[14] = { 'B','M', 0,0,0,0, 0,0, 0,0, 54,0,0,0 };
	unsigned char bmpinfoheader[40] = { 40,0,0,0, 0,0,0,0, 0,0,0,0, 1,0, 32,0 };
	unsigned char bmppad[3] = { 0,0,0 };

	bmpfileheader[2] = (unsigned char)(filesize);
	bmpfileheader[3] = (unsigned char)(filesize >> 8);
	bmpfileheader[4] = (unsigned char)(filesize >> 16);
	bmpfileheader[5] = (unsigned char)(filesize >> 24);

	int soffset = 54;

	bmpfileheader[10] = (unsigned char)(soffset);
	bmpfileheader[11] = (unsigned char)(soffset >> 8);
	bmpfileheader[12] = (unsigned char)(soffset >> 16);
	bmpfileheader[13] = (unsigned char)(soffset >> 24);

	bmpinfoheader[4] = (unsigned char)(w);
	bmpinfoheader[5] = (unsigned char)(w >> 8);
	bmpinfoheader[6] = (unsigned char)(w >> 16);
	bmpinfoheader[7] = (unsigned char)(w >> 24);
	bmpinfoheader[8] = (unsigned char)(h);
	bmpinfoheader[9] = (unsigned char)(h >> 8);
	bmpinfoheader[10] = (unsigned char)(h >> 16);
	bmpinfoheader[11] = (unsigned char)(h >> 24);
	bmpinfoheader[32] = 0;

	fwrite(bmpfileheader, 1, 14, f);
	fwrite(bmpinfoheader, 1, 40, f);

	for (int i = 0; i < h; i++)
	{
		fwrite(src + (pitch * (h - i - 1)), 1, pitch, f);
		if (padsize) fwrite(bmppad, 1, padsize, f);
	}
	fclose(f);
	return true;
}

void LoadLuminPalette(const char* filename, WORD start, WORD endi, WORD slot)
{
	FILE* f = fopen(filename, "rb");
	if (f == nullptr) return;

	DW_RGBA srcpal[256];

	for (size_t i = 0; i < 256; i++)
	{
		fread(&srcpal[i], 3, 1, f);
		srcpal[i].a = 0xff;
	}

	srcpal[0].a = 0;

	fclose(f);
	
	DWORD* dstpal = (DWORD*)AllPAlettes + slot * 256;

	BYTE* dst = (BYTE*)srcpal;
	
	DWORD last = 0xffffffff;
	DWORD lastind = 255;

	for (size_t i = start; i < endi; i++)
	{
		uint8_t lindex = LuminColor(srcpal[i]);

		if (lindex == lastind) continue;

		float linc = 1.0f / (lastind - lindex);
		float lp = 0;

		while (lastind > lindex)
		{
			dstpal[lastind--] = LerpColor3(srcpal[i].dw,last,lp);
			lp += linc;
		}

		last = srcpal[i].dw;
		dstpal[lindex] = last;
	}

	if (lastind > 0)
	{
		float linc = 1.0f / lastind;
		float lp = 1;

		while (lastind-- > 0)
		{
			dstpal[lastind] = MultColor3(last, lp);
			lp -= linc;
		}
	}

	DW_RGBA bmpdata[256];
	for (size_t i = 0; i < 256; i++)
	{
		DW_RGBA pix;
		pix.dw = dstpal[i];
		bmpdata[i].r = pix.b;
		bmpdata[i].g = pix.g;
		bmpdata[i].b = pix.r;
		bmpdata[i].a = pix.a;
	}

	TCHAR fname[128];
	strcpy(fname, filename);
	strcpy(strstr(fname, "."), "lum.bmp");
	Save32BitBmp(fname, &bmpdata[0].dw, 256, 1);
}


std::vector<std::string> ini_sections;
std::vector<std::string> ini_keys;
std::vector<std::string> ini_values;
std::vector<void*>		 ini_customdata;

static int handler(void* user, const char* section, const char* name,
	const char* value)
{
	ini_sections.push_back(section);
	ini_keys.push_back(name);
	ini_values.push_back(value);
	ini_customdata.push_back(nullptr);
	return 1;
}

int32_t ini_getint(const char* section, const char* name, int32_t defvalue)
{
	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			return atoi(ini_values[i].c_str());
		}
	}

	return defvalue;
}

std::string ini_getstr(const char* section, const char* name, const char* defvalue)
{
	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			return ini_values[i];
		}
	}

	return defvalue;
}

uint16_t* ini_str2int16raw(const char* string, uint16_t index, uint16_t* outsize = nullptr)
{
	std::vector<uint16_t> values;

	bool finished = false;
	while (!finished)
	{
		const char* next = strstr(string + 1, ",");
		if (!next)
		{
			next = string + strlen(string);
			finished = true;
		}
		int chlen = next - string;

		int32_t value32;
		if (string[chlen-1] == 'h')
		{
			sscanf(string, "%xh", &value32);
			values.push_back(value32);
		}
		else
		if (sscanf(string, "%d", &value32))
		{
			values.push_back(value32);
		}

		string = next + 1;
	}

	uint16_t* data = new uint16_t[values.size() + 1];
	data[0] = values.size();
	memcpy(data + 1, values.begin()._Ptr, values.size() * sizeof(uint16_t));

	ini_customdata[index] = data;
	if (outsize) *outsize = data[0];

	return data + 1;
}

uint16_t* ini_getint16raw(const char* section, const char* name, uint16_t* outsize = nullptr)
{
	const char* src = nullptr;
	int srcind = -1;

	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			if (ini_customdata[i])
			{
				if (outsize) *outsize = *(uint16_t*)ini_customdata[i];
				return (uint16_t*)ini_customdata[i] + 1;
			}

			srcind = i;
			src = ini_values[i].c_str();
			break;
		}
	}

	if (!src) return 0;

	return ini_str2int16raw(src, srcind, outsize);
}

void parse_struct(void* struct_ptr, const char* format, const char* strdata)
{
	const char* src = strdata;
	
	int i = 0;
	int32_t value32;
	int64_t value64;
	uint16_t* data16 = nullptr;
	char* dst = (char*)struct_ptr;

	while (format[i])
	{
		if (format[i] == ' ')
		{
			dst++;
		}
		else
		{
			const char* next = strstr(src + 1, ",");
			if (!next) next = src + strlen(src);
			int chlen = next - src;

			switch (format[i])
			{
			case 'x':
				sscanf(src, "%I64x", &value64);
				break;
			case 't':
			case 'd':
			case 'b':
				sscanf(src, "%d", &value32);
				break;
			case 'i':
				if (chlen)
				{
					char dsecname[64];
					memcpy(dsecname, src, chlen);
					dsecname[chlen] = '\0';
					data16 = ini_getint16raw("data16", dsecname);
				}
				else
				{
					data16 = nullptr;
				}
				break;
			}

			switch (format[i])
			{
			case 'x':
				*(int64_t*)(dst) = value64;
				dst += 8;
				break;
			case 't':
				*(int16_t*)(dst) = (int16_t)(value32 & 0xffff);
				dst += 2;
				break;
			case 'd':
				*(int32_t*)(dst) = value32;
				dst += 4;
				break;
			case 'b':
				*(int8_t*)(dst) = (int8_t)(value32 & 0xff);
				dst += 1;
				break;
			case 'i':
				*(uint16_t**)(dst) = data16;
				dst += sizeof(uint16_t*);
				break;
			}

			src += chlen + 1;
		}
		
		i++;
	}
}

uint16_t ini_getintarray(const char* section, const char* name, uint16_t outarray[])
{
	uint16_t count = 0;

	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			outarray[count++] = atoi(ini_values[i].c_str());
		}
	}

	return count;
}


std::vector<int32_t> ini_getintarray(const char* section, const char* name)
{
	std::vector<int32_t> values;

	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			values.push_back(atoi(ini_values[i].c_str()));
		}
	}

	return std::move(values);
}

std::vector<std::string> ini_getstrarray(const char* section, const char* name)
{
	std::vector<std::string> values;

	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			values.push_back(ini_values[i]);
		}
	}

	return std::move(values);
}

std::vector<uint16_t*> ini_getint16array(const char* section, const char* name)
{
	std::vector<uint16_t*> values;

	for (int i = 0; i < ini_sections.size(); i++)
	{
		if (ini_sections[i].compare(section) == 0 &&
			ini_keys[i].compare(name) == 0)
		{
			values.push_back(ini_str2int16raw(ini_values[i].c_str(), i));
		}
	}

	return std::move(values);
}

void CacheFiles(const char* subpath, int pathid)
{
	WIN32_FIND_DATA data;
	char Path[256];
	if (pathid > 0)
	{
		sprintf(Path, "%s\\%d\\*", FSReadFolder, pathid);
	}
	else if (pathid == 0)
	{
		sprintf(Path, "%s\\%s\\*", FSReadFolder, subpath);
	}
	else
	{
		sprintf(Path, "%s\\*", FSReadFolder);
	}

	uint64_t value64 = 0;
	uint32_t value32 = 0;

	HANDLE hFind = FindFirstFile(Path, &data);      // DIRECTORY

	if (hFind != INVALID_HANDLE_VALUE) {
		do
		{
			int status = -1;

			if ((data.nFileSizeLow >> 10) > FSMaxFileSize) continue;

			if (!sscanf(data.cFileName, "%d.bmp", &value32))
			{
				value32 = 0;
			}

			if (!sscanf(data.cFileName, "%I64x.png", &value64))
			{
				value32 = 0;
			}

			if (pathid == 0 && (value32 || value64))
			{
				if (value32 && IsFighter4X(value32 / 1000))
				{
					status = FileSystem.Cache(value32,6) ? 1 : 0;
				}
				else
				{
					status = FileSystem.Cache(value64,7) ? 1 : 0;
				}				
			}
			else
			if (pathid > 0 && value32)
			{
				status = FileSystem.Cache(pathid * 1000 + value32, 1) ? 1 : 0;
			}
			else
			if (pathid < 0 && sscanf(data.cFileName, "fx%d.bmp", &value32))
			{
				status = FileSystem.Cache(value32, 1) ? 1 : 0;
			}

			if (status >= 0)
			{
				if (status == 0) OutputDebugStringA("FAILED:");
				OutputDebugStringA(data.cFileName);
				OutputDebugStringA("\n");
			}

		} while (FindNextFile(hFind, &data));
		FindClose(hFind);
	}
}


void CacheAllFiles(const char* SrcFolder,uint64_t MaxFileSize)
{
	FSReadFolder = SrcFolder;
	FSMaxFileSize = MaxFileSize;
	CacheFiles("", -1);
	for (size_t i = 0; i < Fighters4XCount; i++)
	{
		CacheFiles("", Fighters4X[i]);
	}
	CacheFiles("objects4x", 0);
	FSReadFolder = "arcade";
}

//
//
//
int APIENTRY _tWinMain(_In_ HINSTANCE hInstance,
	_In_opt_ HINSTANCE hPrevInstance,
	_In_ LPTSTR    lpCmdLine,
	_In_ int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);

	if (ini_parse("MK3.ini", handler, nullptr) < 0) {
		printf("Can't load 'test.ini'\n");
		return 1;
	}

	Fighters4X = ini_getint16raw("data16", "Fighters", &Fighters4XCount);

	std::string importfolder = ini_getstr("util", "importfolder", "");
	if (importfolder.length())
	{
		CacheAllFiles(importfolder.c_str(),ini_getint("util","maxfilesize",FSMaxFileSize));
	}

	FileCache::CacheOnlyMode = ini_getstr("util", "cacheonlymode", "false")._Equal("true");

	Mode4X = ini_getint("graphics", "mode4x", Mode4X);
	ScreenWidth = ini_getint("graphics", "width", 1600);
	ScreenHeight = ini_getint("graphics", "height", 900);

	gameKeys[0] = ini_getint16raw("input", "p1keys");
	gameKeys[1] = ini_getint16raw("input", "p2keys");
		
	NoSound = ini_getint("audio", "nosound", 0);

	long lcdoverride = ini_getint("audio", "lcdoverridenum", -1);
	std::string lcdfileoverride;

	if (lcdoverride >= 0)
	{
		lcdfileoverride = ini_getstr("audio", "lcdoverride", lcdfightlist_arr2[lcdoverride]);
		lcdfightlist_arr2[lcdoverride] = lcdfileoverride.c_str();
		ochar_voice_groups[1][lcdoverride] = ini_getint("audio", "lcdgroup", ochar_voice_groups[1][lcdoverride]);
	}

	allow_fade = ini_getint("graphics", "fade", 0);
	f_one_win = ini_getint("gameplay", "onewin", 0);
	
	drone_ver = ini_getint("gameplay", "dronever", drone_ver);

	NumCharShaders = ini_getint("data16", "numshaders", 0);
	CustomShaderHints = ini_getint16raw("data16", "customshaders", &NumShaderMaps);
	CustomShaderMap = ini_getint16raw("data16", "customshadermaps", &NumShaderMaps);
	CustomShaderParamsX = ini_getint16raw("data16", "shaderparamsx", nullptr);
	CustomShaderParamsY = ini_getint16raw("data16", "shaderparamsy", nullptr);
	CustomShaderParamsZ = ini_getint16raw("data16", "shaderparamsz", nullptr);

	f_samemap = ini_getint("gameplay", "samemap", 0);

	if (f_samemap)
	{
		int i = 0;
		while (map_same[i] != 0xfefe)
		{
			if (map_same[i] == 0)
			{
				map_same[i] = f_samemap;
			}
			i++;
		}
	}

	const long settingFps = ini_getint("graphics", "fps", 53);
	const long settingFpsUnlocked = ini_getint("graphics", "fps_unlocked", 500);

	// TODO: Place code here.
	MSG msg = { 0 };
	HACCEL hAccelTable;

	// Initialize global strings
	LoadString(hInstance, IDS_APP_TITLE, g_szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_MK3REBOOT, g_szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// Perform application initialization:
	if (!InitInstance(hInstance, nCmdShow, ScreenWidth, ScreenHeight))
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_MK3REBOOT));

	if (FAILED(InitDevice()))
	{
		CleanupDevice();
		return 0;
	}

	MK3_Init();

	//Palette
	CreateD3DTexture(256, 256, NULL, 32, 32);

	const long scanline_image = ini_getint("graphics", "scanline", 0);

	BMPINFO ft = { 0 };	
	if (LoadTextureBmp(scanline_image,&ft, 0))
	{
		//Filter
		CreateD3DTexture(ft.w, ft.h, ft.pixels, 32,TPAGE_FILTER);
	}

	D3D11_VIEWPORT vp;
	vp.MinDepth = 0.0f;
	vp.MaxDepth = 1.0f;
	vp.TopLeftX = 0;
	vp.TopLeftY = 0;

	g_pImmediateContext->OMSetRenderTargets(1, &g_pRenderTargetView, nullptr);
	g_pImmediateContext->VSSetShader(g_pVertexShader, nullptr, 0);
	g_pImmediateContext->PSSetShader(g_pPixelShader8, nullptr, 0);
	g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingEnabledState, 0, 0xff);
	g_pImmediateContext->PSSetSamplers(0, 3, g_sampleStates);
	g_pImmediateContext->VSSetConstantBuffers(0, 1, &g_pConstantBuffer);
	g_pImmediateContext->PSSetConstantBuffers(0, 1, &g_pConstantBuffer);
	g_pImmediateContext->PSSetShaderResources(0, 1, &Pages[TPAGE_PALETTE].textureView);
	g_pImmediateContext->PSSetShaderResources(2, 1, &Pages[TPAGE_FILTER].textureView);

	vp.Width = ScreenWidth;
	vp.Height = ScreenHeight;

	g_pImmediateContext->RSSetViewports(1, &vp);

	// Main message loop:
	while (isRunning)
	{
		static int holdingP = 0;
		static int holdingO = 0;

		if (keyState['P'] && !holdingP) {
			f_pause = f_pause ? 0 : 7;
			holdingP = true;
		}
		else if (!keyState['P']) {
			holdingP = false;
		}

		if (f_pause == 7 && keyState['O'] && !holdingO) {
			f_pause = 0;
			holdingO = 1;
		}
		else if (holdingO == 1) {
			f_pause = 7;
			holdingO = 2;
		}
		else if (!keyState['O'] && holdingO == 2) {
			holdingO = 0;
		}

		MK3_Update();

		D3D11_VIEWPORT vp;
		vp.MinDepth = 0.0f;
		vp.MaxDepth = 1.0f;
		vp.TopLeftX = 0;
		vp.TopLeftY = 0;

		g_InsideRender = 1;
		MK3_Render(keyState[VK_SPACE] ? settingFpsUnlocked : settingFps);
		g_InsideRender = 0;
	}

	CleanupDevice();

	return 0;
}


//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX);

	wcex.style = CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc = WndProc;
	wcex.cbClsExtra = 0;
	wcex.cbWndExtra = 0;
	wcex.hInstance = hInstance;
	wcex.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_D3DTEST));
	wcex.hCursor = LoadCursor(nullptr, IDC_ARROW);
	wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
	wcex.lpszMenuName = nullptr;
	wcex.lpszClassName = g_szWindowClass;
	wcex.hIconSm = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

	return RegisterClassEx(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow, int width, int height)
{
	g_hInst = hInstance; // Store instance handle in our global variable

	RECT windowRect = { 0, 0, width, height };
	AdjustWindowRect(&windowRect, WS_OVERLAPPEDWINDOW, FALSE);

	g_hWnd = CreateWindow(g_szWindowClass, g_szTitle, WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		windowRect.right - windowRect.left,
		windowRect.bottom - windowRect.top,
		nullptr,        // We have no parent window.
		nullptr,        // We aren't using menus.
		hInstance, 
		nullptr);

	if (!g_hWnd)
	{
		return FALSE;
	}

	ShowWindow(g_hWnd, nCmdShow);
	UpdateWindow(g_hWnd);

	return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;

	switch (message)
	{
	case WM_COMMAND:
		wmId = LOWORD(wParam);
		wmEvent = HIWORD(wParam);
		// Parse the menu selections:
		switch (wmId)
		{
		case IDM_EXIT:
			DestroyWindow(hWnd);
			break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_KEYDOWN: {
		WORD keyCode = LOWORD(wParam);
		keyState[keyCode & 0xff] = true;
		}
		break;
	case WM_KEYUP: {
		WORD keyCode = LOWORD(wParam);
		keyState[keyCode & 0xff] = false;
		}
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		// TODO: Add any drawing code here...
		EndPaint(hWnd, &ps);
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		isRunning = 0;
		break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

//
// Helper for compiling shaders with D3DCompile
//
// With VS 11, we could load up prebuilt .cso files instead...
//
HRESULT CompileShaderFromFile(WCHAR* szFileName, LPCSTR szEntryPoint, LPCSTR szShaderModel, ID3DBlob** ppBlobOut)
{
	HRESULT hr = S_OK;

	DWORD dwShaderFlags = D3DCOMPILE_ENABLE_STRICTNESS;
#if defined( DEBUG ) || defined( _DEBUG )
	// Set the D3DCOMPILE_DEBUG flag to embed debug information in the shaders.
	// Setting this flag improves the shader debugging experience, but still allows 
	// the shaders to be optimized and to run exactly the way they will run in 
	// the release configuration of this program.
	//dwShaderFlags |= D3DCOMPILE_DEBUG;
#endif

	ID3DBlob* pErrorBlob = nullptr;
	D3D_SHADER_MACRO macros[4];
	static char macval[4] = { (int)(ScreenWidth / ScreenHeight) + '0',0 };
	
	macros[0].Name = "UPSCALE";
	macros[0].Definition = macval;
	macros[1].Name = NULL;
	macros[1].Definition = NULL;
	hr = D3DCompileFromFile(szFileName, macros, nullptr, szEntryPoint, szShaderModel,
		dwShaderFlags, 0, ppBlobOut, &pErrorBlob);
	if (FAILED(hr))
	{
		if (pErrorBlob != nullptr)
			OutputDebugStringA((char*)pErrorBlob->GetBufferPointer());
		if (pErrorBlob) pErrorBlob->Release();
		return hr;
	}
	if (pErrorBlob) pErrorBlob->Release();

	return S_OK;
}

typedef struct
{
	uint8_t Header[12];         // File Header To Determine File Type
} TGAHeader;

typedef struct
{
	uint8_t header[6];          // Holds The First 6 Useful Bytes Of The File
	uint32_t bytesPerPixel;           // Number Of BYTES Per Pixel (3 Or 4)
	uint32_t imageSize;           // Amount Of Memory Needed To Hold The Image
	uint32_t type;                // The Type Of Image, GL_RGB Or GL_RGBA
	uint32_t Height;              // Height Of Image                 
	uint32_t Width;               // Width Of Image              
	uint32_t Bpp;             // Number Of BITS Per Pixel (24 Or 32)
} TGA;

bool LoadTextureTGAorPNG(uint64_t FileID, uint8_t Hint,BMPINFO* info)
{
	TGAHeader tgaheader;
	TGA tga;

	FileCache* FilePtr = FileSystem.Open(FileID, Hint, true);

	if (FilePtr == nullptr)
	{
		FilePtr = FileSystem.Open(FileID, Hint|4, true);

		if (FilePtr)
		{
			int x, y, comp;
			stbi_uc* data = stbi_load_from_file(FilePtr->GetFilePtr(), &x, &y, &comp, 4);
			
			if (data)
			{				
				FilePtr->Read(nullptr, -1);
				FilePtr->Close(false);
				info->w = x;
				info->h = y;
				info->pixels = data;
				return true;
			}
		}		

		info->pixels = NULL;
		info->w = 0;
		info->h = 0;
		if (FilePtr) FilePtr->Close(true);
		return false;
	}

	// Attempt To Read The File Header
	if (FilePtr->Read(&tgaheader, sizeof(TGAHeader)) == 0)
	{
		FilePtr->Close(true);
		return false;               // Return False If It Fails
	}

	// Attempt To Read Next 6 Bytes
	if (FilePtr->Read(tga.header, sizeof(tga.header)) == 0)
	{
		FilePtr->Close(true);
		return false;               // Return False
	}

	info->w = tga.header[1] * 256 + tga.header[0];   // Calculate Height
	info->h = tga.header[3] * 256 + tga.header[2];   // Calculate The Width
	int bits = tga.header[4];                // Calculate Bits Per Pixel
	tga.Width = info->w;              // Copy Width Into Local Structure
	tga.Height = info->h;                // Copy Height Into Local Structure
	tga.Bpp = bits;
	tga.bytesPerPixel = (tga.Bpp / 8);      // Calculate The BYTES Per Pixel
	// Calculate Memory Needed To Store Image
	tga.imageSize = (tga.bytesPerPixel * tga.Width * tga.Height);

	BYTE* img = info->pixels ? info->pixels : new BYTE[tga.Width * tga.Height * tga.bytesPerPixel];

	info->pixels = img;

	if (bits == 32) 
	{
		int pitch = tga.Width * tga.bytesPerPixel;

		if (tga.header[5] & 0x20)
		{
			FilePtr->Read(info->pixels,tga.Height*pitch);
		}
		else
		{
			// Attempt To Read All The Image Data			
			int row = (tga.Height - 1) * pitch;

			for (size_t i = 0; i < tga.Height; i++, row -= pitch)
			{
				FilePtr->Read(info->pixels + row, pitch);
			}
		}

	}
	
	for (int cswap = 0; cswap < (int)tga.imageSize; cswap += tga.bytesPerPixel)
	{
		// 1st Byte XOR 3rd Byte XOR 1st Byte XOR 3rd Byte
		info->pixels[cswap] ^= info->pixels[cswap + 2] ^=
		info->pixels[cswap] ^= info->pixels[cswap + 2];
	}

	FilePtr->Close(false);                   // Close The File

	return true;	
}

bool LoadTextureBmp(uint64_t FileID, BMPINFO* info, DWORD *Palette8888)
{
	unsigned char bmpfileheader[14] = { 0 };
	unsigned char bmpinfoheader[40] = { 0 };
	unsigned char rgba[4] = {0xff,0xff,0xff,0xff};

	FileCache* FilePtr = FileSystem.Open(FileID, 1, true);
	
	if (FilePtr == nullptr) {
		info->pixels = NULL;
		info->w = 0;
		info->h = 0;
		return false;
	}

	FilePtr->Read(bmpfileheader, 14);
	FilePtr->Read(bmpinfoheader, 40);

	int ww = bmpinfoheader[4] | (bmpinfoheader[5] << 8) | (bmpinfoheader[6] << 8) | (bmpinfoheader[7] << 8);
	int hh = bmpinfoheader[8] | (bmpinfoheader[9] << 8) | (bmpinfoheader[10] << 8) | (bmpinfoheader[11] << 8);

	int bits = bmpinfoheader[14];
	int palsize = bmpinfoheader[32];

	int bpp = bits == 8 ? 1 : 4;

	BYTE* img = info->pixels ? info->pixels : new BYTE[ww * hh * bpp];

	info->pixels = img;

	if (bits == 8)
	{
		DWORD *pal = Palette8888;

		if (palsize == 0) palsize = 256;

		for (size_t i = 0; i < palsize; i++)
		{
			FilePtr->Read(rgba, 4);
			if (pal) {
				*pal++ = rgba[2] | (rgba[1] << 8) | (rgba[0] << 16) | (i == 0 ? 0 : 0xff000000);
			} 
		}
	}

	int padsize = (4 - (ww % 4)) % 4;
	int lsize = (ww+padsize) * bits / 8;
	int dsize = ww * bpp;
	BYTE* line = new BYTE[lsize];
	BYTE* dst = img + (hh - 1) * dsize;

	for (size_t i = 0; i < hh; i++)
	{
		FilePtr->Read(line, lsize);
		switch (bits)
		{
		case 8:
			memcpy(dst, line, dsize);
			break;
		case 32:
			memcpy(dst, line, dsize);
			for (size_t x = 0; x < lsize; x += 4)
			{
				dst[x+3] = 0xff;
			}
			break;
		case 24:	
			for (size_t x = 0; x < lsize; x+=3)
			{
				*dst++ = line[x+2];
				*dst++ = line[x+1];
				*dst++ = line[x+0];
				*dst++ = 0xff;
			}
			dst -= dsize;
			break;
		}

		dst -= dsize;
	}

	FilePtr->Close(false);
	info->w = ww;
	info->h = hh;
	return true;
}

void Save8BitBmp(const char* filename, BYTE* src, void *inpal, int palCount, int w, int h, bool pal16)
{
	static BYTE palette[256*4];
	FILE* f = fopen(filename, "wb");

	if (f == nullptr) return;

	int padsize = (4 - (w % 4)) % 4;
	int filesize = 54 + palCount*4 + (w+padsize) * h;  //w is your image width, h is image height, both int

	unsigned char bmpfileheader[14] = { 'B','M', 0,0,0,0, 0,0, 0,0, 54,0,0,0 };
	unsigned char bmpinfoheader[40] = { 40,0,0,0, 0,0,0,0, 0,0,0,0, 1,0, 8,0 };
	unsigned char bmppad[3] = { 0,0,0 };

	bmpfileheader[2] = (unsigned char)(filesize);
	bmpfileheader[3] = (unsigned char)(filesize >> 8);
	bmpfileheader[4] = (unsigned char)(filesize >> 16);
	bmpfileheader[5] = (unsigned char)(filesize >> 24);

	int soffset = 54 + palCount * 4;

	bmpfileheader[10] = (unsigned char)(soffset);
	bmpfileheader[11] = (unsigned char)(soffset >> 8);
	bmpfileheader[12] = (unsigned char)(soffset >> 16);
	bmpfileheader[13] = (unsigned char)(soffset >> 24);

	bmpinfoheader[4] = (unsigned char)(w);
	bmpinfoheader[5] = (unsigned char)(w >> 8);
	bmpinfoheader[6] = (unsigned char)(w >> 16);
	bmpinfoheader[7] = (unsigned char)(w >> 24);
	bmpinfoheader[8] = (unsigned char)(h);
	bmpinfoheader[9] = (unsigned char)(h >> 8);
	bmpinfoheader[10] = (unsigned char)(h >> 16);
	bmpinfoheader[11] = (unsigned char)(h >> 24);
	bmpinfoheader[32] = palCount;

	if (pal16)
	{
		BYTE* pal = palette;
		WORD* Palette555 = (WORD*)inpal;

		for (int i = 0; i < palCount; i++)
		{
			DWORD pdata = Palette555[i];
			if (pdata == 0 && i > 0) {
				*pal++ = 1;
				*pal++ = 1;
				*pal++ = 1;
			} else {
				*pal++ = ((pdata >> 10) & 0x1f) << 3;
				*pal++ = ((pdata >> 5) & 0x1f) << 3;
				*pal++ = ((pdata >> 0) & 0x1f) << 3;
			}			
			*pal++ = 0;
		}
	}
	else
	{
		BYTE* pal = palette;
		DWORD* Palette888 = (DWORD*)inpal;

		for (int i = 0; i < palCount; i++)
		{
			DWORD pdata = Palette888[i];

			if (pdata == 0xff000000 && i > 0) pdata = 0xff010101;
			
			*pal++ = ((pdata >> 16) & 0xff);
			*pal++ = ((pdata >> 8) & 0xff);
			*pal++ = ((pdata >> 0) & 0xff);
			*pal++ = 0;
		}
	}
	
	fwrite(bmpfileheader, 1, 14, f);
	fwrite(bmpinfoheader, 1, 40, f);
	fwrite(palette, 1, 4* palCount, f);
	
	for (int i = 0; i < h; i++)
	{
		fwrite(src + (w * (h - i - 1) ), 1, w, f);
		if (padsize) fwrite(bmppad, 1, padsize, f);
	}
	fclose(f);

}

void DeleteTexture(int id)
{
	if (Pages[id].texture) {
		Pages[id].texture->Release();
		Pages[id].textureView->Release();
		Pages[id].texture = NULL;
		Pages[id].textureView = NULL;
		free(Pages[id].data);
	}
}

int CreateD3DTexture(int w, int h, void *data, int flags,int slot)
{
	D3D11_TEXTURE2D_DESC desc;
	memset(&desc, 0, sizeof(desc));

	int bits = flags & 0xff;

	desc.Width = w;
	desc.Height = h;
	desc.MipLevels = desc.ArraySize = 1;
	desc.Format = bits == 8 ? DXGI_FORMAT_R8_UNORM : bits == 16 ? DXGI_FORMAT_B5G5R5A1_UNORM : DXGI_FORMAT_R8G8B8A8_UNORM;
	desc.SampleDesc.Count = 1;
	desc.Usage = D3D11_USAGE_DYNAMIC;
	desc.BindFlags = D3D11_BIND_SHADER_RESOURCE | (flags & 0x1000 ? D3D11_BIND_RENDER_TARGET : 0) ;
	desc.CPUAccessFlags = (flags & 0x1000 ? 0 : D3D11_CPU_ACCESS_WRITE);
	desc.MiscFlags = 0;

	ID3D11Texture2D* pTexture = NULL;
	D3D11_SUBRESOURCE_DATA textureSubresourceData = {};
	textureSubresourceData.pSysMem = data;
	textureSubresourceData.SysMemPitch = bits == 8 ? w : bits == 16 ? 2*w : 4*w;

	DeleteTexture(slot);

	g_pd3dDevice->CreateTexture2D(&desc, data ? &textureSubresourceData : NULL, &pTexture);
	Pages[slot].texture = pTexture;
	g_pd3dDevice->CreateShaderResourceView(pTexture, nullptr, &Pages[slot].textureView);
	return 0;
}

HRESULT compilePixelShader(WCHAR shaderFxFile[], LPCSTR entry, ID3D11PixelShader **s)
{
	// Compile the pixel shader
	ID3DBlob* pPSBlob = nullptr;
	HRESULT hr = CompileShaderFromFile(shaderFxFile, entry, "ps_4_0", &pPSBlob);
	if (FAILED(hr))
	{
		MessageBox(nullptr,
			TEXT("The FX file cannot be compiled.  Please run this executable from the directory that contains the FX file."),
			TEXT("Error"), MB_OK);
		return hr;
	}

	// Create the pixel shader
	hr = g_pd3dDevice->CreatePixelShader(pPSBlob->GetBufferPointer(), pPSBlob->GetBufferSize(), nullptr, s);
	pPSBlob->Release();
	return hr;
}

//
//
//
HRESULT InitDevice()
{
	HRESULT hr = S_OK;

	RECT rc;
	GetClientRect(g_hWnd, &rc);
	UINT width = rc.right - rc.left;
	UINT height = rc.bottom - rc.top;

	UINT createDeviceFlags = 0;

#ifdef _DEBUG
	// If the project is in a debug build, enable debugging via SDK Layers with this flag.
	//createDeviceFlags |= D3D11_CREATE_DEVICE_DEBUG;
#endif

	D3D_DRIVER_TYPE driverTypes[] =
	{
		D3D_DRIVER_TYPE_HARDWARE,
		D3D_DRIVER_TYPE_WARP,
		D3D_DRIVER_TYPE_REFERENCE,
	};
	UINT numDriverTypes = ARRAYSIZE(driverTypes);

	// This array defines the ordering of feature levels that D3D should attempt to create.
	D3D_FEATURE_LEVEL featureLevels[] =
	{
		D3D_FEATURE_LEVEL_11_1,
		D3D_FEATURE_LEVEL_11_0,
		D3D_FEATURE_LEVEL_10_1,
		D3D_FEATURE_LEVEL_10_0,
	};
	UINT numFeatureLevels = ARRAYSIZE(featureLevels);

	DXGI_SWAP_CHAIN_DESC sd;
	ZeroMemory(&sd, sizeof(sd));
	sd.BufferCount = 1;
	sd.BufferDesc.Width = width;
	sd.BufferDesc.Height = height;
	sd.BufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
	sd.BufferDesc.RefreshRate.Numerator = 60;
	sd.BufferDesc.RefreshRate.Denominator = 1;
	sd.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT;
	sd.OutputWindow = g_hWnd;
	sd.SampleDesc.Count = 1;
	sd.SampleDesc.Quality = 0;
	sd.Windowed = TRUE;

	for (UINT driverTypeIndex = 0; driverTypeIndex < numDriverTypes; driverTypeIndex++)
	{
		g_driverType = driverTypes[driverTypeIndex];

		hr = D3D11CreateDeviceAndSwapChain(nullptr, g_driverType, nullptr, createDeviceFlags, featureLevels, numFeatureLevels,
			D3D11_SDK_VERSION, &sd, &g_pSwapChain, &g_pd3dDevice, &g_featureLevel, &g_pImmediateContext);

		if (hr == E_INVALIDARG)
		{
			// DirectX 11.0 platforms will not recognize D3D_FEATURE_LEVEL_11_1 so we need to retry without it
			hr = D3D11CreateDeviceAndSwapChain(nullptr, g_driverType, nullptr, createDeviceFlags, &featureLevels[1], numFeatureLevels - 1,
				D3D11_SDK_VERSION, &sd, &g_pSwapChain, &g_pd3dDevice, &g_featureLevel, &g_pImmediateContext);
		}

		if (SUCCEEDED(hr))
			break;
	}
	if (FAILED(hr))
		return hr;

	// Create a render target view
	ID3D11Texture2D* pBackBuffer = nullptr;
	hr = g_pSwapChain->GetBuffer(0, __uuidof(ID3D11Texture2D), (LPVOID*)&pBackBuffer);
	if (FAILED(hr))
		return hr;

	hr = g_pd3dDevice->CreateRenderTargetView(pBackBuffer, nullptr, &g_pRenderTargetView);
	pBackBuffer->Release();
	if (FAILED(hr))
		return hr;

	D3D11_BLEND_DESC blendStateDescription;
	// Clear the blend state description.
	ZeroMemory(&blendStateDescription, sizeof(D3D11_BLEND_DESC));

	// Create an alpha enabled blend state description.
	blendStateDescription.RenderTarget[0].BlendEnable = TRUE;
	blendStateDescription.RenderTarget[0].SrcBlend = D3D11_BLEND_SRC_ALPHA;
	blendStateDescription.RenderTarget[0].DestBlend = D3D11_BLEND_INV_SRC_ALPHA;
	blendStateDescription.RenderTarget[0].BlendOp = D3D11_BLEND_OP_ADD;
	blendStateDescription.RenderTarget[0].SrcBlendAlpha = D3D11_BLEND_ONE;
	blendStateDescription.RenderTarget[0].DestBlendAlpha = D3D11_BLEND_ZERO;
	blendStateDescription.RenderTarget[0].BlendOpAlpha = D3D11_BLEND_OP_ADD;
	blendStateDescription.RenderTarget[0].RenderTargetWriteMask = 0x0f;

	// Create the blend state using the description.
	int result = g_pd3dDevice->CreateBlendState(&blendStateDescription, &g_pAlphaBlendingEnabledState);
	if (FAILED(result))
	{
		return false;
	}

	// Modify the description to create an alpha disabled blend state description.
	blendStateDescription.RenderTarget[0].BlendEnable = FALSE;

	// Create the blend state using the description.
	result = g_pd3dDevice->CreateBlendState(&blendStateDescription, &g_pAlphaBlendingDisabledState);
	if (FAILED(result))
	{
		return false;
	}

	D3D11_SAMPLER_DESC samplerDesc;
	ZeroMemory(&samplerDesc, sizeof(samplerDesc));
	// Create a texture sampler state description.
	samplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_POINT;
	samplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
	samplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
	samplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
	samplerDesc.MipLODBias = 0.0f;
	samplerDesc.MaxAnisotropy = 1;
	samplerDesc.ComparisonFunc = D3D11_COMPARISON_ALWAYS;
	samplerDesc.BorderColor[0] = 0;
	samplerDesc.BorderColor[1] = 0;
	samplerDesc.BorderColor[2] = 0;
	samplerDesc.BorderColor[3] = 0;
	samplerDesc.MinLOD = 0;
	samplerDesc.MaxLOD = D3D11_FLOAT32_MAX;

	// Create the texture sampler state.
	result = g_pd3dDevice->CreateSamplerState(&samplerDesc, &g_sampleStates[0]);
	if (FAILED(result))
	{
		return false;
	}

	// Create a texture sampler state description.
	samplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
	samplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_WRAP;
	samplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_WRAP;
	samplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_WRAP;

	// Create the texture sampler state.
	result = g_pd3dDevice->CreateSamplerState(&samplerDesc, &g_sampleStates[1]);
	if (FAILED(result))
	{
		return false;
	}

	ZeroMemory(&samplerDesc, sizeof(samplerDesc));
	// Create a texture sampler state description.
	samplerDesc.Filter = D3D11_FILTER_MIN_MAG_MIP_LINEAR;
	samplerDesc.AddressU = D3D11_TEXTURE_ADDRESS_CLAMP;
	samplerDesc.AddressV = D3D11_TEXTURE_ADDRESS_CLAMP;
	samplerDesc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
	samplerDesc.MipLODBias = 0.0f;
	samplerDesc.MaxAnisotropy = 1;
	samplerDesc.ComparisonFunc = D3D11_COMPARISON_ALWAYS;
	samplerDesc.BorderColor[0] = 0;
	samplerDesc.BorderColor[1] = 0;
	samplerDesc.BorderColor[2] = 0;
	samplerDesc.BorderColor[3] = 0;
	samplerDesc.MinLOD = 0;
	samplerDesc.MaxLOD = D3D11_FLOAT32_MAX;

	// Create the texture sampler state.
	result = g_pd3dDevice->CreateSamplerState(&samplerDesc, &g_sampleStates[2]);
	if (FAILED(result))
	{
		return false;
	}

	// Compile the vertex shader
	ID3DBlob* pVSBlob = nullptr;
	WCHAR shaderFxFile[] = { L"D3DTest.fx" };
	hr = CompileShaderFromFile(shaderFxFile, "VS", "vs_4_0", &pVSBlob);
	if (FAILED(hr))
	{
		MessageBox(nullptr,
			TEXT("The FX file cannot be compiled.  Please run this executable from the directory that contains the FX file."), 
			TEXT("Error"), MB_OK);
		return hr;
	}

	// Create the vertex shader
	hr = g_pd3dDevice->CreateVertexShader(pVSBlob->GetBufferPointer(), pVSBlob->GetBufferSize(), nullptr, &g_pVertexShader);
	if (FAILED(hr))
	{
		pVSBlob->Release();
		return hr;
	}

	// Define the input layout
	D3D11_INPUT_ELEMENT_DESC layout[] =
	{
		{ "POSITION", 0, DXGI_FORMAT_R32G32B32_FLOAT, 0, 0, D3D11_INPUT_PER_VERTEX_DATA, 0 },
		{ "TEXCOORD", 0, DXGI_FORMAT_R32G32_FLOAT, 0, 12, D3D11_INPUT_PER_VERTEX_DATA, 0 },
	};
	UINT numElements = ARRAYSIZE(layout);

	// Create the input layout
	hr = g_pd3dDevice->CreateInputLayout(layout, numElements, pVSBlob->GetBufferPointer(),
		pVSBlob->GetBufferSize(), &g_pVertexLayout);
	pVSBlob->Release();
	if (FAILED(hr))
		return hr;

	// Set the input layout
	g_pImmediateContext->IASetInputLayout(g_pVertexLayout);

	hr = compilePixelShader(shaderFxFile,"PS",&g_pPixelShader8);
	if (FAILED(hr)) return hr;

	hr = compilePixelShader(shaderFxFile, "PS_BG", &g_pPixelShaderBG);
	if (FAILED(hr)) return hr;

	for (size_t i = 0; i <= NumCharShaders; i++)
	{
		char sname[128];
		strcpy(sname, "PS4X");
		if (i > 0)
		{
			strcat(sname, "_P");			
			int Num = strlen(sname);
			sname[Num] = '0' + i;
			sname[Num + 1] = '\0';
		}
		hr = compilePixelShader(shaderFxFile, sname, &g_pPixelShader32[i]);
		if (FAILED(hr)) return hr;
	}

	// Create vertex buffer
	SimpleVertex vertices[] =
	{
		{ { -0.5f,-0.5f, 0 }, { 0, 0 } },
		{ {  0.5f,-0.5f, 0 }, { 1, 0 } },
		{ { -0.5f, 0.5f, 0 }, { 0, 1 } },
		{ {  0.5f, 0.5f, 0 }, { 1, 1 } },
	};

	D3D11_BUFFER_DESC bd;
	ZeroMemory(&bd, sizeof(bd));
	bd.Usage = D3D11_USAGE_DEFAULT;
	bd.ByteWidth = sizeof(vertices);
	bd.BindFlags = D3D11_BIND_VERTEX_BUFFER;
	bd.CPUAccessFlags = 0;
	D3D11_SUBRESOURCE_DATA InitData;
	ZeroMemory(&InitData, sizeof(InitData));
	InitData.pSysMem = vertices;
	hr = g_pd3dDevice->CreateBuffer(&bd, &InitData, &g_pVertexBuffer);
	if (FAILED(hr))
		return hr;

	// Set vertex buffer
	UINT stride = sizeof(SimpleVertex);
	UINT offset = 0;
	g_pImmediateContext->IASetVertexBuffers(0, 1, &g_pVertexBuffer, &stride, &offset);
	/*
	bd.Usage = D3D11_USAGE_DEFAULT;
	bd.ByteWidth = sizeof(WORD) * 36;        // 36 vertices needed for 12 triangles in a triangle list
	bd.BindFlags = D3D11_BIND_INDEX_BUFFER;
	bd.CPUAccessFlags = 0;

	InitData.pSysMem = indices;
	hr = g_pd3dDevice->CreateBuffer(&bd, &InitData, &g_pIndexBuffer);
	if (FAILED(hr))
		return hr;

	// Set index buffer
	g_pImmediateContext->IASetIndexBuffer(g_pIndexBuffer, DXGI_FORMAT_R16_UINT, 0);
	*/
	// Set primitive topology
	g_pImmediateContext->IASetPrimitiveTopology(D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP);

	// Create the constant buffer
	bd.Usage = D3D11_USAGE_DEFAULT;
	bd.ByteWidth = sizeof(ConstantBuffer);
	bd.BindFlags = D3D11_BIND_CONSTANT_BUFFER;
	bd.CPUAccessFlags = 0;
	hr = g_pd3dDevice->CreateBuffer(&bd, nullptr, &g_pConstantBuffer);
	if (FAILED(hr))
		return hr;

	// Initialize the world matrix
	g_World = XMMatrixIdentity();

	// Initialize the view matrix
	XMVECTOR Eye = XMVectorSet(0.0f, 1.0f, -5.0f, 0.0f);
	XMVECTOR At = XMVectorSet(0.0f, 1.0f, 0.0f, 0.0f);
	XMVECTOR Up = XMVectorSet(0.0f, 1.0f, 0.0f, 0.0f);
	g_View = XMMatrixLookAtLH(Eye, At, Up);

	// Initialize the projection matrix
	g_Projection = XMMatrixPerspectiveFovLH(XM_PIDIV2, width / (FLOAT)height, 0.01f, 100.0f);
	cb.mProjection = XMMatrixTranspose(XMMatrixOrthographicOffCenterLH(0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 100));// XMMatrixIdentity();// XMMatrixTranspose(g_World);XMMatrixTranspose(g_Projection);
	
	return S_OK;
}

void DrawQuad(int x, int y, int w, int h, BYTE c[])
{
	POLY_FT4* p = &poly4x[poly4xcount++];
	p->tpage = 0xffff;
	p->x = x;
	p->y = y;
	p->w = w;
	p->h = h;
	p->color[0] = c ? c[0] : 0xff;
	p->color[1] = c ? c[1] : 0xff;
	p->color[2] = c ? c[2] : 0xff;
}

ID3D11PixelShader* GetTPageShader(TPage* tp)
{
	if (tp->bits != 32) return g_pPixelShader8;

	if (tp->bghint)
	{
		return g_pPixelShaderBG;
	}

	for (size_t i = 0; i < NumShaderMaps; i++)
	{
		if (CustomShaderHints[i] == tp->shader_hint)
		{
			cb.mPalParams.x = CustomShaderParamsX[i]/255.0f;
			cb.mPalParams.y = CustomShaderParamsY[i]/255.0f;
			cb.mPalParams.z = CustomShaderParamsZ[i]/255.0f;
			return g_pPixelShader32[CustomShaderMap[i]];
		}
	}

	return g_pPixelShader32[0];
}


void DrawTextureUV4X(POLY_FT4* p)
{
	float ts = TPAGE_SZ;
	float tw = 1.f / ts;
	float th = 1.f / ts;

	switch (p->flags & 3)
	{
	case 0:
		cb.mUVParams = XMFLOAT4(p->u * tw, p->v * th, p->uw * tw, p->vw * th);
		break;
	case 1:
		cb.mUVParams = XMFLOAT4((p->u + p->uw) * tw, p->v * th, -p->uw * tw, p->vw * th);
		break;
	case 2:
		cb.mUVParams = XMFLOAT4(p->u * tw, (p->v + p->vw) * th, p->uw * tw, -p->vw * th);
		break;
	case 3:
		cb.mUVParams = XMFLOAT4((p->u + p->uw) * tw, (p->v + p->vw) * th, -p->uw * tw, -p->vw * th);
		break;
	}

	float x = p->x * SCREEN_WIDTH / 320.0f;
	float w = p->w * SCREEN_WIDTH / 320.0f;
	float y = p->y * SCREEN_HEIGHT / 240.0f;
	float h = p->h * SCREEN_HEIGHT / 240.0f;

	float* m = (float*)g_World.r;

	m[12] = x + w * 0.5f;
	m[13] = y + h * 0.5f;
	m[0] = w;
	m[5] = h;

	TPage* tp = &Pages[p->tpage];

	float cf = 1;

	if (tp->bits == 32)
	{
		if (f_fade && _fade_table && allow_fade && tp->bghint > 1)
		{
			cf = 0.5 + *_fade_table / 256.f;
		}

		if (p->tpage >= TPAGE_4X_OFFSET)
		{
			g_pImmediateContext->PSSetShaderResources(3, 1, &Pages[p->tpage-TPAGE_4X_OFFSET].textureView);			
		}
	}

	cb.mExtraParams.x = cf;//Mark brightness col pal index for fade in/out
	cb.mExtraParams.y = (p->clut >> 4) / 256.f;
	cb.mExtraParams.z = 1;
	cb.mExtraParams.w = p->semialpha ? 0.5f : 1.f;
	cb.mWorld = XMMatrixTranspose(g_World);
	cb.mColor = XMFLOAT4(1, 1, 1, 1);
	g_pImmediateContext->PSSetShader(GetTPageShader(tp), nullptr, 0);
	g_pImmediateContext->UpdateSubresource(g_pConstantBuffer, 0, nullptr, &cb, 0, 0);
	g_pImmediateContext->PSSetShaderResources(1, 1, &tp->textureView);	
	g_pImmediateContext->Draw(4, 0);
}


void DrawQuad4X(POLY_FT4* p)
{
	float* m = (float*)g_World.r;
	m[12] = p->x + p->w * 0.5f;
	m[13] = p->y + p->h * 0.5f;
	m[0] = p->w;
	m[5] = p->h;
	cb.mWorld = XMMatrixTranspose(g_World);	
	cb.mUVParams = XMFLOAT4(0,0, 1, 1);
	cb.mColor = XMFLOAT4(p->color[0]/255.f, p->color[1]/255.f, p->color[2]/255.f, 1.0f);
	cb.mExtraParams.x = 0;
	cb.mExtraParams.y = 0;
	cb.mExtraParams.z = 0;
	cb.mExtraParams.w = 1;
	g_pImmediateContext->PSSetShader(g_pPixelShader8, nullptr, 0);
	g_pImmediateContext->UpdateSubresource(g_pConstantBuffer, 0, nullptr, &cb, 0, 0);
	g_pImmediateContext->Draw(4, 0);
}

void DrawQuadTexture(ID3D11ShaderResourceView *tview, int x, int y, int w, int h, BYTE c[])
{
	float* m = (float*)g_World.r;
	m[12] = x + w * 0.5f;
	m[13] = y + h * 0.5f;
	m[0] = w;
	m[5] = h;
	cb.mWorld = XMMatrixTranspose(g_World);
	cb.mUVParams = XMFLOAT4(0, 0, 1, 1);
	cb.mColor = c ? XMFLOAT4(c[0] / 255.f, c[1] / 255.f, c[2] / 255.f, 1.0f) : XMFLOAT4(1, 1, 1, 1);
	cb.mExtraParams = XMFLOAT4(0, 0, 0, 0);
	g_pImmediateContext->UpdateSubresource(g_pConstantBuffer, 0, nullptr, &cb, 0, 0);
	g_pImmediateContext->PSSetShader(g_pPixelShader8, nullptr, 0);
	g_pImmediateContext->PSSetShaderResources(1, 1, &tview);
	g_pImmediateContext->Draw(4, 0);
}

extern "C" uint64_t ModifyFrame(int* tindex, int sx, int sy, int sw, int sh, int palette);

typedef struct
{
	BYTE* src;
	DWORD* dst;
	WORD linesize, pitch, height, dst_pitch;
}RectCopy;


void CopyRectBytes(RectCopy* rect)
{
	BYTE* src = rect->src;
	DWORD* dst = rect->dst;

	for (size_t i = 0; i < rect->height; i++)
	{
		memcpy(dst, src, rect->linesize);
		dst += rect->dst_pitch;
		src += rect->pitch;
	}
}

void TickAnim(_BMPINFO* anim, RectCopy* rect, int expected_height, int instance)
{
	if (anim == nullptr || anim->delay == 0) return;

	WORD numanim;

	if (anim->indices)
	{
		numanim = 0;
		while (anim->indices[numanim] != 0xffff) numanim++;
	}
	else
	{
		numanim = anim->num;
	}

	WORD totalframes = numanim * anim->delay;
	WORD frameind = (anim->time[instance] / anim->delay) % numanim;

	if (anim->flags & 0x08)
	{
		numanim /= 2;

		totalframes = 0;
		int frindex = 0;
		frameind = 0;
		while (anim->indices[frindex * 2] != 0xffff)
		{
			int delay = anim->indices[frindex * 2 + 1];
			totalframes += delay == 0 ? anim->delay : delay;
			if (anim->time[instance] >= totalframes)
			{
				frameind++;
			}
			frindex++;
		}
	}

	if (anim->time[instance] >= totalframes)
	{
		if (anim->flags & 1)
		{
			frameind = 0;
			anim->time[instance] = 0;
		}
		else
		{
			frameind = numanim - 1;
			anim->time[instance] = totalframes - 1;
		}
	}
	else if (!f_pause)
	{
		anim->time[instance]++;
	}

	if (anim->flags & 0x80)
	{
		frameind = numanim - 1 - frameind;
	}

	if (anim->indices)
	{
		frameind = anim->indices[anim->flags & 0x08 ? frameind * 2 : frameind];
	}

	anim->flags |= 0x40;

	WORD imtileh = expected_height / anim->ty;

	rect->height = anim->h * 4;
	rect->linesize = anim->w * 4 * 4;

	rect->src += (frameind % anim->tx) * rect->pitch / anim->tx; // x shift
	rect->src += (frameind / anim->tx) * rect->pitch * imtileh; // y shift

	if (imtileh > rect->height)
	{
		rect->src += rect->pitch * (imtileh - rect->height);
	}
}

extern "C" DWORD g_UpdateFB3;

static WORD g_NextFreePage = TPAGE_EXTRA;

void DrawTextureUV(int tindex, int palette, float x, float y, float w, float h, int sx, int sy, int sw, int sh, int flags,int semialpha)
{
	uint64_t id = ModifyFrame(&tindex, sx, sy, sw, sh, palette);

	POLY_FT4* p = &poly4x[poly4xcount++];
	p->tpage = tindex;
	p->clut = palette;
	p->x = x;
	p->y = y;
	p->w = w;
	p->h = h;
	p->u = sx;
	p->v = sy;
	p->uw = sw;
	p->vw = sh;
	p->flags = flags;
	p->semialpha = semialpha ? 0.5f : 1.0f;
}

void DrawQuadUV(int tpage, int palette, float x, float y, float w, float h, int sx, int sy, int sw, int sh,int flags,int semialpha)
{	
	WORD tindex;

	if (tpage & 0x8000)
	{
		tindex = tpage;
	}
	else
	{
		int tx = (tpage & 0x0f) << 7;
		int ty = (tpage & 0x10) << 4;

		sx += tx;
		sy += ty;

		tindex = (sx >> 8) | ((sy >> 8) << 4);
	}	

	DrawTextureUV(tindex, palette, x, y, w, h, sx%TPAGE_SZ, sy%TPAGE_SZ, sw, sh, flags, semialpha);
}


//
//
//
void CleanupDevice()
{
	if (g_pImmediateContext) g_pImmediateContext->ClearState();
	if (g_renderTargetStaging) g_renderTargetStaging->Release();
	if (g_renderTargetStagingBig) g_renderTargetStagingBig->Release();
	if (g_renderTargetTex) g_renderTargetTex->Release();
	if (g_pAlphaBlendingEnabledState) g_pAlphaBlendingEnabledState->Release();
	if (g_pAlphaBlendingDisabledState) g_pAlphaBlendingDisabledState->Release();
	if (g_sampleStates[0]) g_sampleStates[0]->Release();
	if (g_sampleStates[1]) g_sampleStates[1]->Release();
	if (g_pConstantBuffer) g_pConstantBuffer->Release();
	if (g_pVertexBuffer) g_pVertexBuffer->Release();	
	if (g_pVertexLayout) g_pVertexLayout->Release();
	if (g_pVertexShader) g_pVertexShader->Release();
	if (g_pPixelShader8) g_pPixelShader8->Release();
	if (g_pPixelShaderBG) g_pPixelShaderBG->Release();
	for (size_t i = 0; i <= NumCharShaders; i++)
	{
		if (g_pPixelShader32[i]) g_pPixelShader32[i]->Release();
	}
	
	if (g_pPixelShaderPP) g_pPixelShaderPP->Release();
	if (g_pRenderTargetView) g_pRenderTargetView->Release();
	if (g_pRenderTargetView0) g_pRenderTargetView0->Release();
	if (g_pRenderTargetShaderView) g_pRenderTargetShaderView->Release();
	if (g_pSwapChain) g_pSwapChain->Release();
	if (g_pImmediateContext) g_pImmediateContext->Release();
	if (g_pd3dDevice) g_pd3dDevice->Release();
}

extern "C"
{
	static int   g_UpdatePalettes = 0;
	static DWORD g_UpdateFB  = 0; // Old gfx pages
	static DWORD g_UpdateFB2 = 0; // 4x pages
	static DWORD g_UpdateFB3 = 0; // extra overlay pages

	extern short gstate;

	static char MBuff[100];

	void Win95DebugInt(const char* key, int a)
	{
		sprintf(MBuff, "%s: %d\r\n", key, a);
		OutputDebugStringA(MBuff);
	}

	void Win95DebugInt2(const char* key, int a,int b)
	{
		sprintf(MBuff, "%s: %d, %d\r\n", key, a, b);
		OutputDebugStringA(MBuff);
	}

	WORD GetTPage(WORD tmode, WORD tr, WORD x, WORD y)
	{
		return (((x)>>6)&0x0f)|((y>>8)<<4);
	}

	WORD GetTIndex(WORD x, WORD y)
	{
		int i = (x >> 7) | ((y >> 8) << 4);			
		return i;
	}
		
#define MAX_SOBJECTS 16384

	typedef struct
	{
		RECT_PSX main;
		RECT_PSX sub[100];
		DWORD id;
		DWORD subcount;
	}SRECT;

	StaticArray<uint64_t> savedobjects(MAX_SOBJECTS);

	HashMap<uint64_t,uint32_t> fighterobjects;
	HashMap<uint64_t,uint32_t> fighterobjects2;
	HashMap<uint64_t,BMPINFO, 254, 16> bmps;
	Bitmap24_256x256_Base* bgbitmapslots[32] = { 0 };

	BYTE sumbmp[256 * 256] = { 0 };
	WORD palbmp[256] = { 0 }, palsize = 0;

	uint64_t CheckRect(BYTE* tex, short sx, short sy, short sw, short sh, int palette, int pitch)
	{
		uint64_t id = 0;

		if (sw == 0 || sh == 0)
		{
			return 0;
		}

		if (sw == 160 && (sh >= 40 && sh < 85)) {
			return 0;
		}

		DWORD paltot = 0;

		if (palette >= 0)
		{
			WORD* pal16 = get_pal(palette);
			if (pal16) {
				palsize = *pal16;
				pal16 += 3;
				palbmp[0] = 0;
				for (size_t i = 1; i < palsize; i++)
				{
					WORD pd = (*pal16 & 0x7fff);
					palbmp[i] = pd;
					paltot += pd << 1;
					pal16++;
				}
				if (paltot == 0) return 0;
			}
		}

		int pi = 0;

		BYTE* p = tex + pitch * (sy % pitch) + (sx % pitch);
		BYTE* dst = sumbmp;

		for (size_t i = 0; i < sh; i++)
		{
			for (size_t j = 0; j < sw; j++)
			{
				*dst++ = p[j];
				id += p[j];
			}

			id *= 7;
			p += pitch;
		}

		return (id << 8) | (paltot & 0xff);
	}

	BMPINFO* LoadBitmapObject(uint64_t id, bool fighter)
	{
		BMPINFO* bmp = bmps.Find(id);

		if (bmp)
		{
			return bmp;
		}

		BMPINFO* inf = bmps.AddEmpty(id);
		if (inf == nullptr) return nullptr;

		if (fighter) 
		{
			
		}
		else if (Mode4X)
		{
			uint32_t* ddV = fighterobjects.Find(id);

			if (ddV)
			{
				if (LoadTextureTGAorPNG(*ddV, 2, inf))
				{
					inf->anim = bmps.Find(*ddV);
					return inf;
				}
			}	
		}
		else 
		{
			return nullptr;
		}


		if (Mode4X) 
		{
			if (fighter) 
			{
				LoadTextureBmp(id, inf, nullptr);
			}
			else 
			{
				LoadTextureTGAorPNG(id, 3, inf);
			}
		}else
		if (LoadTextureBmp(id, inf, nullptr))
		{
			
		}
		return inf;
	}

	void SaveBitmapObject(uint64_t id, void* pix, void* pal, WORD palcnt, WORD w, WORD h, bool savefighter, bool pal16)
	{
		if (savedobjects.Find(id) >= 0) return;

		char filename[128];

		if (savefighter)
		{
			uint32_t fighter = id / 10000;
			sprintf(filename, "arcade/objects/%d0", fighter);
			CreateDirectoryA(filename, nullptr);
			sprintf(filename, "arcade/objects/%d0/%d.bmp", fighter, (uint32_t)(id % 1000));
		}
		else
		{
			sprintf(filename, "arcade/objects/%I64x.bmp", id);
		}
		
		Save8BitBmp(filename, (BYTE*)pix, pal, palcnt, w, h, pal16);
		savedobjects.Add(id);
	}

	void DLoadImage(RECT_PSX* rect, void* data, u_long id)
	{
    	WORD tindex = GetTIndex(rect->x, rect->y);

		InitTPage(tindex, 8, TPAGE_SZ);

		BYTE* dst = Pages[tindex].data + (rect->y % TPAGE_SZ) * TPAGE_SZ + ((rect->x * 2) % TPAGE_SZ);
		BYTE* src = (BYTE*)data;

		g_UpdateFB |= 1 << tindex;

		int pitch = rect->w * 2;
		
		if (id > 0 && pitch == TPAGE_SZ)
		{
			memcpy(dst, src, TPAGE_SZ * rect->h);

			BMPINFO* bitmap4x = LoadBitmapObject(id, false);

			if (bitmap4x && bitmap4x->pixels)
			{
				if (bgbitmapslots[tindex] == nullptr)
				{
					bgbitmapslots[tindex] = new Bitmap24_256x256_Base();
				}

				bgbitmapslots[tindex]->id = id;
				bgbitmapslots[tindex]->flags = 0xff;

				int tindex32 = tindex + TPAGE_4X_OFFSET;
				const DWORD ts = TPAGE_SZ * IMAGE_UPSCALE;
				InitTPage(tindex32, 32, ts);
				memcpy(Pages[tindex32].data, bitmap4x->pixels, ts * ts * 4);
				Pages[tindex32].bghint = id;

				g_UpdateFB2 |= 1 << tindex;
			}
			else
			if (bgbitmapslots[tindex] == nullptr || !bgbitmapslots[tindex]->withdata)
			{
				if (bgbitmapslots[tindex]) delete bgbitmapslots[tindex];
				bgbitmapslots[tindex] = new Bitmap24_256x256_Data();
			}
			else if (bgbitmapslots[tindex]->withdata)
			{
				((Bitmap24_256x256_Data*)bgbitmapslots[tindex])->clear();
			}

			bgbitmapslots[tindex]->id = id;
		}
		else
		{
			if (bgbitmapslots[tindex])
			{
				delete bgbitmapslots[tindex];
				bgbitmapslots[tindex] = nullptr;
			}			

			for (size_t i = 0; i < rect->h; i++)
			{
				memcpy(dst, src, pitch);
				dst += TPAGE_SZ;
				src += pitch;
			}
		}
	}

	WORD getClut(WORD x, WORD y)
	{
		return (y<<CLUT_ID_SHIFT)+x;
	}

	u_short DLoadTPageFighter(u_short* pix, int x, int y, int w, int h,int pal,int fighter,int fver, int frame_offset, WORD **info)
	{
        PALINFO pi = palram[pal >> 4];
		DWORD palCnt = *pi.palid;
		bool isExternal = pix[0] == 0xffff;
		WORD tindex = GetTIndex(x, y);
		WORD fg = fighter & 0x3f;
		BYTE* src = (BYTE*)pix;
		unsigned int bmpid = 0;
		BYTE* addrect = nullptr;
		*info = nullptr;
		uint64_t rectid0 = 0;
		WORD side = fighter & 0x80 ? 1 : 0;

		if (pal && (palCnt > 62 && palCnt < 65))
		{
			if (isExternal)
			{
				bmpid = (fg * 10000) + (fver * 1000) + pix[1];
			}
			else 
			{
				if (char_texture_type[side] < 2)
				{
					bmpid = (fg * 10000) + (fver * 1000) + 100 + ((frame_offset / 20) % 1000);
				}

				if (IsFighter4X(fg * 10 + fver))
				{
					rectid0 = CheckRect(src, 0, 0, w, h, -1, w);

					if (uint32_t* idptr = fighterobjects2.Find(rectid0))
					{
						bmpid = *idptr;
					}
				}
				// GS_FIGHTING
				else if (gstate == 0x02)
				{
					addrect = src;
				}
				else
				{
					bmpid = 0;
				}
			}
		}
		else
		if (isExternal)
		{
			src = nullptr;
		}

		if (bmpid)
		{
			BMPINFO* inf = LoadBitmapObject(bmpid, true);

			if (inf->pixels)
			{				
				*info = (WORD*)inf;
				w = inf->w;
				h = inf->h;
				src = inf->pixels;
				if (addrect == nullptr) addrect = src;				
			}
		}

		if (addrect && bmpid)
		{
			uint64_t rectid = CheckRect(addrect, 0, 0, w, h, -1, w);
			uint32_t* idptr = fighterobjects.Find(rectid);
			if (idptr == nullptr)
			{
				fighterobjects.Add(rectid,bmpid);

				if (rectid0)
				{
					if (fighterobjects2.Find(rectid0) == nullptr)
					{
						fighterobjects2.Add(rectid0, bmpid);
					}					
				}
			}
		}

		InitTPage(tindex, 8, TPAGE_SZ);

		if (src) 
		{
			BYTE* dst = Pages[tindex].data +
				((y % TPAGE_SZ) * TPAGE_SZ) +
				((x * 2) % TPAGE_SZ);

			for (size_t i = 0; i < h; i++)
			{
				memcpy(dst, src, w);
				dst += TPAGE_SZ;
				src += w;
			}
		}
		else
		{
			memset(Pages[tindex].data, 0, TPAGE_SZ*TPAGE_SZ);
		}

		g_UpdateFB |= 1<<tindex;

		return GetTPage(0, 0, x, y);
	}

	u_short DLoadTPage(u_long* pix, int tp, int abr, int x, int y, int w, int h, u_long id)
	{
		WORD tindex = GetTIndex(x, y);

		InitTPage(tindex,8, TPAGE_SZ);

		BYTE* dst = Pages[tindex].data + (y % TPAGE_SZ) * TPAGE_SZ + ((x * 2) % TPAGE_SZ);
		BYTE* src = (BYTE*)pix;


		for (size_t i = 0; i < h; i++)
		{
			memcpy(dst, src, w);
			dst += TPAGE_SZ;
			src += w;
		}

		g_UpdateFB |= 1<< tindex;
		return GetTPage(0,0,x,y);
	}

	void LoadPaletteTex(u_short* srcpal, int nelem, int x, int y)
	{
		Palette565To8888(srcpal,(BYTE*)AllPAlettes + 256 * 4 * y,nelem);
		g_UpdatePalettes = 1;
	}

    long Win95_timeGetTime()
    {
        return (long)timeGetTime();
    }

    int Win95_Pump()
    {        
        // Main sample loop.
        MSG msg = {};

        while (PeekMessage(&msg, g_hWnd, 0, 0, PM_REMOVE))
        {
            /*
            char msgb[100];
            sprintf(msgb, "%x\n", msg.message);
            OutputDebugString(msgb);
            if (msg.message == WM_QUIT) {
                return TRUE;
            }*/

            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }

        return isRunning;
    }

    char* Win95_FPS(int a, int b)
    {
        static char tmp[10] = { 0 };
        return tmp;
    }

    void Win95_OUT(char* buff)
    {
        OutputDebugStringA(buff);
    }

	extern DB* cdb;

	void DrawPrim(u_long* up)
	{
		
	}

	BOOL RectIntersect(RECT_PSX* a, RECT_PSX* b)
	{
		short left  = a->x < b->x ? b->x : a->x;
		short right = (a->x+a->w) > (b->x+b->w) ? (b->x+b->w) : (a->x+a->w);
		if (left > right) return FALSE;
		short top = a->y < b->y ? b->y : a->y;
		short btm = (a->y + a->h) > (b->y + b->h) ? (b->y + b->h) : (a->y + a->h);
		return top < btm;
	}

	uint64_t ModifyFrame(int *tindex, int sx, int sy, int sw, int sh, int palette)
	{
		uint64_t rectid;

		bool bgpageload = false;

		if (*tindex & 0x8000)
		{
			rectid = *tindex & 0x7fff;
			*tindex = 22 + (*tindex & 0xf);
			bgpageload = true;
		}
		else if (bgbitmapslots[*tindex])
		{
			if (bgbitmapslots[*tindex]->flags == 0xff)
			{
				rectid = bgbitmapslots[*tindex]->id;
				rectid |= (sx & 0xff) | ((sy & 0xff) << 8);
				
				*tindex += TPAGE_4X_OFFSET;
				return rectid;
			}
			else
			{		
				return 0;
			}
			
		}
		else
		{
			rectid = CheckRect(Pages[*tindex].data, sx, sy, sw, sh, palette, TPAGE_SZ);
			bgpageload = false;
		}

		if (rectid == 0) return 0;

		if (Mode4X)
		{
			BMPINFO* anim = nullptr;

			// try to load as full sprite
			BMPINFO* info = LoadBitmapObject(rectid, false);

			int fobj = -1;

			if (!bgpageload && (info == nullptr || info->pixels == nullptr))
			{
				// try to load as fighter sprite
				info = LoadBitmapObject(rectid & RECTID_MASK, false);

				if (uint32_t *fpos = fighterobjects.Find(rectid & RECTID_MASK))
				{
					fobj = *fpos;

					if (info && info->pixels == nullptr)
					{
						SaveBitmapObject(fobj, sumbmp, palbmp, palsize, sw, sh, true, true);
						return rectid & RECTID_MASK;
					}
				}
			}

			if (info && info->pixels)
			{
				*tindex += TPAGE_4X_OFFSET;
				const DWORD ts = TPAGE_SZ * IMAGE_UPSCALE;
				InitTPage(*tindex, 32, ts);

				if (bgpageload)
				{
					if (Pages[*tindex].bghint != rectid)
					{
						memcpy(Pages[*tindex].data, info->pixels, ts * ts * 4);
						Pages[*tindex].bghint = rectid;
					}

					rectid = (rectid << 16) | (sy << 8) | sx;
				}
				else
				{
					RectCopy rect;
					rect.dst = ((DWORD*)Pages[*tindex].data) + ts * sy * IMAGE_UPSCALE + sx * IMAGE_UPSCALE;
					rect.dst_pitch = ts;
					rect.src = info->pixels;
					rect.pitch = info->w * 4;
					rect.linesize = rect.pitch;
					rect.height = info->h;

					if (fobj >= 0)
					{
						memset(Pages[*tindex].data, 0, ts * ts * 4);
						Pages[*tindex].shader_hint = ((fobj / 1000) << 8) | (rectid & 0xff);						
						TickAnim(info->anim, &rect, info->h, (*tindex - P1PAGE_INDEX) & 1);
					}
					else
					{
						Pages[*tindex].shader_hint = 0;
					}

					Pages[*tindex].bghint = 0;

					CopyRectBytes(&rect);
				}
				

				g_UpdateFB2 |= 1 << (*tindex - TPAGE_4X_OFFSET);
				return rectid;
			}
		}
		
		if (!bgpageload)
		{
			SaveBitmapObject(rectid, sumbmp, palbmp, palsize, sw, sh, false, true);
		}
		
		return rectid;
	}

	void DrawPrim0(u_long* up)
	{
		POLY_FT4* p = (POLY_FT4*)up;

		if ((p->flags & 0x80) && p->tpage == 0) {
			DrawQuad(p->x, p->y, p->w, p->h, p->color);	
		}
		else {
			DrawQuadUV(p->tpage, p->clut, p->x, p->y, p->w, p->h, p->u, p->v, p->uw, p->vw, p->flags & (0x03),p->semialpha ? 0.5f : 1.f);
		}
	}

	void ClearScreen()
	{
		
	}

	void UpdateFB(DWORD* flag,WORD offset,WORD count)
	{
		if (*flag == 0) return;

		D3D11_MAPPED_SUBRESOURCE mappedResource;

		for (DWORD i = 0; i < count; i++)
		{
			if ((*flag & (1 << i)) == 0) continue;

			int ii = i + offset;

			int ts = Pages[ii].size;
			if (ts < TPAGE_SZ) continue;
			int bts = Pages[ii].bits;

			if (Pages[ii].texture == nullptr) {
				CreateD3DTexture(ts, ts, 0, bts, ii);
			}

			if (Pages[ii].texture == nullptr) continue;

			int result = g_pImmediateContext->Map(Pages[ii].texture, 0, D3D11_MAP_WRITE_DISCARD, 0, &mappedResource);
			memcpy((BYTE*)mappedResource.pData, Pages[ii].data, ts * ts * bts / 8);
			g_pImmediateContext->Unmap(Pages[ii].texture, 0);
		}
		
		*flag = 0;
	}

	void DrawSync(WORD flags)
	{
		if (!g_InsideRender) return;

		if (g_UpdatePalettes) {
			D3D11_MAPPED_SUBRESOURCE mappedResource;
			int result = g_pImmediateContext->Map(Pages[TPAGE_PALETTE].texture, 0, D3D11_MAP_WRITE_DISCARD, 0, &mappedResource);
			memcpy((BYTE*)mappedResource.pData, AllPAlettes, sizeof(AllPAlettes));
			g_pImmediateContext->Unmap(Pages[TPAGE_PALETTE].texture, 0);
			g_UpdatePalettes = 0;
		}

		UpdateFB(&g_UpdateFB, 0, TPAGE_COUNT);

		if (keyState[VK_INSERT]) 
		{
			g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingDisabledState, 0, 0xff);			

			static const int _PXTbl[] =
			{
				0,1,2,3,0,1,2,3,
				0,1,2,3,0,1,2,3,
				0,1,2,3,0,1,2,3,
				0,1,2,3,0,1,2,3,
			};

			static const int _PYTbl[] =
			{
				0,0,0,0,1,1,1,1,
				0,0,0,0,1,1,1,1,
				2,2,2,2,3,3,3,3,
				2,2,2,2,3,3,3,3,
			};

			g_pImmediateContext->ClearRenderTargetView(g_pRenderTargetView, Colors::Black);

			for (size_t i = 0; i < TPAGE_COUNT; i++)
			{
				TPage* tp = Pages + i;
				if (tp->textureView == NULL) continue;
				int tx = _PXTbl[i] * 80;
				int ty = _PYTbl[i] * 60;

				POLY_FT4 p;
				p.tpage = i;
				p.clut = 0;
				p.x = tx;
				p.y = ty;
				p.w = 80;
				p.h = 60;
				p.u = 0;
				p.v = 0;
				p.uw = TPAGE_SZ;
				p.vw = TPAGE_SZ;
				p.flags = 0;
				p.semialpha = 1;

				DrawTextureUV4X(&p);
			}

			return;
		}

		g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingEnabledState, 0, 0xff);

		poly4xcount = 0;

		for (int i = 0; i < OTSIZE; i++)
		{
			u_long* p = (u_long*)cdb->ot[i].next;
			while (p) {
				DrawPrim0(p);
				p = (u_long*)(*p);
			}
		}

		UpdateFB(&g_UpdateFB2, TPAGE_4X_OFFSET, TPAGE_COUNT);
		UpdateFB(&g_UpdateFB3, TPAGE_EXTRA, TPAGE_COUNT);

		if (poly4xcount > 0)
		{
			for (size_t i = 0; i < poly4xcount; i++)
			{
				POLY_FT4 *p = &poly4x[i];
				if (p->tpage == 0xffff)
					DrawQuad4X(p);
				else
					DrawTextureUV4X(p);
			}
		}

		g_NextFreePage = TPAGE_EXTRA;

		if (_fade_table) {
			if (_fade_table[1] == 0xffff) {
				if (_fade_table[0] > 0) {
					_fade_table = NULL;
				}
			}
			else {
				_fade_table++;
			}
		}
	}

    void Win95_Blast_Frame()
    {
		if (!g_InsideRender) return;

		// Present our back buffer to our front buffer
		g_pSwapChain->Present(0, 0);
    }

	int mod_DrawOTag(void* ot)
	{
		return 0;
	}

	void DrawOTag(OTOBJ* o)
	{

	}

	static int current_tpage = 0;

	void SetDrawMode(void* list, int x, int y, int tpage, RECT_PSX* area)
	{
		current_tpage = tpage;
	}

	void SetSemiTrans(POLY_FT4* p, DWORD value)
	{
		p->tpage = current_tpage;
		p->semialpha = value;
		p->flags &= 3;
		if (p->uw <= 0) p->uw = p->w;
		if (p->vw <= 0) p->vw = p->h;
	}

	void SetPolyF4(POLY_F4* p4)
	{
		memset(p4, 0, sizeof(POLY_F4));
	}

	void SetPolyFT4(POLY_FT4* p4)
	{
		memset(p4, 0, sizeof(POLY_FT4));
	}

	void SetSprt(SPRT* sp)
	{
		memset(sp, 0, sizeof(SPRT));
	}

	void setXY4(POLY_FT4* p, int x, int y, int w, int h, int flip)
	{
		p->x = x;
		p->y = y;
		p->w = w;
		p->h = h;
		p->flags &= ~3;
		p->flags |= flip;
	}

	void setXYWH(POLY_FT4* p, int x, int y, int w, int h)
	{
		p->x = x;
		p->y = y;
		p->w = w;
		p->h = h;
	}

	void setUVWH(POLY_FT4* p, int u, int w, int width, int height)
	{
		p->u = u;
		p->v = w;
		p->uw = width;
		p->vw = height;
		p->flags &= 3;
		p->tpage = current_tpage;
	}

	void setRGB0(POLY_FT4* p, BYTE r, BYTE g, BYTE b)
	{
		p->color[0] = r;
		p->color[1] = g;
		p->color[2] = b;
		p->flags |= 0x80;
	}

	void setXY0(BLK_FILL* p, int x, int y)
	{
		p->x = x;
		p->y = y;
	}

	void setWH(BLK_FILL* p, int x, int y)
	{
		p->w = x;
		p->h = y;
	}

	WORD ReadKeys(uint16_t *list)
	{
		WORD result = 0;
		for (size_t i = 0; i < 16; i++)
		{
			if (keyState[list[i]]) {
				result |= 1 << i;
			}
		}

		return result;
	}

	DWORD PadRead()
	{
		WORD p[2] = {0, 0};
		p[0] = ReadKeys(gameKeys[0]);
		p[1] = ReadKeys(gameKeys[1]);
		for (DWORD i = 0; i < 2; ++i)
		{
			auto state = XINPUT_STATE();
			const auto result = XInputGetState(i, &state);
			if (result == ERROR_SUCCESS)
			{
				// @formatter:off
				// TODO collision boxes? frame buffer view? frame by frame?
				constexpr auto JOY_RUN_L     = 1 << 0;
				constexpr auto JOY_RUN_R     = 1 << 1;
				constexpr auto JOY_BLOCK_L   = 1 << 2;
				constexpr auto JOY_BLOCK_R   = 1 << 3;
				constexpr auto JOY_HK        = 1 << 4;
				constexpr auto JOY_LK        = 1 << 5;
				constexpr auto JOY_LP        = 1 << 6;
				constexpr auto JOY_HP        = 1 << 7;
				constexpr auto JOY_COLL_BOX  = 1 << 8;  // TODO needs #define COLLISION_BOX 1
				constexpr auto JOY_RUN_PSX   = 1 << 9;  // TODO not implemented
				constexpr auto JOY_BLOCK_PSX = 1 << 10; // TODO not implemented
				constexpr auto JOY_START     = 1 << 11;
				constexpr auto JOY_UP        = 1 << 12;
				constexpr auto JOY_RIGHT     = 1 << 13;
				constexpr auto JOY_DOWN      = 1 << 14;
				constexpr auto JOY_LEFT      = 1 << 15;

				const auto g = state.Gamepad;
				const auto b = g.wButtons;

				if (b & XINPUT_GAMEPAD_DPAD_UP)        p[i] |= JOY_UP;
				if (b & XINPUT_GAMEPAD_DPAD_DOWN)      p[i] |= JOY_DOWN;
				if (b & XINPUT_GAMEPAD_DPAD_LEFT)      p[i] |= JOY_LEFT;
				if (b & XINPUT_GAMEPAD_DPAD_RIGHT)     p[i] |= JOY_RIGHT;
				if (b & XINPUT_GAMEPAD_START)          p[i] |= JOY_START;
				if (b & XINPUT_GAMEPAD_BACK)           p[i] |= 0;
				if (b & XINPUT_GAMEPAD_LEFT_THUMB)     p[i] |= 0;
				if (b & XINPUT_GAMEPAD_RIGHT_THUMB)    p[i] |= 0;
				if (b & XINPUT_GAMEPAD_LEFT_SHOULDER)  p[i] |= JOY_RUN_L;
				if (b & XINPUT_GAMEPAD_RIGHT_SHOULDER) p[i] |= JOY_BLOCK_R;
				if (b & XINPUT_GAMEPAD_A)              p[i] |= JOY_LP;
				if (b & XINPUT_GAMEPAD_B)              p[i] |= JOY_LK;
				if (b & XINPUT_GAMEPAD_X)              p[i] |= JOY_HP;
				if (b & XINPUT_GAMEPAD_Y)              p[i] |= JOY_HK;

				if (XINPUT_GAMEPAD_TRIGGER_THRESHOLD < g.bLeftTrigger)
					p[i] |= JOY_BLOCK_L;

				if (XINPUT_GAMEPAD_TRIGGER_THRESHOLD < g.bRightTrigger)
					p[i] |= JOY_RUN_R;

				// @formatter:on

				float x = g.sThumbLX;
				float y = g.sThumbLY;
				const auto m = sqrt(x * x + y * y);
				constexpr auto k = static_cast<float>(XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE);
				if (m > k)
				{
					x /= m;
					y /= m;
					constexpr auto z = 0.5;
					if (x < -z) p[i] |= JOY_LEFT;
					if (x > +z) p[i] |= JOY_RIGHT;
					if (y < -z) p[i] |= JOY_DOWN;
					if (y > +z) p[i] |= JOY_UP;
				}
			}
		}

		return p[0] | p[1] << 16;
	}

	int Wav95_Play(int id, int loop)
	{
		if (sndobj[id].data == NULL || NoSound) return 0;
		
		IXAudio2SourceVoice* snd = NULL;
		XAUDIO2_VOICE_STATE state = { 0 };

		bool is44K = sndobj[id].rate > 40000;

		if (is44K) {

			snd = soundChannels44[0];

			for (size_t i = 0; i < MAX_44K_CHANNELS; i++)
			{
				soundChannels44[i]->GetState(&state);
				if (state.BuffersQueued == 0) {
					snd = soundChannels44[i];
					break;
				}
			}
		}
		else {

			snd = soundChannels11[0];

			for (size_t i = 0; i < MAX_SND_CHANNELS; i++)
			{
				soundChannels11[i]->GetState(&state);
				if (state.BuffersQueued == 0) {
					snd = soundChannels11[i];
					break;
				}
			}
		}

		XAUDIO2_BUFFER buffer = { 0 };
		buffer.AudioBytes = sndobj[id].size;  //size of the audio buffer in bytes
		buffer.pAudioData = sndobj[id].data;  //buffer containing audio data
		buffer.pContext = sndobj[id].data;
		buffer.LoopCount = loop ? XAUDIO2_LOOP_INFINITE : 0;
		if (loop) {
			buffer.LoopBegin = 0;
			buffer.LoopLength = buffer.AudioBytes;
		}
		buffer.Flags = XAUDIO2_END_OF_STREAM; // tell the source voice not to expect any data after this buffer
		snd->Stop();
		snd->FlushSourceBuffers();
		snd->Discontinuity();
		snd->SubmitSourceBuffer(&buffer);
		snd->Start(0);

		return buffer.AudioBytes*500 / (sndobj[id].rate);
	}

	void Wav95_Stop(int id)
	{
		XAUDIO2_VOICE_STATE state = { 0 };
		IXAudio2SourceVoice* snd = NULL;

		if (id < 0) {
			for (size_t i = 0; i < MAX_44K_CHANNELS; i++)
			{
				snd = soundChannels44[i];
				snd->FlushSourceBuffers();
				snd->Stop();
			}
			if (id < -1) {
				for (size_t i = 0; i < MAX_44K_CHANNELS; i++)
				{
					snd = soundChannels11[i];
					snd->FlushSourceBuffers();
					snd->Stop();
				}
			}
			return;
		}
		void* data = sndobj[id].data;
		if (data == NULL) return;

		
		

		for (size_t i = 0; i < MAX_SND_CHANNELS; i++)
		{
			soundChannels11[i]->GetState(&state);
			if (state.pCurrentBufferContext == data) {
				snd = soundChannels11[i];				
				snd->FlushSourceBuffers();
				snd->Stop();
				return;
			}
		}

		for (size_t i = 0; i < MAX_44K_CHANNELS; i++)
		{
			soundChannels44[i]->GetState(&state);
			if (state.pCurrentBufferContext == data) {
				snd = soundChannels44[i];
				snd->FlushSourceBuffers();
				snd->Stop();
				return;
			}
		}
		
	}

	void Wav95_ReleaseWav(int id)
	{
		
	}

	void Wav95_ReleaseWavAll()
	{
		
	}

	IXAudio2* pXAudio2 = NULL;

	void Win95_Load_LCD_File(const char* filename, int group, int flags)
	{
		if (filename == NULL) return;
		FILE* f = fopen(filename, "rb");

		if (f == NULL) return;

		int numEntries;
		fread(&numEntries, 1, sizeof(int), f);

		IndexEntry indices[256];
		fread(indices, sizeof(IndexEntry), numEntries, f);

		for (size_t i = 0; i < numEntries; i++)
		{
			IndexEntry e = indices[i];

			fseek(f, e.offset, 0);

			EMSOUNDOBJ* so = sndobj + e.id;
			
			if (so->data && so->size == e.size) {
				continue;
			}

			so->data = new BYTE[e.size];
			fread(so->data, 1, e.size, f);
			so->size  = e.size;
			so->group = group;	
			so->rate = e.sampleRate;
		}

		fclose(f);
	}

	void Win95_InitDirectSound()
	{		
		HRESULT hr;
		if (FAILED(hr = XAudio2Create(&pXAudio2, 0, XAUDIO2_DEFAULT_PROCESSOR)))
			return;
		IXAudio2MasteringVoice* pMasterVoice = NULL;
		if (FAILED(hr = pXAudio2->CreateMasteringVoice(&pMasterVoice)))
			return;
		pMasterVoice->SetVolume(editmode ? 0 : testmode ? 0.4f : 0.4f);
		
		WAVEFORMATEX wfx = { 1,1,15625,31250,2,16,0 };
		
		for (size_t i = 0; i < MAX_SND_CHANNELS; i++)
		{
			pXAudio2->CreateSourceVoice(&soundChannels11[i], (WAVEFORMATEX*)&wfx);
		}

		WAVEFORMATEX wfxh = { 1,1,44100,88200,2,16,0 };

		for (size_t i = 0; i < MAX_44K_CHANNELS; i++)
		{
			pXAudio2->CreateSourceVoice(&soundChannels44[i], (WAVEFORMATEX*)&wfxh);
		}

	}

	void Win95_DeinitDirectSound()
	{
		for (size_t i = 0; i < MAX_SND_CHANNELS; i++)
		{
			soundChannels11[i]->DestroyVoice();
		}

		for (size_t i = 0; i < MAX_44K_CHANNELS; i++)
		{
			soundChannels44[i]->DestroyVoice();
		}

		for (size_t i = 0; i < MAX_SOUND_OBJS; i++)
		{
			if (sndobj[i].data) delete sndobj[i].data;
		}

		if (pXAudio2) {
			pXAudio2->Release();
			pXAudio2 = NULL;
		}
	}

	void Win95_ResetSpeed()
	{
		keyState[VK_SPACE] = false;
	}
}

