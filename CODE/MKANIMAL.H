/******************************************************************************
 File: mkanimal.h

 By: David Schwartz

 Date: Jan 1995

 (C) Williams Entertainment

 Mortal Kombat III animalship header
******************************************************************************/

#ifndef __mk_mkanimal_h__
#define __mk_mkanimal_h__

/*
 * 	DEFINITIONS
 */


/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void do_animality(void);
void animality_start_pause(void);

void cyrax_shark(void);
void eaten_by_shark(void);
void eaten_by_snake(void);

void lao_cheetah(void);

void liu_kang_dragon(void);

void shang_tsung_snake(void);

void sheeva_scorpion(void);
void stung_by_scorpion(void);

void kabal_skeleton(void);
void dino_bucked(void);

void sektor_bat(void);
WORD q_bat_4(void);
WORD q_bat_3(void);
WORD q_bat_2(void);
WORD q_bat_1(void);
void r_bat_bite(void);
void animate_till_a11_stop(FUNCW pa11);
void animate_till_a11(FUNCW pa11);

void smoke_bull_shit(void);
void hit_by_bull(void);

void sindel_wasp(void);
void stung_a_bunch(void);

void swat_dino(void);
void bit_in_half(void);

void sz_polar(void);

void kano_spider(void);
void spider_shake(void);
void spider_shake_jsrp(void);

void sonya_eagle(void);

void jax_lion(void);
void lion_mauled(void);

void indian_wolf(void);

void next_anirate_a10(WORD pa10);
PROCESS *create_fx_for_him(WORD pa0);

void unmorph_and_exit(void);
void animal_morph(WORD pa10);
void animality_tune(void);
void animality_complete(void);

void face_him_at_me(void);
void center_around_him(void);

void kill_and_stop_scrolling(void);

/*
 *	MACROS
 */
#define kill_repell dallprc(PID_REPELL)

#endif /* __mk_mkanimal_h__ */

