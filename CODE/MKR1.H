/******************************************************************************
 File: mkr1.h

 By: David Schwartz

 Date: Mar 1995

 (C) Williams Entertainment

 Mortal Kombat III Round Intro Header
******************************************************************************/

#ifndef __mk_mkr1_h__
#define __mk_mkr1_h__

/*
 * 	DEFINITIONS
 */

/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void do_round_jsrps(void);
void r_intro_message(void);
void r_psycho_kombat(void);
void psycho_score_onoff(void);
WORD pso3(void);
void r_uppercut_recovery(void);
void r_unlim_run(void);
void r_sf_smoke(void);
void r_wf_noob(void);
void r_wf_shao(void);
void r_wf_motaro(void);
void wf3(char *pa8,FUNC pa14);
void r_space_game(void);
void r_no_powerbars(void);
void r_nofear_clues(void);
void r_jackbot_easy(void);
void r_switcheroo(void);
void r_dark_fighting(void);
void r_p1_supercap(void);
void r_p2_supercap(void);
void p1_supercap_proc(void);
void p2_supercap_proc(void);
void r_blocking_disabled(void);
void r_throwing_disabled(void);
void r_p1_handicap(void);
void r_p2_handicap(void);
void p1_hadicap_proc(void);
void p2_hadicap_proc(void);
void hand2(WORD pa11,WORD pa10);
PROCESS *wait_for_charge(void);
void msg1(char *msg);
void msg_round1(void);
void switcheroo_proc(void);
void switcheroo_check(ADDRESS *pa11);
void dark_fight_proc(void);
void dark_sleep(void);
void lights_out(void);
void lights_on(void);
void dark_velocities(void);
void lights_on_hit(void);
void lights_on_slam(void);
void space_game(void);
void post_wf_smoke(void);
void post_wf_noob(void);
void post_wf_shao(void);
void post_wf_motaro(void);
void postw2(WORD pa0);
void special_game_init(void);
void r_superjumps(void);
void r_no_combos(void);
void r_no_special_moves(void);
void r_p1_half_damage(void);
void r_p2_half_damage(void);
void r_p1p2_half_damage(void);
void r_bar_regenerate(void);
void regenerate_proc(void);
void r_super_endur(void);
void r_real_kombat(void);
void r_shadow_fighting(void);








/*
 *	MACROS
 */

#endif /* __mk_mkr1_h__ */

