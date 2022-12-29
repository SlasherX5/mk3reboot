/******************************************************************************
 File: mkbio.c

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III Briefcase Setup
******************************************************************************/

/* INCLUDES */
#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif /* SONY_PSX */

#include "mkbkgd.h"
#include "mkobj.h"
#include "mkos.h"
#include "mkgame.h"
#include "mkutil.h"
#include "mkani.h"
#include "mkbio.h"
#include "mkfile.h"
#include "mktext.h"

#if 0

/* local externs */
extern void *kanobio_txt[];
extern void *sonyabio_txt[];
extern void *jaxbio_txt[];
extern void *indianbio_txt[];
extern void *subzerobio_txt[];
extern void *swatbio_txt[];
extern void *liabio_txt[];
extern void *robo1bio_txt[];
extern void *robo2bio_txt[];
extern void *laobio_txt[];
extern void *tuskbio_txt[];
extern void *sheevabio_txt[];
extern void *shangbio_txt[];
extern void *lkangbio_txt[];

#endif

void *bio_texture_addr[]=
{
#if 0  // linked in data
	kanobio_txt,
	sonyabio_txt,
	jaxbio_txt,
	indianbio_txt,
	subzerobio_txt,
	swatbio_txt,
	liabio_txt,
	robo1bio_txt,
	robo2bio_txt,
	laobio_txt,
	tuskbio_txt,
	sheevabio_txt,
	shangbio_txt,
	lkangbio_txt
#endif

	"bio\\kanobio.bin",
	"bio\\sonyabio.bin",
	"bio\\jaxbio.bin",
	"bio\\indybio.bin",
	"bio\\szbio.bin",
	"bio\\swatbio.bin",
	"bio\\liabio.bin",
	"bio\\robo1bio.bin",
	"bio\\robo2bio.bin",
	"bio\\laobio.bin",
	"bio\\tuskbio.bin",
	"bio\\shevabio.bin",
	"bio\\shangbio.bin",
	"bio\\lkangbio.bin"
};


/******************************************************************************
 Function: void mk3_bio(void)

 By: David Schwartz

 Date: Mar  1995

 Parameters:  None

 Returns: None

 Description:  lets see a history of our fighter
******************************************************************************/
void mk3_bio(void)
{
	load_bkgd=c_amode_bio+BKGD_BIO_KANO;								// load correct BIO
	init_background_module(table_o_mods[load_bkgd]);

	// place textures in memory
	LoadBinToVram(bio_texture_addr[c_amode_bio],
				  bkgd_base_x,BACK_TEXTURE_BASE_Y);
	
	// 	vram_texture_load(bkgd_base_x,BACK_TEXTURE_BASE_Y,bio_texture_addr[c_amode_bio]);		

	
	multi_plane();

	triple_sound(0x28+c_amode_bio);						// lets say there name!!
	DISPLAY_ON;

	process_sleep(0x40*6);

	return;
}

/******************************************************************************
 Function: void mk3_gradient(WORD pa0)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  display fighter gradients
******************************************************************************/
extern void *gradient_txt[];
void mk3_gradient(WORD pa0)
{
	load_bkgd=BKGD_MK3_RGRAD+pa0;								// load correct gradient
	init_background_module(table_o_mods[load_bkgd]);
	vram_texture_load(bkgd_base_x,BACK_TEXTURE_BASE_Y,(ADDRESS*)gradient_txt);		// place textures in memory
	multi_plane();
	return;
}
