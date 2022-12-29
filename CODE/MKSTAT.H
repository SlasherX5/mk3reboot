/******************************************************************************
 File: mkstat.h

 By: David Schwartz

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III stationary attack header
******************************************************************************/

#ifndef __mk_mkstat_h__
#define __mk_mkstat_h__

/* 
 * 	DEFINITIONS
 */

/* stationary indexes */
#define STAT_BABY			0x18
#define STAT_ROUNDH			0x17
#define STAT_UPPER			0x16
#define STAT_DKICKL			0x15
#define STAT_DKICKH			0x14
#define STAT_DUCKP			0x13
#define STAT_SWEEPK			0x12
#define STAT_LKICK			0x11
#define STAT_HKICK			0x10
#define STAT_KSWIPE			0x0a
#define STAT_LEG_THROW		0x09
#define STAT_INVISO			0x08
#define STAT_QUAKE			0x07
#define STAT_NOOGY			0x06
#define STAT_SHAKE			0x05
#define STAT_REFLECT		0x04
#define STAT_F_AXE			0x03
#define STAT_AXE			0x02
#define STAT_SCREAM			0x01
#define STAT_SPIN			0x00


/* 
 *	RAM 
 */

/*
 *	PROTOTYPES 
 */
void do_stationary(WORD pa0);
void stat_do_babality(void);
void baby_start_pause(void);
void turn_into_a_baby(void); 

void stat_do_roundhouse(void);
void stat_do_sweep_kick(void);

void stat_do_duck_punch(void);
void stat_do_duck_kickh(void);
void stat_do_duck_kickl(void);
void stat_do_uppercut(void);
void stat_do_lo_kick(void);
void kick2(WORD anispeed,WORD actnum,WORD anioff,WORD stkoff);
void stat_do_hi_kick(void);

void stat_do_kano_swipe(void);

void stat_do_leg_throw(void);
void post_leg_sleep(WORD sleeptime);
void r_leg_slammed(void);

void stat_do_inviso(void);
void do_un_inviso(void);

void stat_do_quake(void);

void stat_do_noogy(void);
void noogy_blocked(OBJECT *obj);
void noogy_hit(OBJECT *obj);
 void noogy_suspended(void);
 void noogy_early_check(OBJECT *obj);
void noogy_shaker(void);
void noog_lineup_1(void);
void edge_of_world_lineup(FUNC routine); 

void stat_do_shake(void);
void shake_hit(OBJECT *obj);
void shake_suspended(void);

void stat_do_lao_spin(void);

void stat_do_lia_scream(void);
void scream_wave(void);

void stat_do_fast_axe_up(void);
void stat_do_axe_up(void);
void axeup3(WORD pa9hi,WORD pa9lo,WORD pa11);

void stat_do_reflect(void);

void xfer_him_to_a10_r(WORD offset);

void retract_strike_act(WORD actnum,WORD sleeptime);

/*
 *	MACROS
 */
/* retract stike */
#define retract_strike(_sleep) retract_strike_act(0,(_sleep))

/* power stuff */
#define local_zero_power current_proc->pdata.p_power=0

#endif /* __mk_mkstat_h__ */

