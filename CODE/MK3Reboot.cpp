// MK3Reboot.cpp : Defines the entry point for the application.
//

// ReSharper disable CommentTypo
// ReSharper disable CppInconsistentNaming
// ReSharper disable IdentifierTypo
#pragma warning(disable:4996)

#include "framework.h"
#include "MK3Reboot.h"
#include "timeapi.h"
#include "stdafx.h"
#include "D3DTest.h"
#include "stdio.h"

#include <xaudio2.h>

extern "C"
{
#include "psxlib.h"
#include "MKPAL.H"
#include "hqx.h"
};

#define MAX_LOADSTRING 100
#define MAX_TEXTURES 256

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240
#define RT_WIDTH 1600
#define RT_HEIGHT 900
#define PIXEL_WIDTH 1600
#define PIXEL_HEIGHT 900
#define USE_RTARGET
//#define SWUPSCALE
#define DESIRED_FPS 52

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
ID3D11PixelShader* g_pPixelShader = nullptr;
ID3D11PixelShader* g_pPixelShaderPP = nullptr;
ID3D11InputLayout* g_pVertexLayout = nullptr;
ID3D11Buffer* g_pVertexBuffer = nullptr;
ID3D11Buffer* g_pConstantBuffer = nullptr;
ID3D11BlendState* g_pAlphaBlendingEnabledState = nullptr;
ID3D11BlendState* g_pAlphaBlendingDisabledState = nullptr;
ID3D11SamplerState* g_sampleStates[2] = {nullptr,nullptr};
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

extern "C" WORD editmode = 0;// 2 | 0x40;
extern "C" WORD testmode = 0;// 2 | 0x40 | 0x100;// | 2;// 2 | 0x80;

#define TPAGE_SZ 256

extern "C" short f_pause;				/* flag: TRUE: game paused */

#define MAX_SND_CHANNELS 32
#define MAX_44K_CHANNELS 8

extern "C" EMSOUNDOBJ sndobj[MAX_SOUND_OBJS];
IXAudio2SourceVoice* soundChannels11[MAX_SND_CHANNELS] = { 0 };
IXAudio2SourceVoice* soundChannels44[MAX_44K_CHANNELS] = { 0 };

typedef struct
{
	ID3D11Texture2D* texture;
	ID3D11ShaderResourceView* textureView;
	BYTE data[TPAGE_SZ * TPAGE_SZ];	
}TPage;

static TPage Pages[16 * 2 + 2] = { 0 };

/*
	game_map_tbl[0]=pad1_map_tbl[0]=pad2_map_tbl[0]=0x0004;			//r1,block
	game_map_tbl[1]=pad1_map_tbl[1]=pad2_map_tbl[1]=0x0004;			//l1,block
	game_map_tbl[2]=pad1_map_tbl[2]=pad2_map_tbl[2]=0x0008;			//r2,run
	game_map_tbl[3]=pad1_map_tbl[3]=pad2_map_tbl[3]=0x0008;			//l2,run

	game_map_tbl[4]=pad1_map_tbl[4]=pad2_map_tbl[4]=0x0020;			//triangle, hk
	game_map_tbl[5]=pad1_map_tbl[5]=pad2_map_tbl[5]=0x0040;			//circle, lk
	game_map_tbl[6]=pad1_map_tbl[6]=pad2_map_tbl[6]=0x0080;			//x, lp
	game_map_tbl[7]=pad1_map_tbl[7]=pad2_map_tbl[7]=0x0010;			//square, hp

	game_map_tbl[8]=pad1_map_tbl[8]=pad2_map_tbl[8]=0x0100;			//coll box, (SELECT BUTTON)
	game_map_tbl[9]=pad1_map_tbl[9]=pad2_map_tbl[9]=0x0200;			//run, needed for sony box controllers
	game_map_tbl[10]=pad1_map_tbl[10]=pad2_map_tbl[10]=0x0400;		//block, needed for sony box controllers
	game_map_tbl[11]=pad1_map_tbl[11]=pad2_map_tbl[11]=0x0800;		//start

	game_map_tbl[12]=pad1_map_tbl[12]=pad2_map_tbl[12]=0x1000;		//up
	game_map_tbl[13]=pad1_map_tbl[13]=pad2_map_tbl[13]=0x2000;		//right
	game_map_tbl[14]=pad1_map_tbl[14]=pad2_map_tbl[14]=0x4000;		//down
	game_map_tbl[15]=pad1_map_tbl[15]=pad2_map_tbl[15]=0x8000;		//left
*/

int gameKeys[2][16] =
{
	{'U','I','B','N',
	'G','H','T','Y',
	'3',0,0,'1','W','D','S','A'},

	{VK_ADD,VK_NUMPAD4,VK_NUMPAD3,VK_NUMPAD7,
	VK_RETURN,VK_DECIMAL,VK_NUMPAD1,VK_NUMPAD0,
	'4',0,0,'2',VK_UP,VK_RIGHT,VK_DOWN,VK_LEFT},
};

extern "C" void MK3_Init();
extern "C" void MK3_Update();
extern "C" int MK3_Render(int fps);

void DrawQuadUV(int t, int p, float x, float y, float w, float h, int sx, int sy, int sw, int sh,int flags,float);
void DrawQuad(int x, int y, int w, int h, BYTE color[]);
int CreateD3DTexture(int w, int h, void* data,int flags,int slot);
bool LoadTextureBmp(const char* filename, BMPINFO* info, DWORD* Palette8888);

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

	// TODO: Place code here.
	MSG msg = { 0 };
	HACCEL hAccelTable;

	// Initialize global strings
	LoadString(hInstance, IDS_APP_TITLE, g_szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_MK3REBOOT, g_szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// Perform application initialization:
	if (!InitInstance(hInstance, nCmdShow, PIXEL_WIDTH, PIXEL_HEIGHT))
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_MK3REBOOT));

	if (FAILED(InitDevice()))
	{
		CleanupDevice();
		return 0;
	}

	hqxInit();

	MK3_Init();

	//Palette
	CreateD3DTexture(256, 256, NULL, 32, 32);

	BMPINFO ft = { 0 };
#define FILTER_NAME1 "Scanlines75x4_j4"//"" //Scanrez1_Althor
#define FILTER_NAME2 "Scanrez1_Althor"
#define FILTER_NAME3 "Scanrez2_Althor"
	if (LoadTextureBmp("arcade/"
		FILTER_NAME2
		".bmp", &ft, 0)) {
		//Filter
		CreateD3DTexture(ft.w, ft.h, ft.pixels, 32,33);
	}

	D3D11_VIEWPORT vp;
	vp.MinDepth = 0.0f;
	vp.MaxDepth = 1.0f;
	vp.TopLeftX = 0;
	vp.TopLeftY = 0;

#ifndef USE_RTARGET
	g_pImmediateContext->OMSetRenderTargets(1, &g_pRenderTargetView, nullptr);
	g_pImmediateContext->VSSetShader(g_pVertexShader, nullptr, 0);
	g_pImmediateContext->PSSetShader(g_pPixelShader, nullptr, 0);
	g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingEnabledState, 0, 0xff);
	g_pImmediateContext->PSSetSamplers(0, 2, g_sampleStates);
	g_pImmediateContext->VSSetConstantBuffers(0, 1, &g_pConstantBuffer);
	g_pImmediateContext->PSSetConstantBuffers(0, 1, &g_pConstantBuffer);
	g_pImmediateContext->PSSetShaderResources(0, 1, &Pages[32].textureView);
	g_pImmediateContext->PSSetShaderResources(2, 1, &Pages[33].textureView);
#endif

	vp.Width = PIXEL_WIDTH;
	vp.Height = PIXEL_HEIGHT;

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

#ifdef USE_RTARGET

		vp.Width  = RT_WIDTH;
		vp.Height = RT_HEIGHT;
		g_pImmediateContext->RSSetViewports(1, &vp);

		// Setup the viewport
		g_pImmediateContext->OMSetRenderTargets(1, &g_pRenderTargetView0, nullptr);
		g_pImmediateContext->VSSetShader(g_pVertexShader, nullptr, 0);
		g_pImmediateContext->PSSetShader(g_pPixelShader, nullptr, 0);
		g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingEnabledState, 0, 0xff);
		g_pImmediateContext->PSSetSamplers(0, 2, g_sampleStates);
		g_pImmediateContext->VSSetConstantBuffers(0, 1, &g_pConstantBuffer);
		g_pImmediateContext->PSSetConstantBuffers(0, 1, &g_pConstantBuffer);
		g_pImmediateContext->PSSetShaderResources(0, 1, &Pages[32].textureView);
		g_pImmediateContext->PSSetShaderResources(2, 1, &Pages[33].textureView);
		g_pImmediateContext->RSSetViewports(1, &vp);

		g_pImmediateContext->ClearRenderTargetView(g_pRenderTargetView0, Colors::Black);
#endif

		g_InsideRender = 1;
		MK3_Render(keyState[VK_SPACE] ? 1000 : DESIRED_FPS);
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

	ID3DBlob* pErrorBlob;
	D3D_SHADER_MACRO macros[4] = { 0 };
#ifdef USE_RTARGET
	static char macval[4] = { '0',0 };
#else
	static char macval[4] = { (int)(PIXEL_WIDTH / SCREEN_WIDTH) + '0',0 };
#endif
	
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

bool LoadTextureBmp(const char* filename, BMPINFO* info, DWORD *Palette8888)
{
	FILE* f;

	unsigned char bmpfileheader[14] = { 0 };
	unsigned char bmpinfoheader[40] = { 0 };
	unsigned char rgba[4] = {0xff,0xff,0xff,0xff};

	f = fopen(filename, "rb");

	if (f == 0) {
		info->pixels = NULL;
		info->w = 0;
		info->h = 0;
		return false;
	}

	fread(bmpfileheader, 1, 14, f);
	fread(bmpinfoheader, 1, 40, f);

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
			fread(rgba, 1, 4, f);
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
		fread(line, 1, lsize, f);
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

	fclose(f);
	info->w = ww;
	info->h = hh;
	return true;
}

void Save8BitBmp(const char* filename, BYTE* src, WORD *Palette555, int palCount, int w, int h)
{
	static BYTE palette[256*4];
	FILE* f;

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

	BYTE* pal = palette;

	for (int i = 0; i < palCount; i++)
	{
		DWORD pdata = Palette555[i];
		*pal++ = ((pdata >> 10) & 0x1f) << 3; 
		*pal++ = ((pdata >> 5) & 0x1f) << 3;
		*pal++ = ((pdata >> 0) & 0x1f) << 3;
		*pal++ = 0;
	}

	f = fopen(filename, "wb");
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
			"The FX file cannot be compiled.  Please run this executable from the directory that contains the FX file.",
			"Error", MB_OK);
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

#ifdef USE_RTARGET

	D3D11_TEXTURE2D_DESC desc;
	memset(&desc, 0, sizeof(desc));
	desc.Width = RT_WIDTH;
	desc.Height = RT_HEIGHT;
	desc.MipLevels = desc.ArraySize = 1;
	desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
	desc.SampleDesc.Count = 1;
	desc.BindFlags = D3D11_BIND_SHADER_RESOURCE | D3D11_BIND_RENDER_TARGET;

	hr = g_pd3dDevice->CreateTexture2D(&desc, NULL, &g_renderTargetTex);
	if (FAILED(hr))
		return hr;
#ifdef SWUPSCALE
	memset(&desc, 0, sizeof(desc));
	desc.Width = SCREEN_WIDTH;
	desc.Height = SCREEN_HEIGHT;
	desc.MipLevels = desc.ArraySize = 1;
	desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
	desc.SampleDesc.Count = 1;
	desc.Usage = D3D11_USAGE_STAGING;
	desc.CPUAccessFlags = D3D11_CPU_ACCESS_READ;

	hr = g_pd3dDevice->CreateTexture2D(&desc, NULL, &g_renderTargetStaging);
	if (FAILED(hr))
		return hr;

	desc.Width = PIXEL_WIDTH;
	desc.Height = PIXEL_HEIGHT;
	desc.MipLevels = desc.ArraySize = 1;
	desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
	desc.SampleDesc.Count = 1;
	desc.CPUAccessFlags = D3D11_CPU_ACCESS_WRITE;
	desc.Usage = D3D11_USAGE_DYNAMIC;
	desc.BindFlags = D3D11_BIND_SHADER_RESOURCE;

	hr = g_pd3dDevice->CreateTexture2D(&desc, NULL, &g_renderTargetStagingBig);
	if (FAILED(hr))
		return hr;

	D3D11_RENDER_TARGET_VIEW_DESC renderTargetViewDesc;
	D3D11_SHADER_RESOURCE_VIEW_DESC shaderResourceViewDesc;
	renderTargetViewDesc.Format = desc.Format;
	renderTargetViewDesc.ViewDimension = D3D11_RTV_DIMENSION_TEXTURE2D;
	renderTargetViewDesc.Texture2D.MipSlice = 0;

	hr = g_pd3dDevice->CreateRenderTargetView(g_renderTargetStagingBig, &renderTargetViewDesc, &g_pRenderTargetView0);
	if (FAILED(hr))
		return hr;

#else

	D3D11_RENDER_TARGET_VIEW_DESC renderTargetViewDesc;
	D3D11_SHADER_RESOURCE_VIEW_DESC shaderResourceViewDesc;
	renderTargetViewDesc.Format = desc.Format;
	renderTargetViewDesc.ViewDimension = D3D11_RTV_DIMENSION_TEXTURE2D;
	renderTargetViewDesc.Texture2D.MipSlice = 0;

	hr = g_pd3dDevice->CreateRenderTargetView(g_renderTargetTex, &renderTargetViewDesc, &g_pRenderTargetView0);
	if (FAILED(hr))
		return hr;

#endif

	
	// Setup the description of the shader resource view.
	shaderResourceViewDesc.Format = desc.Format;
	shaderResourceViewDesc.ViewDimension = D3D11_SRV_DIMENSION_TEXTURE2D;
	shaderResourceViewDesc.Texture2D.MostDetailedMip = 0;
	shaderResourceViewDesc.Texture2D.MipLevels = 1;

	hr = g_pd3dDevice->CreateShaderResourceView(g_renderTargetTex, &shaderResourceViewDesc, &g_pRenderTargetShaderView);
	if (FAILED(hr))
		return hr;
#endif

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

	// Compile the vertex shader
	ID3DBlob* pVSBlob = nullptr;
	WCHAR shaderFxFile[] = { L"D3DTest.fx" };
	hr = CompileShaderFromFile(shaderFxFile, "VS", "vs_4_0", &pVSBlob);
	if (FAILED(hr))
	{
		MessageBox(nullptr,
			"The FX file cannot be compiled.  Please run this executable from the directory that contains the FX file.", 
			"Error", MB_OK);
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
#ifdef USE_RTARGET
	hr = compilePixelShader(shaderFxFile, "PS_RAW", &g_pPixelShader);
	if (FAILED(hr)) return hr;
	hr = compilePixelShader(shaderFxFile, "PS_UP", &g_pPixelShaderPP);
	if (FAILED(hr)) return hr;
#else
	hr = compilePixelShader(shaderFxFile,"PS",&g_pPixelShader);
	if (FAILED(hr)) return hr;
#endif

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
	cb.mUVOffsets = XMFLOAT4(0,0, 0, 0);


	return S_OK;
}

void DrawQuad(int x, int y, int w, int h, BYTE c[])
{
	float* m = (float*)g_World.r;
	m[12] = x + w * 0.5f;
	m[13] = y + h * 0.5f;
	m[0] = w;
	m[5] = h;
	cb.mWorld = XMMatrixTranspose(g_World);	
	cb.mUVParams = XMFLOAT4(0,0, 1, 1);
	cb.mColor = c ? XMFLOAT4(c[0]/255.f, c[1]/255.f, c[2]/255.f, 1.0f) : XMFLOAT4(1,1,1,1);
	cb.mExtraParams.x = 0;
	cb.mExtraParams.y = 0;
	cb.mExtraParams.z = 0;
	cb.mExtraParams.w = 1;
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
	g_pImmediateContext->PSSetShaderResources(1, 1, &tview);
	g_pImmediateContext->Draw(4, 0);
}

void DrawTextureUV(int tindex, int palette, float x, float y, float w, float h, int sx, int sy, int sw, int sh, int flags,float alpha=1.f)
{
	const float tw = 1.f / TPAGE_SZ;
	const float th = 1.f / TPAGE_SZ;

	switch (flags)
	{
	case 0:
		cb.mUVParams = XMFLOAT4(sx * tw, sy * th, sw * tw, sh * th);
		break;
	case 1:
		cb.mUVParams = XMFLOAT4((sx + sw) * tw, sy * th, -sw * tw, sh * th);
		break;
	case 2:
		cb.mUVParams = XMFLOAT4(sx * tw, (sy + sh) * th, sw * tw, -sh * th);
		break;
	case 3:
		cb.mUVParams = XMFLOAT4((sx + sw) * tw, (sy + sh) * th, -sw * tw, -sh * th);
		break;
	}

	x *= SCREEN_WIDTH  / 320.0f;	
	w *= SCREEN_WIDTH  / 320.0f;
	y *= SCREEN_HEIGHT / 240.0f;
	h *= SCREEN_HEIGHT / 240.0f;
	

	float* m = (float*)g_World.r;

	m[12] = x + w * 0.5f;
	m[13] = y + h * 0.5f;
	m[0] = w;
	m[5] = h;

	cb.mExtraParams.x = 0;
	cb.mExtraParams.y = (palette >> 4) / 256.f;
	cb.mExtraParams.z = 1;
	cb.mExtraParams.w = alpha;
	cb.mWorld = XMMatrixTranspose(g_World);
	cb.mColor = XMFLOAT4(1, 1, 1, 1);
	g_pImmediateContext->UpdateSubresource(g_pConstantBuffer, 0, nullptr, &cb, 0, 0);
	g_pImmediateContext->PSSetShaderResources(1, 1, &Pages[tindex].textureView);
	g_pImmediateContext->Draw(4, 0);
}

void DrawQuadUV(int tpage, int palette, float x, float y, float w, float h, int sx, int sy, int sw, int sh,int flags,float alpha)
{	
	int tx = (tpage & 0x0f) << 7;
	int ty = (tpage & 0x10) << 4;
		
	sx += tx;
	sy += ty;

	WORD tindex = (sx >> 8) | ((sy >> 8) << 4);
	
	DrawTextureUV(tindex, palette, x, y, w, h, sx%TPAGE_SZ, sy%TPAGE_SZ, sw, sh, flags,alpha);
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
	if (g_pPixelShader) g_pPixelShader->Release();
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
	//static DWORD FighterBuffer[512 * 256];
	static DWORD AllPAlettes[256 * 256];

	static int  g_UpdatePalettes = 0;
	static long g_UpdateFB = 0;

	extern short gstate;

	static char MBuff[100];

	void Win95DebugInt(const char* key, int a)
	{
		sprintf(MBuff, "%s: %d\r\n", key, a);
		OutputDebugString(MBuff);
	}

	void Win95DebugInt2(const char* key, int a,int b)
	{
		sprintf(MBuff, "%s: %d, %d\r\n", key, a, b);
		OutputDebugString(MBuff);
	}

	WORD GetTPage(WORD tmode, WORD tr, WORD x, WORD y)
	{
		return (((x)>>6)&0x0f)|((y>>8)<<4);
	}

	WORD GetTIndex(WORD x, WORD y)
	{
		int i = (x >> 8) | ((y >> 8) << 4);			
		return i;
	}

	void DLoadImage(RECT_PSX* rect, void* data)
	{
		WORD tindex = GetTIndex(rect->x*2, rect->y);
		BYTE* dst = Pages[tindex].data + (rect->y % TPAGE_SZ) * TPAGE_SZ + ((rect->x * 2) % TPAGE_SZ);
		BYTE* src = (BYTE*)data;

		int pitch = rect->w*2;

		for (size_t i = 0; i < rect->h; i++)
		{
			memcpy(dst, src, pitch);
			dst += TPAGE_SZ;
			src += pitch;
		}

		g_UpdateFB |= 1<<tindex;
	}

	WORD getClut(WORD x, WORD y)
	{
		return (y<<CLUT_ID_SHIFT)+x;
	}

	BYTE outedframes[2][1024] = { 0 };
	BMPINFO bmps[2][1024] = { 0 };
	//DWORD paloverrides[2][2][64] = { 0 };

	#define OUTFRAMES

	u_short DLoadTPageFighter(u_short* pix, int x, int y, int w, int h,int pal,int fighter,int fver, int fo, WORD **info)
	{
		PALINFO pi = palram[pal >> 4];
		DWORD palCnt = *pi.palid;
		WORD fid = pix[0] == 0xffff ? pix[1] : (((fo >> 3) & 0xffff) - 400);
		WORD tindex = GetTIndex(x*2, y);

		BYTE* src = (BYTE*)pix;
		
		*info = NULL;

		if (pal && palCnt == 64 && (fighter&0x3f) == 2 
			//&& 	(gstate == 0x02 || gstate == 0x05 || gstate == 0x07 || gstate == 0x04)
#ifdef OUTFRAMES1
			&& outedframes[fid] == 0 )
		{
			char filename[128];
				sprintf(filename, "output/%d.bmp", fid);
				Save8BitBmp(filename, (BYTE*)pix, pi.palid + 2, palCnt, w, h);
				outedframes[fid] = 1;
		}
#else
			)
		{

			BYTE* ofr = &outedframes[fver][0];

			if (ofr[fid] == 0) {
				char filename[128];
				sprintf(filename, "arcade/%d%d/%d.bmp", (fighter & 0x3f),fver, fid);

				/*
				if (fid == 101 && fver == 1) {
					pp = paloverrides[fver][0];
				}else if (fid == 102 && fver == 1) {
					pp = paloverrides[fver][1];
				}*/

				if (!LoadTextureBmp(filename, &bmps[fver][fid], NULL)) {
					Win95DebugInt("Frame Not Found:",fid);
				}
				ofr[fid] = 1;
			}else if (editmode || testmode) {
				ofr[fid]++;
				ofr[fid] &= 7;
			}

			BMPINFO* inf = &bmps[fver][fid];

			if (inf->pixels) {
				/*
				if (fver == 1)
				{
					if ((fighter & 0x80) == 0) {
						paloverrides[fver][0][0] = 0;
						memcpy(AllPAlettes + 256 * (pal >> 4), paloverrides[fver][0], 256 * 4);
						g_UpdatePalettes = 1;
					}
					else if ((fighter & 0x80) != 0) {
						paloverrides[fver][1][0] = 0;
						memcpy(AllPAlettes + 256 * (pal >> 4), paloverrides[fver][1], 256 * 4);
						g_UpdatePalettes = 1;
					}
				}
				*/

				*info = (WORD*)inf;
				w = inf->w;
				h = inf->h;
				src = inf->pixels;
			} else if (pix[0] == 0xffff) {
				src = NULL;
			}
			
		}
#endif


		BYTE *dst = Pages[tindex].data + (y % TPAGE_SZ) * TPAGE_SZ + ((x * 2)% TPAGE_SZ);

		if (src == NULL) {
			for (size_t i = 0; i < h; i++)
			{
				memset(dst, 1, w);
				dst += TPAGE_SZ;
			}
		}
		else {
			for (size_t i = 0; i < h; i++)
			{
				memcpy(dst, src, w);
				dst += TPAGE_SZ;
				src += w;
			}
		}

		g_UpdateFB |= 1<<tindex;


		return GetTPage(0, 0, x, y);
	}

	u_short DLoadTPage(u_long* pix, int tp, int abr, int x, int y, int w, int h)
	{
		WORD tindex = GetTIndex(x*2, y);
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
		BYTE* dst = (BYTE*)AllPAlettes + 256 * 4 * y;
		/*
		if (srcpal[0] == 0xfdfd) {
			char actname[128];
 			sprintf(actname, "arcade/%d.act", srcpal[1]);

 			FILE* fpal = fopen(actname, "rb");

			for (int i = 0; i < 256; i++)
			{
				*dst++ = (fgetc(fpal)) & 0xff;
				*dst++ = (fgetc(fpal)) & 0xff;
				*dst++ = (fgetc(fpal)) & 0xff;
				*dst++ = i == 0 ? 0 : 0xff;
			}

			fclose(fpal);
		}
		else */
		{

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
        OutputDebugString(buff);
    }

	extern DB* cdb;

	void DrawPrim(u_long* up)
	{
		
	}

	void DrawPrim0(u_long* up)
	{
		POLY_FT4* p = (POLY_FT4*)up;

		if ((p->flags & 0x80) && p->tpage == 0) {
			DrawQuad(p->x, p->y, p->w, p->h, p->color);
		}
		else {
			DrawQuadUV(p->tpage, p->clut, p->x, p->y, p->w, p->h, p->u, p->v, p->uw, p->vw, p->flags & 3,p->semialpha ? 0.5f : 1.f);
		}
	}

	void DrawSync(WORD flags)
	{
		if (!g_InsideRender) return;

		if (g_UpdatePalettes) {
			D3D11_MAPPED_SUBRESOURCE mappedResource;
			int result = g_pImmediateContext->Map(Pages[32].texture, 0, D3D11_MAP_WRITE_DISCARD, 0, &mappedResource);
			memcpy((BYTE*)mappedResource.pData, AllPAlettes, sizeof(AllPAlettes));
			g_pImmediateContext->Unmap(Pages[32].texture, 0);
			g_UpdatePalettes = 0;
		}

		if (g_UpdateFB) {
			D3D11_MAPPED_SUBRESOURCE mappedResource;
			for (size_t i = 0; i < 32; i++)
			{
				if ((g_UpdateFB & (1 << i)) == 0) continue;

				if (Pages[i].texture == NULL) {
					CreateD3DTexture(TPAGE_SZ, TPAGE_SZ, 0, 8, i);
				}

				int result = g_pImmediateContext->Map(Pages[i].texture, 0, D3D11_MAP_WRITE_DISCARD, 0, &mappedResource);
				memcpy((BYTE*)mappedResource.pData, Pages[i].data, TPAGE_SZ * TPAGE_SZ);
				g_pImmediateContext->Unmap(Pages[i].texture, 0);
			}

			g_UpdateFB = 0;
		}

		if (keyState[VK_INSERT]) {
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

			for (size_t i = 0; i < 32; i++)
			{
				TPage* tp = Pages + i;
				if (tp->textureView == NULL) continue;
				int tx = _PXTbl[i] * 80;
				int ty = _PYTbl[i] * 60;
				DrawTextureUV(i, 0, tx, ty, 80, 60, 0, 0, TPAGE_SZ, TPAGE_SZ, 0);
			}
			return;
		}

		g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingEnabledState, 0, 0xff);		

		for (int i = 0; i < OTSIZE; i++)
		{
			u_long* p = (u_long*)cdb->ot[i].next;
			while (p) {
				DrawPrim0(p);
				p = (u_long*)(*p);
			}
		}
}

    void Win95_Blast_Frame()
    {
		if (!g_InsideRender) return;

		//Post Process
#ifdef USE_RTARGET		

		D3D11_VIEWPORT vp;
		vp.MinDepth = 0.0f;
		vp.MaxDepth = 1.0f;
		vp.TopLeftX = 0;
		vp.TopLeftY = 0;
		vp.Width = PIXEL_WIDTH;
		vp.Height = PIXEL_HEIGHT;

		g_pImmediateContext->OMSetRenderTargets(1, &g_pRenderTargetView, nullptr);
		g_pImmediateContext->PSSetShader(g_pPixelShaderPP, nullptr, 0);
		g_pImmediateContext->OMSetBlendState(g_pAlphaBlendingDisabledState, 0, 0xff);
		g_pImmediateContext->PSSetSamplers(0, 2, g_sampleStates);
		g_pImmediateContext->PSSetConstantBuffers(0, 1, &g_pConstantBuffer);
		g_pImmediateContext->PSSetShaderResources(2, 1, &Pages[33].textureView);//screen filter pattern
		g_pImmediateContext->RSSetViewports(1, &vp);

#ifdef SWUPSCALE
		{
			g_pImmediateContext->CopyResource(g_renderTargetStaging, g_renderTargetTex);			

			D3D11_MAPPED_SUBRESOURCE mappedResourceSrc, mappedResourceDest;
			int result = g_pImmediateContext->Map(g_renderTargetStaging, 0, D3D11_MAP_READ, 0, &mappedResourceSrc);
			result = g_pImmediateContext->Map(g_renderTargetStagingBig, 0, D3D11_MAP_WRITE_DISCARD, 0, &mappedResourceDest);
			/*
			hq3x_32_rb((uint32_t*)mappedResourceSrc.pData, mappedResourceSrc.RowPitch, 
				(uint32_t*)mappedResourceDest.pData, mappedResourceDest.RowPitch,
				SCREEN_WIDTH, SCREEN_HEIGHT);
				*/
			g_pImmediateContext->Unmap(g_renderTargetStaging, 0);
			g_pImmediateContext->Unmap(g_renderTargetStagingBig, 0);
		}
#endif
		DrawQuadTexture(g_pRenderTargetShaderView, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, NULL);
#endif
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

	WORD ReadKeys(int list[])
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
		WORD p1 = ReadKeys(gameKeys[0]);
		WORD p2 = ReadKeys(gameKeys[1]);
		return p1 | (p2 << 16);
	}

	int Wav95_Play(int id, int loop)
	{
		if (sndobj[id].data == NULL) return 0;
		
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

