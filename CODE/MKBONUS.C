/******************************************************************************
 File: mkbonus.c

 Date: Dec 1994

 (C) Williams Entertainment

 Mortal Kombat III bonus Routines
******************************************************************************/
#include "win_port.h"

#include "mk3snd.h"
/* INCLUDES */
#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif /* SONY_PSX */

#include "mkbkgd.h"
#include "mkos.h"
#include "mkobj.h"
#include "mkgame.h"
#include "mkutil.h"
#include "mkani.h"
#include "mkmain.h"
#include "mkblood.h"
#include "mkbonus.h"
#include "mkfx.h"
#include "mkfile.h"
#include "mktext.h"
#include "mksound.h"
#include "psxspu.h"

/* local extern info */
extern char txt_tie[];
extern char txt_single_flawless[];
WORD g_marker;

/******************************************************************************
 Function: void bonus_count(void)

 By: David Schwartz

 Date: Dec 1994

 Parameters: None

 Returns: None

 Description:	After fight bonus screen display
******************************************************************************/
char txt_tie[]="DRAW";
char txt_single_flawless[]="FLAWLESS VICTORY";

BYTE fatality_animations[][2]=
{
	{FX_FATAL_DRIP,FX_FATAL_LOAD},
	{FX_FATAL_DRIP,FX_FATAL_LOAD},
	{FX_ANIMALITY,FX_ANIMAL_LOAD},
	{FX_FRIENDSHIP,FX_FRIEND_LOAD},
	{FX_BABALITY,FX_BABY_LOAD},
	{FX_FATAL_DRIP,FX_FATAL_LOAD},
	{FX_FATAL_DRIP,FX_FATAL_LOAD}
};

//WIN95 changed from sectors to ticks 
//WIN95 short fatal_wait[]={225,225,425,450,520,225,225};
short fatal_wait[]={87,87,164,174,201,87,87};

// NOTE: THESE ARE ALSO USED AS OFFSETS INTO A SINGLE COMPOSITE REDBOOK TRACK
WORD winner_wait[]=
{
	2+30*75,		// kano
	2+130*75,		// sonya
	2+20*75,		// jax
	2+70*75,		// ind
	2+150*75,		// subz
	2+140*75,		// swat
	2+110*75,		// sindel
	2+80*75,		// robo1
	2+10*75,		// robo2
	2+40*75,		// lao
	2+0*75,			// kabal
	2+100*75,		// sheeva
	2+90*75,		// shang
	2+50*75,		// liu kang
	2+120*75,		// smoke
	2+60*75,		// motaro
	2+0*75,			// shao
	2+0*75,			// noob
};

void bonus_count(void)
{
	WORD *pa4;
	WORD *pa5;
	WORD *pbar;
	ADDRESS ta11;
	WORD count;
	PROCESS *ptemp;

	gstate=GS_BONUS;					// game state = bonus

	kill_lingerings();					// kill fx/dangers/etc...

	while ( f_no_bonus)				// wait until fatality code say go
		process_sleep(1);

//********************************************
	ptemp=process_exist(PID_MERCY,0xffff);
	if ( ptemp!=NULL  )
	{
		if ( ptemp->p_comp_flag==999 )
		{
			process_kill(ptemp);
		}
	}
//********************************************


	/* load after fight sound effects */
  	psxspu_start_cd_fade(2*FADE_TIME,0);

	if ( p1_bar!=p2_bar )
	{
		p15_centered(get_winner_text(),SCX(0xc8),SCY(0x38)+8);
		change_oid_list(&objlst2,OID_TEXT,OID_FX);		// change oid of PLAYER WINS TEXT
	}

	process_sleep(0x10);

	if ( f_death==0 )
		play_ending_chord();

	count=0;
	while(psxspu_get_cd_fade_status() && (++count)<4*55)		// wait until fade done to prevent popping
		process_sleep(1);

	process_sleep(1);
	if ( f_death!=0 )
	{
		current_proc->a0=(f_final_act==0)? 0:f_final_act-1;
		current_proc->pa8=(winner_status==1)?p1_obj:p2_obj;
		/* load graphic data */

		psxspu_set_cd_vol(0); 					// make sure volume is zero so no delay can happen
		psxcd_stop();

		count=0;
		while ( psxcd_waiting_for_pause() && ++count<2*55 )
		{
			process_sleep(1);
		}

		ta11=(ADDRESS)special_fx_load(fatality_animations[current_proc->a0][1]);
	}

	if (p1_bar!=p2_bar)
	{
//********************************************************************
//  ANNOUNCE THE WINNER
//********************************************************************
		if (get_winner_ochar==FT_SK)
		{
			current_proc->pa8=(p1_char==FT_SK)?p1_obj:p2_obj;		// make sure point to an object for panning driver call
			rsnd_sk_bonus_win();
			process_sleep(0x28);
		}
		else
		{
#if 0 
			 if ( (p1_bar==FULL_STRENGTH && p1_state==PS_ACTIVE )|| (p2_bar==FULL_STRENGTH && p2_state==PS_ACTIVE))
			 {
			 	//play_generic_stream(triple_sndtab[0x92+get_winner_ochar]);		// play winner & flawless
				if ( f_no_sfx )
					psxcd_play_at(30,0,winner_wait[get_winner_ochar]);
				else 
					psxcd_play_at(30,cd_vol_tbl[3],winner_wait[get_winner_ochar]);
			 }
			 else
			 {
		 		//play_generic_stream(triple_sndtab[0x3d+get_winner_ochar]);	// play winner
				if ( f_no_sfx )
					psxcd_play_at(31,0,winner_wait[get_winner_ochar]);
				else
				{
					if ( get_winner_ochar==FT_NOOB )
						psxcd_play_at(TRK_KANO_MERCY,cd_vol_tbl[3],winner_wait[get_winner_ochar]);		// so noob plays kano show mercy (BUG IN
					else 
						psxcd_play_at(31,cd_vol_tbl[3],winner_wait[get_winner_ochar]);
				}
			 }
#endif
	 		//play_generic_stream(triple_sndtab[0x3d+get_winner_ochar]);	// play winner
			if ( !f_no_sfx )
			{
				if ( get_winner_ochar==FT_NOOB )
//					psxcd_play_at(TRK_KANO_MERCY,cd_vol_tbl[3],winner_wait[get_winner_ochar]);		// so noob plays kano show mercy (BUG IN
;
				else 
					playsnd(WAV_TRK_KANO_WINS + get_winner_ochar);
			}
		}	


//********************************************************************
//  ANNOUNCE THE WINNER
//********************************************************************
#if _CD_VERSION_ == 1
		count=0;
//WIN95 MOVED THE SOUND TO MEMORY SO CHECK SECTORS WILL NOT WORK
//		while ( psxcd_elapsed_sectors()<20 && (++count)<5*55 )
//		{
//			process_sleep(1);								// wait until sound has started
//		}
#endif

//********************************************************************

		/* flawless check */
// -SONY-
		if (p1_bar==FULL_STRENGTH || p2_bar==FULL_STRENGTH)
			tsound(0x72);			// flawless tone


		/* bonus3 */
		process_sleep(2);

		if ( get_winner_ochar==FT_NOOB )
			wait_for_bonusv(340);										// make sure name is said completely
		else 
//WIN95:			wait_for_bonusv(170+winner_wait[get_winner_ochar]);	// make sure name is said completely
			wait_for_bonusv(140);										// make sure name is said completely

		if ((winner_status==1 && p1_state==PS_ACTIVE) ||
		   (winner_status==2 && p2_state==PS_ACTIVE))
		{
			/* flawless victory ? */
			if (winner_status==1)
			{
				pbar=&p1_bar;
				pa4=&p1_perfect;			// winner perfect
				pa5=&p2_perfect;			// loser perfect
			}
			else
			{
				pbar=&p2_bar;
				pa4=&p2_perfect;			// winner perfect
				pa5=&p1_perfect;			// loser perfect
			}

			/* bonus5 */
			*pa5=~0;						// loser = no chance for double perfect

			if (*pbar==FULL_STRENGTH)		// check for perfection
			{
				/* win5 */
				*pa4=1;			// flag: perfect round
				(char *)current_proc->pa8=txt_single_flawless;

				/* win51 */
				pds_centered((char *)current_proc->pa8,SCX(0xc8),SCY(0x60)+16);

//********************************************************************
//  ANNOUNCE FLAWLESS
//********************************************************************
//				play_generic_stream(TRK_FLAWLESS);			// tsound(0x61)
//#if _CD_VERSION_ == 1
//					while ( psxcd_elapsed_sectors()<20)
//						process_sleep(1);								// wait until sound has started
//#endif
//********************************************************************
//  ANNOUNCE FLAWLESS
//********************************************************************
				// WIN95: Moved waves files back into memory 
				tsound(0x61);

//WIN95			wait_for_bonusv(340+winner_wait[get_winner_ochar]);	// make sure name is said completely
				wait_for_bonusv(120);
	  			psxspu_start_cd_fade(FADE_TIME,0);					// kill volume so next tune happens quicker
			}
		}
		else
		{
	  		psxspu_start_cd_fade(FADE_TIME/2,0);					// kill volume so next tune happens quicker
			/* stay awhile for a computer victory, NEED for streams */
			process_sleep(0x28);
		}

		/* win6 , fatality ? */
		if (f_death!=0)
		{
			dallobj(OID_TEXT);

			current_proc->a0=(f_final_act==0)? 0:f_final_act-1;
			current_proc->pa8=(winner_status==1)?p1_obj:p2_obj;

			/* load graphic data */
//			current_proc->a11=(ADDRESS)special_fx_load(fatality_animations[current_proc->a0][1]);

			/* display graphic data */
			current_proc->a11=ta11;
			create_fx(fatality_animations[current_proc->a0][0]);		// fatality drip fx

			process_sleep(2);
			wait_for_bonusv(fatal_wait[current_proc->a0]);
  			psxspu_start_cd_fade(FADE_TIME,0);					// kill volume so next tune happens quicker
		}
	}
	else
	{
		/* bonus_count_draw */
		p15_centered(txt_tie,SCX(0xc8),SCY(0x38)+16);
		process_sleep(0x40);
	}

	/* bonus exit */
	if (p1_matchw!=2 && p2_matchw!=2)
	{
		fast_fadeout_jsrp(0x20);
		freeze_2_pages();
		MURDER;

		/* amode display reset */
		f_doscore=0;
		clr_scrn();
		f_auto_erase=1;
		murder_myoinit();
		clr_scrn();
		/* amode display reset */
	}
	else
	{
		/* bonus7 */
		process_sleep(0x25);
	}

	send_code_a3(0);
	return;
}

/******************************************************************************
 Function: void kill_lingerings(void)

 By: David Schwartz

 Date: Dec 1994

 Parameters: None

 Returns: None

 Description:	kill lingering objects and processes that aren't needed
******************************************************************************/
void kill_lingerings(void)
{
	dallobj(PID_DANGER1);
	dallprc(PID_DANGER1);

	dallobj(PID_DANGER2);
	dallprc(PID_DANGER2);

	dallprc(PID_FX);
	dallobj(OID_FX);
	dallobj(OID_TEXT);

	return;
}

/******************************************************************************
 Function: inline char *get_winner_text(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	returns ptr to winners text
******************************************************************************/
char txt_kano_wins[]="KANO WINS";
char txt_sonya_wins[]="SONYA WINS";
char txt_jax_wins[]="JAX WINS";
char txt_sal_wins[]="NIGHTWOLF WINS";
char txt_sz_wins[]="SUB-ZERO WINS";
char txt_swat_wins[]="STRYKER WINS";
char txt_lia_wins[]="SINDEL WINS";
char txt_robo1_wins[]="SEKTOR WINS";
char txt_robo2_wins[]="CYRAX WINS";
char txt_lao_wins[]="KUNG LAO WINS";
char txt_tusk_name_wins[]="KABAL WINS";
char txt_sg_name_wins[]="SHEEVA WINS";
char txt_st_name_wins[]="SHANG TSUNG WINS";
char txt_lk_name_wins[]="LIU KANG WINS";
char txt_smoke_wins[]="SMOKE WINS";
char txt_motaro_wins[]="MOTARO WINS";
char txt_shao_kahn_wins[]="SHAO KAHN WINS";
char txt_noob_wins[]="NOOB SAIBOT WINS";

char *ochar_winner_text[]=
{
	txt_kano_wins,
	txt_sonya_wins,
	txt_jax_wins,
	txt_sal_wins,
	txt_sz_wins,
	txt_swat_wins,
	txt_lia_wins,
	txt_robo1_wins,
	txt_robo2_wins,
	txt_lao_wins,
	txt_tusk_name_wins,
	txt_sg_name_wins,
	txt_st_name_wins,
	txt_lk_name_wins,
	txt_smoke_wins,
	txt_motaro_wins,
	txt_shao_kahn_wins,
	txt_noob_wins,
	txt_noob_wins
};

 char *get_winner_text(void)
{
	return(ochar_winner_text[get_winner_ochar]);
}


/******************************************************************************
 Function: void wait_for_bonusv(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:	wait for shao kahn voice to finish
******************************************************************************/
void wait_for_bonusv(WORD sector)
{
	current_proc->a10=0x44*5;
	/* wfb3 */
	do
	{
//WIN95		if ( psxcd_elapsed_sectors()<=sector)
		if ( --sector)
			process_sleep(1);
		else break;
	}
	while(--current_proc->a10>0);

	return;
}
