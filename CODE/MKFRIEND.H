/******************************************************************************
 File: mkfriend.h

 By: David Schwartz

 Date: Jan 1995

 (C) Williams Entertainment

 Mortal Kombat III friendship header
******************************************************************************/

#ifndef __mk_mkfriend_h__
#define __mk_mkfriend_h__

/*
 * 	DEFINITIONS
 */


/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void do_friendship(void);
void friendship_start_pause(void);
void friendship_complete(void);

void f_kano(void);
void f_sonya(void);
void f_jax(void);
void end_friend_proc(void);

void f_indian(void);
void other_ochar_sound(WORD pa0,WORD pa1);

void f_sz(void);

void f_swat(void);
void swat_friend_proc(void);
void swat_crossing_people(void);

void f_sindel(void);
void football_proc(void);

void f_sektor(void);
void dinger_proc(void);

void f_cyrax(void);

void f_lao(void);
void lao_dog_sounds(void);
void cute_lil_doggy(void);
void hat_proc(void);

void f_kabal(void);
void f_sheeva(void);

void f_shang(void);
void bounce(void);

void f_liu(void);
void wall_dragon_proc(void);

void f_smoke_ninja(void);

/*
 *	MACROS
 */
#define mframew_5 mframew(5)
#define mframew_4 mframew(4)
#define mframew_3 mframew(3)

#endif /* __mk_mkfriend_h__ */

