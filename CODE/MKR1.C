/******************************************************************************
 File: mkr1.c

 Date: Mar 1995

 (C) Williams Entertainment

 Mortal Kombat III round intro jsrps
******************************************************************************/

#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif /* SONY_PSX */

#include "mkbkgd.h"
#include "mkobj.h"
#include "mkos.h"
#include "mkgame.h"
#include "mkutil.h"
#include "mkbkgd.h"
#include "mkani.h"
#include "mkjoy.h"
#include "mkmain.h"
#include "mkpal.h"
#include "mkscore.h"
#include "mktext.h"
#include "mksound.h"
#include "mkr1.h"
/* Local Externs */
extern void *fl_r1[];

#define REGEN_POWER	2			// # of power ticks to give back during regeneration
#define REGEN_SLEEP 30

#if 0
/* Round Intro Jump Tables */
JUMPTBL round_23_jumps[]=
{
	r_throwing_disabled,	//  1 = throwing disabled
	r_blocking_disabled,	//  2
	r_p1_handicap,			//  3 =
	r_p2_handicap,			//  4 =
	r_dark_fighting,		//  5 =
	r_switcheroo,	  		//  6 =
	r_jackbot_easy,			//  7 =
	r_p1_supercap,			//  8 =
	r_p2_supercap,			//  9 =
	r_space_game,			// 10 =
	r_wf_motaro,			// 11 = winner fights motaro
	r_wf_shao,				// 12 = winner fights shao kahn
	r_wf_noob,				// 13 = winner fights noob
	r_nofear_clues,			// 14 = no fear clue
	r_no_powerbars,			// 15 =
	r_uppercut_recovery,	// 16 =
	r_unlim_run,			// 17 =
	r_psycho_kombat,		// 18 =
	r_intro_message,		// 19 =
	r_sf_smoke,				// 1a =
};
#endif

#define round_23_jumps round_1_jumps
JUMPTBL round_1_jumps[]=
{
	r_throwing_disabled,	// 1 = throwing disabled
	r_blocking_disabled,	// 2
	r_p1_handicap,			// 3 =
	r_p2_handicap,			// 4 =
	r_dark_fighting,		// 5 =
	r_switcheroo,	  		// 6 = quasi randper
	r_jackbot_easy,			// 7 =
	r_p1_supercap,			// 8 =
	r_p2_supercap,			// 9 =
	r_space_game,			// 10 =
	r_wf_motaro,			// 11 = winner fights motaro
	r_wf_shao,				// 12 = winner fights shao kahn
	r_wf_noob,				// 13 = winner fights noob
	r_nofear_clues,			// 14 = no fear clue
	r_no_powerbars,			// 15 =
	r_uppercut_recovery,	// 16 =
	r_unlim_run,   			// 17 =
	r_psycho_kombat,		// 18 =
	r_intro_message,		// 19 =
	r_sf_smoke,				// 20 =
	r_no_combos,			// 21 = disable combo system
	r_superjumps,			// 22 = allow superjumps
	r_no_special_moves,		// 23 = no special moves allowed
	r_p1_half_damage,		// 24 = p1 inflict half damage
	r_p2_half_damage,		// 25 = p1 inflict half damage
	r_p1p2_half_damage,		// 26 = p1 & p2 inflict half damage
	r_bar_regenerate,		// 27 = powerbars grow back to life
	r_super_endur,			// 28 = regen power bars half damage unlimited run
	r_real_kombat,			// 29 = no special moves & regenerating kombat
};

/******************************************************************************
 Function: void do_round_jsrps(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	round introduction display code
******************************************************************************/
void do_round_jsrps(void)
{
	if (round_num==1)
	{
		if (round_1_jsrp)
		{
			round_1_jumps[round_1_jsrp-1]();
		}
	}
	else
	{
		if (round_23_jsrp)
		{
			round_23_jumps[round_23_jsrp-1]();
		}
	}

	return;
}

/******************************************************************************
 Function: void r_intro_message(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	round intro message
******************************************************************************/
char txt_intro_message[]="THERE IS NO KNOWLEDGE THAT IS NOT POWER";
void r_intro_message(void)
{
	msg1(txt_intro_message);
}

/******************************************************************************
 Function: void r_psycho_kombat(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	pyscho combat
******************************************************************************/
char txt_psycho_kombat[]="PSYCHO KOMBAT";
void r_psycho_kombat(void)
{
	f_upcut_rec=1;
	f_unlim_run=1;
	f_sans_block=1;

	CREATE(PID_PSYCHO,psycho_score_onoff);
	CREATE(PID_SWITCHEROO,switcheroo_proc);
	CREATE(PID_DARK,dark_fight_proc);
	msg1(txt_psycho_kombat);
}

void psycho_score_onoff(void)
{
	do
	{
		DONT_SHOW_SCORES;
		process_sleep(pso3());
		SHOW_SCORES;
		process_sleep(pso3());
	}
	while(1);
}

WORD pso3(void)
{
	if (winner_status!=0)
	{
		SHOW_SCORES;
		process_suicide();
	}

	return(randu_minimum(0x20,0x20));
}

/******************************************************************************
 Function: void r_uppercut_recovery(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  recover from uppercuts fast
******************************************************************************/
char txt_uppercut_recovery[]="FAST UPPERCUT RECOVERY ENABLED";
void r_uppercut_recovery(void)
{
	f_upcut_rec=1;
	msg1(txt_uppercut_recovery);
}

/******************************************************************************
 Function: void r_unlim_run(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  unlimited running
******************************************************************************/
char txt_unlim_run[]="UNLIMITED RUN";
void r_unlim_run(void)
{
	f_unlim_run=1;
	msg1(txt_unlim_run);
}

/******************************************************************************
 Function: void r_no_special_moves(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  unlimited running
******************************************************************************/
char txt_no_special_moves[]="SPECIAL MOVES DISABLED";
void r_no_special_moves(void)
{
	f_no_special_moves=1;
	msg1(txt_no_special_moves);
}

/******************************************************************************
 Function: void r_p1p2_half_damage(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  inflict half damage
******************************************************************************/
char txt_p1_half_damage[]="PLAYER 1 INFLICTS HALF DAMAGE";
char txt_p2_half_damage[]="PLAYER 2 INFLICTS HALF DAMAGE";
char txt_p1p2_half_damage[]="INFLICT HALF DAMAGE";
void r_p1p2_half_damage(void)
{
	f_p1_half_damage=1;
	f_p2_half_damage=1;
	msg1(txt_p1p2_half_damage);
}

void r_p1_half_damage(void)
{
	f_p1_half_damage=1;
	msg1(txt_p1_half_damage);
}

void r_p2_half_damage(void)
{
	f_p2_half_damage=1;
	msg1(txt_p2_half_damage);
}

/******************************************************************************
 Function: void r_sf_????(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  fight certain characters
******************************************************************************/
char txt_wf_smoke[]="WINNER OF THIS ROUND BATTLES SMOKE";
char txt_wf_noob[]="WINNER OF THIS ROUND BATTLES NOOB SAIBOT";
char txt_wf_shao[]="WINNER OF THIS ROUND BATTLES SHAO KAHN";
char txt_wf_motaro[]="WINNER OF THIS ROUND BATTLES MOTARO";

void r_sf_smoke(void)
{
	wf3(txt_wf_smoke,post_wf_smoke);
}

void r_wf_noob(void)
{
	wf3(txt_wf_noob,post_wf_noob);
}

void r_wf_shao(void)
{
	wf3(txt_wf_shao,post_wf_shao);
}

void r_wf_motaro(void)
{
	wf3(txt_wf_motaro,post_wf_motaro);
}

void wf3(char *pa8,FUNC pa14)
{
	if (f_play3==0)
		return;

	round_1_jsrp=0;			// only once
	round_23_jsrp=0;
	clear_combo_ram();

	msg1(pa8);

	play3_pa14=pa14;			// set return addr after fight

	return;
}

/******************************************************************************
 Function: void r_space_game(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	play the space game
******************************************************************************/
char txt_rellim[]="YOU ARE ENTERING THE LAND OF RELLIM";
void r_space_game(void)
{
	CREATE(PID_MASTER,space_game);
	msg1(txt_rellim);
}

/******************************************************************************
 Function: void r_no_powerbars(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	no powerbars
******************************************************************************/
char txt_no_powerbars[]="NO POWERBARS";
void r_no_powerbars(void)
{
	DONT_SHOW_SCORES;
	msg1(txt_no_powerbars);
}

/******************************************************************************
 Function: void r_nofear_clues(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	nofear pinball clues
******************************************************************************/
char txt_nofear_clue[]="NO FEAR = EB BUTTON, SKYDIVE, MAX COUNTDOWN";
char txt_jackbot[]="HOLD FLIPPERS DURING CASINO RUN";
void r_nofear_clues(void)
{
	msg1(txt_nofear_clue);
}

void r_jackbot_easy(void)
{
	msg1(txt_jackbot);
}

/******************************************************************************
 Function: void r_switcheroo(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	random fighter kombat(NOT SUPPORTED FOR SONY OR ANY OTHER CDROM PLATFORM)
******************************************************************************/
char txt_switcheroo[]="QUASI-RANDPER KOMBAT";
void r_switcheroo(void)
{
	CREATE(PID_SWITCHEROO,switcheroo_proc);
	msg1(txt_switcheroo);
}

/******************************************************************************
 Function: void r_bar_regenerate(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	powerbars regenerate
******************************************************************************/
char txt_regenerate[]="REGENERATING POWERBARS";
char txt_super_endur[]="SUPER ENDURANCE";
void r_bar_regenerate(void)
{
	CREATE(PID_REGENERATE,regenerate_proc);
	msg1(txt_regenerate);
}

void r_super_endur(void)
{
	f_unlim_run=1;
	f_p1_half_damage=1;
	f_p2_half_damage=1;
	CREATE(PID_REGENERATE,regenerate_proc);
	msg1(txt_super_endur);
}

char txt_real_kombat[]="REAL KOMBAT";
void r_real_kombat(void)
{
	f_no_special_moves=1;
	CREATE(PID_REGENERATE,regenerate_proc);
	msg1(txt_real_kombat);
}
/******************************************************************************
 Function: void r_dark_fighting(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:	fight in the dark
******************************************************************************/
char txt_dark_fighting[]="DARK KOMBAT";
void r_dark_fighting(void)
{
	CREATE(PID_DARK,dark_fight_proc);
	msg1(txt_dark_fighting);
}

/******************************************************************************
 Function: void r_blocking_disabled(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	round intro blocking disabled
******************************************************************************/
char txt_no_blocks[]="BLOCKING DISABLED";
void r_blocking_disabled(void)
{
	f_sans_block=1;
	msg1(txt_no_blocks);
}

/******************************************************************************
 Function: void r_throwing_disabled(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	round intro throwing disabled
******************************************************************************/
char txt_no_throws[]="THROWING DISABLED";
void r_throwing_disabled(void)
{
	f_sans_throws=1;
	msg1(txt_no_throws);
}

/******************************************************************************
 Function: void r_superjump(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  unlimited running
******************************************************************************/
char txt_super_jumps[]="SUPER RUN JUMPS";
void r_superjumps(void)
{
	f_superjumps=1;
	msg1(txt_super_jumps);
}

/******************************************************************************
 Function: void r_no_combos(void)

 By: David Schwartz

 Date: May 1995

 Parameters:  None

 Returns: None

 Description:  disable combo system
******************************************************************************/
char txt_no_combos[]="COMBO SYSTEM DISABLED";
void r_no_combos(void)
{
	f_no_combos=1;
	msg1(txt_no_combos);
}

/******************************************************************************
 Function: void r_p1_handicap(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	round intro p1 handicap
******************************************************************************/
char txt_p1_handicap[]="PLAYER 1 HALF POWER";
char txt_p1_supercap[]="PLAYER 1 QUARTER POWER";
void r_p1_handicap(void)
{
	CREATE(PID_FX,p1_hadicap_proc);
	msg1(txt_p1_handicap);
}

void r_p1_supercap(void)
{
	CREATE(PID_FX,p1_supercap_proc);
	msg1(txt_p1_supercap);
}

/******************************************************************************
 Function: void r_p2_handicap(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	round intro p2 handicap
******************************************************************************/
char txt_p2_handicap[]="PLAYER 2 HALF POWER";
char txt_p2_supercap[]="PLAYER 2 QUARTER POWER";
void r_p2_handicap(void)
{
	CREATE(PID_FX,p2_hadicap_proc);
	msg1(txt_p2_handicap);
}

void r_p2_supercap(void)
{
	CREATE(PID_FX,p2_supercap_proc);
	msg1(txt_p2_supercap);
}

/******************************************************************************
 Function: void p1_hadicap_proc(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	p1 handicap
******************************************************************************/
void p1_supercap_proc(void)
{
	hand2(0,FULL_STRENGTH/4);
}

void p1_hadicap_proc(void)
{
	hand2(0,FULL_STRENGTH/2);
}

/******************************************************************************
 Function: void p2_hadicap_proc(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	p2 handicap
******************************************************************************/
void p2_supercap_proc(void)
{
	hand2(1,FULL_STRENGTH/4);
}

void p2_hadicap_proc(void)
{
	hand2(1,FULL_STRENGTH/2);
}

/******************************************************************************
 Function: void hand2(WORD pa11,WORD pa10)

 By: David Schwartz

 Date: March 1995

 Parameters:  pa11 - 0=pwr bar0 1=pwr bar1
			  pa10 - strength to set

 Returns: None

 Description:	deal with handicap
******************************************************************************/
void hand2(WORD pa11,WORD pa10)
{
	PROCESS *ptemp;

	ptemp=wait_for_charge();

	if (pa11==0)
	{
		ptemp->a10=pa10;
	}
	else
	{
		ptemp->a11=pa10;
	}

	process_suicide();
}

PROCESS *wait_for_charge(void)
{
	PROCESS *ptemp;
	do
	{
		process_sleep(5);
		ptemp=process_exist(PID_FX_CHARGE,-1);
	}
	while(ptemp==NULL);
	return(ptemp);
}

/******************************************************************************
 Function: void msg1(char *msg)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	print round message
******************************************************************************/
void msg1(char *msg)
{
	OBJECT *ta0;

	p7_centered(msg,SCX(0xc8),SCY(0xf0)+8);

	ta0=(OBJECT *)&objlst2;

	/* msg3 */
	while((ta0=ta0->olink)!=NULL)
	{
		ta0->oid=OID_R1;				// change all text id --> oid_r1
		//delpal(ta0);		// mod arcade to allow blinking palettes
		//ta0->opal=get_fore_pal(bpal_white_P);
	}

	CREATE(PID_R1,msg_round1);

	return;
}

/******************************************************************************
 Function: void msg_round1(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	flash letters for round intro
******************************************************************************/
void flash_r1(int t)
{
	OBJECT *obj;
	short pos;

	pos=(t==1)?600:-600;

	obj=(OBJECT *)&objlst2;
	while ( obj->olink!=NULL )
	{
		obj=obj->olink;
		if ( obj->oid==OID_R1 )
			obj->oypos.u.intpos+=pos;
	}

	return;
}

void msg_round1(void)
{
	PROCESS *pa0;

	WORD t;

	flash_r1(1);				// premove message off screen

	t=0x50/8;
	do
	{
		flash_r1(0);					// ON
		process_sleep(6);
		flash_r1(1);
		process_sleep(6);			// OFF
	} while ( --t>0 );

	//pa0=CREATE(PID_R1,boonpal_stuff);
	//pa0->a11=(ADDRESS)fl_r1;
	//process_sleep(0x50);

	dallobj(OID_R1);
	dallprc(PID_R1);

	process_suicide();
}

/******************************************************************************
 Function: void switcheroo_proc(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	rander fighter change process
******************************************************************************/
void switcheroo_proc(void)
{
#if SONY_PSX
	//process_suicide();
#endif
	do
	{
		process_sleep(8);
	}
	while(f_start==0);			// wait until we are fighting

	current_proc->pdata.p_store1=8;
	current_proc->pdata.p_store2=8;

	do
	{
		if (p1_bar==0 || p2_bar==0 || f_thatsall!=0)
			process_suicide();				// stop upon these events

		process_sleep(2);

		current_proc->pa8=p1_obj;
		current_proc->a5=(ADDRESS)p1_proc;
		switcheroo_check(&(current_proc->pdata.p_store1));

		current_proc->pa8=p2_obj;
		current_proc->a5=(ADDRESS)p2_proc;
		switcheroo_check(&(current_proc->pdata.p_store2));
	}
	while(1);
}

void switcheroo_check(ADDRESS *pa11)
{
	PROCESS *a13=current_proc;
	long a0;

	a0=*pa11;

	if (a0!=0)
	{
		a0-=2;
		if (a0<0)
			a0=0;

		/* sw2 */
		*pa11=a0;

		if (a0!=0)
			return;
	}

	/* sw3 */
	current_proc=(PROCESS *)current_proc->a5;
	if (am_i_airborn(current_proc->pa8)==SYSTEM_CARRY_SET)
	{
		current_proc=a13;
		return;				// no switch in air
	}

	if (current_proc->pdata.p_flags & PM_SPECIAL)
	{
		current_proc=a13;
		return;				// no switch during special
	}

	if (current_proc->pdata.p_flags & PM_REACTING)
	{
		current_proc=a13;
		return;				// no switch during reacting
	}

	fastxfer(current_proc,switcheroo_wake);

	*pa11=randu_minimum(0x40,0x40*4);

	current_proc=a13;
	return;
}

/******************************************************************************
 Function: void regenerate_proc(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	keep power bars growing back to full health
******************************************************************************/
void regenerate_proc(void)
{
	do
	{
		process_sleep(1);
	}
	while(f_start==0);				// wait till fights starts

	while (p1_bar!=0 && p2_bar!=0 && f_thatsall==0)
	{
		p1_bar+=REGEN_POWER;
		if (p1_bar>FULL_STRENGTH)
			p1_bar=FULL_STRENGTH;

		p2_bar+=REGEN_POWER;
		if (p2_bar>FULL_STRENGTH)
			p2_bar=FULL_STRENGTH;

		process_sleep(REGEN_SLEEP);				// give power at some time intervals
	}

	process_suicide();
}

/******************************************************************************
 Function: void dark_fight_proc(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	fight in the dark
******************************************************************************/
void dark_fight_proc(void)
{
	do
	{
		process_sleep(1);
		//next_anirate();
	}
	while(f_start==0);				// wait till fights starts

	f_dark=0;						// lights out
	(void *)current_proc->pa10=dark_dlist=dlists;				// grab current dlists
	process_sleep(8);

	/* dark2 */
	do
	{
		lights_out();

		/* dark3 */
		do
		{
			current_proc->a0=1;
			dark_sleep();
		}
		while(f_dark==0);			// someone hit lights on

		/* hit = lights on !! */
		lights_on();

		/* dark4 */
		do
		{
			if (f_dark==0)
				break;			// already slept --> go dark
			current_proc->a0=f_dark;
			f_dark=0;
			dark_sleep();
			lights_out();
		}
		while(1);
	}
	while(1);
}

void dark_sleep(void)
{
	/* darks3 */
	do
	{
		process_sleep(1);
		if (p1_bar==0 || p2_bar==0 || f_thatsall!=0)
		{
			/* dark_abort */
			lights_on();
			process_suicide();
		}
	}
	while(--current_proc->a0>0);

	return;
}

void lights_out(void)
{
	call_every_tick=dark_velocities;
	f_dark=0;
	dlists=NULL;
	return;
}

void lights_on(void)
{
	call_every_tick=qwerty;
	dlists=(void *)current_proc->a10;
	return;
}

void dark_velocities(void)
{
	ADDRESS *dptr;
	OBJECT *obj;

	dptr=(ADDRESS *)dark_dlist;
	dptr-=2;

	/* darkv2 */
	do
	{
		dptr+=2;
		obj=(OBJECT *)(*((ADDRESS **)dptr));

		if (obj==NULL)
		{
			qwerty();			// all velocites update --> qwerty
			return;
		}

		/* -SONY- SONY CODE SPACE AT 0x80000000 */
#if SONY_PSX
#endif

		if ((ADDRESS)obj!=0xffffffff)
		{
			/* darkv3 */
			while ((obj=obj->olink)!=NULL)
			{
				obj->oxpos.pos+=obj->oxvel.pos;
				obj->oypos.pos+=obj->oyvel.pos;
			}
		}
		else
		{
			if (*((FUNC*)(dptr+1))==use_next_y)
				dptr++;						// special case routine
		}
	}
	while(1);
}

void lights_on_hit(void)
{
	f_dark=0x18;				// flag to darkman
	return;
}

void lights_on_slam(void)
{
	f_dark=0x38;				// flag to darkman
	return;
}

/******************************************************************************
 Function: void space_game(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	play the space game
******************************************************************************/
void space_game(void)
{
	process_sleep(0x40*2);
	hidden_game_load();
	murder_myoinit_score();
	CREATE(PID_AMODE,game_over);
	f_nosound=0;
	process_suicide();
}

/******************************************************************************
 Function: void post_wf_????(void)

 By: David Schwartz

 Date: March 1995

 Parameters:  None

 Returns: None

 Description:	play the space game
******************************************************************************/
void post_wf_smoke(void)
{
	postw2(FT_SMOKE);
}

void post_wf_noob(void)
{
	postw2(FT_NOOB);
}

void post_wf_shao(void)
{
	postw2(FT_SK);
}

void post_wf_motaro(void)
{
	postw2(FT_MOTARO);
}

void postw2(WORD pa0)
{
	results_of_round(round_results);
	f_thatsall=1;					// flag: enough fighting already
	bonus_count();					// print winner is

	if (p1_bar==0)
	{
		/* p1 lost, out of game */
		p1_state=0;
		p1_char=p1_name_char=pa0;
	}
	else
	{
		/* p2 lost, out of game */
		p2_state=0;
		p2_char=p2_name_char=pa0;
	}

	p1_matchw=p2_matchw=0;

	murder_myoinit_score();
	p1_heap_char=p2_heap_char=0xffff;
	snd_module_status=0xffff;

	pa0=diff;
	p1_matchw=p2_matchw=0;
	special_game_init();
	round_results=play_1_round();
	results_of_round(round_results);
	diff=pa0;

	f_thatsall=1;
	bonus_count();

	special_game_init();
	advance_curback();

	if (p1_state!=PS_ACTIVE)
		p1_state=PS_BUYIN;
	else p2_state=PS_BUYIN;

	do_buyin();

	advance_curback();
	stack_jump(game_loop);
}

void special_game_init(void)
{
	WORD a1,a2;

	a1=p1_state;
	a2=p2_state;
	game_init();
	p1_state=a1;
	p2_state=a2;

	return;
}

