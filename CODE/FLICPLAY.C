#include "win_port.h"

/* INCLUDES */
#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif

#include "mkbkgd.h"
#include "mkobj.h"
#include "mkamode.h"
#include "mkos.h"
#include "mkgame.h"
#include "mkutil.h"
#include "emulator.h"
#include "bigstack.h"

///#include "../flic/flicfile.h"

/*
static int read_flic_frame(KludgeFlic *kf)
{
int err;
u_short *pclut;
u_short *pclutmax;
FlicRGB *palette;

	if((err = CallOnBigStack(FlicReadUncompFrame,&kf->flic,
							  &kf->rast,kf->decomp_buff)) >= 0)
	{
		pclut = kf->rast.clutpsx;
		pclutmax = (u_short *)OPTR(pclut,(sizeof(u_short)*0xff));

		palette = kf->rast.palette;

		while(pclut < pclutmax)
		{	
			*pclut = PSX_RGB(palette->r,palette->g,palette->b);
			++palette;
			++pclut;
		}
		Emu.ConvertPalettePSX(kf->rast.clutpsx, kf->rast.clut, 256);
	}
	return(err);
}
*/
void close_kludgeflic()
{
	/*
KludgeFlic *kf = (KludgeFlic *)player_heap;

    if(Emu.kludgeflags & KLUDGE_DRAWFLIC)
	{
		Emu.kludgeflags = 0;
		CallOnBigStack(FlicClose,&kf->flic);
	}*/
}