/******************************************************************************
 File: mkopt.c

 Date: April 1995

 (C) Williams Entertainment

 Mortal Kombat III SONY OPTION SCREENS ROUTINES
******************************************************************************/
#include "win_port.h"
extern int iWinDisableESC;
extern int CheckForDefautNoKeys(int buttonix);

/* INCLUDES */
#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif

#include "mkbkgd.h"
#include "mkobj.h"
#include "mkos.h"
#include "mkgame.h"
#include "mkutil.h"
#include "psxcd.h"
#include "mkani.h"
#include "mkopt.h"
#include "mkinit.h"
#include "mkjoy.h"
#include "valloc.h"
#include "mktext.h"
#include "mkdiag.h"
#include "mkfade.h"
#include "mkguys.h"
#include "mkpal.h"
#include "mksound.h"
#include "mkfile.h"
#include "emulator.h"

/* local externs */
extern void *a_opt_dragon[];
extern void *a_logo[];
extern void *a_credit[];
extern void *options_anims[];
extern void *POLE01[];
extern void *FRAME01[];

extern FNTSETUP pf_dave_smallc[];
extern FNTSETUP pf_15point[];

extern WORD YELLOW_p[];
extern WORD WHITE_p[];
extern WORD BLUE_p[];
extern WORD optextbg_PAL[];

extern void *options_module[];
extern void *optcoin_module[];

OPTPAGE option_text_list[]=
{
	{0,0,90,13},					// 0 - violence level
	{152,0,26,13},					// 1 - on
	{179,0,35,15},					// 2 - off
	{0,13,60,13},					// 3 - blood
	{61,13,107,15},					// 4 - difficulty
	{168,15,74,14},					// 5 - normal
	{0,28,100,14},					// 6 - very easy
	{54,28,46,14},					// 7 - easy
	{101,29,106,14},				// 8 - very hard
	{155,29,52,14},					// 9 - hard
	{208,29,39,14},					// a - rgb
	{0,42,44,13},					// b - ntsc
	{44,43,54,13},					// c - mono
	{104,43,96,14},					// d - stereo
	{213,43,43,13},					// e - exit
	{0,57,232,14},					// f - master vol control
	{0,71,102,13},					// 10 - music test
	{0,71,54,13},					// 11 - music
	{102,71,59,13},					// 12 - sound
	{102,71,109,13},				// 13 - sound test
	{0,84,88,15},					// 14 - sound fx
	{89,84,125,14},					// 15 - pan control
	{0,99,137,14},					// 16 - monitor type
	{137,98,73,9},					// 17 - sound test
	{137,107,71,9},					// 18 - music test
	{0,113,63,13},					// 19 - silent
	{63,113,59,13},					// 1a - quiet
	{124,118,69,14},				// 1b - rockin'
	{0,126,97,14},					// 1c - kranked!
	{172,132,79,10}, 				// 1d - high punch
	{61,144,71,10},					// 1e - lo punch
	{103,132,69,10},				// 1f - hi kick
	{0,144,61,9},					// 20 - lo kick
	{172,144,27,10},				// 21 - run

//	{132,144,40,10},				// 22 - block
//	{225,85,13,13},					// 23 - square
//	{240,85,13,13},					// 24 - tri
//	{240,71,13,13},					// 25 - circle

	{132,144,40,10},				// 22 - block
	{225,85,0,13},					// 23 - square	 "disabled"
	{240,85,0,13},					// 24 - tri		 "disabled"
	{240,71,0,13},					// 25 - circle	 "disabled"
	{225,71,0,13},					// 26 - x

//	{225,113,13,13},				// 27 - l1		 "disabled"
//	{240,113,13,13},				// 28 - l2		 "disabled"
//	{225,99,13,13},					// 29 - r1		 "disabled"
//	{240,99,13,13},					// 2a - r2		 "disabled"

   	{225,113,0,13},					// 27 - l1
	{240,113,0,13},					// 28 - l2
	{225,99,0,13},					// 29 - r1
	{240,99,0,13},					// 2a - r2

	{0,154,94,10},					// 2b - not assigned
	{97,154,135,14},				// 2c - shang morph
	{0,164,90,14},					// 2d - disabled
	{0,192,99,13},					// 2e - opponent
	{97,168,33,14},					// 2f - all
	{130,168,54,13},				// 30 - clock
	{103,182,102,15},				// 31 - free play
	{184,168,61,13},				// 32 - smoke
	{0,178,86,14},					// 33 - enabled
	{140,100,33,14},				// 34 - l/r
	{178,100,30,14},				// 35 - r/l
	{102,197,141,15},				// 36 - fataltity time
	{112,212,144,14},				// 37 - l round match
	{0,212,112,14},					// 38 - 1 hit death
	{0,226,127,13},					// 39 - cheats
	{128,226,96,14}					// 3a - vs screen
};


/***************************************************
 Joystick Remap Setup and Convert Tables
***************************************************/

OPTMAP opt_p1bridge[]=
{
	{B_TRI,&pad_tri[0]},
	{B_X,&pad_x[0]},
	{B_CIRCLE,&pad_circle[0]},
	{B_SQUARE,&pad_square[0]},
	{B_L1,&pad_l1[0]},
	{B_L2,&pad_l2[0]},
	{B_R1,&pad_r1[0]},
	{B_R2,&pad_r2[0]},
	{0,NULL}
};

OPTMAP opt_p2bridge[]=
{
	{B_TRI,&pad_tri[1]},
	{B_X,&pad_x[1]},
	{B_CIRCLE,&pad_circle[1]},
	{B_SQUARE,&pad_square[1]},
	{B_L1,&pad_l1[1]},
	{B_L2,&pad_l2[1]},
	{B_R1,&pad_r1[1]},
	{B_R2,&pad_r2[1]},
	{0,NULL}
};

/******************************************************************************
 Function: void opt_main(void)

 By: David Schwartz

 Date: March 1995

 Parameters: None

 Returns: None

 Description:	main routine for the options
******************************************************************************/
extern void sony_graphics_setup(void);
extern void *option_text[];
int remap_input = 1;

void opt_main(void)
{
	OBJECT *obj;
	PROCESS *ptemp;
	PROCESS *pcube;

	remap_input = 0; // always make sure user can control this beastie

	current_proc->pdata.p_store5=gstate;		// save current state so we can restore it

	gstate=GS_OPTIONS;					// set game state so that we don't have multiple copies runned

	murder_myoinit();
	f_doscore=0;
	
	//WIN95:KLUDGE TO CONFIG CD SOUND TO ON AND OFF ONLY 
	if ( f_music > 1 )
		f_music = 1;

	//file_load_message();

	/* load background textures so that no disk access */
	load_bkgd=BKGD_MK3_OPTION;
	sony_graphics_setup();
	bkgd_texture_load(bkgd_base_x,BACK_TEXTURE_BASE_Y);

	/* load texture graphics overlay for options */
	generic_overlay_load(OVL_OPTIONS);
	option_tpage=GetTPage(TEXTURE_MODE,TRANS_RATE,bkgd_base_x+128+128+128,BACK_TEXTURE_BASE_Y);		// -NOTE- ART FILES CHANGES MAKE SURE UPDATE TPAGE LOCATION

	/* generic sound effects load */
	sound_module_load(SMOD_SELECT);
	//play_generic_tune(TRK_OPT_ATTRACT);
	psxcd_play_at_andloop(TRK_OPT_ATTRACT,cd_vol_tbl[f_music],2,0,
												TRK_OPT_ATTRACT,cd_vol_tbl[f_music],2,3000);

	f_load=0;

#ifdef FORCE_CHEAT_MODE
f_cheat_menu=2;
current_proc->pdata.p_store1 = OPT_CREDIT;
#endif

	for(;;)
	{
		DISPLAY_OFF;
		murder_myoinit_score();

		load_bkgd=BKGD_MK3_OPTION;
		init_background_module(options_module);
		multi_plane();
		dlists=dlists_bogus;

		/* setup and create spinning cube */
		current_proc->pdata.p_store1=OPT_START;			// which cube face where on

		pcube=CREATE(PID_OPTION,opt_logo);
		pcube->a10=OPT_START;					// current cube face
		pcube->a11=FALSE;						// cube not spinning

		/* setup and create spinning dragon */
		gso_dmawnz_ns(obj,(ADDRESS)POLE01,options_anims,PFLAG_CLEAR);
		alloc_cache((ADDRESS)POLE01,&options_anims,obj);
		insert_object(obj,&objlst);
		obj->ozval=2;
		obj->oxpos.u.intpos=OPT_DRAGON_X;
		obj->oypos.u.intpos=OPT_DRAGON_Y;

		process_sleep(2);
		fadein_jsrp(0x16);

		ptemp=CREATE(PID_BANI,opt_dragon);
		ptemp->a10=DRAGON_SPIN;
		current_proc->pdata.p_store2=(ADDRESS)ptemp;			// keep ptr to dragon so that we can control him


		current_proc->a10=0;					// joy debounce
		/* main select loop */
		for(;;)
		{
			process_sleep(1);

			if (current_proc->a10!=0)
				current_proc->a10--;

			if (swcurr.padvalue & P1P2_ACTION || swcurr.padvalue & (MASK_START|MASK_START<<16))
			{
				(ADDRESS)ptemp=current_proc->pdata.p_store2;			// get dragon spin process and tell him to finish
				ptemp->a10=DRAGON_FINISH;
				break;
			}

			if ((swcurr.padvalue & P1P2_LEFT) && current_proc->a10==0 && pcube->a11==0 && current_proc->pdata.p_store1!=OPT_CREDIT)
			{
				/* turn cube to the left */
				current_proc->a10=12;
				if (current_proc->pdata.p_store1==0)
					current_proc->pdata.p_store1=OPT_MAX_SEL;
				else current_proc->pdata.p_store1--;

			 	pcube->a10=current_proc->pdata.p_store1;			// set new cube face
				tsound(0x5e);

			}
			else
			{
				if ((swcurr.padvalue & P1P2_RIGHT) && current_proc->a10==0 && pcube->a11==0 && current_proc->pdata.p_store1!=OPT_CREDIT)
				{
					/* turn cube to the right */
					current_proc->a10=12;
					if (current_proc->pdata.p_store1==OPT_MAX_SEL)
						current_proc->pdata.p_store1=0;
					else current_proc->pdata.p_store1++;

					pcube->a10=current_proc->pdata.p_store1;			// set new cube face
					tsound(0x5e);

				}
				else
				{
					if ( (swcurr.padvalue & P1P2_UP) && current_proc->a10==0 && pcube->a11==0)
					{
						if (current_proc->pdata.p_store1==OPT_START && f_cheat_menu!=0)
						{
							/* ONLY START CAN GOTO CREDITS w/ cheats enabled */
							current_proc->a10=12;
							current_proc->pdata.p_store1=pcube->a10=OPT_CREDIT;
							tsound(0x5e);
						}
					}
					else
					{
						if ((swcurr.padvalue & P1P2_DOWN) && current_proc->a10==0 && pcube->a11==0)
						{
							if (current_proc->pdata.p_store1==OPT_CREDIT)
							{
								/* ONLY CREDIT CAN GOTO START */
								current_proc->a10=12;
								current_proc->pdata.p_store1=pcube->a10=OPT_START;
								tsound(0x5e);
							}
						}
					}
				}
			}
		}

		/* selection made, do it */
		while (ptemp->a10!=DRAGON_STOP)
			process_sleep(1);					// wait for dragon to stop spinning

		process_sleep(30);
		fast_fadeout_jsrp(20);

		switch (current_proc->pdata.p_store1)
		{
			case OPT_START:			// ready to start playing
				gstate=current_proc->pdata.p_store5;
				murder_myoinit_score();
				remap_input = TRUE;
//WIN95: CD just to make sure it's really stoped
if ( !f_music )
	psxcd_stop();
				return;
				break;
			case OPT_GAME:		// game options
				murder_myoinit_score();
				option_select(OPT_SCRN_GAME);
				break;
			case OPT_MUSIC:		// music options
				murder_myoinit_score();
				option_select(OPT_SCRN_MUSIC);

//WIN95: CD hack silence music after selection 
if ( !f_music )
	psxcd_pause();
else	
	psxcd_restart(cd_vol_tbl[f_music]);


				break;
			case OPT_CONTROL:		// joystick configuration
iWinDisableESC = TRUE;
				murder_myoinit_score();
				opt_pad_setup(opt_p1bridge,pad1_map_tbl);
				opt_pad_setup(opt_p2bridge,pad2_map_tbl);
				option_select(OPT_SCRN_CONTROLS);
				opt_pad_remap(opt_p1bridge,pad1_map_tbl);
				opt_pad_remap(opt_p2bridge,pad2_map_tbl);
iWinDisableESC = FALSE;
				break;
			case OPT_CREDIT:
				murder_myoinit_score();
				if ( f_cheat_menu==1 )
					option_select(OPT_SCRN_CHEAT);
				else option_select(OPT_SCRN_CHEAT1);
				break;
		}
	}
	return;
}

/******************************************************************************
 Function: void opt_dragon(void)

 By: David Schwartz

 Date: March 1995

 Parameters: None

 Returns: None

 Description:	show the dragon part
******************************************************************************/
void opt_dragon(void)
{
	OBJECT *obj=current_proc->pa8;

	current_proc->pa9=a_opt_dragon;
	init_anirate(DRAGON_SPIN_SLOW);								  

	while (1)
	{
		switch (current_proc->a10)
		{
			case DRAGON_SPIN:
				if (GET_LONG(current_proc->pa9)==ANI_END)
					current_proc->pa9=a_opt_dragon;				// at end restart
				next_anirate();
				process_sleep(1);
				break;
			case DRAGON_FINISH:
				tsound(0x5f);
				init_anirate(DRAGON_SPIN_FAST);				// spin faster
				while (GET_LONG(current_proc->pa9)!=ANI_END)
				{
					next_anirate();							// spin until revolved around completely
					process_sleep(1);
				}

				/* spin one more time */
				tsound(0x5f);
				current_proc->pa9=a_opt_dragon;
				while (GET_LONG(current_proc->pa9)!=ANI_END)
				{
					next_anirate();							// spin until revolved around completely
					process_sleep(1);
				}

				current_proc->pa9=a_opt_dragon;
				frame_a9(obj);				// show first frame
				current_proc->a10=DRAGON_STOP;			// all done wait forever
			case DRAGON_STOP:
				wait_forever();
				break;
		}
	}
}

/******************************************************************************
 Function: void opt_logo(void)

 By: David Schwartz
			 
 Date: March 1995

 Parameters: None

 Returns: None

 Description:	show the logo part
******************************************************************************/
void opt_logo(void)
{
	OBJECT *obj;

	current_proc->pdata.p_store1=current_proc->a10;			// get current face

	gso_dmawnz_ns(obj,(ADDRESS)FRAME01,options_anims,PFLAG_CLEAR);
	alloc_cache((ADDRESS)FRAME01,&options_anims,obj);
	insert_object(obj,&objlst);
	obj->ozval=0;
	obj->oxpos.u.intpos=OPT_CUBE_X;			// start at left edge
	obj->oypos.u.intpos=OPT_CUBE_Y;

	while (TRUE)
	{
		if (current_proc->a10==current_proc->pdata.p_store1)
			process_sleep(1);						// no change do nada
		else
		{
			/* time to change */
			current_proc->a11=1;				// set spinning flag

			if ( current_proc->a10==OPT_CREDIT || current_proc->pdata.p_store1==OPT_CREDIT)
			{
				current_proc->pa9=a_credit;

				if ( current_proc->pdata.p_store1==OPT_CREDIT)
					find_part2();

				framew(CUBE_SPIN);
			}
			else
			{
				/* determine spin direction */
				if (((current_proc->pdata.p_store1+1) & 3)==current_proc->a10)
				{
					/* spin right */
					current_proc->pa9=a_logo;
					find_part_a14(current_proc->pdata.p_store1+1);			// set at current
					framew(CUBE_SPIN);
				}
				else
				{
					/* spin left */
					current_proc->pa9=a_logo;
					find_part_a14(current_proc->a10+1+4);			// set at current
					framew(CUBE_SPIN);
				}
			}

			current_proc->pdata.p_store1=current_proc->a10;			// set new current
			current_proc->a11=0;									// done spinning, ready to do more
		}
	}
}

/******************************************************************************
 Function: void option_select(WORD scrnindex)

 By: David Schwartz

 Date: April 1995

 Parameters: scrnindex = which option screen
			0 - game configure
			1 - music configure
			2 - control configure

 Returns: None

 Description:	game selection options
******************************************************************************/
static char cheats_title[] = "CHEATS";

static char *opt_screen_list[]=
{
	"GAME KONFIGURE",
	"SOUND AND MUSIC",
	"", // KONTROL KONFIGURE",
	"", // KONTROL KONFIGURE",
	cheats_title,
	cheats_title
};

static BYTE opt_dis_en[]={OIND_DISABLED,OIND_ENABLED,OIND_END};
static BYTE opt_en_dis[]={OIND_ENABLED,OIND_DISABLED,OIND_END};
static BYTE opt_off[]={OIND_OFF,OIND_END};
static BYTE opt_off_on[]={OIND_OFF,OIND_ON,OIND_END};
static BYTE opt_on_off[]={OIND_ON,OIND_OFF,OIND_END};
static BYTE opt_diff[]={OIND_VEASY,OIND_EASY,OIND_MED,OIND_HARD,OIND_VHARD,OIND_END};
//BYTE opt_mtype[]={OIND_NTSC,OIND_RGB,OIND_END};
//WIN95: BYTE opt_music[]={OIND_SILENT,OIND_QUIET,OIND_ROCKIN,OIND_KRANKED,OIND_END};
static BYTE opt_music[]={OIND_OFF,OIND_ON,OIND_END};
static BYTE opt_control[]={OIND_HP,OIND_LP,OIND_HK,OIND_LK,OIND_RUN,OIND_BLOCK,OIND_NOTASSIGN,OIND_END};
static WORD opt_hard_log[]={MASK_JHIP,MASK_JLOP,MASK_JHIK,MASK_JLOK,MASK_JRUN,MASK_JBLOCK,0x0000};
static BYTE opt_pan[]={OIND_OFF,OIND_LR,OIND_RL,OIND_END};
static BYTE opt_shang[]={OIND_DISABLED,OIND_OPPONENT,OIND_ALL,OIND_END};

static OPTLIST game_opts[]=
{
	{NULL,NULL,&cmos_diff,OPT_TOP_Y+20*0,OPT_TOP_X_L,OPT_TOP_X_C,OIND_DIFF,opt_diff,option_toggle,0},					// difficulty
	{NULL,NULL,&f_no_violence,OPT_TOP_Y+20*1,OPT_TOP_X_L,OPT_TOP_X_C,OIND_VIOLENCE,opt_on_off,option_toggle,0},	// violence
	{NULL,NULL,&f_no_blood,OPT_TOP_Y+20*2,OPT_TOP_X_L,OPT_TOP_X_C,OIND_BLOOD,opt_on_off,option_toggle,0},			// blood
	{NULL,NULL,&f_shang_morph,OPT_TOP_Y+20*3,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SHANG,opt_shang,option_toggle,0},			// monitor type
	{NULL,NULL,&f_no_clock,OPT_TOP_Y+20*4,OPT_TOP_X_L,OPT_TOP_X_C,OIND_CLOCK,opt_en_dis,option_toggle,0},					// difficulty
	{NULL,NULL,&f_no_vs,OPT_TOP_Y+20*5,OPT_TOP_X_L,OPT_TOP_X_C,OIND_VS,opt_en_dis,option_toggle,0},			// vs screen on off
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_EXIT_X,OPT_EXIT_X,OIND_EXIT,NULL,option_exit,0}							// exit
};

static OPTLIST cheat_opts[]=
{
	{NULL,NULL,&f_freeplay,OPT_TOP_Y+20*0,OPT_TOP_X_L,OPT_TOP_X_C,OIND_FREEPLAY,opt_off_on,option_toggle,0},	// violence
	{NULL,NULL,&f_smoke,OPT_TOP_Y+20*1,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SMOKE,opt_off_on,option_toggle,0},			// blood
	{NULL,NULL,&f_unlim_fatal,OPT_TOP_Y+20*2,OPT_TOP_X_L,OPT_TOP_X_C,OIND_FATAL_TIME,opt_on_off,option_toggle,0},			// blood
	{NULL,NULL,&f_level_select,OPT_TOP_Y+20*3,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SELECT,opt_off_on,option_toggle,0},			// blood
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_EXIT_X,OPT_EXIT_X,OIND_EXIT,NULL,option_exit,0}							// exit
};

static OPTLIST cheat_opts1[]=
{
	{NULL,NULL,&f_freeplay,OPT_TOP_Y+20*0,OPT_TOP_X_L,OPT_TOP_X_C,OIND_FREEPLAY,opt_off_on,option_toggle,0},	// violence
	{NULL,NULL,&f_smoke,OPT_TOP_Y+20*1,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SMOKE,opt_off_on,option_toggle,0},			// blood
	{NULL,NULL,&f_unlim_fatal,OPT_TOP_Y+20*2,OPT_TOP_X_L,OPT_TOP_X_C,OIND_FATAL_TIME,opt_on_off,option_toggle,0},			// blood
	{NULL,NULL,&f_level_select,OPT_TOP_Y+20*3,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SELECT,opt_off_on,option_toggle,0},			// blood
	{NULL,NULL,&f_one_win,OPT_TOP_Y+20*4,OPT_TOP_X_L,OPT_TOP_X_C,OIND_ROUND,opt_off_on,option_toggle,0},			// blood
	{NULL,NULL,&f_nopower,OPT_TOP_Y+20*5,OPT_TOP_X_L,OPT_TOP_X_C,OIND_MATCH_DEAD,opt_off_on,option_toggle,0},			// blood
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_EXIT_X,OPT_EXIT_X,OIND_EXIT,NULL,option_exit,0}							// exit
};


#if 0 
OPTLIST sound_opts[]=
{
	{NULL,NULL,&f_stereo,OPT_TOP_Y+30*0,OPT_TOP_X_L,OPT_TOP_X_C,OIND_STEREO,opt_off_on,option_toggle_sound,0},			// sound on/off
	{NULL,NULL,&f_no_pan,OPT_TOP_Y+30*1,OPT_TOP_X_L,OPT_TOP_X_C,OIND_PAN,opt_pan,option_toggle_sound,0},			// pan control on/off, l/r r/l
	{NULL,NULL,&f_no_sfx,OPT_TOP_Y+30*2,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SOUND,opt_on_off,option_toggle,0},		// sound fx on/off
	{NULL,NULL,&f_music,OPT_TOP_Y+30*3,OPT_TOP_X_L,OPT_TOP_X_C,OIND_MUSIC,opt_music,option_toggle_sound,0},		// music silent,quiet,rockin,kranked
//	{NULL,NULL,&opt_snum,OPT_TOP_Y+22*4,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SOUND_TEST,NULL,option_stest,0},		// sound test
//	{NULL,NULL,&opt_mnum,OPT_TOP_Y+22*4+16,OPT_TOP_X_L,OPT_TOP_X_C,OIND_MUSIC_TEST,NULL,option_mtest,0},		// music test
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_EXIT_X,OPT_EXIT_X,OIND_EXIT,NULL,option_exit,0}							// exit
};
#endif 

static OPTLIST sound_opts[]=
{
	{NULL,NULL,&f_no_sfx,OPT_TOP_Y+30*0,OPT_TOP_X_L,OPT_TOP_X_C,OIND_SOUND,opt_on_off,  option_toggle,		0},	// sound fx on/off
	{NULL,NULL,&f_music, OPT_TOP_Y+30*1,OPT_TOP_X_L,OPT_TOP_X_C,OIND_MUSIC,opt_music,   option_toggle_sound,0},	// music silent,quiet,rockin,kranked
	{NULL,NULL,&f_no_pan,OPT_TOP_Y+30*2,OPT_TOP_X_L,OPT_TOP_X_C,OIND_PAN,  opt_pan,		option_toggle_sound,0},	// pan control on/off, l/r r/l
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_EXIT_X,OPT_EXIT_X,OIND_EXIT,NULL,option_exit,0}							// exit
};


#if 0  // control1 and cntrol2 opts not used
//win95:
#if 1 
static OPTLIST control1_opts[]=
{
	{NULL,NULL,&pad_tri[0],OPT_TOP_Y+14*0,OPT_CC_X_L,OPT_CC_X1_C,OIND_TRIANGLE,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_square[0],OPT_TOP_Y+14*1,OPT_CC_X_L,OPT_CC_X1_C,OIND_SQUARE,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_circle[0],OPT_TOP_Y+14*2,OPT_CC_X_L,OPT_CC_X1_C,OIND_CIRCLE,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_x[0],OPT_TOP_Y+14*3,OPT_CC_X_L,OPT_CC_X1_C,OIND_X,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r2[0],OPT_TOP_Y+14*4,OPT_CC_X_L,OPT_CC_X1_C,OIND_R2,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r1[0],OPT_TOP_Y+14*5,OPT_CC_X_L,OPT_CC_X1_C,OIND_R1,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l2[0],OPT_TOP_Y+14*6,OPT_CC_X_L,OPT_CC_X1_C,OIND_L2,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l1[0],OPT_TOP_Y+14*7,OPT_CC_X_L,OPT_CC_X1_C,OIND_L1,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_CC_X1_C-24,OPT_CC_X1_C-24,OIND_EXIT,NULL,option_exit,0}							// exit
};

static OPTLIST control2_opts[]=
{
	{NULL,NULL,&pad_tri[1],OPT_TOP_Y+14*0,OPT_CC_X_L,OPT_CC_X2_C,OIND_TRIANGLE,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_square[1],OPT_TOP_Y+14*1,OPT_CC_X_L,OPT_CC_X2_C,OIND_SQUARE,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_circle[1],OPT_TOP_Y+14*2,OPT_CC_X_L,OPT_CC_X2_C,OIND_CIRCLE,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_x[1],OPT_TOP_Y+14*3,OPT_CC_X_L,OPT_CC_X2_C,OIND_X,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r2[1],OPT_TOP_Y+14*4,OPT_CC_X_L,OPT_CC_X2_C,OIND_R2,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r1[1],OPT_TOP_Y+14*5,OPT_CC_X_L,OPT_CC_X2_C,OIND_R1,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l2[1],OPT_TOP_Y+14*6,OPT_CC_X_L,OPT_CC_X2_C,OIND_L2,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l1[1],OPT_TOP_Y+14*7,OPT_CC_X_L,OPT_CC_X2_C,OIND_L1,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_CC_X2_C-24,OPT_CC_X2_C-24,OIND_EXIT,NULL,option_exit,0}							// exit
};
#else
static OPTLIST control1_opts[]=
{
	{NULL,NULL,&pad_tri[0],OPT_TOP_Y+14*0,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_square[0],OPT_TOP_Y+14*1,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_circle[0],OPT_TOP_Y+14*2,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_x[0],OPT_TOP_Y+14*3,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r2[0],OPT_TOP_Y+14*4,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r1[0],OPT_TOP_Y+14*5,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l2[0],OPT_TOP_Y+14*6,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l1[0],OPT_TOP_Y+14*7,OPT_CC_X_L,OPT_CC_X1_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_CC_X1_C-24,OPT_CC_X1_C-24,OIND_EXIT,NULL,option_exit,0}							// exit
};

static OPTLIST control2_opts[]=
{
	{NULL,NULL,&pad_tri[1],OPT_TOP_Y+14*0,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_square[1],OPT_TOP_Y+14*1,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_circle[1],OPT_TOP_Y+14*2,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_x[1],OPT_TOP_Y+14*3,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r2[1],OPT_TOP_Y+14*4,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_r1[1],OPT_TOP_Y+14*5,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l2[1],OPT_TOP_Y+14*6,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,&pad_l1[1],OPT_TOP_Y+14*7,OPT_CC_X_L,OPT_CC_X2_C,255,opt_control,option_toggle,0},					// difficulty
	{NULL,NULL,NULL,OPT_TOP_Y+30*4,OPT_CC_X2_C-24,OPT_CC_X2_C-24,OIND_EXIT,NULL,option_exit,0}							// exit
};
#endif

static OPTLIST *opt_tables[]=
      {game_opts,sound_opts,control1_opts,control2_opts,cheat_opts,cheat_opts1};

#endif // mkcontrol option tables not used

static OPTLIST *opt_tables[]=
      {game_opts,sound_opts,sound_opts,sound_opts,cheat_opts,cheat_opts1};

typedef struct _kontrol_texts {
	short buttonix;
	short x;
    short y;
	hString strid;  // string id in object list
} KontrolTexts;


#define _LINE(num) (84+(num*12))


static KontrolTexts ktexts[] = {
	{ IOBIX_START,   40, _LINE(0), },
	{ IOBIX_HIKICK,  40, _LINE(1), },
	{ IOBIX_LOKICK,  40, _LINE(2), },
 	{ IOBIX_HIPUNCH, 40, _LINE(3), },
	{ IOBIX_LOPUNCH, 40, _LINE(4), },
	{ IOBIX_RUN,     40, _LINE(5), },
	{ IOBIX_BLOCK,   40, _LINE(6), },
	{ IOBIX_JRIGHT,  40, _LINE(7), },
	{ IOBIX_JLEFT,   40, _LINE(8), },
	{ IOBIX_JUP,     40, _LINE(9), },
	{ IOBIX_JDOWN,   40, _LINE(10), },
	{ IOBIX_NONE,  0,0 },	// exit pointer only

#define KSEL_COLUMN_HT 12

	{ IOBIX_START+IOBIX_P2,   282, _LINE(0), },
	{ IOBIX_HIKICK+IOBIX_P2,  282, _LINE(1), },
	{ IOBIX_LOKICK+IOBIX_P2,  282, _LINE(2), },
 	{ IOBIX_HIPUNCH+IOBIX_P2, 282, _LINE(3), },
	{ IOBIX_LOPUNCH+IOBIX_P2, 282, _LINE(4), },
	{ IOBIX_RUN+IOBIX_P2,     282, _LINE(5), },
	{ IOBIX_BLOCK+IOBIX_P2,   282, _LINE(6), },
	{ IOBIX_JRIGHT+IOBIX_P2,  282, _LINE(7), },
	{ IOBIX_JLEFT+IOBIX_P2,   282, _LINE(8), },
	{ IOBIX_JUP+IOBIX_P2,     282, _LINE(9), },
	{ IOBIX_JDOWN+IOBIX_P2,   282, _LINE(10), },
	{ IOBIX_NONE,  0,0 },	// exit flag
};

static KontrolTexts kbtexts[] = {

	{ IOBIX_START,   95, _LINE(0), },
	{ IOBIX_HIKICK,  95, _LINE(1), },
	{ IOBIX_LOKICK,  95, _LINE(2), },
 	{ IOBIX_HIPUNCH, 95, _LINE(3), },
	{ IOBIX_LOPUNCH, 95, _LINE(4), },
	{ IOBIX_RUN,     95, _LINE(5), },
	{ IOBIX_BLOCK,   95, _LINE(6), },
	{ IOBIX_NONE,0,0 },  // exit flag

#define B_OPT_COLUMN_HT 8	

	{ IOBIX_START+IOBIX_P2,   228, _LINE(0), },
	{ IOBIX_HIKICK+IOBIX_P2,  228, _LINE(1), },
	{ IOBIX_LOKICK+IOBIX_P2,  228, _LINE(2), },
 	{ IOBIX_HIPUNCH+IOBIX_P2, 228, _LINE(3), },
	{ IOBIX_LOPUNCH+IOBIX_P2, 228, _LINE(4), },
	{ IOBIX_RUN+IOBIX_P2,     228, _LINE(5), },
	{ IOBIX_BLOCK+IOBIX_P2,   228, _LINE(6), },
	{ IOBIX_NONE,0,0, },	// exit flag

};

#undef _LINE


char *GetKeyString(int keyval);
int ShiftKeyState();
void SetDefaultKeymap(void);
int GetButtonMapkey(int buttonix);
int SetButtonMapkey(int buttonix, int mapchar);
//void update_kpic_clut(KludgePic *pic);
static char unassigned_key_text[] = "NO KEY";
u_int JoyGetNative(int which);
int SetBitButtons(int bitix,u_int buttons);
u_int GetBitButtons(int bitix);
void SetDefaultButtonmap(void);


typedef struct tag_KontrolOptData {
	u_byte key_sel; // current keyboard selection
	u_byte lastkey; // last key acted upon
	u_short hilite_color; // hilite color from kludgepic
	u_short key_normal_color; // hilighted entries color in cludgepic
} KontrolOptData;

typedef struct tag_ButtonOptData {
	int clut0;
	KontrolTexts *ktexts;
	u_short hilite_color;
	u_short normal_color;
	u_byte b_sel;
	u_byte btime; // button acceptance timer
} ButtonOptData;

static ButtonOptData Bo[2] = {
	{ 49, &kbtexts[0], },
	{ 57, &kbtexts[B_OPT_COLUMN_HT], },	
};
static KontrolOptData Ko;

static char *get_buttons_string(u_int buttons)
{
static char buff[10]; // more static memory!
char *pstr;
int bnum = '1';

	if(!buttons)
		return("NONE");
	
	pstr = &buff[-1];

	while(buttons && pstr)
	{
		if(buttons & 0x01)
		{
		 	pstr[1] = 'B';
			pstr[2] = bnum;
			pstr[3] = ' ';
			pstr += 3;
			if(pstr > &buff[3])
				break;
		}
		++bnum;
	 	buttons >>= 1;
	}
	*pstr = 0;
	return(buff);
}
static u_long Only2Buttons(u_long buttons)
// 	look for first two buttons and mask out all others sets high bit if two
//  button bits set
{
u_long mask = 0x01;
u_long out = 0;

	while(mask)
	{
		if(mask & buttons)
		{
			out |= mask;
			if(out > mask)
			{		// two bits in out so flag with two button flag
				out |= 0x080000000;
				break;
			}
		}
		mask <<= 1;
	}
	return(out);
}
static void KontrolText(KontrolTexts *kt, char *str, int hilite)
{
 	delete_string(kt->strid,&objlst2);
 	kt->strid = p7_centered_soff(str,kt->x,kt->y,hilite ? YELLOW_p : WHITE_p);
}
static void set_key_text(KontrolTexts *kt, int hilite)
{
int ret;
char *str;
	
	if(kt->y == 0)
		return;
	ret= GetButtonMapkey(kt->buttonix);
	if((str = GetKeyString(ret)) == NULL)  // no key or unmapped key
		str = unassigned_key_text;
	KontrolText(kt,str,hilite);
}						
static void set_button_text(KontrolTexts *kt, int hilite)
{
int ret;
char *str;

	if(kt->y == 0) // exit pointer
		return;
	ret = GetBitButtons(kt->buttonix);
	str = get_buttons_string(ret);
	KontrolText(kt, str, hilite);
}
static void init_ktext_strings(int resetting)
{
KontrolTexts *kt;

	// initialize key fields
	for(kt = ktexts;kt < &ktexts[ArrayCount(ktexts)]; ++kt)
	{
 		if(!resetting)
			kt->strid = NULL;
		if(kt->y == 0)
			continue;
		set_key_text(kt,kt == &ktexts[Ko.key_sel]);
	}
   
   	// initialize button fields
   	for(kt = kbtexts;kt < &kbtexts[ArrayCount(kbtexts)]; ++kt)
	{
 		if(!resetting)
			kt->strid = NULL;
		set_button_text(kt,( kt == &kbtexts[Bo[0].b_sel] 
		                     || kt == &(&kbtexts[B_OPT_COLUMN_HT])[Bo[1].b_sel]));
	}
}
static int exit_hilited()
{
	/*
KludgePic *pic;

	pic = (KludgePic *)player_heap;
 	return(pic->psxclut[25] == Ko.hilite_color);
	*/
}
static void check_hilite_exit()
{
	/*
KludgePic *pic;

	pic = (KludgePic *)player_heap;

	pic->psxclut[25] = (    Ko.key_sel  == (KSEL_COLUMN_HT-1)
					     || Ko.key_sel  == ((KSEL_COLUMN_HT*2)-1)
					     || Bo[0].b_sel == (B_OPT_COLUMN_HT - 1)
						 || Bo[1].b_sel ==  (B_OPT_COLUMN_HT - 1) )
		    					? Ko.hilite_color : PSX_RGB(236,236,236);
	update_kpic_clut(pic);*/
}
static void kontrol_opt_proc(void)
// note this checks native input and not translated input
{
#define VALID_BUTTONS 0x01FF
KontrolTexts *kt,*kttemp;
ButtonOptData *bod;
int do_sound = 0;
int temp;
int retval;

	opt_done=1;
	current_proc->pdata.p_store6=1;

	while(current_proc->pdata.p_store6 && opt_done!=0)
	{
		if(do_sound)
			tsound(0x0c);
		do_sound = 0;
	
		process_sleep(1);

		if(current_proc->pdata.p_store7 == OPT_P1MASK)
		{
		static char *str;
			
			if(retval = GetKeyNowait())	// only player one process checks for keys
			{
			 	temp = Ko.key_sel;
						
				switch(retval)
				{
					case 0x25:  //  VK_LEFT           0x25
						temp -= KSEL_COLUMN_HT;
						goto clip_sub_sel;
					case 0x26:  //  VK_UP             0x26
						--temp;
						goto clip_sub_sel;
					case 0x27:  //  VK_RIGHT          0x27
						temp += KSEL_COLUMN_HT;
						goto clip_add_sel;
					case 0x28:  //  VK_DOWN           0x28
						++temp;
					clip_add_sel:
						if(temp >= (2*KSEL_COLUMN_HT)) // note unsigned test
							temp -= (KSEL_COLUMN_HT*2);
						goto sel_clipped;
					clip_sub_sel:
						if(temp < 0)
							temp += (KSEL_COLUMN_HT*2);
					sel_clipped: // change hilit entry in palette of kludgepic
					
						if(ShiftKeyState())	// only remap arrow keys if "shift"
							goto remap_key;

						set_key_text(&ktexts[Ko.key_sel],FALSE);
						kt = &ktexts[temp];
						Ko.key_sel = temp;
						set_key_text(kt,TRUE);
						check_hilite_exit();
						++do_sound;
					 	break;
					
					case 0x1B: //  VK_ESCAPE         0x1B

						// reset fields to default values
						SetDefaultKeymap();
						SetDefaultButtonmap();
						init_ktext_strings(1);
						++do_sound;
						continue;
					
					case 0x64: // VK_NUMPAD4        0x64
					case 0x0D: // VK_ENTER gets us out if pointing to "exit"
						if(exit_hilited())
							goto done;
					default:
					remap_key:
					{
						if(exit_hilited())
							break;

						kt = &ktexts[Ko.key_sel];

						if((str = GetKeyString(retval)) == NULL)  // not mappable key
							break;
					
						temp = SetButtonMapkey(kt->buttonix,retval);
						if(temp < IOBIX_NONE) // current mapping did not change
							break;
							
						// if key was mapped to another button set string
						// to "unassigned_key_text" or set it to the default
						// value for that button if that key is not used


						for(kttemp = ktexts;kttemp < &ktexts[ArrayCount(ktexts)]; ++kttemp)
						{				
							if(kttemp->buttonix == temp && kttemp->y)
							{
								set_key_text(kttemp,FALSE);
							}
							if(CheckForDefautNoKeys(kttemp->buttonix))
							{
								set_key_text(kttemp,FALSE);
							}
						}

						if((str = GetKeyString(retval)) == NULL)  // not mappable key
							break;

						// replace string hilit in button
						KontrolText(kt,str,TRUE);
					}
		  		}
			}
			retval = JoyGetNative(0);
			bod = &Bo[0]; // player one data
	  	}
		else
		{
			retval = JoyGetNative(1);
			bod = &Bo[1]; // player two data
		}

// check joystick input for any possible action

		if(current_proc->a10!=0)   // timeout for joystick motion advance enable
			--current_proc->a10;	

		if(!retval)
		{
			bod->btime = 0;
			continue;
		}
		if(bod->btime)
			--bod->btime;

		
		if(current_proc->a10 == 0) // ready to accept joystick up-down
		{
			temp = bod->b_sel;
			
			if(retval & NATIVE_JUP)
			{
				if(--temp < 0)
					temp = B_OPT_COLUMN_HT - 1;		
				goto move_joycursor;
			}
			else if(retval & NATIVE_JDOWN)
			{	
				if(++temp >= B_OPT_COLUMN_HT)
					temp = 0;		
			
			move_joycursor:

				set_button_text(&bod->ktexts[bod->b_sel],FALSE);
				set_button_text(&bod->ktexts[temp],TRUE);
				bod->b_sel = temp;
				check_hilite_exit();

				// arrow moved via button hit

				current_proc->a10 = 12; // time to next joy cursor motion
				++do_sound;
			}
			else 
			{
				kt = &bod->ktexts[bod->b_sel];

				if(kt->x != 0 && (retval & (NATIVE_JLEFT | NATIVE_JRIGHT)))
				{
					temp = GetBitButtons(kt->buttonix);
					
					if(Only2Buttons(temp) & 0x080000000)
					{
						temp = 0;
					}
		 			else if(retval & NATIVE_JLEFT)
					{
					  	if(temp == 0)
							temp = 1;
						else
						{
					  		temp <<= 1;
							temp &= VALID_BUTTONS;	// will make zero if large
						}
					}
					else if(retval & NATIVE_JRIGHT)
					{
						if(temp == 0)
							temp = (VALID_BUTTONS + 1); // next bit up
						temp >>= 1;
					}
					bod->btime = 12;
					current_proc->a10 = 12; // time to next joy cursor motion
					retval = temp;
					goto force_button_setting;
				}
			}
		}
		
		if(bod->btime) // not ready to accept button change
			continue;
		
		// kill joystick position bits
		retval &= ~(NATIVE_JUP | NATIVE_JDOWN | NATIVE_JRIGHT | NATIVE_JLEFT);
		
		if(!retval)	 // no buttons down
			continue;

		// do button selection

		if(exit_hilited()) // exit flag	and a button down
		{
			current_proc->pdata.p_store6 = 0;
			goto done;
		}

		retval &= VALID_BUTTONS; // only 1 to 9 allowed due to screen realestate
		if(!retval)
			continue;

		retval = Only2Buttons(retval);
				
		kt = &bod->ktexts[bod->b_sel];
	
	force_button_setting:

		if(!SetBitButtons(kt->buttonix,retval & VALID_BUTTONS)) // no change to existing buttons
			continue;

		if(retval & 0x80000000) // two buttons are down
			bod->btime = 12;

		set_button_text(kt,TRUE);
	}
	 
done:

	ClearKeyBuffer();
	opt_done=0;
	return;

#undef VALID_BUTTONS
}

extern int Loop_Time;

static void opt_p2control(void)
{
	current_proc->a11=OPT_SCRN_CONTROLS2;
	current_proc->pdata.p_store7=OPT_P2MASK;
	kontrol_opt_proc();
	process_suicide();
}
static void init_scrn_controls()
{
KludgePic *pic;
u_short color;

	memset(&Ko,0,sizeof(Ko));
	ClearKeyBuffer();

//	pds_centered_soff("RIGHT LEFT",320/2, 40);  // gotta make text somehow :-)

	init_ktext_strings(0);

	Emu.kludgeflags |= KLUDGE_DRAWPIC;
	Load8BitPicture("bkgds\\mkconfig.bin",player_heap);
	//WIN95: HORRIBLE HACK TO RESTART SOUND AFTER LOADING FROM DISK
	Loop_Time = 1;

	pic = (KludgePic *)player_heap;
	Ko.hilite_color = pic->psxclut[25];
   	Bo[0].b_sel = 0;
	Bo[1].b_sel = 0;
	check_hilite_exit();

}

static void set_text_ids(int newid)
{
OBJECT *obj;

	obj=(OBJECT *)&objlst2;
	while ( obj->olink!=NULL )
	{
		obj=obj->olink;
		if ( obj->oid==OID_TEXT )
			obj->oid=newid;
	}
}
extern long CoinModObjCount;
extern long CoinModNologoObjCount;
extern long CoinModNormalObjCount;
void option_select(WORD scrnindex)
{
	load_bkgd=BKGD_MK3_COINOPT;
	
	if(scrnindex == OPT_SCRN_CONTROLS)
		CoinModObjCount = CoinModNologoObjCount;

	init_background_module(optcoin_module);
	multi_plane();
	CoinModObjCount = CoinModNormalObjCount;

 	f_novel=1;								// disable velocities
	opt_done=0;								// # of process using routine
	current_proc->a11=scrnindex;
	
    // texts for kludged keyboard option screen
	if(scrnindex == OPT_SCRN_CONTROLS)
		init_scrn_controls();
	else
		p15_centered(opt_screen_list[scrnindex],160,16);

	set_text_ids(OID_OPTION);


	/* activate 2nd player controls */

	if(scrnindex==OPT_SCRN_CONTROLS)
	{
		current_proc->pdata.p_store7=OPT_P1MASK;
		CREATE(PID_OPTCONTROL,opt_p2control);
		kontrol_opt_proc();
	}
	else
	{
		current_proc->pdata.p_store7=OPT_P2MASK|OPT_P1MASK;
		current_proc->a11=scrnindex;
		opt_proc();
	}

	while ( opt_done!=0 )
		process_sleep(1);

 	fadeout_jsrp(0x30);						// fade down
	Emu.kludgeflags &= ~KLUDGE_DRAWPIC;
	return;
}

/******************************************************************************
 Function: void opt_proc(void)

 By: David Schwartz

 Date: April 1995

 Parameters:
				current_proc->pdata.p_store7 - joystick mask
								(OPT_P1MASK - player 1 joystick only)
								(OPT_P2MASK - player 2 joystick only)
 				current_proc->a11 = which option screen table to use
					0 = game configure
					1 = music configure
					2 = p1 control configure
					3 = p2 control configure
					4 = cheat screen

 Returns: None

 Description:	game selection options
******************************************************************************/
void opt_proc(void)
{
	OPTLIST *opt,*opt_table;
	OBJECT *obj;

	opt=opt_table=opt_tables[current_proc->a11];

	/* setup all parameters, display and stuff for options */
	current_proc->a11=init_option_table(opt);			// max # of entries
	current_proc->pdata.p_store1=0;								// current entry pos
	current_proc->a10=0;													// debounce

	/* hilight palette of first choice */
	obj=opt->cobj;
	delpal(obj);
	obj->opal=get_fore_pal(OPT_HILITE_COLOR);

	opt_done=1;
	current_proc->pdata.p_store6=1;
	while (current_proc->pdata.p_store6 && opt_done!=0)
	{
		process_sleep(1);

		if ( current_proc->a10!=0 )
		{
				current_proc->a10--;
		}

		/* check for cursor movement */
		if ((swcurr.padvalue & P1P2_UP & current_proc->pdata.p_store7) && current_proc->a10==0)
		{
			current_proc->a10=12;
			obj=opt->cobj;							// get object

			/* move up */
			if ( obj!=NULL )
			{
				delpal(obj);							// change back to original color
				obj->opal=get_fore_pal(OPT_NORMAL_COLOR);
			}

			if (current_proc->pdata.p_store1==0)
				current_proc->pdata.p_store1=current_proc->a11-1;
			else current_proc->pdata.p_store1--;

			opt=opt_table+current_proc->pdata.p_store1;		// update opt ptr & object
			obj=opt->cobj;

			if ( obj!=NULL )
			{
				delpal(obj);							// set hilite color
				obj->opal=get_fore_pal(OPT_HILITE_COLOR);
			}

			tsound(0x0c);
		}
		else
		{
			if ((swcurr.padvalue & P1P2_DOWN & current_proc->pdata.p_store7) && current_proc->a10==0)
			{
				current_proc->a10=12;
				obj=opt->cobj;							// get object

				/* move down */
				if ( obj!=NULL )
				{
					delpal(obj);							// set to orig color
					obj->opal=get_fore_pal(OPT_NORMAL_COLOR);
				}

				current_proc->pdata.p_store1++;

				if (current_proc->pdata.p_store1==current_proc->a11)
					current_proc->pdata.p_store1=0;

				opt=opt_table+current_proc->pdata.p_store1;		// update opt ptr & object
				obj=opt->cobj;

				if ( obj!=NULL )
				{
					delpal(obj);							// set hilite color
					obj->opal=get_fore_pal(OPT_HILITE_COLOR);
				}

				tsound(0x0c);
			}
		}

		current_proc->pdata.p_store4=(ADDRESS)opt_table;		// setup transfer vars
		current_proc->pdata.p_store5=(ADDRESS)opt;
		current_proc->pa8=obj;
		opt->toggle_func();
		(ADDRESS)opt_table=current_proc->pdata.p_store4;		// update transfer vars
		(ADDRESS)opt=current_proc->pdata.p_store5;
		obj=current_proc->pa8;
	}

	opt_done=0;

	/* unhilite object */
	obj=opt->cobj;
	delpal(obj);
	obj->opal=get_fore_pal(OPT_NORMAL_COLOR);

	return;
}
/******************************************************************************
 Function: void option_exit(void)

 By: David Schwartz

 Date: April 1995

 Parameters:  current_proc->pdata.p_store5 - current option table entry
							current_proc->pdata.p_store4 - base option table

 Returns: None

 Description:	see if its time to exit
******************************************************************************/
void option_exit(void)
{
	/* check for exit */
	if ((swcurr.padvalue & OPTION_EXIT & current_proc->pdata.p_store7))
		current_proc->pdata.p_store6=0;

	return;
}

/******************************************************************************
 Function: void option_toggle(void)

 By: David Schwartz

 Date: April 1995

 Parameters:  current_proc->pdata.p_store5 - current option table entry
							current_proc->pdata.p_store4 - base option table

 Returns: None

 Description:	std option toggle stuff, will toggle through a list based on joy input
******************************************************************************/
void option_toggle_sound(void)
{
	option_toggle();
	sound_driver_config();			// repeatedly set sound driver, a waste but no big deal
	return;
}

void option_toggle(void)
{
	OBJECT *obj;
	OPTLIST *opt,*opt_table;

	opt_table=(OPTLIST *)current_proc->pdata.p_store4;
	opt=(OPTLIST *)current_proc->pdata.p_store5;
	obj=current_proc->pa8;

	/* check for option change */
	if ((swcurr.padvalue & P1P2_RIGHT & current_proc->pdata.p_store7) && current_proc->a10==0 && opt->choicetbl!=NULL)
	{

		current_proc->a10=12;

		/* toggle forward in options */
		opt->index++;								// next option
		if ((current_proc->a0=*((opt->choicetbl)+opt->index))==OIND_END)		// if at end reset to start
		{
			opt->index=0;
			current_proc->a0=*opt->choicetbl;
		}

		/* update graphics */
		obj->header.t_xoffset=option_text_list[current_proc->a0].u0;
		obj->header.t_yoffset=option_text_list[current_proc->a0].v0;
		obj->header.t_width=option_text_list[current_proc->a0].w;
		obj->header.t_height=option_text_list[current_proc->a0].h;

		/* center object */
		center_opt_obj(obj);

		/* update variable */
		if ( opt->var!=NULL )
			*opt->var=opt->index;

	}
	else
	{
		if ((swcurr.padvalue & P1P2_LEFT & current_proc->pdata.p_store7) && current_proc->a10==0 && opt->choicetbl!=NULL)
		{
			current_proc->a10=12;

			/* toggle backward in options */
			if (opt->index==0)
			{
				while (*((opt->choicetbl)+opt->index)!=OIND_END)
					opt->index++;
			}

			opt->index--;

			current_proc->a0=*((opt->choicetbl)+opt->index);

			/* update graphics */
			obj->header.t_xoffset=option_text_list[current_proc->a0].u0;
			obj->header.t_yoffset=option_text_list[current_proc->a0].v0;
			obj->header.t_width=option_text_list[current_proc->a0].w;
			obj->header.t_height=option_text_list[current_proc->a0].h;

			/* center object */
			center_opt_obj(obj);

			/* update variable */
			if ( opt->var!=NULL )
				*opt->var=opt->index;
		}
	}

	/* update vars to other routines will know about changes */
	current_proc->pdata.p_store4=(ADDRESS)opt_table;
	current_proc->pdata.p_store5=(ADDRESS)opt;
	current_proc->pa8=obj;
}

/******************************************************************************
 Function: WORD init_option_table(OPTLIST *otbl)

 By: David Schwartz

 Date: April 1995

 Parameters:  otbl - ptr to a table of options

 Returns: # of options in table (includeing exit)

 Description:	setup a screen for options
	Option table must be terminated by using NULL in 'var' field
******************************************************************************/
WORD init_option_table(OPTLIST *otbl)
{
	OBJECT *obj;		// temp obj ptr
	WORD index=0;

	while (otbl->lab_index!=OIND_EXIT)
	{
		/* set choice index to current variable value */
		otbl->index=*(otbl->var);

		/* Create Label Object */
		if ( otbl->lab_index != 255 )
		{
			obj=get_option_object(otbl->xlabel,otbl->y,otbl->lab_index);
			obj->opal=get_fore_pal(OPT_NORMAL_COLOR);
			insert_object(obj,&objlst2);
			otbl->lobj=obj;							// link object into struct
		}

		/* Create Choice Object */
		if ( otbl->choicetbl!=NULL )
		{
			obj=get_option_object(otbl->xchoice,otbl->y,*(otbl->choicetbl+otbl->index));
			center_opt_obj(obj);
			obj->opal=get_fore_pal(OPT_NORMAL_COLOR);
			insert_object(obj,&objlst2);
			otbl->cobj=obj;							// link object into struct
		}

		otbl++;							// next entry
		index++;
	}

	/* setup exit object */
	obj=get_option_object(otbl->xlabel,otbl->y,otbl->lab_index);
	obj->opal=get_fore_pal(OPT_NORMAL_COLOR);
	insert_object(obj,&objlst2);
	otbl->cobj=obj;							// link object into struct

	return(index+1);
}

/******************************************************************************
 Function: OBJECT *get_option_object(short x, short y, WORD lindex)

 By: David Schwartz

 Date: April 1995

 Parameters: x,y - pos of object
			 lindex - index into option_text_list to get graphic data

 Returns: None

 Description:	setup a text object for the option screens
******************************************************************************/
OBJECT *get_option_object(short x,short y,WORD lindex)
{
	OBJECT *obj;

	obj=get_object();

	obj->ozval=1;
	obj->oxvel.u.intpos=obj->oxpos.u.intpos=x;
	obj->oyvel.u.intpos=obj->oypos.u.intpos=y;
	obj->oid=OID_OPTION;

	/* setup header stuff */
	obj->header.tpage=option_tpage;
	obj->header.t_xoffset=option_text_list[lindex].u0;
	obj->header.t_yoffset=option_text_list[lindex].v0;
	obj->header.t_width=option_text_list[lindex].w;
	obj->header.t_height=option_text_list[lindex].h;

	return(obj);
}

#if 0
/******************************************************************************
 Function: void option_mtest(void)

 By: David Schwartz

 Date: April 1995

 Parameters: None

 Returns: None

 Description:	music test
******************************************************************************/
void option_mtest(void)
{
	option_test_toggle(OPT_ACTIVE_MUSIC,OPT_MAX_MUSIC);
	return;
}

/******************************************************************************
 Function: void option_stest(void)

 By: David Schwartz

 Date: April 1995

 Parameters: None

 Returns: None

 Description:	sound test
******************************************************************************/
void option_stest(void)
{
	option_test_toggle(OPT_ACTIVE_SOUND,OPT_MAX_SOUND);
	return;
}

/******************************************************************************
 Function: void option_test_toggle(WORD aflag,WORD max)

 By: David Schwartz

 Date: April 1995

 Parameters: None

 Returns: None

 Description:	sound test
******************************************************************************/
void option_test_toggle(WORD aflag,WORD max)
{
	OPTLIST *opt,*opt_table;

	opt_active=aflag;				// set sound active

	opt_table=(OPTLIST *)current_proc->pdata.p_store4;
	opt=(OPTLIST *)current_proc->pdata.p_store5;

	/* check for option change */
	if ((swcurr.padvalue & P1P2_RIGHT & current_proc->pdata.p_store7) && current_proc->a10==0)
	{

		current_proc->a10=12;

		/* toggle forward in options */
		opt->index++;								// next option
		if ( opt->index>=max)
			opt->index=0;

		/* update variable */
		*opt->var=opt->index;

	}
	else
	{
		if ((swcurr.padvalue & P1P2_LEFT & current_proc->pdata.p_store7) && current_proc->a10==0)
		{
			current_proc->a10=12;

			/* toggle backward in options */
			if ( opt->index==0 )
				opt->index=max-1;
			else opt->index--;

			/* update variable */
			*opt->var=opt->index;
		}
	}

	return;
}

#if 0
/******************************************************************************
 Function: void soundtest_proc(void)

 By: David Schwartz

 Date: April 1995

 Parameters: current_proc->a10 - x pos
						 current_proc->a11 - y pos
						 current_proc->a14 - ptr to variable to track

 Returns: None

 Description:	sound test process, this process deals with update the text
						and playing a sfx
******************************************************************************/
void soundtest_proc(void)
{
	WORD *sndsrc;
	OBJECT *obj;

	sndsrc=(WORD *)current_proc->a14;
	current_proc->pdata.p_store1=*sndsrc;

	/* print current snd num */
	opt_disp_num(current_proc->pdata.p_store1,current_proc->a10,current_proc->a11,current_proc->procid);

	while ( 1 )
	{
		sndsrc=(WORD *)current_proc->a14;

		if ( (*sndsrc)!=current_proc->pdata.p_store1 )
		{
			/* sound # changed, play new sfx, and print new # */
			kilobj2(current_proc->procid,-1);							// remove old text
			current_proc->pdata.p_store1=*sndsrc;
			opt_disp_num(*sndsrc,current_proc->a10,current_proc->a11,current_proc->procid);
		}

		obj=(OBJECT *)&objlst2;

		/* set text color, hilite or normal depending on activity */
		(WORD *)current_proc->a0=OPT_NORMAL_COLOR;
		if ( opt_active==current_proc->procid )
		{
			(WORD *)current_proc->a0=OPT_HILITE_COLOR;
			opt_active=OPT_ACTIVE_NONE;
		}

		/* change color */
		while ( obj->olink!=NULL )
		{
			 obj=obj->olink;
			 if ( obj->oid==current_proc->procid )
			 {
				 delpal(obj);
				 obj->opal=get_fore_pal((WORD *)current_proc->a0);
			 }
		}

		process_sleep(1);
	}

	process_suicide();
}
#endif

/******************************************************************************
 Function: void opt_disp_num(WORD sndnum,WORD x,WORD y,WORD id)

 By: David Schwartz

 Date: April 1995

 Parameters: sndnum - current sound number
						 x,y - position
						 id - id to change all OID_TEXT

 Returns: None

 Description:	display the current sound effect/music that we are going to play
******************************************************************************/
void opt_disp_num(WORD sndnum,WORD x,WORD y,WORD id)
{
	OBJECT *obj;

	/* set position */
 	lm_setup(pf_dave_smallc);
	fnt_state.fnt_posx=x;
	fnt_state.fnt_posy=y;

	/* print number */
	printf_p1("%d",sndnum);

	/* change ids */
	obj=(OBJECT *)&objlst2;
	while ( obj->olink!=NULL )
	{
		obj=obj->olink;
		if ( obj->oid==OID_TEXT )
			obj->oid=id;
	}

	return;
}
#endif

/******************************************************************************
 Function: void opt_pad_setup(OPTMAP *omap, WORD *padmap)

 By: David Schwartz

 Date: April 1995

 Parameters: omap - init table
						 index - 0=p1 1=p2

 Returns: None

 Description: read the current logical joystick values and convert them to viewable
							indecies for the option remap routines

 pad?_map_table[X] -> logical hardware value -> display object index
******************************************************************************/
void opt_pad_setup(OPTMAP *omap, WORD *padmap)
{
	WORD log_hard_val;

	while ( omap->storage!=NULL )
	{
		/* retrieve currentl logical hardware value from remap table */
		log_hard_val=*(padmap+omap->b_index);

		/* assign storage, dispaly object index with correct index type */
		switch ( log_hard_val )
		{
			case MASK_JHIP:
				*(omap->storage)=OCL_HP;
				break;
			case MASK_JLOP:
				*(omap->storage)=OCL_LP;
				break;
			case MASK_JHIK:
				*(omap->storage)=OCL_HK;
				break;
			case MASK_JLOK:
				*(omap->storage)=OCL_LK;
				break;
			case MASK_JRUN:
				*(omap->storage)=OCL_RUN;
				break;
			case MASK_JBLOCK:
				*(omap->storage)=OCL_BLOCK;
				break;
			default:
				*(omap->storage)=OCL_OFF;
				break;
		}
		omap++;
	}

	return;
}

/******************************************************************************
 Function: void opt_pad_remap(OPTMAP *omap, WORD *padmap)

 By: David Schwartz

 Date: April 1995

 Parameters: omap - init table
						 index - 0=p1 1=p2

 Returns: None

 Description: converts readable index into logical hardware value and stores into remap table

 display object index -> logical hardware value -> pad?_map_table[X]
******************************************************************************/
void opt_pad_remap(OPTMAP *omap, WORD *padmap)
{
	WORD log_hard_val;

	while ( omap->storage!=NULL )
	{
		/* retrieve current display index */
		log_hard_val=opt_hard_log[*(omap->storage)];

		/* assign storage, dispaly object index with correct index type */
		*(padmap+omap->b_index)=log_hard_val;

		omap++;
	}

	return;
}
