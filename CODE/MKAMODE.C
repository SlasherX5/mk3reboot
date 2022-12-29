/******************************************************************************
 File: mkamode.c

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III ATTRACT MODE ROUTINES
******************************************************************************/
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
#include "mkani.h"
#include "mkmain.h"
#include "valloc.h"
#include "mktext.h"
#include "mkvs.h"
#include "mkdiag.h"
#include "mkfade.h"
#include "mkrepell.h"
#include "mkscore.h"
#include "mksound.h"
#include "mkbio.h"
#include "mkinit.h"
#include "mkend.h"
#include "mkhstd.h"
#include "emulator.h"

/* local extern info */
void sony_graphics_setup(void);
void enter_initials(void);
void legal_page(void);

extern FNTSETUP pf_15point[];
extern WORD f_load;
/******************************************************************************
 Function: void amode(void)

 By: David Schwartz

 Date: Aug 11, 1994

 Parameters: None

 Returns: None

 Description:	This is the main attract mode process
******************************************************************************/
#if 0
char txt_pass[]="PASS ";
char txt_num[]="   %d";
char txt_p1[]="P1 ";
char txt_p2[]="P2 ";
char txt_b1[]="BKGD ";
char txt_s[]="SOUND";
#endif

static void DumbBackground(char *path, u_long time1000)
{
	/*
 	object_initialize();  // just to make sure everything is cleared out
	Emu.kludgeflags |= KLUDGE_DRAWPIC;
	Load8BitPicture(path,player_heap);
	process_sleep(time1000 >> 4);
 	Emu.kludgeflags &= ~KLUDGE_DRAWPIC;
	smooth_black_retp();
	return;*/
}
static void gti_presents()
{
	DumbBackground("bkgds\\gtiscrn.bin", 5000 );
}
static void legal_page()
{
	DumbBackground("bkgds\\legal.bin", 5000 );
}
static void artd_logo()
{
	DumbBackground("bkgds\\artdlogo.bin", 5000 );
}
static void ati_logo()
{
	DumbBackground("bkgds\\atilogo.bin", 5000 );
}
static void williams_flic(void)
{
 	//play_flic_and_sound("bkgds\\wmslogo.bin", NULL);
}

void amode(void)
{
	amode_init();
	gstate=GS_AMODE;

//	mk3_thank_you();
//	mk3_design_team(arcade_team_table);
//	mk3_design_team(sony_team_table);
//	mk3_cast_o_characters();
//	smoke_page();
//	gstate=GS_AMODE;


	/* amode_loop */
	do
	{
		/* load sound stuff */
		sound_module_load(SMOD_SELECT);

		//aama_message();
//BKF
{
static int do_once = 0;	
	if ( !do_once )
	{
		do_once = 1;
		//williams_flic();
//		gti_presents();
		title_page();
		artd_logo();
		ati_logo();
		legal_page();
	}
}
		raiden_intro();
		quote();
		title_page();
		send_code_a3(0);
		print_rankings();
		amode_coin_page;

		amode_story(0);
		amode_story(1);
		amode_story(2);

		coin_bio_fight();

		amode_story(3);
		amode_story(4);
		amode_story(5);
		amode_story(6);
		coin_bio_fight();

		amode_story(7);
		coin_bio_fight();

		amode_story(8);
		coin_bio_fight();

		amode_story(9);
		coin_bio_fight();
	}
	while(1);

	//nosounds();
	//f_nosound=1;

}

/******************************************************************************
 Function: void coin_bio_fight(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	show credits, biography, fight a demo
******************************************************************************/
void coin_bio_fight(void)
{
	amode_coin_page;
	sound_module_load(SMOD_SELECT);
	mk3_bio();
	amode_demo_fight();
	f_load=0;
	return;
}

/******************************************************************************
 Function: void amode_story(WORD pa0)

 By: David Schwartz

 Date: May 1995

 Parameters: pa0 - story number to display

 Returns: None

 Description:	tell a tale
******************************************************************************/
void amode_story(WORD pa0)
{
	load_bkgd=BKGD_MK3_STORIES+pa0;
	init_background_module(table_o_mods[load_bkgd]);
	multi_plane();

	DISPLAY_ON;
	process_sleep(0x40*12);
	smooth_black_retp();
}


/******************************************************************************
 Function: void quote(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	words of wisdom
******************************************************************************/
extern char txt_quote1[];
extern char txt_quote3[];
extern char txt_quote4[];
char *quote_table[]=
{
	txt_quote1,
	txt_quote3,
	txt_quote4
};
void quote(void)
{
	DISPLAY_OFF;	//WIN95: HACK FADE !!!!
	sony_graphics_setup();
	amode_init_no_score();
	pds_centered(quote_table[randu(3)-1],SCX(0xc8),SCY(0x70));
	fadein_jsrp(0x40*4);
}

/******************************************************************************
 Function: void midway_presents(void);

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	midway presents
******************************************************************************/
char txt_midway_presents[]="WILLIAMS ENTERTAINMENT PRESENTS";
char txt_beta[]="BETA VERSION 2.0";
WORD TUNE_ATTRACT[] = { TUNE_ATTRACT1, 0 };
void midway_presents(void)
{
	nosounds();

	load_bkgd=BKGD_MK3_RAIDFLY;				// set system up to for title screen stuff (don't want music intrupted later)
	sony_graphics_setup();
	bkgd_texture_load(bkgd_base_x,BACK_TEXTURE_BASE_Y);
	play_generic_tune(TUNE_ATTRACT);			// send_code_a3(0x3e)

	process_sleep(1);

#if 0
	f_load=0;
	amode_init_no_score();
	pds_centered(txt_midway_presents,SCX(0xc8),SCY(0x70));
#if 0
	fadein_jsrp(0x40*2);
#else
	pds_centered(txt_beta,SCX(0xc8),SCY(0x70)+32);
	fadein_jsrp(0x40*4);
#endif
#endif
	return;
}

/******************************************************************************
 Function: void legal_page(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	legal page
******************************************************************************/
#if 0
void legal_page(void)
{
	/* legal_page */
	object_initialize();
	load_bkgd=BKGD_MK3_LEGAL;
	init_background_module(legal_module);
	multi_plane();
	process_sleep(0x40*5);
	smooth_black_retp();
	return;
}
#endif

/******************************************************************************
 Function: void raiden_intro(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	title page
******************************************************************************/
extern void *raidfly_module[];
void raiden_intro(void)
{
	/* raiden_intro */
	object_initialize();
	load_bkgd=BKGD_MK3_RAIDFLY;
	init_background_module(raidfly_module);
	multi_plane();
	send_code_a3(TS_CHURCH_BELL);			// send_code_a3(0x429) play church bell

	process_sleep(0x40*13);
	smooth_black_retp();

	return;
}

/******************************************************************************
 Function: void title_page(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	title page
******************************************************************************/
char revnum[]="REVISION 2.1";

void title_page(void)
{
	object_initialize();
	do_background(BKGD_MK3_TITLE);
	//pds_centered(revnum,160,224);
	process_sleep(0x40*5);
	smooth_black_retp();
	return;
}

#if 0
/******************************************************************************
 Function: void aama_message(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:	parental advisory
******************************************************************************/
extern char txt_warning[];
void aama_message(void)
{
	amode_init_no_score();
	mk3_gradient(BLUE_GRAD);
	pds_centered_soff(txt_warning,SCX(0xc8),SCY(0x50)+8);
	fadein_jsrp(0x40*6);
	amode_fade_retp();

	return;
}
#endif

/******************************************************************************
 Function: void amode_demo_fight(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	show a small demo of what we got
******************************************************************************/
void amode_demo_fight(void)
{
	amode_init_no_score();

	if (c_amode_bio>13)
		p1_char=1;
	else p1_char=c_amode_bio;			// p1 -> bio dude


	p2_char=(f_smoke==1) ? randu(15)-1:randu(14)-1;		// smoke active include

	curback=randu(11)-1;

	if ( !f_no_vs )
		vs_or_ladder();

	CREATE(PID_AMODE,amode_demo_game);
	process_sleep(6);
	CREATE(PID_REPELL,repell);
	process_sleep(0x40*12);

	MURDER;
	/* freeze_2_pages modified fixes wierd bugs */
	f_novel=1;
	scrolly.pos=0;
	p1_heap_char=p2_heap_char=0xffff;
	stop_scrolling();
	idcomp_ptr=idcomp_base=image_dcomp_buffer;			// reset buffer
	send_code_a3(0);
	play_ending_chord();
	process_sleep(0x30);

	if (++c_amode_bio>13)
		c_amode_bio=0;

	amode_fade_retp();

//	fast_fadeout_jsrp(0x40);
//	freeze_2_pages();
//	amode_init_system();

	sound_module_load(SMOD_SELECT);
	return;
}

/******************************************************************************
 Function: void amode_init(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	Initialize game for attact mode
******************************************************************************/
void amode_init(void)
{
	WORD loop;

	current_proc->pdata.p_hit=4;
	c_amodeloop=0;

	//if (read_dip() & DIP_AMSOUNDS)
	//	amode_shutup();

	/* ainit4 */
	current_proc->pdata.p_action=randu(7)-1;

	update_pmsg();

	coinflag=0;

	c_amode_bio=randu(14)-1;

	/* setup ram for hidden codes */
	/* initialize switch queue ram */
	p1_bcq[0]=(LONG)(1);					/* set ptr to first entry */
	p1_jcq[0]=(LONG)(1);					/* set ptr to first entry */
	p1_boq[0]=(LONG)(1);					/* set ptr to first entry */
	p1_joq[0]=(LONG)(1);					/* set ptr to first entry */

	p2_bcq[0]=(LONG)(1);					/* set ptr to first entry */
	p2_jcq[0]=(LONG)(1);					/* set ptr to first entry */
	p2_boq[0]=(LONG)(1);					/* set ptr to first entry */
	p2_joq[0]=(LONG)(1);					/* set ptr to first entry */

	for (loop=1;loop<=SQS;loop++)
	{
		p1_bcq[loop]=0;
		p1_jcq[loop]=0;
		p1_boq[loop]=0;
		p1_joq[loop]=0;

		p2_bcq[loop]=0;
		p2_jcq[loop]=0;
		p2_boq[loop]=0;
		p2_joq[loop]=0;
	}
	return;
}

/******************************************************************************
 Function: void amode_shutup(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: None

 Description:	attact mode be quiet
******************************************************************************/
#if 0
void amode_shutup(void)
{
	nosounds();
	f_nosound=1;
	current_proc->pdata.p_hit=0;
	return;
}
#endif

/******************************************************************************
 Function: void amode_init_no_score(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	attact mode setup and dont show score board
******************************************************************************/
void amode_init_no_score(void)
{
	amode_oinit();
	DONT_SHOW_SCORES;
	f_load=0;
}

/******************************************************************************
 Function: void amode_oinit(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	attact mode setup
******************************************************************************/
void amode_oinit(void)
{
	murder_myoinit_score();

	dlists=dlists_bogus;

	irqskye=0;
	noflip=0;
	f_doscore=1;
	return;
}

/******************************************************************************
 Function: void amode_init_system(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: None

 Description:	attact system setuyp
******************************************************************************/
void amode_init_system(void)
{
	murder_myoinit_score();
//	clr_scrn();

	//file_load_message();

	irqskye=0;
	noflip=0;
//	f_doscore=1;
	f_auto_erase=1;
	DONT_SHOW_SCORES;
	nosounds();
	clr_scrn();
	process_sleep(2);
	return;
}

/******************************************************************************
 Function: void gover_amode_entry(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: None

 Description:	game over attract mode entry point,
******************************************************************************/
void gover_amode_entry(void)
{
	PROCESS *ptemp;

	ptemp=CREATE(PID_FADE,skydown);
	ptemp->a9=0x800;
	amode_fade_retp();

	amode_init();
	gstate=GS_AMODE;

	print_rankings();

	smooth_black_retp();

	stack_jump(amode);
}

/******************************************************************************
 Function: void amode_fade_retp(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: None

 Returns: None

 Description:	attact mode fade and return to caller
******************************************************************************/
void amode_fade_retp(void)
{
	fadeout_jsrp(0x20);
	smooth_black_retp();
}

/******************************************************************************
 Function: void smooth_black_retp(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: None

 Returns: None

 Description:	smooth black fade transition
******************************************************************************/
void smooth_black_retp(void)
{
	amode_display_reset();

	process_sleep(0x6);

	return;
}

/******************************************************************************
 Function: void amode_display_reset(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: None

 Returns: None

 Description:	attact mode display reset routine
******************************************************************************/
void amode_display_reset(void)
{
	murder_myoinit();
	f_doscore=0;					// score bars = no
	f_auto_erase=1;
	clr_scrn();

	return;
}

/******************************************************************************
 Function: void coin_page(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: None

 Returns: None

 Description:	attact mode coin info
******************************************************************************/
char free_play_txt[]="FREE PLAY";
char credits_txt[]="KREDITS %d";
//WIN95: char press_start_txt[]="PRESS START";
char press_start_txt[]="PRESS SPACE";

void coin_page(void)
{
	if (coinflag==0)
	{
		murder_myoinit();
		DISPLAY_ON;
		do_background(BKGD_MK3_COIN);
		coinflag=1;
	}

	/* cp1 */
	dallobj(OID_TEXT);

	//output_custom

	/* cs2 */
	if (f_freeplay)
	{
		p15_centered(free_play_txt,160,96);
		p15_centered(press_start_txt,160,210);
	}
	else
	{
		lm_setup(pf_15point);
		fnt_state.fnt_posx=160;
		fnt_state.fnt_posy=96;
		printf_p1(credits_txt,credits);
		p15_centered(press_start_txt,160,210);
	}

	process_sleep(400);

	coinflag=0;
	wipeout();
	return;
}



