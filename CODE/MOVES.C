/******************************************************************************
 File: moves.c

 Date: Nov 1994

 (C) Williams Entertainment

 Mortal Kombat III Moves Logic (Combos, Specials, Etc)
******************************************************************************/

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
#include "mkani.h"
#include "mkjoy.h"
#include "mkreact.h"
#include "mkinit.h"
#include "moves.h"
#include "mkdrone.h"
#include "mkguys.h"
#include "mkfx.h"
#include "mkprop.h"
#include "mkstat.h"
#include "mkzap.h"
#include "mkcanned.h"
#include "mkmain.h"
#include "mkslam.h"
#include "mkfile.h"
#include "mkend.h"
#include "mkfatal.h"
#include "mkfriend.h"
#include "mkanimal.h"
#include "psxsnd.h"
#include "mksound.h"

/******************************************************************************/
/* External Local References */
/******************************************************************************/

/* located in mkcombo.s */
extern WORD scom_robo_zap1[];
extern WORD scom_robo_zap2[];
extern WORD scom_robo_net[];
extern WORD scom_bomb_mid[];
extern WORD scom_bomb_full[];
extern WORD scom_robo_tele[];
extern WORD scom_robo2_tele[];
extern WORD scom_robo_air_grab[];
extern WORD scom_fly[];
extern WORD scom_lia_anglez[];
extern WORD scom_dash[];
extern WORD scom_jax_zap2[];
extern WORD scom_jax_zap1[];
extern WORD scom_bike[];
extern WORD scom_ind_charge[];
extern WORD scom_sonya_zap[];
extern WORD scom_sky_zap_on[];
extern WORD scom_sky_zap_behind[];
extern WORD scom_sky_zap_front[];
extern WORD scom_sw_zap[];
extern WORD scom_lao_teleport[];
extern WORD scom_lao_angle_kick[];
extern WORD scom_lao_zap[];
extern WORD scom_axe_up[];

/* secret move externs */
extern SMOVE sm_all_ro[];
extern SMOVE sm_smoke_lkc[];
extern SMOVE sm_smoke_uc[];
extern SMOVE sm_smoke_dc[];
extern SMOVE sm_smoke_hkc[];
extern SMOVE sm_smoke_bc[];
extern SMOVE sm_smoke_lpc[];
extern SMOVE sm_smoke_rc[];
extern SMOVE sm_kano_hpc[];
extern SMOVE sm_kano_lpo[];
extern SMOVE sm_kano_lkc[];
extern SMOVE sm_kano_hpo[];
extern SMOVE sm_robo2_uc[];
extern SMOVE sm_robo1_dc[];
extern SMOVE sm_robo1_uc[];
extern SMOVE sm_robo_hkc[];
extern SMOVE sm_robo_bc[];
extern SMOVE sm_robo2_hpc[];
extern SMOVE sm_robo2_dc[];
extern SMOVE sm_robo2_rc[];
extern SMOVE sm_lia_uc[];
extern SMOVE sm_lia_hpc[];
extern SMOVE sm_lia_bc[];
extern SMOVE sm_lia_lpc[];
extern SMOVE sm_sz_rc[];
extern SMOVE sm_sz_uc[];
extern SMOVE sm_sz_lpc[];
extern SMOVE sm_sz_hkc[];
extern SMOVE sm_ind_lpc[];
extern SMOVE sm_ind_bc[];
extern SMOVE sm_ind_dc[];
extern SMOVE sm_ind_hpo[];
extern SMOVE sm_ind_hpc[];
extern SMOVE sm_ind_hkc[];
extern SMOVE sm_sonya_hpc[];
extern SMOVE sm_sonya_dc[];
extern SMOVE sm_sonya_rc[];
extern SMOVE sm_sonya_lpo[];
extern SMOVE sm_sonya_lkc[];
extern SMOVE sm_jax_lpc[];
extern SMOVE sm_jax_lkc[];
extern SMOVE sm_jax_bo[];
extern SMOVE sm_jax_lpo[];
extern SMOVE sm_sw_bc[];
extern SMOVE sm_sw_lkc[];
extern SMOVE sm_swat_hkc[];
extern SMOVE sm_swat_lpc[];
extern SMOVE sm_swat_hpc[];
extern SMOVE sm_sg_bc[];
extern SMOVE sm_sg_hko[];
extern SMOVE sm_sg_lpc[];
extern SMOVE sm_sg_hkc[];
extern SMOVE sm_sg_hpc[];
extern SMOVE sm_sg_uc[];
extern SMOVE sm_lao_lkc[];
extern SMOVE sm_lao_bc[];
extern SMOVE sm_lao_hpc[];
extern SMOVE sm_lao_dc[];
extern SMOVE sm_lao_rc[];
extern SMOVE sm_lk_dc[];
extern SMOVE sm_lk_uc[];
extern SMOVE sm_lk_bc[];
extern SMOVE sm_lk_lkc[];
extern SMOVE sm_lk_hkc[];
extern SMOVE sm_lk_hpc[];
extern SMOVE sm_lk_lko[];
extern SMOVE sm_lk_lpc[];
extern SMOVE sm_st_hpo[];
extern SMOVE sm_st_lpo[];
extern SMOVE sm_st_dc[];
extern SMOVE sm_st_lko[];
extern SMOVE sm_st_rc[];
extern SMOVE sm_st_hkc[];
extern SMOVE sm_st_uc[];
extern SMOVE sm_st_bc[];
extern SMOVE sm_st_lpc[];
extern SMOVE sm_st_hpc[];
extern SMOVE sm_tusk_hpo[];
extern SMOVE sm_st_lkc[];
extern SMOVE sm_tusk_uc[];
extern SMOVE sm_tusk_hkc[];
extern SMOVE sm_tusk_lkc[];
extern SMOVE sm_tusk_bc[];
extern SMOVE sm_tusk_rc[];
extern SMOVE sm_tusk_zap[];
extern SMOVE sm_kano_hkc[];
extern SMOVE sm_kano_lpc[];

/******************************************************************************/


/******************************************************************************
 Function: void reaction_exit(OBJECT *obj)

 By: David Schwartz

 Date: Sept 1994

 Parameters: obj - dude to work with

 Returns: None

 Description:	common reaction_exit (reaction_exit) code from the TMS processor
				cleans up a fighter before continue fighter progress
******************************************************************************/
void reaction_exit(OBJECT *obj)
{
	if (am_i_airborn(obj)==SYSTEM_CARRY_SET)			// if airborn the execute this code
		fall_on_my_back();

	/* rex3 */
	stop_me(obj);
	back_to_normal();
	back_to_shang_check();

	if (current_proc->pdata.p_flags & PM_CORPSE)
		stack_jump(collapse_on_ground);

	/* return to joystick code */
	if (current_proc->pdata.p_flags & PM_JOY)
	{
		stack_jump_joy(joy_proc,JI_JOY_ENTRY);

	}
	else
	{
		stack_jump(drone_entry);
	}
}

/*****************************************************************************/
JUMPTBL ochar_null[]=
{
	NULL,NULL,NULL,NULL,NULL,
	NULL,NULL,NULL,NULL,NULL,
	NULL,NULL,NULL,NULL,NULL
};

JUMPTBL ochar_run_close[]=
{
	NULL,
	sonya_run_close,
	NULL,
	NULL,
	sz_run_close,

	NULL,
	NULL,
	NULL,
	robo2_run_close,
	lao_run_close,

	tusk_run_close,
	NULL,
	st_run_close,
	NULL,
	smoke_run_close,
};

JUMPTBL ochar_hp_close[]=
{
	kano_hp_close,	// NULL,
	sonya_hp_close,	// 1
	jax_hp_close,	// 2
	ind_hp_close,	// 3
	sz_hp_close,	// 4
	sw_hp_close,	// 5
	lia_hp_close,	// 6
	robo_hp_close,
	robo2_hp_close,
	lao_hp_close,
	tusk_hp_close,
	sg_hp_close,
	st_hp_close,
	lk_hp_close,
	NULL
};


JUMPTBL ochar_lp_close[]=
{
	kano_lp_close,
	sonya_lp_close,
	jax_lp_close,
	ind_lp_close,
	sz_lp_close,
	sw_lp_close,
	lia_lp_close,
	robo_lp_close,
	robo2_lp_close,
	lao_lp_close,
	tusk_lp_close,
	sg_lp_close,
	st_lp_close,
	lk_lp_close,
	smoke_lp_close
};


JUMPTBL ochar_block_close[]=
{
	kano_block_close,
	sonya_block_close,
	jax_block_close,
	ind_block_close,
	sz_block_close,
	sw_block_close,
	lia_block_close,
	robo_block_close,
	robo2_block_close,
	lao_block_close,
	tusk_block_close,
	sg_block_close,
	st_block_close,
	lk_block_close,
	smoke_block_close
};


JUMPTBL ochar_hk_close[]=
{
	kano_hk_close,
	sonya_hk_close,
	jax_hk_close,
	ind_hk_close,
	sz_hk_close,
	sw_hk_close ,
	lia_hk_close,
	robo_hk_close,
	robo2_hk_close,
	lao_hk_close,
	tusk_hk_close,
	sg_hk_close,
	st_hk_close,
	lk_hk_close,
	smoke_hk_close
};


JUMPTBL ochar_lk_close[]=
{
	kano_lk_close,
	sonya_lk_close,
	jax_lk_close,
	ind_lk_close,
	sz_lk_close,
	sw_lk_close,
	lia_lk_close,
	robo1_lk_close,
	robo2_lk_close,
	lao_lk_close,
	tusk_lk_close,
	NULL,
	st_lk_close,
	lk_lk_close,
	smoke_lk_close
};


JUMPTBL ochar_up[]=
{
	NULL,
	NULL,
	NULL,
	NULL,
	sz_up,
	NULL,
	lia_up_close,
	robo1_up,
	robo2_up_close,
	lao_up,
	tusk_up,
	sg_up,
	st_up_close,
	lk_up_close,
	smoke_up_close,
};


JUMPTBL ochar_down[]=
{
	NULL,
	sonya_down_close,
	NULL,
	ind_down_close,
	NULL,
	NULL,
	NULL,
	robo1_down_close,
	robo2_down_close,
	lao_down_close,
	NULL,
	NULL,
	st_down_close,
	lk_down_close,
	smoke_down_close
};

JUMPTBL ochar_left[]=
{
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};

JUMPTBL ochar_right[]=
{
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};

/* Close Switch Tables & Routines
   Parameters:
	process.a0 = switch offset (0-8)
	process.a2 = player offset (0-1)
	process.a8 = my object

	process.p_store4 = my proc
	process.p_otherguy = other guy's object
	process.p_otherproc = other guy's process
*/
JUMPTBL *switch_close_jumps[]=
{
	ochar_hp_close,
	ochar_lp_close,
	ochar_block_close,
	ochar_hk_close,
	ochar_lk_close,
	ochar_run_close,
	ochar_up,
	ochar_down,
	ochar_left,
	ochar_right
};

/*****************************************************************************/

/********************************
 * SHEEVA SPECIAL MOVES 		*
 ********************************/
void sg_block_close(void)
{
	secret_move_search(sm_sg_bc);
}

void sg_hk_open(void)
{
	secret_move_search(sm_sg_hko);
}

void sg_lp_close(void)
{
	secret_move_search(sm_sg_lpc);
}

void sg_hk_close(void)
{
	secret_move_search(sm_sg_hkc);
}

void sg_up(void)
{
	secret_move_search(sm_sg_uc);
}

void sg_hp_close(void)
{
	secret_move_search(sm_sg_hpc);
}

/********************************
 * Liu Kang SPECIAL MOVES 		*
 ********************************/
void lk_down_close(void)
{
	secret_move_search(sm_lk_dc);
}

void lk_up_close(void)
{
	secret_move_search(sm_lk_uc);
}

void lk_block_close(void)
{
	secret_move_search(sm_lk_bc);
}

void lk_lk_close(void)
{
	secret_move_search(sm_lk_lkc);
}

void lk_hp_close(void)
{
	secret_move_search(sm_lk_hpc);
}

void lk_lp_close(void)
{
	secret_move_search(sm_lk_lpc);
}

void lk_hk_close(void)
{
	secret_move_search(sm_lk_hkc);
}

void lk_lk_open(void)
{
	secret_move_search(sm_lk_lko);
}

/********************************
 * SHANG TSU SPECIAL MOVES 		*
 ********************************/
void st_hp_open(void)
{
	secret_move_search(sm_st_hpo);
}

void st_lp_open(void)
{
	secret_move_search(sm_st_lpo);
}

void st_lk_open(void)
{
	secret_move_search(sm_st_lko);
}

void st_run_close(void)
{
	secret_move_search(sm_st_rc);
}

void st_hk_close(void)
{
	secret_move_search(sm_st_hkc);
}

void st_lk_close(void)
{
	secret_move_search(sm_st_lkc);
}

void st_up_close(void)
{
	secret_move_search(sm_st_uc);
}

void st_down_close(void)
{
	if (check_st_2_sonya()==SYSTEM_CARRY_SET)
		st_2_sonya();

	secret_move_search(sm_st_dc);
}

void st_block_close(void)
{
	if (check_st_2_sonya()==SYSTEM_CARRY_SET)
		st_2_sonya();

	secret_move_search(sm_st_bc);
}

void st_lp_close(void)
{
	if (check_st_2_sonya()==SYSTEM_CARRY_SET)
		st_2_sonya();

	secret_move_search(sm_st_lpc);
}

void st_hp_close(void)
{
	secret_move_search(sm_st_hpc);
}

void st_2_sonya(void)
{
	restricted_xfer(do_st_2_sonya);
}

/********************************
 * TUSK SPECIAL MOVES 			*
 ********************************/
void tusk_up(void)
{
	secret_move_search(sm_tusk_uc);
}

void tusk_hk_close(void)
{
	secret_move_search(sm_tusk_hkc);
}

void tusk_block_close(void)
{
	secret_move_search(sm_tusk_bc);
}

void tusk_run_close(void)
{
	secret_move_search(sm_tusk_rc);
}

void tusk_lk_close(void)
{
	secret_move_search(sm_tusk_lkc);
}

void tusk_lp_close(void)
{
	process_suicide();
}

void tusk_hp_close(void)
{
	secret_move_search(sm_tusk_zap);
}

void tusk_hp_open(void)
{
	secret_move_search(sm_tusk_hpo);
}

/********************************
 * SMOKE SPECIAL MOVES 			*
 ********************************/
void smoke_lk_close(void)
{
	secret_move_search(sm_smoke_lkc);
}

void smoke_up_close(void)
{
	secret_move_search(sm_smoke_uc);
}

void smoke_down_close(void)
{
	secret_move_search(sm_smoke_dc);
}

void smoke_hk_close(void)
{
	secret_move_search(sm_smoke_hkc);
}

void smoke_run_close(void)
{
	secret_move_search(sm_smoke_rc);
}

void smoke_lp_close(void)
{
	secret_move_search(sm_smoke_lpc);
}

void smoke_block_close(void)
{
	if (distance_from_ground(current_proc->pa8)<SCY(0xa0) ||
	   get_x_dist>SCX(0x58) ||
	   get_y_dist>SCY(0x58) ||
	   (ground_y-(current_proc->pdata.p_otherguy)->oypos.u.intpos)<SCY(0xb8))
		smoke_block_close2();

	if (q_is_he_a_boss()==SYSTEM_CARRY_SET)
		smoke_block_close2();

	if (get_his_action(current_proc)==ACT_REACT_FLIPK)
		smoke_block_close2();

	airborn_xfer(do_air_slam);
}

void smoke_block_close2(void)
{
	secret_move_search(sm_smoke_bc);
}

/********************************
 * KANO SPECIAL MOVES 			*
 ********************************/
void kano_block_close(void)
{
	OBJECT *obj=current_proc->pa8;

	if (q_is_he_a_boss()==SYSTEM_CARRY_SET)
		process_suicide();

	if (distance_from_ground(obj)<SCY(0xa0) || get_x_dist>SCX(0x50) || get_y_dist>SCY(0x50))
		process_suicide();

	if ((ground_y-(current_proc->pdata.p_otherguy)->oypos.u.intpos)<=SCY(0xb8))
		process_suicide();				// other guy high enough off ground

	if (get_his_action(current_proc)==ACT_REACT_FLIPK)
		process_suicide();
	else airborn_xfer(do_air_slam);
}

void kano_lp_close(void)
{
	secret_move_search(sm_kano_lpc);
}

void kano_hk_close(void)
{
	secret_move_search(sm_kano_hkc);
}

void kano_lp_open(void)
{
	secret_move_search(sm_kano_lpo);
}

void kano_hp_close(void)
{
	secret_move_search(sm_kano_hpc);
}

void kano_lk_close(void)
{
	secret_move_search(sm_kano_lkc);
}

void kano_lk_open(void)
{
	check_tsl(0,do_kano_roll,l_lk,0x50);			// special move address, last time kicked was pressed (2 seconds?)
	process_suicide();
}

void kano_hp_open(void)
{
	secret_move_search(sm_kano_hpo);
}

/********************************
 * SONYA SPECIAL MOVES 			*
 ********************************/
void sonya_down_close(void)
{
	secret_move_search(sm_sonya_dc);
}

void sonya_run_close(void)
{
	secret_move_search(sm_sonya_rc);
}

void sonya_lp_open(void)
{
	secret_move_search(sm_sonya_lpo);
}

void sonya_lk_close(void)
{
	secret_move_search(sm_sonya_lkc);
}

void sonya_hk_close(void)
{
	if (stick_look_lr(P1B3,P2B3,scom_bike)==SYSTEM_CARRY_SET && get_his_action(current_proc)!=ACT_SBIKE_KICKED)
		restricted_xfer(do_bike);
	else process_suicide();
}

void sonya_hp_close(void)
{
	secret_move_search(sm_sonya_hpc);
}

void sonya_lp_close(void)
{
	if (stick_look_lr(P1B1,P2B1,scom_sonya_zap)==SYSTEM_CARRY_SET)
		restricted_xfer(do_sonya_zap);
	else
	{
		if (check_sonya_legs()==SYSTEM_CARRY_SET)
			restricted_xfer(do_leg_throw);
		else process_suicide();
	}
}

void sonya_block_close(void)
{
	if (check_sonya_legs()==SYSTEM_CARRY_SET)
		restricted_xfer(do_leg_throw);
	else process_suicide();
}

WORD check_st_2_sonya(void)
{
	if (button_bit_check(current_proc->pa8,P1B1|P1B2|P1B5,P2B1|P2B2|P2B5)==SYSTEM_CARRY_CLR)
		return(SYSTEM_CARRY_CLR);
	else
	{
		if ( q_shang_morph(FT_SONYA)==SYSTEM_CARRY_CLR)
			return(SYSTEM_CARRY_CLR);
		else return(is_stick_down(current_proc));
	}
}

WORD check_sonya_legs(void)
{
	if (button_bit_check(current_proc->pa8,(P1B1|P1B2),(P2B1|P2B2))==SYSTEM_CARRY_CLR)
		return(SYSTEM_CARRY_CLR);

	if (get_his_action(current_proc)==ACT_LEGGED)
		return(SYSTEM_CARRY_CLR);

	if (get_his_action(current_proc)==ACT_SWEEP_SD)
		return(SYSTEM_CARRY_CLR);

	return(is_stick_down(current_proc));
}

/********************************
 * LIA SPECIAL MOVES 			*
 ********************************/
void lia_up_close(void)
{
	secret_move_search(sm_lia_uc);
}

void lia_block_close(void)
{
	secret_move_search(sm_lia_bc);
}

void lia_lp_close(void)
{
	secret_move_search(sm_lia_lpc);
}

void lia_lk_close(void)
{
	if (stick_look_lr(P1B4,P2B4,scom_lia_anglez)==SYSTEM_CARRY_SET && distance_from_ground(current_proc->pa8)>SCY(0xb0))
		check_tsl(1,do_lia_anglez,l_liazap,0x30);

	process_suicide();
}

void lia_hk_close(void)
{
	if (stick_look_lr(P1B3,P2B3,scom_fly)==SYSTEM_CARRY_SET && q_is_he_a_boss()==SYSTEM_CARRY_CLR)
		restricted_xfer(do_lia_fly);
	else process_suicide();
}

void lia_hp_close(void)
{
	secret_move_search(sm_lia_hpc);
}

/********************************
 * Kung-Lao SPECIAL MOVES 		*
 ********************************/
void lao_lk_close(void)
{
	secret_move_search(sm_lao_lkc);
}

void lao_block_close(void)
{
	secret_move_search(sm_lao_bc);
}

void lao_down_close(void)
{
	secret_move_search(sm_lao_dc);
}

void lao_hp_close(void)
{
	secret_move_search(sm_lao_hpc);
}

void lao_run_close(void)
{
	secret_move_search(sm_lao_rc);
}

void lao_up(void)
{
	if (stick_look_lr(P1B0|P1B1|P1B2|P1B3|P1B4,P2B0|P2B1|P2B2|P2B3|P2B4,scom_lao_teleport)==SYSTEM_CARRY_SET)
		restricted_xfer(do_lao_tele);
	else process_suicide();
}

void lao_lp_close(void)
{
	if (stick_look_lr(P1B1,P2B1,scom_lao_zap)==SYSTEM_CARRY_SET && is_my_proj_alive()==SYSTEM_CARRY_CLR)
		restricted_xfer(do_lao_zap);
	else process_suicide();
}

void lao_hk_close(void)
{
	if (stick_look_lr(P1B3,P2B3,scom_lao_angle_kick)==SYSTEM_CARRY_SET && distance_from_ground(current_proc->pa8)>=SCY(0xa0))
		airborn_xfer(do_lao_angle_kick);
	else process_suicide();
}

void all_run_open(void)
{
	secret_move_search(sm_all_ro);
}

/*****************************************************************************/
JUMPTBL ochar_run_open[]=
{
	all_run_open,
	all_run_open,
	all_run_open,
	all_run_open,
	all_run_open,

	all_run_open,
	all_run_open,
	all_run_open,
	all_run_open,
	all_run_open,

	all_run_open,
	all_run_open,
	all_run_open,
	all_run_open,
	all_run_open
};

JUMPTBL ochar_hi_punch_open[]=
{
	kano_hp_open,
	NULL,
	NULL,
	ind_hp_open,
	NULL,

	NULL,
	NULL,
	NULL,
	NULL,
	NULL,

	tusk_hp_open,
	NULL,
	st_hp_open,
	NULL,
	NULL
};

JUMPTBL ochar_lo_punch_open[]=
{
	kano_lp_open,
	sonya_lp_open,
	jax_lp_open,
	NULL,
	NULL,

	NULL,
	NULL,
	NULL,
	NULL,
	NULL,

	NULL,
	NULL,
	st_lp_open,
	NULL,
	NULL
};

JUMPTBL ochar_block_open[]=
{
	NULL,
	NULL,
	jax_block_open,
	NULL,
	NULL,

	NULL,
	NULL,
	NULL,
	NULL,
	NULL,

	NULL,
	NULL,
	NULL,
	NULL,
	NULL
};

JUMPTBL ochar_lo_kick_open[]=
{
	kano_lk_open,
	NULL,
	jax_lk_open,
	NULL,
	NULL,

	NULL,
	NULL,
	NULL,
	NULL,
	NULL,

	NULL,
	NULL,
	st_lk_open,
	lk_lk_open,
	NULL
};

JUMPTBL ochar_hi_kick_open[]=
{
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,

	NULL,
	NULL,
	NULL,
	NULL,
	NULL,

	NULL,
	sg_hk_open,
	NULL,
	NULL,
	NULL
};

/* Open Switch Tables & Routines
   Parameters:
	process.a0 = switch offset
	process.a2 = player offset
	process.a8 = my object

	process.p_store4 = my proc
	process.p_otherguy = other guy's object
	process.p_otherproc = other guy's process
*/
JUMPTBL *switch_open_jumps[]=
{
	ochar_hi_punch_open,	// 0
	ochar_lo_punch_open,	// 1
	ochar_block_open,		// 2
	ochar_hi_kick_open,		// 3
	ochar_lo_kick_open,		// 4
	ochar_run_open,			// 5
	ochar_null,				// 6
	ochar_null,				// 7
	ochar_null,				// 8
	ochar_null				// 9
};

/*****************************************************************************/

/********************************
 * JAX SPECIAL MOVES 			*
 ********************************/
void jax_lk_close(void)
{
	secret_move_search(sm_jax_lkc);
}

void jax_block_close(void)
{
	if (distance_from_ground(current_proc->pa8)<SCY(0xa0) ||
	   get_x_dist>SCX(0x58) ||
	   get_y_dist>SCY(0x58) ||
	   (ground_y-((current_proc->pdata.p_otherguy)->oypos.u.intpos))<SCY(0xb8))
		jax_block_close2();

	if (q_is_he_a_boss()==SYSTEM_CARRY_SET)
		jax_block_close2();

	if (get_his_action(current_proc)==ACT_REACT_FLIPK)
		jax_block_close2();

	airborn_xfer(do_back_breaker);
}

void jax_block_close2(void)
{
	process_suicide();
}

void jax_block_open(void)
{
	secret_move_search(sm_jax_bo);
}

void jax_lp_open(void)
{
	secret_move_search(sm_jax_lpo);
}

void jax_hp_close(void)
{
	if (stick_look_lr((P1B0|P1B1|P1B4),(P2B0|P2B1|P2B4),scom_jax_zap2)==SYSTEM_CARRY_SET)
	{
		if (get_tsl(l_jaxzap2,current_proc->pa8)>0x40*2)
			restricted_xfer(do_jax_zap2);
	}

	if (stick_look_lr((P1B0|P1B4),(P2B0|P2B4),scom_jax_zap1)==SYSTEM_CARRY_SET)
		restricted_xfer(do_jax_zap1);
	else process_suicide();
}

void jax_lp_close(void)
{
	secret_move_search(sm_jax_lpc);
}

void jax_hk_close(void)
{
	if (stick_look_lr((P1B3|P1B4),(P2B3|P2B4),scom_dash)==SYSTEM_CARRY_SET)
		restricted_xfer(jax_dash_punch);
	  else process_suicide();
}

void jax_lk_open(void)
{
	check_tsl(0,do_quake,l_lk,0x50);			// special move address, last time kicked was pressed (2 seconds?)
	process_suicide();
}

/********************************
 * INDIAN SPECIAL MOVES 		*
 ********************************/
void ind_block_close(void)
{
	secret_move_search(sm_ind_bc);
}

void ind_down_close(void)
{
	secret_move_search(sm_ind_dc);
}

void ind_hp_close(void)
{
	secret_move_search(sm_ind_hpc);
}

void ind_hp_open(void)
{
	secret_move_search(sm_ind_hpo);
}

void ind_lp_close(void)
{
	secret_move_search(sm_ind_lpc);
}

void ind_lk_close(void)
{
	if (stick_look_lr(P1B4,P2B4,scom_ind_charge)==SYSTEM_CARRY_SET)
		restricted_xfer(do_ind_charge);
	else process_suicide();
}

void ind_hk_close(void)
{
	secret_move_search(sm_ind_hkc);
}

/********************************
 * Sub-Zero SPECIAL MOVES 		*
 ********************************/
void sz_run_close(void)
{
	secret_move_search(sm_sz_rc);
}

void sz_up(void)
{
	secret_move_search(sm_sz_uc);
}

void sz_hk_close(void)
{
	secret_move_search(sm_sz_hkc);
}

void sz_hp_close(void)
{
	if (stick_look_lr(P1B0,P2B0,scom_sky_zap_on)==SYSTEM_CARRY_SET)
		sky_ice_xfer(do_sky_ice_on);
	else
	{
		/* szhpc3 */
		if (stick_look_lr(P1B0,P2B0,scom_sky_zap_behind)==SYSTEM_CARRY_SET)
			sky_ice_xfer(do_sky_ice_behind);
		else
		{
			/* szhpc4 */
			if (stick_look_lr(P1B0,P2B0,scom_sky_zap_front)==SYSTEM_CARRY_SET)
				sky_ice_xfer(do_sky_ice_front);
			else process_suicide();
		}
	}
}

/******************************************************************************
 Function: void sky_ice_xfer(FUNC pa7)

 By: David Schwartz

 Date: Feb 1995

 Parameters: pa7 - routine to xfer to if sky ice allowed

 Returns: None

 Description:	subzero skyice xfer routine
******************************************************************************/
void sky_ice_xfer(FUNC pa7)
{
	PROCESS *ptemp;
	if ((ptemp=process_exist(p1p2_pick(current_proc->pa8,PID_DECOY1,PID_DECOY2),-1))==NULL)
		restricted_xfer(pa7);

	if (ptemp->pdata.p_store1==(current_proc->pa8)->oid)
		process_suicide();
	else restricted_xfer(pa7);
}

void sz_lk_close(void)
{
	slide_check();
	process_suicide();
}

void sz_block_close(void)
{
	slide_check();
	process_suicide();
}

void sz_lp_close(void)
{
	slide_check();
	secret_move_search(sm_sz_lpc);
}

/******************************************************************************
 Function: void slide_check(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: None

 Returns: None

 Description:	subzero slide check
******************************************************************************/
void slide_check(void)
{
	if (is_stick_away(current_proc)==SYSTEM_CARRY_CLR)
		return;

	if (button_bit_check(current_proc->pa8,(P1B1|P1B2|P1B4),(P2B1|P2B2|P2B4))==SYSTEM_CARRY_CLR)
		return;

	restricted_xfer(do_slide);
}

/********************************
 * SWAT SPECIAL MOVES 			*
 ********************************/
void sw_block_close(void)
{
	secret_move_search(sm_sw_bc);
}

void sw_lk_close(void)
{
	secret_move_search(sm_sw_lkc);
}

void sw_hk_close(void)
{
	secret_move_search(sm_swat_hkc);
}

void sw_lp_close(void)
{
	secret_move_search(sm_swat_lpc);
}

void sw_hp_close(void)
{
	secret_move_search(sm_swat_hpc);
}

/********************************
 * ROBOT SPECIAL MOVES 			*
 ********************************/
void robo2_up_close(void)
{
	secret_move_search(sm_robo2_uc);
}

void robo2_down_close(void)
{
	secret_move_search(sm_robo2_dc);
}

void robo_hk_close(void)
{
	secret_move_search(sm_robo_hkc);
}

void robo_block_close(void)
{
	secret_move_search(sm_robo_bc);
}

void robo2_run_close(void)
{
	secret_move_search(sm_robo2_rc);
}

void robo2_hp_close(void)
{
	secret_move_search(sm_robo2_hpc);
}

void robo2_lp_close(void)
{
	PROCESS *ptemp;

	ptemp=(PROCESS *)(current_proc->pdata.p_store4);

	if (ptemp->p_comp_flag!=PC_ROBO_AIR)		// air grabbin, mod from orig code
		process_suicide();	// use a6 as a flag to indiacte if at air_grab_sleep

	if (get_y_dist>SCY(0x30) || get_x_dist>SCX(0x50))
		process_suicide();				// make sure we are close enough
	else free_xfer(do_air_slam);
}

void robo2_block_close(void)
{
	OBJECT *otemp;

	if (stick_look_lr(P1B2,P2B2,scom_robo2_tele)==SYSTEM_CARRY_SET)
		airborn_xfer(do_tele_explode);
	else
	{
		if (stick_look_lr(P1B2,P2B2,scom_robo_air_grab)==SYSTEM_CARRY_CLR || q_is_he_a_boss()==SYSTEM_CARRY_SET || is_he_airborn()==SYSTEM_CARRY_CLR)
			process_suicide();

		if ((otemp=current_proc->pdata.p_otherguy)->oyvel.pos>0) 		// heading downward check dist
		{
			if (abs((current_proc->pdata.p_otherproc)->pdata.p_ganiy-otemp->oypos.u.intpos)<SCY(0x30))
				process_suicide();
		}

		restricted_xfer(do_robo_air_grab);
	}

}

void robo2_hk_close(void)
{
	if (button_bit_check(current_proc->pa8,(P1B3|P1B4),(P2B3|P2B4))==SYSTEM_CARRY_CLR)	// require #1: hk & lk closed
		process_suicide();

	if (get_his_p_hit(current_proc)>=2)
		process_suicide();				// dont over do it !

	if (get_his_action(current_proc)==ACT_CAUGHT_NET)
		process_suicide();

	if (stick_look_lr(P1B3|P1B4,P2B3|P2B4,scom_bomb_full)==SYSTEM_CARRY_SET)
		check_tsl(0,do_bomb_full,l_lk,0x10);			// special move address, last time low kicked was pressed

	if (stick_look_lr(P1B3|P1B4,P2B3|P2B4,scom_bomb_mid)==SYSTEM_CARRY_SET)
		check_tsl(0,do_bomb_mid,l_lk,0x10);			// special move address, last time low kicked was pressed

	process_suicide();
}

void robo_lp_close(void)
{
	if (stick_look_lr(P1B1,P2B1,scom_robo_zap1)==SYSTEM_CARRY_SET)
	{
		if (process_exist(p1p2_pick(current_proc->pa8,PID_P1ROCKET2,PID_P2ROCKET2),-1)!=NULL)
			process_suicide();
		else restricted_xfer(do_robo_zap);
	}
	else
	{
		process_suicide();

		fatality_xfer_range(SCX(0x70),SCX(0xa0),do_fatality_1);
	}
}

void robo_hp_close(void)
{
	if (stick_look_lr(P1B0,P2B0,scom_robo_zap2)==SYSTEM_CARRY_SET)
		restricted_xfer(do_robo_zap2);
	else process_suicide();
}

void robo1_down_close(void)
{
	secret_move_search(sm_robo1_dc);
}

void robo1_up(void)
{
	secret_move_search(sm_robo1_uc);
}

void robo1_lk_close(void)
{
	if (stick_look_lr(P1B4,P2B4,scom_robo_tele)==SYSTEM_CARRY_SET && get_his_action(current_proc)!=ACT_ROBO_TELED && (current_proc->pdata.p_otherproc)->pdata.p_hit<2)
		airborn_xfer(do_robo_tele);
	else process_suicide();
}

void robo2_lk_close(void)
{
	if (stick_look_lr(P1B4,P2B4,scom_robo_net)==SYSTEM_CARRY_SET && get_his_action(current_proc)!=ACT_CAUGHT_NET && (current_proc->pdata.p_otherproc)->pdata.p_hit<3) 	// no "double netting" allowed
		check_tsl(0,do_robo_net,l_net,0x40);

	/* bug fix from arcade since there look at buttons opposite then we do */
	if (button_bit_check(current_proc->pa8,(P1B3|P1B4),(P2B3|P2B4))==SYSTEM_CARRY_CLR)	// require #1: hk & lk closed
		process_suicide();

	if (stick_look_lr(P1B3|P1B4,P2B3|P2B4,scom_bomb_full)==SYSTEM_CARRY_SET)
		check_tsl(0,do_bomb_full,l_lk,0x10);			// special move address, last time low kicked was pressed

	if (stick_look_lr(P1B3|P1B4,P2B3|P2B4,scom_bomb_mid)==SYSTEM_CARRY_SET)
		check_tsl(0,do_bomb_mid,l_lk,0x10);			// special move address, last time low kicked was pressed

	process_suicide();
}

/******************************************************************************
 Function: void check_tsl(WORD xfer_flag,FUNC routine,WORD *movetime,WORD timer)

 By: David Schwartz

 Date: Nov 1994

 Parameters: xfer_flag - type of xfer to perform (a6)
 			 routine - routine to execute if time since last is ok (a7)
			 movetime - ptr to move timer to check (a0)
			 timer - time from last move (a3)

 Returns: performs routine if conditions hold

 Description:	check time since last move to determine if routine should be executed
******************************************************************************/
void check_tsl(WORD xfer_flag,FUNC routine,WORD *movetime,WORD timer)
{
	if (get_tsl(movetime,current_proc->pa8)<=timer)
		return;
	else
	{
		/* check_yes */
		if (xfer_flag>X_LASTONE)
			xfer_flag=0;

		switch (xfer_flag)
		{
			case X_GROUND:
				restricted_xfer(routine);
				break;
			case X_AIRBORN:
				airborn_xfer(routine);
				break;
			case X_FATAL:
				fatality_xfer(routine);
				break;
			case X_MERCY:
				mercy_xfer(routine);
				break;
			case X_ANIMAL:
				animality_xfer(routine);
				break;
			case X_CLOSE_ANIMAL:
				close_animality_xfer(routine);
				break;
			case X_FRIEND:
				friendship_xfer(routine);
				break;
			case X_BABY:
				babality_xfer(routine);
				break;
		}
	}
}

/******************************************************************************
 Function: WORD button_bit_check(OBJECT *obj,WORD p1_legal,WORD p2_legal)

 By: David Schwartz

 Date: Nov 1994

 Parameters: obj = dudes object
 			 p1_legal = player 1 legal requirements
			 p2_legal = player 2 legal requirements

 Returns: SYSTEM_ZERO_SET - illegal button pushed
		  SYSTEM_ZERO_CLR - no illegal buttons pushed

 Description:	routine to see if an illegal buttons was pushed
******************************************************************************/
WORD button_bit_check(OBJECT *obj,WORD p1_legal,WORD p2_legal)
{

	if (obj==p2_obj)
		p1_legal=p2_legal;

	if (p1_legal==buttons_in_a2(obj))
		return(SYSTEM_CARRY_SET);
	else return(SYSTEM_CARRY_CLR);

}

/******************************************************************************
 Function: WORD illegal_button_check(OBJECT *obj,WORD p1_legal,WORD p2_legal)

 By: David Schwartz

 Date: Nov 1994

 Parameters: obj = dudes object
 			 p1_legal = player 1 legal buttons
			 p2_legal = player 2 legal buttons

 Returns: SYSTEM_ZERO_SET - illegal button pushed
		  SYSTEM_ZERO_CLR - no illegal buttons pushed

 Description:	routine to see if an illegal buttons was pushed
******************************************************************************/
WORD illegal_button_check(OBJECT *obj,WORD p1_legal,WORD p2_legal)
{

	if (obj==p2_obj)
		p1_legal=p2_legal;

	if ((~p1_legal) & buttons_in_a2(obj))
		return(SYSTEM_ZERO_SET);
	else return(SYSTEM_ZERO_CLR);

}

/******************************************************************************
 Function:  WORD buttons_in_a2(OBJECT *obj)

 By: David Schwartz

 Date: Nov 1994

 Parameters: obj - dudes to check

 Returns: current buttons being pushed

 Description:	get correct buttons being pushed
******************************************************************************/
 WORD buttons_in_a2(OBJECT *obj)
{
	if (obj==p1_obj)
		return(swcurr.u.p1pad & P1_BUTTON_MASK);
	else return(swcurr.u.p2pad & P2_BUTTON_MASK);
}

/******************************************************************************/

/********************************
 * STATIONARY MOVES 			*
 ********************************/
void do_baby(void)
{
	do_stationary(STAT_BABY);
}

void do_roundhouse(void)
{
	do_stationary(STAT_ROUNDH);
}

void do_uppercut(void)
{
	do_stationary(STAT_UPPER);
}

void do_duck_kickl(void)
{
	do_stationary(STAT_DKICKL);
}

void do_duck_kickh(void)
{
	do_stationary(STAT_DKICKH);
}

void do_duck_punch(void)
{
	do_stationary(STAT_DUCKP);
}

void do_sweep_kick(void)
{
	do_stationary(STAT_SWEEPK);
}

void do_lo_kick(void)
{
	do_stationary(STAT_LKICK);
}

void do_hi_kick(void)
{
	do_stationary(STAT_HKICK);
}

void do_kano_swipe(void)
{
	do_stationary(STAT_KSWIPE);
}

void do_leg_throw(void)
{
	do_stationary(STAT_LEG_THROW);
}

void do_inviso(void)
{
	do_stationary(STAT_INVISO);
}

void do_quake(void)
{
	do_stationary(STAT_QUAKE);
}

void do_noogy(void)
{
	do_stationary(STAT_NOOGY);
}

void do_shake(void)
{
	do_stationary(STAT_SHAKE);
}

void do_reflect(void)
{
	do_stationary(STAT_REFLECT);
}

void do_fast_axe_up(void)
{
	do_stationary(STAT_F_AXE);
}

void do_axe_up(void)
{
	do_stationary(STAT_AXE);
}

void do_lia_scream(void)
{
	do_stationary(STAT_SCREAM);
}

void do_lao_spin(void)
{
	do_stationary(STAT_SPIN);
}

/********************************
 * Body Propell Moves
 ********************************/
void do_kano_roll(void)
{
	do_body_propell(PROP_KANO_CANNON);
}

void do_bike(void)
{
	do_body_propell(PROP_SONYA_BIKE);
}

void do_ind_charge(void)
{
	do_body_propell(PROP_IND_CHARGE);
}

void jax_dash_punch(void)
{
	do_body_propell(PROP_JAX_DASH);
}

void do_sz_decoy(void)
{
	do_body_propell(PROP_SZ_DECOY);
}

void do_lia_fly(void)
{
	do_body_propell(PROP_LIA_FLY);
}

void do_lao_tele(void)
{
	do_body_propell(PROP_LAO_TELE);
}

void do_lao_angle_kick(void)
{
	do_body_propell(PROP_LAO_ANGLE_KICK);
}

void do_robo_tele(void)
{
	do_body_propell(PROP_ROBO_TELE);
}

void do_robo_air_grab(void)
{
	do_body_propell(PROP_ROBO_AIR_GRAB);
}

void do_tele_explode(void)
{
	do_body_propell(PROP_TELE_EXP);
}

void do_square_wave(void)
{
	do_body_propell(PROP_SONYA_SWAVE);
}

void lk_bike_kick(void)
{
	do_body_propell(PROP_LK_BIKE);
}

void do_super_kang(void)
{
	do_body_propell(PROP_LK_SUPER);
}

void do_sg_pounce(void)
{
	do_body_propell(PROP_SG_POUNCE);
}

void do_slide(void)
{
	do_body_propell(PROP_SZ_SLIDE);
}

void do_swat_zoom(void)
{
	do_body_propell(PROP_SW_ZOOM);
}

void do_stick_sweep(void)
{
	do_body_propell(PROP_SW_STICK);
}

void do_tusk_blur(void)
{
	do_body_propell(PROP_TUSK_BLUR);
}

void do_sg_quake(void)
{
	do_body_propell(PROP_SG_QUAKE);
}

/******************************************************************************/
/******************************************************************************/

/********************************
 * Projectile Zaps
 ********************************/

void do_kano_zap(void)
{
	do_zap(ZAP_KANO_ZAP);
}

void do_sonya_zap(void)
{
	do_zap(ZAP_SONYA_ZAP);
}

void do_jax_zap1(void)
{
	do_zap(ZAP_JAX_ZAP1);
}

void do_jax_zap2(void)
{
	do_zap(ZAP_JAX_ZAP2);
}

void do_ind_zap(void)
{
	do_zap(ZAP_IND_ZAP);
}

void do_sky_ice_on(void)
{
	do_zap(ZAP_SZ_ION);
}

void do_sky_ice_behind(void)
{
	do_zap(ZAP_SZ_IBEHIND);
}

void do_sky_ice_front(void)
{
	do_zap(ZAP_SZ_IFRONT);
}

void do_sw_zap(void)
{
	do_zap(ZAP_SW_ZAP);
}

void do_robo_zap(void)
{
	do_zap(ZAP_ROBO_ZAP);
}

void do_robo_zap2(void)
{
	do_zap(ZAP_ROBO_ZAP2);
}

void do_robo_net(void)
{
	do_zap(ZAP_ROBO_NET);
}

void do_sz_forward_zap(void)
{
	do_zap(ZAP_SZ_ZAP);
}

void do_lia_anglez(void)
{
	do_zap(ZAP_LIA_ANGLEZ);
}

void do_lao_zap(void)
{
	do_zap(ZAP_LAO_ZAP);
}

void do_bomb_full(void)
{
	do_zap(ZAP_ROBO_BOMBF);
}

void do_bomb_mid(void)
{
	do_zap(ZAP_ROBO_BOMBM);
}

void do_tusk_zap(void)
{
	do_zap(ZAP_TUSK_ZAP);
}

void do_summon(void)
{
	do_zap(ZAP_ST_SUMMON);
}

void do_st_zap1(void)
{
	do_zap(ZAP_ST_ZAP1);
}

void do_st_zap2(void)
{
	do_zap(ZAP_ST_ZAP2);
}

void do_st_zap3(void)
{
	do_zap(ZAP_ST_ZAP3);
}

void lk_zap_hi(void)
{
	do_zap(ZAP_LK_HI);
}

void lk_zap_lo(void)
{
	do_zap(ZAP_LK_LO);
}

void do_sg_zap(void)
{
	do_zap(ZAP_SG_ZAP);
}

void do_swat_bomb_hi(void)
{
	do_zap(ZAP_SWAT_BOMBH);
}

void do_swat_bomb_lo(void)
{
	do_zap(ZAP_SWAT_BOMBL);
}

void do_lia_forward(void)
{
	do_zap(ZAP_LIA_FZAP);
}

void do_floor_blade(void)
{
	do_zap(ZAP_TUSK_FLOOR);
}

void do_smoke_spear(void)
{
	do_zap(ZAP_SMOKE_SPEAR);
}

/******************************************************************************
		STANDARD MOVES
******************************************************************************/
/******************************************************************************
 Function: void do_unblock_hi(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: None

 Returns: None

 Description:	exit from standing block (hi block)
******************************************************************************/
void do_unblock_hi(void)
{
	ADDRESS *temp;

	current_proc->pdata.p_action=0;

	find_ani_last_frame(ANIM_STANDBLOCK);

	((ADDRESS *)current_proc->pa9)--;			// a9 --> block frame 2
	temp=(ADDRESS *)current_proc->pa9-1;		// temo --> block frame 1

	do_next_a9_frame(current_proc->pa8);
	process_sleep(4);
	(ADDRESS *)current_proc->pa9=temp;
	do_next_a9_frame(current_proc->pa8);
	process_sleep(4);

	return;
}

/******************************************************************************
 Function: void do_block_hi(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: None

 Returns: None

 Description:	perform standing block (hi block)
******************************************************************************/
void do_block_hi(void)
{
	stop_me(current_proc->pa8);

	get_char_ani(ANIM_TABLE1,ANIM_STANDBLOCK);

	/* act_mframew */
	act_mframew(ACT_BLOCKHI,3);					// block stance
}

/******************************************************************************
 Function: void turn_around(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: None

 Returns: None

 Description:	turn fighter around
******************************************************************************/
void turn_around(void)
{
	stop_me(current_proc->pa8);
	disable_all_buttons;

	get_char_ani(ANIM_TABLE1,ANIM_TURN);

	mframew(2);
#if 0
	mframew(ta_speeds[current_proc->pa8->ochar][0]);

	if (ta_speeds[current_proc->pa8->ochar][1]!=0)
		process_sleep(ta_speeds[current_proc->pa8->ochar][0]);
#endif
}

#if 0
/* "turn around" speeds */
WORD ta_speeds[][2] = {
	{2,0},				// 0
	{2,0},				// 1
	{2,0},				// 2
	{2,0},				// 3
	{2,0},				// 4
	{2,0},				// 5
	{2,0},				// 6
	{2,0},				// 7
	{2,0},				// 8
	{2,0},				// 9
	{2,0},				// 10
	{2,0},				// 11
	{2,0},				// 12
	{2,0},				// 13
	{2,0},				// 14
	{2,0},				// 15 - motaro
	{2,0},				// 16 - sk
	{2,0},				// 17 - noob
	{2,0}				// 18 -
};
#endif

/******************************************************************************
 Function: void duck_turnaround(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: None

 Returns: None

 Description:	turn fighter around animation
******************************************************************************/
void duck_turnaround(void)
{
	get_char_ani(ANIM_TABLE1,ANIM_DUCKTURN);

	mframew(2);

	return;
}

/******************************************************************************
 Function: void do_jumpup_kick_punch(WORD jtype)

 By: David Schwartz

 Date: Nov 1994

 Parameters: 	jtype - punch routine (JUP_PUNCH) || kick routine (JUP_KICK)

 Returns: None

 Description:	jump up punch or kick routine
******************************************************************************/
void combo_air_pause(WORD pa0);

void do_jumpup_kick_punch(WORD jtype)
{
	OBJECT *obj=current_proc->pa8;
	WORD results;
	POS grav;
	POS yvel;

	switch (jtype)
	{
		case JUP_PUNCH:
			current_proc->pdata.p_action=ACT_JUPPUNCH;
			face_opponent(obj);
			group_sound(0);
			rsnd_whoosh();

			current_proc->pdata.p_stk=0x09;									// strike table offset

			current_proc->a4=POW_FLIPKP;
			results=air_strike(0x09,15,3,UP_GRAV,ANIM_FLIPPUNCH);
			break;
		case JUP_KICK:
			current_proc->pdata.p_action=ACT_JUPKICK;
			face_opponent(obj);
			group_sound(0);
			rsnd_whoosh();

			current_proc->pdata.p_stk=0x0a;									// strike table offset

			current_proc->a4=POW_FLIPKP;
			results=air_strike(0x0a,16,3,UP_GRAV,ANIM_JUMPUPKICK);
			break;
	}

	if (results==SYSTEM_CARRY_SET)
	{
		combo_air_pause(8);

		/* hit routine */
		current_proc->pdata.p_action=ACT_HITFALL_SD;		// action: falling to ground !

		/* stop in midair */
//		grav.pos=obj->ograv.pos;
//		yvel.pos=obj->oyvel.pos;
//		obj->oyvel.pos=0;
//		obj->ograv.pos=0;
//		process_sleep(8);
//		obj->ograv.pos=grav.pos;
//		obj->oyvel.pos=yvel.pos;

		((ADDRESS *)current_proc->pa9)++;					// pa9 --> jump kick finish animation

		current_proc->pdata.p_store4=NULL;						// no more routine callin'
		obj->ograv.pos=SCY(0xe000);
		flight_loop(obj);
	}

	jump_up_land_jsrp();

	reaction_exit(obj);
}

/******************************************************************************
 Function: void do_flip_kick(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: 	None

 Returns: None

 Description:	flip in air kick
******************************************************************************/
void do_flip_kick(void)
{
	OBJECT *obj=current_proc->pa8;

	face_opponent(obj);
	rsnd_whoosh();
	group_sound(0);

	current_proc->pdata.p_stk=0x0b;

	current_proc->pdata.p_action=ACT_FLYKICK;

	current_proc->a4=POW_FLIPKP;
	if (air_strike(0x0b,15,3,ANGLE_GRAV,ANIM_FLIPKICK)==SYSTEM_CARRY_SET)
	{
		/* wham !*/
		me_in_front();

		current_proc->pdata.p_action=ACT_FK_SD;			// flag: i'm vulnerable

		mid_air_pause(obj,8);								// pause ticks

		current_proc->pdata.p_store4=NULL;				// avoid double drone kicks
		obj->ograv.pos=SCY(0xc000);
		flight_loop(obj);
	}

	/* jfk8 */
	//current_proc->pdata.p_action=ACT_FK_SD;

	angle_jump_land_jsrp();

	return;
}

/******************************************************************************
 Function: void do_flip_punch(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: 	None

 Returns: None

 Description:	flip in air punch
******************************************************************************/
void air_combo_setup(void);
void update_block_fk(void);

void do_flip_punch(void)
{
	OBJECT* obj = current_proc->pa8;

	face_opponent(obj);
	rsnd_whoosh();
	group_sound(0);

	current_proc->pdata.p_stk = 0x0c;

	current_proc->pdata.p_action = ACT_FLYPUNCH;

	current_proc->a4 = POW_FLIPKP;
	if (air_strike(0x0c, 16, 3, ANGLE_GRAV, ANIM_FLIPPUNCH) == SYSTEM_CARRY_SET)
	{
		combo_air_pause(8);								// pause ticks

		current_proc->pdata.p_action = ACT_FK_SD;			// flag: i'm vulnerable
		current_proc->pdata.p_store4 = NULL;				// avoid double drone punches
		obj->ograv.pos = SCY(0xc000);
		flight_loop(obj);
	}

	current_proc->pdata.p_action = ACT_FK_SD;

	/* jfp8 */
	angle_jump_land_jsrp();

	return;
}



void cap_elbow(void)
{
	air_combo_setup();
	do_elbow();
	reaction_exit(current_proc->pa8);
}

void cap_knee(void)
{
	air_combo_setup();
	do_knee();
	reaction_exit(current_proc->pa8);
}

void cap_airborn(void)
{
	short ta10;

	ta10 = current_proc->a10;
	ta10 -= 4;
	if (ta10 < 0)
		ta10 = 1;
	(long)current_proc->a10 = (long)ta10;
	process_sleep(ta10);
	return;
}

void combo_air_pause(WORD pa0)
{
	OBJECT* obj = current_proc->pa8;
	short ta0;
	WORD* ta10, * ta11;

	current_proc->pdata.p_store1 = f_block;
	stop_me(obj);
	clear_combo_butn();
	current_proc->a10 = current_proc->pdata.p_anicount = pa0;
	process_sleep(4);

	if (is_he_airborn() == SYSTEM_CARRY_SET)
	{
		cap_airborn();
		return;
	}

	if (am_i_joy() == SYSTEM_CARRY_CLR)
	{
		cap_elbow();			// drone ==combo
	}		

	if (obj == p1_obj)
	{
		ta11 = &c_hp[0];
		ta10 = &c_hk[0];
	}
	else
	{
		ta11 = &c_hp[1];
		ta10 = &c_hk[1];
	}

	/*
	 * a10 = kick button location
	 * a11 = punch button location
	 */
	ta0 = (short)current_proc->pdata.p_anicount - 4;
	if (ta0 < 0)
		ta0 = 1;
	do
	{
		process_sleep(1);
		if (*ta11 != 0)
			cap_elbow();

		if (*ta10 != 0)
			cap_knee();
	} while (--ta0 > 0);
	return;
}


void air_combo_setup(void)
{
	if (current_proc->pdata.p_store1 == 0)
	{
		/* calla_for_him */
		set_no_block(current_proc->pdata.p_otherguy);
	}

	ground_player(current_proc->pa8);
	match_me_with_him();
	flip_multi(current_proc->pa8);
	multi_adjust_xy(current_proc->pa8, -SCX(0x40), 0);

	return;
}

/******************************************************************************
 Function: WORD air_strike(WORD strkoff,WORD framecnt,WORD anispeed,long gravity,WORD anioff)

 By: David Schwartz

 Date: Nov 1994

 Parameters: strkoff - strike table offset (a0)
			 framecnt - # of frames to look for collision (a1)
 			 anispeed - animation speed rate (a2)
			 gravity - gravity (a3)
			 anioff - animation offset (a9)
			 current_proc->a4 = pwoer level which I cannot handle

 Returns: SYSTEM_CARRY_SET - hit
		  SYSTEM_CARRY_CLR - miss

 Description:	routine for making a strike animation while in the air
******************************************************************************/
WORD air_strike(WORD strkoff, WORD framecnt, WORD anispeed, long gravity, WORD anioff)
{
	OBJECT* obj = current_proc->pa8;

	obj->ograv.pos = gravity;								// set yer gravity
	current_proc->pdata.p_store2 = current_proc->a4;

	init_anirate(anispeed);

	get_char_ani(ANIM_TABLE1, anioff);					// animation setup

AS2:
	process_sleep(1);
	next_anirate();

	if (GET_LONG(current_proc->pa9) == 0)
	{
		if (current_proc->pdata.p_store2 > (current_proc->pdata.p_otherproc)->pdata.p_power) 	// i have enough power to take them on
		{
			if (strike_check_a0(obj, strkoff) == SYSTEM_CARRY_SET)
				return(SYSTEM_CARRY_SET);
		}
	}

AS5:
	if ((--framecnt) == 0)									// no hit, count this pass
	{
	AS7:
		((ADDRESS*)current_proc->pa9)++;						// 2nd part of animation
		current_proc->pdata.p_action = ACT_POST_AIRSTK;
		current_proc->pdata.p_store4 = NULL;					// dornes -> dont try to kick again
		flight_loop(obj);
		return(SYSTEM_CARRY_CLR);
	}

AS3:
	if (obj->oyvel.pos < 0)								// head upwards = loop
		goto AS2;

	if (obj->oypos.u.intpos < current_proc->pdata.p_ganiy)
		goto AS2;										// am I on the ground

	stop_me(obj);
	ground_player(obj);									// landed attack failed
	return(SYSTEM_CARRY_CLR);
}

WORD air_strike_OLD(WORD strkoff,WORD framecnt,WORD anispeed,long gravity,WORD anioff)
{
	OBJECT *obj=current_proc->pa8;

	obj->ograv.pos=gravity;								// set yer gravity
	current_proc->pdata.p_store2=current_proc->a4;

	init_anirate(anispeed);

	get_char_ani(ANIM_TABLE1,anioff);					// animation setup

AS2:
	process_sleep(1);
	next_anirate();

	if (GET_LONG(current_proc->pa9)==0)
	{
		if (current_proc->pdata.p_store2>(current_proc->pdata.p_otherproc)->pdata.p_power) 	// i have enough power to take them on
		{
	 		if (strike_check_a0(obj,strkoff)==SYSTEM_CARRY_SET)
	 			return(SYSTEM_CARRY_SET);
		}
	}

AS5:
		if ((--framecnt)==0)									// no hit, count this pass
		{
AS7:
			GET_LONG(current_proc->pa9)++;						// 2nd part of animation
			current_proc->pdata.p_store4=NULL;					// dornes -> dont try to kick again
			flight_loop(obj);
			return(SYSTEM_CARRY_CLR);
		}

AS3:
		if (obj->oyvel.pos<0)								// head upwards = loop
			goto AS2;

		if (obj->oypos.u.intpos<current_proc->pdata.p_ganiy)
			goto AS2;										// am I on the ground

		stop_me(obj);
		ground_player(obj);									// landed attack failed
		return(SYSTEM_CARRY_CLR);
}

/******************************************************************************/
/******************************************************************************
 Function: void mid_air_pause(OBJECT *obj,WORD sleep)

 By: David Schwartz

 Date: Nov 1994

 Parameters: obj - dude to pause
 			 sleep - time to sleep

 Returns: None

 Description:	pause a dude in the air for "sleep" ticks
******************************************************************************/
 void mid_air_pause(OBJECT *obj,WORD sleep)
{
	stop_me(obj);
	process_sleep(sleep);
	return;
}

/******************************************************************************
 Function: void flight_call(OBJECT *obj,long initx,long inity,long gravity,short anispeed,long anioffset)

 By: David Schwartz

 Date: Nov 1994

 Parameters: obj - ptr to object
 			 initx - inital x velocity (a0)
			 inity - initial y velocity (a1)
			 gravity - gravity to use (a2)
			 anispeed - animation speed (sleep ticks) (a3)
			 anioffset - animation offset to use (a9)

			 current_proc->a6 - routine to call (NULL=NONE)

 Returns: None

 Description:	flight routines for people to fly
******************************************************************************/
void flight_call(OBJECT *obj,long initx,long inity,long gravity,short anispeed,long anioffset)
{

	if (inity != DONT_TOUCH)
		obj->oyvel.pos=inity;

	/* flgt2 */
	if (gravity != DONT_TOUCH)
		obj->ograv.pos=gravity;

	/* flgt3 */
	if (initx != DONT_TOUCH)
		away_x_vel(current_proc,obj,initx);

	/* flgt6 */
	/* setup animation (a9) */
	if (anioffset>=0) 								// neg offset = animation already setup
	{
		if ((anioffset>>16)==0)
			get_char_ani(ANIM_TABLE1,anioffset & 0xfff);	// pick correct table
		else get_char_ani(ANIM_TABLE2,anioffset & 0xffff);
	}

	/* flgt5 */
	if (anispeed!=DONT_TOUCH)
		init_anirate(anispeed);								// set things up to animate

	(ADDRESS *)current_proc->pdata.v_store4=(ADDRESS *)current_proc->a6;	// routine to call every tick!!

	/* check if starting underground */
	if (obj->oypos.u.intpos>current_proc->pdata.p_ganiy)		// check if start below ground level
		obj->oypos.u.intpos=current_proc->pdata.p_ganiy;		// yes, set to ground level

	/* flight loop */
	do
	{
		process_sleep(1);

		if ((ADDRESS *)current_proc->pdata.p_store4!=NULL)
			((FUNC)current_proc->pdata.p_store4)();

		next_anirate();
	}
	while(obj->oypos.u.intpos<current_proc->pdata.p_ganiy);		// keep falling until below ground

	obj->ograv.pos=0;										// stop gravity
	stop_me(obj);
	ground_player(obj);

	return;
}


/******************************************************************************
 Function: void flight_loop(OBJECT *obj)

 By: David Schwartz

 Date: Nov 1994

 Parameters: obj - ptr to object
			 current_proc->pdata.pstore4 - routine to call (NULL=NONE)

 Returns: None

 Description:	flight loop routine
 ******************************************************************************/
 void flight_loop(OBJECT *obj)
 {
	/* flight loop */
	do
	{
		process_sleep(1);

		if ((ADDRESS *)current_proc->pdata.p_store4!=NULL)
			((FUNC)current_proc->pdata.p_store4)();

		next_anirate();
	}
	while(obj->oypos.u.intpos<current_proc->pdata.p_ganiy);		// keep falling until below ground

	obj->ograv.pos=0;										// stop gravity
	stop_me(obj);
	ground_player(obj);

	return;
}

/******************************************************************************/
/******************************************************************************
 Function: void away_x_vel(PROCESS *proc,OBJECT *obj,long initx)

 By: David Schwartz

 Date: Nov 1994

 Parameters: initx - initial x velocity (16.16)
			 obj - current object
			 proc - current proc

 Returns: None

 Description:	left or right velocity
******************************************************************************/
 void away_x_vel(PROCESS *proc,OBJECT *obj,long initx)
{
	if (is_he_right(proc)==SYSTEM_CARRY_SET)
		set_x_vel(obj,-initx);
	else set_x_vel(obj,initx);
}

/******************************************************************************
 Function: void towards_x_vel(PROCESS *proc,OBJECT *obj,long initx)

 By: David Schwartz

 Date: Nov 1994

 Parameters: initx - initial x velocity (16.16)
			 obj - current object
			 proc - current process

 Returns: None

 Description:	left or right velocity
******************************************************************************/
 void towards_x_vel(PROCESS *proc,OBJECT *obj,long initx)
{
	if (is_he_right(proc)==SYSTEM_CARRY_CLR)
		set_x_vel(obj,-initx);
	else set_x_vel(obj,initx);
}

/********************************
 * FATALITY STUFF 				*
 ********************************/

/******************************************************************************
 Function: void fatality_xfer_range(short xmin,short xmax,FUNC fatal_func)

 By: David Schwartz

 Date: Jan 1995

 Parameters: xmin - min range to do fatality
			 xmax - max range to do fatality
			 fatal_func - routine to perform

 Returns: None

 Description:	determine if fighter in range to perform fatality
******************************************************************************/
void fatality_xfer_range(short xmin,short xmax,FUNC fatal_func)
{
	short xdist;

	xdist=get_x_dist;

	if (xdist>xmax || xdist<xmin)
		process_suicide();

	fatality_xfer(fatal_func);
}


void close_animality_xfer(FUNC anim_func)
{
	if (get_x_dist>SCX(0x50))
		process_suicide();

	if (f_mercy==0)
		process_suicide();

	fatality_xfer(anim_func);
}

void animality_xfer(FUNC anim_func)
{
	if (f_mercy==0)
	{
		f_no_bonus=0;
		process_suicide();
	}

	fatality_xfer(anim_func);
}

void fatality_xfer(FUNC fatal_func)
{
	/* fatality_xfer */

	/* fatality allowed conditions
	   1) no violence flag must be clr
	   2) no blood flag must be clr
	   3) only during "finish him mode"
	   4) only 1 fatality at a time
	   5) opponent must be on ground
	*/
	if (f_no_violence!=0 || f_no_blood !=0 || winner_status !=3 || f_death!=0 || is_he_airborn()==SYSTEM_CARRY_SET)
	{
		f_no_bonus=0;
		process_suicide();
	}

	/* check to see if dude is dizzy */
	if ((current_proc->pdata.p_otherproc)->p_comp_flag!=PC_DIZZY)
	{
		f_no_bonus=0;
		process_suicide();
	}

	restricted_xfer(fatal_func);
}

void babality_xfer(FUNC fatal_func)
{
	/* fatality_xfer */

	/* fatality allowed conditions
	   3) only during "finish him mode"
	   4) only 1 fatality at a time
	   5) opponent must be on ground
	*/
	if (winner_status !=3 || f_death!=0 || is_he_airborn()==SYSTEM_CARRY_SET)
	{
		f_no_bonus=0;
		process_suicide();
	}

	/* check to see if dude is dizzy */
	if ((current_proc->pdata.p_otherproc)->p_comp_flag!=PC_DIZZY)
	{
		f_no_bonus=0;
		process_suicide();
	}

	restricted_xfer(fatal_func);
}

/******************************************************************************
 Function: void special_xfer(WORD xfertype,FUNC routine)

 By: David Schwartz

 Date: Nov 1994

 Parameters: xfertype - type of xfer to perform
			 routine - routine to set other process to if conditions true
			 current_proc->pdata.p_store4 - process to switch

 Returns: None

 Description:	switch process if conditions are valid
******************************************************************************/
void special_xfer(WORD xfertype,FUNC routine)
{
	PROCESS *ptemp;
	WORD results;


	switch (xfertype)
	{
		case 0:
			/* restricted_xfer */
			ptemp=current_proc;
			current_proc=(PROCESS *)(current_proc->pdata.p_store4);			// trickery to fake out routine
			results=am_i_airborn(current_proc->pa8);
			current_proc=ptemp;
			if (results==SYSTEM_CARRY_SET)
			{
				if ( f_no_bonus==1 )
					f_no_bonus=0;
				process_suicide();
			}
		case 1:
			/* airborn_xfer */
			ptemp=(PROCESS *)current_proc->pdata.p_store4;
			if ((ptemp->pdata.p_flags & (PM_REACTING+PM_SPECIAL+PM_SITDUCK)) !=0)
			{
				if ( f_no_bonus==1 )
					f_no_bonus=0;
				process_suicide();
			}

			break;
	}

	/* free_xfer */
	if (get_my_strength(current_proc->pa8)>0)
	{
		fastxfer((PROCESS *)current_proc->pdata.p_store4,routine);
		/* Note: From David Schwartz
		   the code following the call, sets a return address to "reaction_exit"
		   that cannot be coded in C.  The called return in the set process
		   will call a final routine that will return to "reaction_exit".
		   You will need to write the code so that the return is executed instead
		   of returned.  Trace through do_quake for a good example.  It exit from
		   the routine is to jump to do_backup.  This routine returns to reaction_exit.
		   To make this work, have do_quake call do_backup and then call reaction_exit()
		*/
	}

	process_suicide();
}


/******************************************************************************
 Function: WORD is_my_proj_alive(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: SYSTEM_CARRY_SET - proj exists
 		  SYSTEM_CARRY_CLR - proj does not exists

 Description:	check to see if my projectile process already exists
******************************************************************************/
WORD is_my_proj_alive(void)
{
	if (process_exist(p1p2_pick(current_proc->pa8,PID_PROJ1,PID_PROJ2),-1)==NULL)
		return(SYSTEM_CARRY_CLR);
	else return(SYSTEM_CARRY_SET);
}


/******************************************************************************
 Function: WORD stick_look_lr(WORD p1_legal,WORD p2_legal,WORD *scom)

 By: David Schwartz

 Date: Nov 1994

 Parameters: p1_legal = player 1 legal buttons
			 p2_legal = player 2 legal buttons
			 scom = combo table to check (a11)

			 current_proc->pdata.p_store4 = dued in questions proc

 Returns: SYSTEM_CARRY_SET - combo valid
		  SYSTEM_CARRY_CLR - no combo

 Description:	routine to look and see if a certain joystick combo
                was made.
******************************************************************************/
WORD stick_look_lr(WORD p1_legal,WORD p2_legal,WORD *scom)
{
	OBJECT *obj=current_proc->pa8;

	WORD time,results,swstate,tickv;
	LONG *que;
	LONG queind,prevval=0;

	tickv=tick;

	if (illegal_button_check(obj,p1_legal,p2_legal)==SYSTEM_ZERO_SET)
		return(SYSTEM_CARRY_CLR);

	time=GET_WORD(scom)++;				// time frame allowed
	if (time==0)
		return(SYSTEM_CARRY_SET);

	results=is_he_right((PROCESS *)(current_proc->pdata.p_store4));

	if (*scom>=SW_UP)
		queind=get_jcq_next_pointer(&que);
	else queind=get_bcq_next_pointer(&que);

	if (results==SYSTEM_CARRY_CLR)
		scom+=6;						// use "face-left" combo

	/* combo5 */
	do
	{
		if ((swstate=GET_WORD(scom)++)==0) 			// get a switch state from table, zero->done
		{
			/* combo7 */
			if ((tickv-(prevval & 0xffff)) > time)
				return(SYSTEM_CARRY_CLR);				// to much time expired
			else return(SYSTEM_CARRY_SET);				// combo valid
		}
		else prevval=previous_q_entry(&queind,que); // previous [switch,time]
	}
	while (swstate==((WORD)(prevval>>16)));

	return(SYSTEM_CARRY_CLR);				// no match, so no combo
}

/******************************************************************************/
/******************************************************************************
 Function: LONG previous_q_entry(LONG qindex,LONG *quebase)

 By: David Schwartz

 Date: Oct 1994

 Parameters: quebase - ptr to base que array
			 qindex - current entry

 Returns: previous que entry button/time

 Description:	returns the previous button/time entry in the past in que
******************************************************************************/
 LONG previous_q_entry(LONG *qindex,LONG *quebase)
{
	*qindex=*qindex-1;

	if (*qindex==0)
		*qindex=SQS;

	return(*(quebase+(*qindex)));
}

/******************************************************************************
 Function: LONG get_bcq_next_pointer(LONG **quebase)

 By: David Schwartz

 Date: Oct 1994

 Parameters: quebase - ptr to base que array

 Returns: index into quebase

 Description:	gets next pointer/index into button close queue
******************************************************************************/
 LONG get_bcq_next_pointer(LONG **quebase)
{
	*quebase=(current_proc->pa8==p1_obj) ? p1_bcq:p2_bcq;
 	return(**quebase);
}

/******************************************************************************
 Function: LONG get_jcq_next_pointer(LONG **quebase)

 By: David Schwartz

 Date: Oct 1994

 Parameters: quebase - ptr to base que array

 Returns: index into quebase

 Description:	gets next pointer/index into joystick close queue
******************************************************************************/
 LONG get_jcq_next_pointer(LONG **quebase)
{
	*quebase=(current_proc->pa8==p1_obj) ? p1_jcq:p2_jcq;
 	return(**quebase);
}

/******************************************************************************
 Function: void shang_morph(WORD pa9)

 By: David Schwartz

 Date: Feb 1995

 Parameters: pa9 - char to morph to

 Returns: None

 Description:	shang tsu morph
******************************************************************************/
void do_st_2_kano(void)
{
	shang_morph(FT_KANO);
}

void do_st_2_sonya(void)
{
	shang_morph(FT_SONYA);
}

void do_st_2_jax(void)
{
	shang_morph(FT_JAX);
}

void do_st_2_ind(void)
{
	shang_morph(FT_INDIAN);
}

void do_st_2_sz(void)
{
	shang_morph(FT_SUBZERO);
}

void do_st_2_swat(void)
{
	shang_morph(FT_SWAT);
}

void do_st_2_lia(void)
{
	shang_morph(FT_LIA);
}

void do_st_2_robo1(void)
{
	shang_morph(FT_ROBO1);
}

void do_st_2_robo2(void)
{
	shang_morph(FT_ROBO2);
}

void do_st_2_lao(void)
{
	shang_morph(FT_LAO);
}

void do_st_2_tusk(void)
{
	shang_morph(FT_TUSK);
}

void do_st_2_sg(void)
{
	shang_morph(FT_SG);
}

void do_st_2_lk(void)
{
	shang_morph(FT_LK);
}

void do_st_2_smoke(void)
{
	shang_morph(FT_SMOKE);
}


void shang_morph(WORD pa9)
{
	OBJECT *obj=current_proc->pa8;
	OBJECT *other;
	WORD ta4;

	init_special_act(ACT_MORPH,obj);
	stop_me(obj);

	local_ochar_sound(4);				// morph sound

	get_char_ani(ANIM_TABLE2,pa9);		// correct morph
	set_no_block(obj);					// no blocking while morphing

	/* smorph2 */
	mframew(4);
	obj->ochar=pa9;
	ground_ochar();
	ochar_bank_bit(obj);

	current_proc->pdata.p_ganiy=obj->oypos.u.intpos;			// new ground pos

	other=current_proc->pdata.p_otherguy;

	player_normpal();

	/* load new fighter data */
	if (f_shang_morph==MORPH_NORMAL)
	{
		psxcd_pause();

		character_texture_load(pa9,0,CHAR_NORMAL,obj->oheap,SYNC_LOAD, obj == p1_obj ? 0 : 1);
		if (obj==p1_obj)							// set heap to belong to correct owner
			p1_heap_char=pa9;
		else p2_heap_char=pa9;

		if (obj->oid==OID_P1  )
			PsxSoundLoadFighter1(pa9, p1_version);
		else PsxSoundLoadFighter2(pa9, p2_version);

		psxcd_restart(cd_vol_tbl[f_music]);
	}
	else
	{
		obj->oheap=(p1_obj==obj)?p2_heap:p1_heap;			// switch to other heap for quasi morph
	}

	/* smorph5 */
	get_char_ani(ANIM_TABLE1,ANIM_STANCE);			// stance ani
	do_next_a9_frame(obj);
	update_tsl(l_morph,obj);				// mark this point

	/* if smoke then create smoke */
	if ( pa9==FT_SMOKE )
		create_fx(FX_SMOKE);			// start the smoke

	reaction_exit(obj);
}

/******************************************************************************
 Function: void init_special(OBJECT *obj)

 By: David Schwartz

 Date: Oct 1994

 Parameters: obj - object to setup

 Returns: None

 Description:	set things up before doing a special move
******************************************************************************/
void init_special(OBJECT *obj)
{
	stop_me(obj);
	ground_player(obj);

	face_opponent(obj);
	set_no_block(obj);						// i cant block !!
	me_in_front();

//*******************
	player_normpal();						// keep raiden at correct pal
//*******************

	current_proc->pdata.p_flags |=PM_SPECIAL;	// flag: i am doing a special move

	disable_all_buttons;

	return;
}

/******************************************************************************
 Function: void air_init_special(OBJECT *obj)

 By: David Schwartz

 Date: Oct 1994

 Parameters: obj - object to setup

 Returns: None

 Description:	set things up before doing a special move in air
******************************************************************************/
void air_init_special(OBJECT *obj)
{
	stop_me(obj);

	face_opponent(obj);
	set_no_block(obj);						// i cant block !!
	me_in_front();

//*******************
	player_normpal();						// keep raiden at correct pal
//*******************

	current_proc->pdata.p_flags |=PM_SPECIAL;	// flag: i am doing a special move

	disable_all_buttons;

	return;
}

/***********************************************************************
 *
 * Jumps and Landings
 *
 ***********************************************************************/

/******************************************************************************
 Function: void angle_jump_land_jsrp(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: 	None

 Returns: None

 Description:	land from an angle jump
******************************************************************************/
void angle_jump_land_jsrp(void)
{
	current_proc->pdata.p_action=ACT_LAND;			// action: landing on the ground

	face_opponent(current_proc->pa8);
	tsound(0x18);

	get_char_ani(ANIM_TABLE1,ANIM_FFLIP);

	allow_moves();
	do_next_a9_frame(current_proc->pa8);

	process_sleep(3);		// allow moves during this sleep

	return;
}

/******************************************************************************
 Function: void land_on_yer_feet(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: 	None

 Returns: None

 Description:	land on your feet then normal retrun
******************************************************************************/
void land_on_yer_feet(void)
{
	flight(current_proc->pa8,0,0,SCY(0x8000),NEVER_ANI,-1);
	stack_jump(jump_up_land_jump);
}

/******************************************************************************
 Function: void jump_up_land_jump(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: 	None

 Returns: None

 Description:	jump up punch or kick land routine
******************************************************************************/
void jump_up_land_jump(void)
{
	jump_up_land_jsrp();
	reaction_exit(current_proc->pa8);
}

/******************************************************************************
 Function: void do_jump_up(void *pa11)

 By: David Schwartz

 Date: Feb 1995

 Parameters:   routine - routine to call every tick NULL=None

 Returns: None

 Description:	joy drone jumpup routine
******************************************************************************/
void do_jump_up(void *pa11)
{
	group_sound(1);				// group speech: jump "huh"

	current_proc->pdata.p_action=ACT_JUMPUP;

	get_char_ani(ANIM_TABLE1,ANIM_JUMPUP);
	((ADDRESS *)current_proc->pa9)++;

	(void *)current_proc->pa6=pa11;				// set call routine

	flight_call(current_proc->pa8,0,UP_VEL,UP_GRAV,4,-1);

	jump_up_land_jsrp();
	reaction_exit(current_proc->pa8);
}

/******************************************************************************
 Function: void jump_up_land_jsrp(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: 	None

 Returns: None

 Description:	jump up punch or kick land routine
******************************************************************************/
void jump_up_land_jsrp(void)
{
	current_proc->pdata.p_action=ACT_LAND;
	tsound(0x18);						// feet gently landing

	get_char_ani(ANIM_TABLE1,ANIM_JUMPUP);

	if (am_i_joy()==SYSTEM_CARRY_CLR)
		stack_jump(d_land);

	allow_moves();
	current_proc->a10=(ADDRESS)current_proc->pa9;
	((ADDRESS *)current_proc->pa9)++;
	do_next_a9_frame(current_proc->pa8);
	process_sleep(3);
	(ADDRESS)current_proc->pa9=current_proc->a10;
	do_next_a9_frame(current_proc->pa8);
	process_sleep(3);

	return;
}

/******************************************************************************
 Function: void allow_moves(void)

 By: David Schwartz

 Date: Feb 1995

 Parameters: 	None

 Returns: None

 Description:	allow moves again
******************************************************************************/
void allow_moves(void)
{
	enable_all_buttons;
	back_to_normal();
	return;
}

/******************************************************************************
 * SECRET MOVE STUFF
 ******************************************************************************/

/******************************************************************************
 Function: void secret_move_search(SMOVE *pa14)

 By: David Schwartz

 Date: Feb 1995

 Parameters: 	None

 Returns: None

 Description:	perform a secret move search
******************************************************************************/
void secret_move_search(SMOVE *pa14)
{
	while (pa14->s_p1leg!=0)
	{
		if (stick_look_lr(pa14->s_p1leg,pa14->s_p2leg,(WORD *)&(pa14->s_time))==SYSTEM_CARRY_SET)
		{
			if (pa14->s_yes_no!=0)
			{
				if ((((FUNCW)pa14->s_yes_no)())==SYSTEM_CARRY_CLR)
					process_suicide();
			}

			/* sms5 */
			switch (pa14->s_xfer)
			{
				case X_GROUND:
					restricted_xfer(pa14->s_routine);
					break;
				case X_AIRBORN:
					airborn_xfer(pa14->s_routine);
					break;
				case X_FATAL:
					f_no_bonus=1;
					fatality_xfer(pa14->s_routine);
					break;
				case X_MERCY:
					f_no_bonus=1;
					mercy_xfer(pa14->s_routine);
					break;
				case X_ANIMAL:
					f_no_bonus=1;
					animality_xfer(pa14->s_routine);
					break;
				case X_CLOSE_ANIMAL:
					f_no_bonus=1;
					close_animality_xfer(pa14->s_routine);
					break;
				case X_FRIEND:
					f_no_bonus=1;
					friendship_xfer(pa14->s_routine);
					break;
				case X_BABY:
					f_no_bonus=1;
					babality_xfer(pa14->s_routine);
			}
		}
		pa14++;
	}

	/* secret9 */
	process_suicide();
}

/******************************************************************************
 Function: WORD q_?????(void)

 By: David Schwartz

 Date: Mar 1995

 Parameters: None

 Returns: SYSTEM_CARRY_SET - yes (q_yes)
 		  SYSTEM_CARRY_CLR - no (q_no)

 Description:	answer a question for various conditions
******************************************************************************/
WORD q_shang_morph_lk(void)
{
	return(q_shang_morph(FT_LK));
}

WORD q_shang_morph_smoke(void)
{
	if ( f_smoke==0)
		return(SYSTEM_CARRY_CLR);
	else return(q_shang_morph(FT_SMOKE));
}

WORD q_shang_morph_sg(void)
{
	return(q_shang_morph(FT_SG));
}

WORD q_shang_morph_lao(void)
{
	return(q_shang_morph(FT_LAO));
}

WORD q_shang_morph_robo1(void)
{
	return(q_shang_morph(FT_ROBO1));
}

WORD q_shang_morph_swat(void)
{
	return(q_shang_morph(FT_SWAT));
}

WORD q_shang_morph_tusk(void)
{
	return(q_shang_morph(FT_TUSK));
}

WORD q_shang_morph_ind(void)
{
	return(q_shang_morph(FT_INDIAN));
}

WORD q_shang_morph_robo2(void)
{
	return(q_shang_morph(FT_ROBO2));
}

WORD q_shang_morph_kano(void)
{
	return(q_shang_morph(FT_KANO));
}

WORD q_shang_morph_jax(void)
{
	return(q_shang_morph(FT_JAX));
}

WORD q_shang_morph_sz(void)
{
	return(q_shang_morph(FT_SUBZERO));
}

WORD q_shang_morph_lia(void)
{
	return(q_shang_morph(FT_LIA));
}

WORD q_shang_morph(WORD pa0)
{
	if ( process_exist(PID_SUMMON,-1)!=NULL || process_exist(p1p2_pick(current_proc->pa8,PID_PROJ1,PID_PROJ2),-1)!=NULL )
		q_no;

	if (process_exist(PID_SWITCHEROO,-1)!=NULL || round_1_jsrp==18 || round_23_jsrp==18 || round_1_jsrp==6 || round_23_jsrp==6)
		q_no;						// no morph during randper

	switch (f_shang_morph)
	{
		case MORPH_OFF:
			q_no;
			break;
		case MORPH_QUASI:
			if ((current_proc->pdata.p_otherguy)->ochar==pa0)
				q_yes;
			else q_no;
			break;
	}
	q_yes;
}

WORD q_spear_ok(void)
{
	if  (get_his_action(current_proc)==ACT_SPEARED_SD)
		q_no;
	else q_yes;
}

WORD q_smoke_tele(void)
{
	if (get_his_p_hit(current_proc)>=2 || get_his_action(current_proc)==ACT_ROBO_TELED)
		q_no;
	else q_yes;
}

WORD q_robo_flame_fatal(void)
{
	return(q_fatal_dist(SCX(0xc0),SCX(0x100)));
}

WORD q_taser_fatal(void)
{
	return(q_fatal_dist(SCX(0x100),SCX(0x130)));
}

WORD q_close_fatal(void)
{
	return(q_fatal_dist(SCX(0x20),SCX(0x50)-7));
}

WORD q_half_screen_fatal(void)
{
	return(q_fatal_dist(SCX(0x80),SCX(0xb0)));
}

WORD q_fatal_dist(short pa5,short pa6)
{
	if (get_x_dist<pa5 || get_x_dist>pa6)
		q_no;

	return(q_fatality_req());
}

WORD q_fatality_req(void)
{
	if (winner_status!=3)
		return(SYSTEM_CARRY_CLR);
	else return(SYSTEM_CARRY_SET);
}

WORD q_sz_decoy(void)
{
	if (get_tsl(l_sz_decoy,current_proc->pa8)<(0x40*4) || get_his_action(current_proc)==ACT_FROZEN)
		q_no;
	else q_yes;
}

WORD q_blurred_req(void)
{
	if ((current_proc->pdata.p_otherproc)->pdata.p_hit>1)
		q_no;

	if (get_his_action(current_proc)==ACT_FK_SD)
		q_no;

	if (get_his_action(current_proc)==ACT_RET_KICK)
		q_no;

	if (get_his_action(current_proc)==ACT_BLURRED)
		q_no;

	if (get_his_action(current_proc)==ACT_SWEEP_SD)
		q_no;

	if (get_x_dist>SCX(0xa0))
		q_yes;

	if (get_his_action(current_proc)==ACT_SWEEP)
		q_no;
	else q_yes;
}

WORD q_pounce_ok_now(void)
{
	if (get_his_action(current_proc)==ACT_REACTING)
		q_no;
	else q_yes;
}

WORD q_bike_req(void)
{
	if (get_tsl(l_lk,current_proc->pa8)<0x40*2)
		q_no;
	else q_yes;
}

WORD q_lia_scream(void)
{
	if (get_his_p_hit(current_proc)>=3 || q_is_he_a_boss()==SYSTEM_CARRY_SET)
		q_no;
	else q_yes;
}

WORD q_sz_forward_zap(void)
{
	if (get_his_p_hit(current_proc)>=2 || process_exist(p1p2_pick(current_proc->pa8,PID_DECOY1,PID_DECOY2),-1)!=NULL)
		q_no;
	else q_yes;
}

WORD q_kabal_animal(void)
{
	if (get_tsl(l_hp,current_proc->pa8)<0x40)
		q_no;
	else q_yes;
}

WORD q_eatit_fatal(void)
{
	if (button_bit_check(current_proc->pa8,P1B2|P1B5,P2B2|P2B5)==SYSTEM_CARRY_CLR)
		q_no;
	else return(q_fatal_dist(SCX(0x70),SCX(0xa0)));
}

WORD q_bubble_fatal(void)
{
	if (button_bit_check(current_proc->pa8,P1B2|P1B5,P2B2|P2B5)==SYSTEM_CARRY_CLR)
		q_no;
	else return(q_fatal_dist(SCX(0xd0),SCX(0x140)));
}

WORD q_earth_fatal(void)
{
	return(q_fatal_dist(SCX(0xd0),SCX(0x140)));
}

WORD q_st_spike_fatal(void)
{
	if (get_tsl(l_lp,current_proc->pa8)<0x40)
		q_no;
	else
	{
		if (q_am_i_cornered()==SYSTEM_CARRY_SET)
			q_no;
		else return(q_close_fatal());
	}
}

WORD q_lk_mk_fatal(void)
{
	if (button_bit_check(current_proc->pa8,P1B2|P1B5,P2B2|P2B5)==SYSTEM_CARRY_CLR)
		q_no;
	else return(q_fatality_req());
}

WORD q_pit_fatal(void)
{
	if ((curback==BKGD_PIT_MOD || curback==BKGD_BELL_MOD || curback==BKGD_SUBWAY_MOD) && (f_no_violence==0 && f_no_blood==0) )
	{
		if ( (current_proc->pa8)->ochar==FT_ROBO1 || (current_proc->pa8)->ochar==FT_ROBO2 || (current_proc->pa8)->ochar==FT_SMOKE)
			return(q_fatal_dist(4,SCX(0x50)-8));
		else return(q_close_fatal());
	}
	else q_no;
}

WORD q_inflate_fatal(void)
{
	if (q_is_he_cornered()==SYSTEM_CARRY_SET)
		q_no;
	return(q_fatal_dist(SCX(0x60),SCX(0xe0)));
}

WORD q_swat_animal(void)
{
	return(q_animal_dist(SCX(0x58),SCX(0x78)));
}

WORD q_lao_hat_fatal(void)
{
	return(q_fatal_dist(SCX(0x20),SCX(0x70)));
}

WORD q_scream_fatal(void)
{
	if (button_bit_check(current_proc->pa8,P1B2|P1B5,P2B2|P2B5)==SYSTEM_CARRY_CLR)
		q_no;
	else return(q_close_fatal());
}

WORD q_lia_hair_fatal(void)
{
	return(q_fatal_dist(SCX(0x50),SCX(0x90)));
}

WORD q_grow_fatal(void)
{
	return(q_fatal_dist(SCX(0xd0),SCX(0x140)));
}

WORD q_kano_animal(void)
{
	if (get_tsl(l_hp,current_proc->pa8)<0x40)
		q_no;
	else return(q_close_animal());
}

WORD q_close_animal(void)
{
	if (f_mercy==0)
		q_no;

	return(q_close_fatal());
}

WORD q_sherip_fatal(void)
{
	if (get_tsl(l_hk,current_proc->pa8)<0x40)
		q_no;
	else return(q_close_fatal());
}

WORD q_skel_fatal(void)
{
	if (get_tsl(l_lp,current_proc->pa8)<0x40)
		q_no;
	else return(q_close_fatal());
}

WORD q_ind_axe_fatal(void)
{
	if (get_tsl(l_lk,current_proc->pa8)<0x40)
		q_no;
	else return(q_fatal_dist(SCX(0xa0),SCX(0xe0)));
}

WORD q_lk_animal(void)
{
	return(q_animal_dist(SCX(0x58),SCX(0x90)));
}

WORD q_smoke_animal(void)
{
	return(q_animal_dist(SCX(0xa0),SCX(0x150)));
}

WORD q_shang_animal(void)
{
	if (get_tsl(l_hp,current_proc->pa8)<0x40)
		q_no;
	else return(q_animal_dist(SCX(0x70),SCX(0xa0)));
}

WORD q_animal_dist(short pa5,short pa6)
{
	if (get_x_dist<pa5 || get_x_dist>pa6)
		q_no;
	else return(q_animal_req());
}

WORD q_mercy_req(void)
{
	if (is_master_in_finish()==SYSTEM_CARRY_CLR || f_mercy!=0 || get_x_dist<SCX(0xa0))
		q_no;

	if (p1_matchw==0 || p2_matchw==0)
		q_no;

	if (get_tsl(l_run,current_proc->pa8)<0x30)
		q_no;

	return(q_fatality_req());
}

WORD q_dinger_friend(void)
{
	if (get_x_dist<SCX(0xc0))
		q_no;
	else
	{
		return(q_friend());
	}
}

WORD q_smoke_friend(void)
{
	if (get_x_dist<SCX(0xd0))
		q_no;
	else
	{
		return(q_friend());
	}
}


WORD q_ind_friend(void)
{
	if (get_x_dist<SCX(0xa0))
		q_no;
	else
	{
		return(q_friend());
	}
}


WORD q_sonya_friend(void)
{
	if (is_stick_down(current_proc)==SYSTEM_CARRY_CLR)
		q_no;
	else
	{
		return(q_friend());
	}
}

WORD q_friend(void)
{
	WORD a0;

	a0=((current_proc->pa8)->oid==OID_P1) ? 0:1;

	if (l_block[a0]!=0)
		q_no;
	return(q_fatality_req());
}

WORD q_babality(void)
{
	WORD a0;

	a0=((current_proc->pa8)->oid==OID_P1) ? 0:1;

	if (l_block[a0]!=0)
		q_no;
	return(q_fatality_req());
}

WORD q_animal_req(void)
{
	if (f_mercy==0)
		q_no;
	return(q_fatality_req());
}

WORD is_master_in_finish(void)
{
	PROCESS *pa0;

	pa0=process_exist(PID_MASTER,-1);
	if (pa0!=NULL)
	{
		current_proc->a0=(ADDRESS)pa0;
		if (pa0->p_comp_flag==PC_FATAL_WAIT)
			q_yes;
	}

	q_no;
}

WORD q_floor_blade(void)
{
	if (process_exist(PID_BLADE,-1)!=NULL)
		q_no;				// blade out there no two

	if (process_exist(PID_DEAD_BLADE,-1)!=NULL)
		q_no;				// blade out there no two

	q_yes;
}

WORD q_lk_friend(void)
{
	if (button_bit_check(current_proc->pa8,P1B5,P2B5)==SYSTEM_CARRY_CLR)
		q_no;
	return(q_friend());
}

WORD q_robo_crush_fatal(void)
{
	return(q_fatal_dist(SCX(0x60),SCX(0x90)));
}

void do_mercy(void)
{
	if (is_master_in_finish()==SYSTEM_CARRY_CLR)
		stack_jump(victory_animation);

	fastxfer((PROCESS*)current_proc->a0,master_proc_mercy);
	winner_status=3;
	f_mercy=1;
	stack_jump(mercy_start);
}

/******************************************************************************
 Function: home_code_que(WORD swoffset,LONG *bqueue)

 By: David Schwartz

 Date: June 1995

 Parameters: WORD swoffset - switch offset (0-8)
			 LONG b_queue - array button queue to queue switch offset

 Returns: NONE

 Description:	adds a switch entry to the current queue and then checks player 1 and player 2 for valid codes
******************************************************************************/
extern SMOVE sm_home_codes[];
void home_code_que(WORD swoffset,LONG *b_queue)
{
	SMOVE *pa14;

	switch_queue(swoffset,b_queue);

	home_code_check(0,sm_home_codes);		// check player 1 for codes
	home_code_check(1,sm_home_codes);		// check player 2 for codes

	process_suicide();
}

void home_code_check(WORD ptype,SMOVE *pa14)
{
	WORD legal;
	while (pa14->s_p1leg!=0)
	{
		legal=(ptype==0)?pa14->s_p1leg:pa14->s_p2leg;

		if (home_code_eval(ptype,legal,(WORD *)&(pa14->s_time))==SYSTEM_CARRY_SET)
		{
			if (pa14->s_yes_no!=0)
			{
				if ((((FUNCW)pa14->s_yes_no)())==SYSTEM_CARRY_CLR)
					process_suicide();
			}

			pa14->s_routine();
			break;
		}
		pa14++;
	}

	return;
}

WORD home_code_eval(WORD ptype,WORD p_legal,WORD *scom)
{
	WORD time,results,swstate,tickv;
	LONG *que;
	LONG queind,prevval=0;

	tickv=tick;

	/* illegal button check */
	if (ptype==0)
	{
		if ((swcurr.u.p1pad & P1_BUTTON_MASK) & (~p_legal))
			return(SYSTEM_CARRY_CLR);
	}
	else
	{
		if ((swcurr.u.p2pad & P2_BUTTON_MASK) & (~p_legal))
			return(SYSTEM_CARRY_CLR);
	}

	/* using SMOVE SCOM STRUCTURE BUT NO LEFT/RIGHT CODE IS UP TO 12 digits long */
	time=GET_WORD(scom)++;				// time frame allowed
	if (time==0)
		return(SYSTEM_CARRY_SET);

	if (*scom>=SW_UP)
	{
		que=(ptype==0)?p1_jcq:p2_jcq;
		queind=(ptype==0)?*p1_jcq:*p2_jcq;
	}
	else
	{
		que=(ptype==0)?p1_bcq:p2_bcq;
		queind=(ptype==0)?*p1_bcq:*p2_bcq;
	}

	/* combo5 */
	do
	{
		if ((swstate=GET_WORD(scom)++)==0) 			// get a switch state from table, zero->done
		{
			/* combo7 */
			if ((tickv-(prevval & 0xffff)) > time)
				return(SYSTEM_CARRY_CLR);				// to much time expired
			else return(SYSTEM_CARRY_SET);				// combo valid
		}
		else prevval=previous_q_entry(&queind,que); // previous [switch,time]
	}
	while (swstate==((WORD)(prevval>>16)));

	return(SYSTEM_CARRY_CLR);				// no match, so no combo
}

void hc_free_play(void)
{
	if (f_freeplay==0)
	{
		f_freeplay=1;					// allow free play
		tsound(0x7c);
	}

	return;
}

void hc_smoke(void)
{
	PROCESS *ptemp;

	if (f_smoke==0 && gstate!=GS_UNLOCK_SMOKE)
	{
		ptemp=process_exist(PID_AMODE,0xffff);
		if ( ptemp!=NULL )
			fastxfer(ptemp,smoke_page);
	}

	return;
}

void hc_cheat(void)
{
	if (f_cheat_menu<1)
	{
		f_cheat_menu=1;
		tsound(0x19);
	}

	return;
}

void hc_cheat1(void)
{
	if (f_cheat_menu<2)
	{
		f_cheat_menu=2;
		tsound(0x7d);
	}

	return;
}

