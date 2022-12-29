// Overlay.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "stdio.h"

typedef char SBYTE;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned int DWORD;

extern "C"
{
    int LoadOverlay(const char* path, void* buff);
    int SizeOverlay(const char* fname);
    BYTE* uncompress_image(BYTE* src, BYTE* idcomp_ptr);
};

static BYTE Buffer[1024 * 1024];
static BYTE DstBuffer[1024 * 1024];

#define GET_DWORD(o) *(DWORD*)(Buffer+o)
#define GET_SHORT(o) *(short*)(Buffer+o)

/* animation commands */
#define ANI_END			0					// animation script "end" command
#define ANI_JUMP		1					// animation script "jump" command
#define ANI_FLIP		2					// animation script "flip" command
#define ANI_ADJUSTX		3					// animation script "adjust x" command
#define ANI_ADJUSTXY	4					// animation script "adjust xy" command
#define ANI_NOSLEEP		5					// animation script "skip sleep" command
#define ANI_CALLA		6					// animation script call routine (next long)
#define ANI_SOUND		7					// animation script make a sound call
#define ANI_OCHAR_JUMP	8					// animation script ochar conditional jump
#define ANI_FLIP_V		9					// animation script vertical flip
#define ANI_OFFSET_XY	10					// animation script offset xy
#define ANI_SLADD		11					// animation script add slave
#define ANI_SLANI		12					// animation script slave animate
#define ANI_SWPAL		13					// animation script switch to next img pal
#define ANI_SLANI_SLEEP 14					// animation script slave animate sleep
#define ANI_OCHAR_SOUND 15
#define ANI_LASTCOM		15					// last animation command

static WORD Palette[64] = {
    0x0000, 0x7BDE, 0x6F7B, 0x6739, 0x5EF7, 0x56B5, 0x4E73, 0x4631, 0x3DEF, 0x35AD,
    0x318C, 0x2D6B, 0x294A, 0x2529, 0x2108, 0x1CE7, 0x18C6, 0x14A5, 0x1084, 0x0C63,
    0x0842, 0x0421, 0x6419, 0x5435, 0x4C33, 0x4411, 0x3C0F, 0x300C, 0x280A, 0x2008,
    0x1806, 0x1004, 0x6FDF, 0x5B1E, 0x46BB, 0x4A99, 0x3E57, 0x2DF6, 0x0574, 0x29B3,
    0x1D71, 0x2170, 0x1530, 0x256F, 0x192F, 0x296E, 0x150E, 0x0CEE, 0x190D, 0x10CD,
    0x14CC, 0x088C, 0x14CB, 0x088B, 0x18EA, 0x0CAA, 0x0C89, 0x0049, 0x0868, 0x0846,
    0x0006, 0x0424, 0x0004, 0x0002
};

void SaveBmp(const char *filename,BYTE *src, WORD Palette555[], WORD w, WORD h)
{
    static BYTE img[1024 * 1024 * 3];
    FILE* f;
    int filesize = 54 + 3 * w * h;  //w is your image width, h is image height, both int

    for (int i = 0; i < w; i++)
    {
        for (int j = 0; j < h; j++)
        {
            int x = i;
            int y = (h - 1) - j;

            BYTE pindex = src[y * w + x];

            WORD pdata = Palette555[pindex];

            int r = ((pdata >>  0) & 0x1f) << 3;
            int g = ((pdata >>  5) & 0x1f) << 3;
            int b = ((pdata >> 10) & 0x1f) << 3;

            img[(x + y * w) * 3 + 2] = (unsigned char)(r);
            img[(x + y * w) * 3 + 1] = (unsigned char)(g);
            img[(x + y * w) * 3 + 0] = (unsigned char)(b);
        }
    }

    unsigned char bmpfileheader[14] = { 'B','M', 0,0,0,0, 0,0, 0,0, 54,0,0,0 };
    unsigned char bmpinfoheader[40] = { 40,0,0,0, 0,0,0,0, 0,0,0,0, 1,0, 24,0 };
    unsigned char bmppad[3] = { 0,0,0 };

    bmpfileheader[2] = (unsigned char)(filesize);
    bmpfileheader[3] = (unsigned char)(filesize >> 8);
    bmpfileheader[4] = (unsigned char)(filesize >> 16);
    bmpfileheader[5] = (unsigned char)(filesize >> 24);

    bmpinfoheader[4] = (unsigned char)(w);
    bmpinfoheader[5] = (unsigned char)(w >> 8);
    bmpinfoheader[6] = (unsigned char)(w >> 16);
    bmpinfoheader[7] = (unsigned char)(w >> 24);
    bmpinfoheader[8] = (unsigned char)(h);
    bmpinfoheader[9] = (unsigned char)(h >> 8);
    bmpinfoheader[10] = (unsigned char)(h >> 16);
    bmpinfoheader[11] = (unsigned char)(h >> 24);

    f = fopen(filename, "wb");
    fwrite(bmpfileheader, 1, 14, f);
    fwrite(bmpinfoheader, 1, 40, f);
    for (int i = 0; i < h; i++)
    {
        fwrite(img + (w * (h - i - 1) * 3), 3, w, f);
        fwrite(bmppad, 1, (4 - (w * 3) % 4) % 4, f);
    }
    fclose(f);

}


int main()
{
    const char* _BINFILE = "../Runtime/Jax/JaxS.bin";
    int sz = SizeOverlay(_BINFILE);

    if (sz <= 0) return -1;

    int result = LoadOverlay(_BINFILE, Buffer);

    char filename[256];

    int ImgPtr = 0;
    short X = 0, Y = 0, W = 0, H = 0;

    DWORD ptr = 0;

    DWORD animCount = 460/4;

    for (int a = 0; a < animCount ; a++)
    {
        DWORD code = GET_DWORD(a * 4);

        printf("Animation %d - %d\n", a, code);

        if (code == 0) continue;

        DWORD nextCode = GET_DWORD(a * 4 + 4);

        if (nextCode == 0) nextCode = code + 64;

        while (code < nextCode)
        {
            DWORD animCode = GET_DWORD(code);
            code += 4;

            switch (animCode)
            {
            case ANI_JUMP:
            case ANI_OFFSET_XY:
            case ANI_ADJUSTX:
            case ANI_ADJUSTXY:
            case ANI_CALLA:
                code += 4;
                break;
            case ANI_END:            
            case ANI_FLIP:
            case ANI_NOSLEEP:            
            case ANI_SOUND:
            case ANI_OCHAR_JUMP:
            case ANI_FLIP_V:            
            case ANI_SLADD:
            case ANI_SLANI:
            case ANI_SWPAL:
            case ANI_SLANI_SLEEP:
            case ANI_OCHAR_SOUND:
                break;

            default:
                //aframe address!
                DWORD framePtr = GET_DWORD(animCode);
                ImgPtr = GET_DWORD(framePtr + 0);
                W = GET_SHORT(framePtr + 4);
                W += (4 - (W & 3)) & 3;
                H = GET_SHORT(framePtr + 6);
                X = GET_SHORT(framePtr + 8);
                Y = GET_SHORT(framePtr + 10);

                if (W < 0 || W > 1024 || H < 0 || H > 1024 || ImgPtr > sz) {
                    continue;
                }

                BYTE* uncompressed = uncompress_image(Buffer + ImgPtr, DstBuffer);

                sprintf(filename, "output/j%d_%dx%d.bmp", ImgPtr, W, H);
                printf("%s\n", filename);
                SaveBmp(filename, uncompressed, Palette, W, H);
            }
        }
        
    }

    return 0;
}