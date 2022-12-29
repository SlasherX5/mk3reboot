/******************************************************************************
 File: mkfatal.h

 By: David Schwartz

 Date: Jan 1995

 (C) Williams Entertainment

 Mortal Kombat III fatality header
******************************************************************************/

#ifndef __mk_mkfatal_h__
#define __mk_mkfatal_h__

/*
 * 	DEFINITIONS
 */


/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void do_fatality_1(void);
void do_fatality_2(void);

void smoke_arm(void);
void open_wide(void);
void smoke_dropping(void);
void eat_this_shit(void);

void smoke_blowup_earth(void);
void earth_bomb(void);
void fbomb_gravity2(OBJECT *pa8,long pa0);
void bgrav3(OBJECT *pa8);
#define fbomb_gravity(_la8) bgrav3(_la8)

void kang_mk_game(void);
void mk_game_cabinet(void);
void r_mk_game_crush(void);

void kang_fire(void);
void kang_reform(void);
void lk_skeleton_burn(void);

void st_suck(void);
void soul_afloat(void);
void green_shit(void);

void st_spike(void);
void st_spiked(void);
void appearing_spikes(void);

void sg_pound(void);
void chop_off_his_height(WORD pa6);

void sg_flesh_rip(void);
void about_2b_ripped(void);
void flesh_ripped_off(void);
void ripped_skeleton(void);

void kabal_scare(void);
void sacred_2_death(void);
void face_and_head_ani(void);
void face_ani(WORD pa0);
void next_head_ani(void);
void my_ghost(void);

void kabal_inflator(void);
void pumped(void);

void lao_slicer(void);
void slice_hat_proc(void);
void slice_speed_set(void);
void slice_on_by(WORD pa0);
void sob3(void);
void hat_sliced_xfer(void);
void lop_a_piece_off(void);
void lopped_piece(void);

void lao_tornado(void);
void tornado_sucked(void);
void normal_spin_intro(void);
void nado_sounds(void);

void cyrax_helecopter(void);
void hele_cutup(void);
void hele_slice(void);
void hele_sleep(void);
void hele_sound(void);

void cyrax_self_destruct(void);
void animate_a11(WORD pa0);

void jax_grow(void);
void r_jax_stomp(void);
void grow_victum(void);
void ground_scaled_jax(OIMGTBL *pa5);
short get_scaled_x_size(OIMGTBL *pa5);

void jax_slice(void);
void get_sliced_up(void);
void post_sliced_up(void);
void slice_fall(void);
void cutup_correct_pal(void);

void robo_flame_throw(void);

void lia_hair_spin(void);
void slide_behind_hair(void);
void hair_spin(void);

void lia_scream_rip(void);
void flesh_rip_sound(void);
void r_scream_ripped(void);
void rip_ani(void);
void initial_skeleton_shake(void);
void remaining_skel(void);
void skel_blood(void);
#define skinny_spawn create_fx(FX_SKINNY_BLOOD)

void sw_plant_bomb(void);
void attach_obj_to_him(void);

void swat_taser(void);
void r_taser(void);

void sz_lift_n_freeze(void);
void frozen_half_ani(void);
void liftshake(void);
void lifts3(OBJECT *pa0,short pa2);
void freeze_into_boomer(void);

void sz_blow(void);
void r_ice_blow(void);

void ind_zap_kill(void);
void r_ind_lightning(void);

void ind_light(void);
void light_sound_proc(void);
void light_animator(void);

void sonya_kiss_crusher(void);
void crusher_orb(void);
void crush_stuggle(void);
void crush_duck(void);
void crush_blood(void);

void sonya_kiss(void);
void kiss_orb(void);
void kissani(void);
void orb_sleep_1(void);

void robo_skeleton_burn(void);
void sb_skeleton_burn(void);
void skburn3(void);
void skel_fire_proc(void);

void kano_skeleton(void);
void skin_fall(void);
void death_shake(void);

void kano_lazer(void);
void local_r_laser(void);

void fat_robo_crush(void);
void adjust_top_and_bottom(short pa0,short pa1);
void crush_him_more(short pa1,WORD pa9frm,short pa9off);
void crush_sleep_5(void);
void create_arm_obj(void);
void a10_frame_a9(void);

void shocker_shaker(WORD pa11);
void fatal_offset(OBJECT *obj,short pa0,short pa1);
void sans_repell_for_good(void);
void fatality_start_pause(void);
void init_death_blow(WORD pa1);
void death_blow_fader(void);
void make_db_tone(void);
void death_blow_complete(void);
void do_pit_fatality(void);
void gravity_ani_ysize(long pa1,long pa10);
void make_him_face_me(void);

/*
 *	MACROS
 */
#define adjust_piece(_pa6,_pa1) ((OBJECT *)(_pa6))->oypos.u.intpos+=(_pa1)

#define wfe_him takeover_him(wait_forever)

/* death_scream */
#define death_scream group_sound(9)

#define bogus_dlist dlists=dlists_bogus

#define local_victory_animation stack_jump(victory_animation)

#define make_him_invisible set_inviso(current_proc->pdata.p_otherguy)
#endif /* __mk_mkfatal_h__ */

