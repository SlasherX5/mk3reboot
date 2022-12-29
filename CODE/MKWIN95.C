
#include "system.h"
#include "psxlib.h"
#include <stddef.h>
#include "emulator.h"
#include <malloc.h>

#define OBJECT void
#include "MKSOUND.H"
#undef OBJECT
#include <stdio.h>

extern void Win95DebugInt(const char* key, int a);


int psxcd_waiting_for_pause()
{
	return 0;
}

void psxcd_stop()
{

}

void psxspu_set_cd_vol()
{

}

WORD psxspu_get_cd_fade_status()
{
	return 0;
}

int psxcd_seeking_for_play()
{
	return 0;
}

void f_block_flip()
{

}

int psxcd_async_on()
{
	return 0;
}

void psxcd_pause()
{

}

void psxcd_restart(int vol)
{
	Win95DebugInt("psxcd_restart", vol);
}

int psxcd_elapsed_sectors()
{
	return 0;
}

void psxcd_set_stereo(WORD v)
{

}

void psxcd_set_loop_volume(WORD v)
{

}

void wess_master_mus_vol_set(WORD v)
{

}

void wess_pan_mode_set(WORD v)
{

}

extern File_IO_Struct module_int;

WORD PCinit()
{
	return 1;
}

File_IO_Struct* PCopen(const char* filename, int mode1, int mode2)
{
	return (File_IO_Struct*)fopen(filename, "rb");
}

int PCread(File_IO_Struct* fin, void* destptr, int readbytes)
{
	return fread(destptr, 1, readbytes, (FILE*)fin);
}

long PClseek(File_IO_Struct* fin, long seekpos, int seekmode)
{
	fseek((FILE*)fin, seekpos, seekmode);
	return ftell((FILE*)fin);
}

void PCclose(File_IO_Struct* fin)
{
	fclose((FILE*)fin);
}

int S_LoadOverlay(const char* subpath, void** pbuff, int buffmode);

int AllocOverlay(void** ppMem, int size)
{
	if ((*ppMem = malloc(size)) == NULL)
		return(-1);
	return(0);
}
void FreeOverlay(void** ppMem)
{
	if (ppMem != NULL && (ppMem = (void**)(*ppMem)) != NULL)
	{
		free(ppMem);
		*ppMem = NULL;
	}
}

long LoadOverlay(const char* fname, void* dest)
{
	return S_LoadOverlay(fname, &dest, 0);
}

int AllocLoadOverlay(const char* path, void** ppMem)
{
	return S_LoadOverlay(path, ppMem, 2);
}

long LoadOverlayBelow(const char* fname, void* dest)
{
	return S_LoadOverlay(fname, &dest, 1);
}

void setRECT(RECT_PSX *rect, int x, int y, WORD w, WORD h)
{
	rect->x = (short)x;
	rect->y = (short)y;
	rect->w = w;
	rect->h = h;
}

void SetBlockFill(BLK_FILL* p)
{

}

void AddPrim(OTOBJ* optr, void* ptr)
{
	POLY_F4* p = (POLY_F4*)ptr;
	POLY_F4* ex = optr->next;
	optr->next = p;
	p->next = ex;
}

void ClearOTag(OTOBJ* optr, int length)
{
	memset(optr,0, sizeof(OTOBJ) * length);
}

void PutDrawEnv(DRAWENV *de)
{

}

void PutDispEnv(DISPENV *de)
{

}

void psxcd_loop_callback()
{

}

void psxcd_init()
{

}

void PadInit(WORD flags)
{

}

char* MapStartKeyToString(int player)
{
	static char tmp[10];
	tmp[0] = 'P';
	tmp[1] = (char)('1' + player);
	tmp[2] = 0;
	return tmp;
}

void opt_main()
{

}


