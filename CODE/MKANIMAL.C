/******************************************************************************
 File: mkanimal.c

 Date: Jan 1995

 (C) Williams Entertainment

 Mortal Kombat III Animality Routines
******************************************************************************/

#define ANIMAL 0

/* INCLUDES */
#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif /* SONY_PSX */

#include "mkbkgd.h"
#include "mkos.h"
#include "mkobj.h"
#include "mkfx.h"
#include "mkutil.h"
#include "mkani.h"
#include "mkgame.h"
#include "mkjoy.h"
#include "moves.h"
#include "mkcanned.h"
#include "mkguys.h"
#include "mkanimal.h"
#include "mkfatal.h"
#include "mkblood.h"
#include "mkpal.h"
#include "mkfile.h"
#include "mksound.h"
#include "valloc.h"
#include "psxspu.h"

JUMPTBL ochar_animalities[]=
{
	kano_spider,            // 0
	sonya_eagle,            // 1
	jax_lion,               // 2
	indian_wolf,            // 3
	sz_polar,               // 4
	swat_dino,              // 5
	sindel_wasp,            // 6
	sektor_bat,             // 7
	cyrax_shark,            // 8
	lao_cheetah,            // 9
	kabal_skeleton,         // 10
	sheeva_scorpion,                // 11
	shang_tsung_snake,      // 12
	liu_kang_dragon,                // 13
	smoke_bull_shit         // 14
};

//extern void*animality_anims[];
/******************************************************************************
 Function: void do_animality(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   perform fighter animality
******************************************************************************/
void do_animality(void)
{
	animality_start_pause();
	init_special(current_proc->pa8);
	ochar_animalities[(current_proc->pa8)->ochar]();
}

void animality_start_pause(void)
{
	OBJECT *obj=current_proc->pa8;

	psxspu_start_cd_fade(FADE_TIME,0);

	init_death_blow(FAT_ANIMALITY);

	/* load animality file data */
	player_heap_adj();
	character_texture_load(obj->ochar,obj->over,CHAR_ANIMAL,finish_heap_ptr,ASYNC_LOAD|FATAL_LOAD,obj == p1_obj ? 0 : 1);

	/* sleep for fade */
	process_sleep(0x20);

#if _CD_VERSION_ == 1
	while ( psxcd_async_on() )
		process_sleep(1);                               // what for async load to complete
	module_os_close(module_int);                    // make sure to close async file
#endif

	/* load animality sound data */
	if ( obj==p1_obj )
		PsxSoundLoadFighter1Animality(p1_obj->ochar);
	else PsxSoundLoadFighter2Animality(p2_obj->ochar);

#if 1
	/* sony add for memory */
	player_heap_ptr=(current_proc->pa8)->oheap;
	(current_proc->pa8)->oheap=finish_heap_ptr;             // make sure and restore at end of friendship
#endif

	f_no_bonus=0;                                                           // allow bonus routine to do its thing

	return;
}

/******************************************************************************
 Function: void cyrax_shark(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   cyrax shark
******************************************************************************/
//extern void *a_shark[];
void cyrax_shark(void)
{
	animality_tune();
	//current_proc->pa9=a_shark;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);

	sans_repell_for_good();
	kill_and_stop_scrolling();

	towards_x_vel(current_proc,current_proc->pa8,SCX(0xa0000));
	process_sleep(8);
	kill_repell;
	set_noedge(current_proc->pa8);
	process_sleep(0x50-8);

	tsound(0x3a);                           // roar
	stop_me(current_proc->pa8);
	match_me_with_him();
	ground_player(current_proc->pa8);
	a8_back_minus_1(current_proc->pa8);
	mframew(4);

	takeover_him(eaten_by_shark);
	shake_a11(0xa,0xa);

	process_sleep(4);
	mframew(3);
	set_inviso(current_proc->pa8);
	process_sleep(0x30);
	clear_inviso(current_proc->pa8);

	//current_proc->pa9=a_shark;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

void eaten_by_shark(void)
{
	death_scream;
	create_fx(FX_STAND_BLOOD);
	process_sleep(6);
	//create_fx(FX_STAND_BLOOD);
	process_sleep(6);
	create_fx(FX_STAND_BLOOD);
	process_sleep(6);

	eaten_by_snake();
}

void eaten_by_snake(void)
{
	tsound(0x24);
	tsound(0x25);                   // crunchy
	shake_a11(0xa,0xa);

	set_inviso(current_proc->pa8);
	wait_forever();
}

/******************************************************************************
 Function: void lao_cheetah(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   lao cheetah
******************************************************************************/
//extern void *a_cheetah[];
void lao_cheetah(void)
{
	animality_tune();
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	//current_proc->pa9=a_cheetah;

	sans_repell_for_good();
	process_sleep(0x18);

	tsound(0x3c);
	towards_x_vel(current_proc,current_proc->pa8,SCX(0x30000));
	mframew(7);

	takeover_him(lion_mauled);
	away_x_vel(current_proc->pdata.p_otherproc,current_proc->pdata.p_otherguy,SCX(0x20000));
	mframew(6);

	stop_me(current_proc->pa8);
	process_sleep(8);
	stop_him(current_proc->pdata.p_otherguy);

	animate_a0_frames(0x5,0x10);

	//current_proc->pa9=a_cheetah;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	find_part_a14(5);
	do_next_a9_frame(current_proc->pa8);
	wfe_him;
	process_sleep(0x28);

	//current_proc->pa9=a_cheetah;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

/******************************************************************************
 Function: void liu_kang_dragon(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   lk dragon
******************************************************************************/
//extern void *a_dragon[];
void liu_kang_dragon(void)
{
	animality_tune();
	//current_proc->pa9=a_dragon;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	process_sleep(0x30);

	mframew(4);
	takeover_him(bit_in_half);
	shake_a11(0xa,0xa);
	process_sleep(0x40);

	mframew(4);

	process_sleep(0x30);
	//current_proc->pa9=a_dragon;
	tsound(0x27);
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

/******************************************************************************
 Function: void shang_tsung_snake(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   st snake
******************************************************************************/
//extern void *a_snake[];
void shang_tsung_snake(void)
{
	animality_tune();
	//current_proc->pa9=a_snake;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	a8_front_plus_1(current_proc->pa8);

	mframew(5);
	takeover_him(eaten_by_snake);
	shake_a11(0xa,0xa);

	process_sleep(0x20);

	mframew(5);

	process_sleep(0x40);
	//current_proc->pa9=a_snake;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

/******************************************************************************
 Function: void sheeva_scorpion(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   sheeva scorpion
******************************************************************************/
//extern void *a_scorpion[];
void sheeva_scorpion(void)
{
	animality_tune();
	//current_proc->pa9=a_scorpion;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);

	mframew(5);
	takeover_him(stung_by_scorpion);

	process_sleep(0x40*3);

	//current_proc->pa9=a_scorpion;
	tsound(0x27);
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	backwards_ani(5,0xffff);
	stack_jump(animality_complete);
}

WORD scorp_fade_tab[]={1,2,4,6,8,10,12,14,16,18,20,0xffff};

void stung_by_scorpion(void)
{
	face_opponent(current_proc->pa8);
	away_x_vel(current_proc,current_proc->pa8,SCX(0x40000));
	rsnd_stab();
	group_sound(2);
	animate_a9(5,ANIM_STUMBLE);

	/* now the poision sets in */
	stop_me(current_proc->pa8);
	death_scream;
	pose_a9(0,ANIM_SCARED);

	fade_this_pal((current_proc->pa8)->opal,6,3,scorp_fade_tab);

	shake_a8_up(current_proc->pa8,3,0,3,20);

	set_inviso(current_proc->pa8);
	create_fx(FX_LASER_EXPLODE);
	wait_forever();
}

/******************************************************************************
 Function: void kabal_skeleton(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   kabal skeleton
******************************************************************************/
//extern void *a_skeleton[];
void kabal_skeleton(void)
{
	animality_tune();
	//current_proc->pa9=a_skeleton;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);

	towards_x_vel(current_proc,current_proc->pa8,SCX(0x80000));
	mframew(4);

	takeover_him(dino_bucked);
	stop_me(current_proc->pa8);
	process_sleep(0x10);

	mframew(5);
	process_sleep(0x10);
	//current_proc->pa9=a_skeleton;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

void dino_bucked(void)
{
	createBLOOD_Proc(BLOOD_UPPERCUT);
	shake_a11(6,6);
	death_scream;
	rsnd_stab();

	flight(current_proc->pa8,SCX(0x30000),-SCY(0x150000),SCY(0x5000),4,ANIM_KDOWN);
	land_on_my_back();
}

/******************************************************************************
 Function: void sektor_bat(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   sektor bat
******************************************************************************/
//extern void *a_bat[];
void sektor_bat(void)
{
	animality_tune();

	center_around_him();

	//current_proc->pa9=a_bat;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	sans_repell_for_good();
	set_noedge(current_proc->pa8);

	init_anirate(3);

	ochar_sound(0x20);
	(current_proc->pa8)->ograv.pos=-SCY(0x2000);
	towards_x_vel(current_proc,current_proc->pa8,SCX(0x80000));
	animate_till_a11_stop(q_bat_1);

	stop_me(current_proc->pa8);
	match_me_with_him();
	flip_multi(current_proc->pa8);
	multi_adjust_xy(current_proc->pa8,-SCRRGT,-SCY(0x40));

	ochar_sound(0x20);
	towards_x_vel(current_proc,current_proc->pa8,SCX(0xa0000));
	animate_till_a11(q_bat_2);

	takeover_him(r_bat_bite);
	(long)(current_proc->pdata.p_otherproc)->pdata.p_store1=(current_proc->pa8)->oxvel.pos;
	animate_till_a11(q_bat_3);
	process_sleep(0x40);

	/* land/unmorph */
	stop_me(current_proc->pa8);
	match_me_with_him();
	flip_multi(current_proc->pa8);
	multi_adjust_xy(current_proc->pa8,-SCX(0x60),-SCRBOT);
	(current_proc->pa8)->oyvel.pos=SCY(0x50000);
	animate_till_a11_stop(q_bat_4);

	ground_player(current_proc->pa8);
	//current_proc->pa9=a_bat;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

WORD q_bat_4(void)
{
	if (distance_off_ground(current_proc,current_proc->pa8)>3)
		q_no;
	else q_yes;
}

WORD q_bat_3(void)
{
	if (get_x_dist<SCX(0x100)+35)
		q_no;
	else q_yes;
}

WORD q_bat_2(void)
{
	if (get_x_dist>SCX(0x20))
		q_no;
	else q_yes;
}

WORD q_bat_1(void)
{
	if (get_x_dist<SCX(0x100)+25)
		q_no;
	else q_yes;
}

//extern void*ochar_cutups[];
void r_bat_bite(void)
{
	void *ta0;
	ADDRESS animframe;
	OBJECT *obj;

	shake_a11(6,8);
	rsnd_stab();
	death_scream;
	createBLOOD_Proc(BLOOD_UPPERCUT);

	current_proc->a10=(ADDRESS)current_proc->pa8;
	set_inviso(current_proc->pa8);
	//ta0=COMPUTE_ADDR(&animality_anims,ochar_cutups[(current_proc->pa8)->ochar]);
	(current_proc->pa8)->oheap=(current_proc->pdata.p_otherguy)->oheap;             // get jax heap ptr (where cutup frames are)
	ta0=get_char_ani(ANIM_TABLE2,ANIM_OCHAR_CUTUP);         // get ptr to animation tables
	((ADDRESS*)ta0)+=(current_proc->pa8)->ochar;                                            // move to ptr of character
	ta0=COMPUTE_ADDR(((current_proc->pa8)->oheap),GET_LONG(ta0));           // get start of animation

	current_proc->pdata.p_store2=(ADDRESS)obj_free;
	current_proc->a11=20;

	/* bb3 */
	do
	{
		animframe=GET_LONG(ta0)++;
		if ( animframe==0 )
			break;

		//animframe=(ADDRESS)COMPUTE_ADDR(&animality_anims,animframe);
		//gso_dmawnz(obj,animframe,animality_anims,0);
		//alloc_cache((OIMGTBL *)animframe,&animality_anims,obj);
		animframe=(ADDRESS)COMPUTE_ADDR((current_proc->pa8)->oheap,animframe);
		gso_dmawnz(obj,(ADDRESS)animframe,(current_proc->pa8)->oheap,0);
		alloc_cache((OIMGTBL *)animframe,(current_proc->pa8)->oheap,obj);
		cutup_correct_pal();

		lineup_1pwm(obj,(OBJECT*)current_proc->a10);
		insert_object(obj,&objlst);
		obj->ozval=current_proc->a11;
		current_proc->a11--;

	} while (1);

	/* posts5 */
	obj=current_proc->pa8=(OBJECT*)current_proc->pdata.p_store2;
	obj->ozval+=FRONT_Z;
	obj->oxvel.pos=((long)current_proc->pdata.p_store1)>>1;
	gravity_ani_ysize(-SCY(0x20000),SCY(0x6000));
	rsnd_stab();

	gravity_ani_ysize(-SCY(0x20000),SCY(0x6000));
	rsnd_stab();

	wait_forever();
}

void animate_till_a11_stop(FUNCW pa11)
{
	animate_till_a11(pa11);
	stop_me(current_proc->pa8);
	return;
}

void animate_till_a11(FUNCW pa11)
{
	do
	{
		process_sleep(1);
		next_anirate();
	}
	while(pa11()==SYSTEM_CARRY_CLR);

	return;
}

/******************************************************************************
 Function: void smoke_bull_shit(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   smoke bull
******************************************************************************/
//extern void *a_bull[];
void smoke_bull_shit(void)
{
	animality_tune();

	//current_proc->pa9=a_bull;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);

	sans_repell_for_good();
	kill_and_stop_scrolling();
	towards_x_vel(current_proc,current_proc->pa8,SCX(0xa0000));
	process_sleep(1);
	kill_repell;

	init_anirate(4);

	/* bull4 */
	do
	{
		process_sleep(1);
		next_anirate();
	}
	while(get_x_dist>SCX(0x60));

	//current_proc->pa9=a_bull;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	find_part2();
	do_next_a9_frame(current_proc->pa8);
	stop_me(current_proc->pa8);
	shake_a11(0xa,0xa);

	takeover_him(hit_by_bull);

	process_sleep(0x60);

	//current_proc->pa9=a_bull;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	stack_jump(unmorph_and_exit);
}

void hit_by_bull(void)
{
	createBLOOD_Proc(BLOOD_UPPERCUT);
	shake_a11(0x6,0x6);
	death_scream;
	rsnd_stab();

	set_noedge(current_proc->pa8);

	away_x_vel(current_proc,current_proc->pa8,SCX(0x130000));
	if ( current_proc->pa8==p1_obj )
		(current_proc->pa8)->oxvel.pos=p1_xvel.pos;
	else (current_proc->pa8)->oxvel.pos=p2_xvel.pos;

	flight(current_proc->pa8,DONT_TOUCH,-SCY(0x80000),SCY(0x6000),4,ANIM_KDOWN);
	land_on_my_back();
}

/******************************************************************************
 Function: void sindel_wasp(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   sindel wasp
******************************************************************************/
//extern void *a_wasp[];
void sindel_wasp(void)
{
	LONG *hackptr;

	animality_tune();
	sans_repell_for_good();

	//current_proc->pa9=a_wasp;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(10);

	//WIN95: added to fix bug
	towards_x_vel(current_proc,current_proc->pa8,SCX(0x30000));

	animate_a0_frames(0x3,0x10);
	takeover_him(stung_a_bunch);
	face_him_at_me();

//*****************************************
	/* hack time, to avoid memory overflow, reuse comp memory area */
	hackptr=idcomp_ptr;
//*****************************************
	match_me_with_him();
	flip_multi(current_proc->pa8);
	multi_adjust_xy(current_proc->pa8,-SCX(0x28),-SCY(0x48));

	kill_and_stop_scrolling();

	no_edge_both_players();
	away_x_vel(current_proc->pdata.p_otherproc,current_proc->pdata.p_otherguy,SCX(0x30000));
	towards_x_vel(current_proc,current_proc->pa8,SCX(0x30000));

	//current_proc->pa9=a_wasp;
//*****************************************
	/* hack time, to avoid memory overflow */
	idcomp_ptr=hackptr;
//*****************************************
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	find_part2();
	find_part2();
	animate_a0_frames(4,0x1a);

	set_inviso(current_proc->pdata.p_otherguy);
	stop_me(current_proc->pa8);
	process_sleep(0x40);
	death_blow_complete();
	dallprc(PID_REPELL);

	player_normpal();

#if 1
	/* sony add for memory */
	(current_proc->pa8)->oheap=player_heap_ptr;             // make sure and restore at end of animality
#endif

	pose_a9(0,ANIM_STANCE);
	ground_ochar();
	(current_proc->pa8)->oypos.u.intpos+=SCY(0x90);
	(current_proc->pa8)->oxpos.u.intpos=worldtlx.u.intpos+SCX(0x60);

	(current_proc->pa8)->oyvel.pos=-SCY(0x20000);

	stack_jump(victory_animation);
}

void stung_a_bunch(void)
{
	process_sleep(8);
	death_scream;
	do
	{
		animate_a9(3,ANIM_HITHI);
	}
	while(1);
}

/******************************************************************************
 Function: void swat_dino(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   swat dinosaur
******************************************************************************/
//extern void *a_swat_dino[];
void swat_dino(void)
{
	animality_tune();

	//current_proc->pa9=a_swat_dino;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	sans_repell_for_good();

	tsound(0x3a);
	process_sleep(0x30);

	mframew(5);
	shake_a11(0x8,0x8);
	takeover_him(bit_in_half);
	tsound(0x24);
	tsound(0x25);

	process_sleep(0x30);

	mframew(5);

	tsound(0x27);
	ground_player(current_proc->pa8);
	//current_proc->pa9=a_swat_dino;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	backwards_ani(5,0xffff);
	stack_jump(animality_complete);
}

//extern void*ochar_half_bodies[];
void bit_in_half(void)
{
	ADDRESS *animframe;

	shake_a11(0x6,0x6);
	death_scream;
	rsnd_stab();
	createBLOOD_Proc(BLOOD_DINO_BLOOD);

	//(current_proc->pa8)->oheap=&animality_anims;  // switch heap ptr
	//current_proc->pa9=(void*)&ochar_half_bodies[(current_proc->pa8)->ochar];
	(current_proc->pa8)->oheap=(current_proc->pdata.p_otherguy)->oheap;             // switch to heap with art
	get_char_ani(ANIM_TABLE2,ANIM_OCHAR_HALF);                                                                                      // get ptr to start of table
	((ADDRESS*)current_proc->pa9)+=(current_proc->pa8)->ochar;                      // index into table
	//current_proc->pa9=(void*)COMPUTE_ADDR((current_proc->pa8)->oheap,GET_LONG(animframe));        // get ptr to act frame

	animframe=(void*)COMPUTE_ADDR((current_proc->pa8)->oheap,GET_LONG(current_proc->pa9));
	animframe=(ADDRESS*)COMPUTE_ADDR((current_proc->pa8)->oheap,GET_LONG(animframe));
	((OIMGTBL*)animframe)++;                                        // get to palette ptr
	swpal((void *)GET_LONG(animframe),current_proc->pa8);

	current_proc->a10=(ADDRESS)current_proc->pa8;
	cutup_correct_pal();
	do_next_a9_frame(current_proc->pa8);
	wait_forever();
}

/******************************************************************************
 Function: void sz_polar(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   subzero polar
******************************************************************************/
//extern void *a_sz_polar[];
void sz_polar(void)
{
	animality_tune();

	//current_proc->pa9=a_sz_polar;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	sans_repell_for_good();
	process_sleep(0x30);

	tsound(0x3c);
	towards_x_vel(current_proc,current_proc->pa8,SCX(0x20000));
	mframew(5);

	takeover_him(lion_mauled);
	stop_me(current_proc->pa8);
	stop_him(current_proc->pdata.p_otherguy);

	animate_a0_frames(0x5,0x20);
	wfe_him;
	process_sleep(8);

	tsound(0x27);
	ground_player(current_proc->pa8);
	//current_proc->pa9=a_sz_polar;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	backwards_ani(5,0xffff);
	stack_jump(animality_complete);
}

/******************************************************************************
 Function: void kano_spider(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   kano spider
******************************************************************************/
//extern void *a_kano_spider[];
void kano_spider(void)
{
	OBJECT *obj;

	wfe_him;
	pose_him_a9(0,ANIM_SCARED);
	face_him_at_me();

	animality_tune();

	//current_proc->pa9=a_kano_spider;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(0x40);
	sans_repell_for_good();
	tsound(0x26);

	mframew(5);

	if ((current_proc->pdata.p_otherguy)->ochar==FT_SG)
	{
		multi_adjust_xy(current_proc->pa8,SCX(0x20),0); // nudfe for sheeva
	}

	/* spid3 */
	obj=current_proc->pa8;
	current_proc->pa8=current_proc->pdata.p_otherguy;
	createBLOOD_Proc(BLOOD_SPIDER);
	current_proc->pa8=obj;

	takeover_him(spider_shake);
	spider_shake_jsrp();

	//current_proc->pa9=a_kano_spider;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	find_part_a14(3);
	mframew(5);

	takeover_him(collapse_on_ground);
	process_sleep(0x30);
	tsound(0x27);
	mframew(5);
	stack_jump(animality_complete);
}

void spider_shake(void)
{
	spider_shake_jsrp();
	wait_forever();
}

void spider_shake_jsrp(void)
{
	shake_a8_up(current_proc->pa8,6,0,3,16);
	return;
}

/******************************************************************************
 Function: void sonya_eagle(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   sonya eagle
******************************************************************************/
//extern void *a_sonya_hawk[];
void sonya_eagle(void)
{
	PROCESS *ptemp;

	animality_tune();

	//current_proc->pa9=a_sonya_hawk;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);

	animal_morph(1);
	sans_repell_for_good();

	init_anirate(5);
	(current_proc->pa8)->ograv.pos=-SCY(0x2000);
	/* eagle3 */
	do
	{
		process_sleep(1);
		next_anirate();
	}
	while(distance_off_ground(current_proc,current_proc->pa8)<SCY(0x38));

	stop_me(current_proc->pa8);

	/* eagle5 */
	do
	{
		process_sleep(1);
		towards_x_vel(current_proc,current_proc->pa8,SCX(0xa000));
		next_anirate();
	}
	while(get_x_dist>SCX(8));

	stop_me(current_proc->pa8);
	next_anirate_a10(0x30);

	(current_proc->pa8)->ograv.pos=-SCY(0x10000);
	(current_proc->pdata.p_otherguy)->ograv.pos=-SCY(0x10000);

	next_anirate_a10(0x18);
	stop_me(current_proc->pa8);
	stop_him(current_proc->pdata.p_otherguy);

	/* calla_for_him (death_scream */
	ptemp=current_proc;
	current_proc=current_proc->pdata.p_otherproc;
	death_scream;
	current_proc=ptemp;

	process_sleep(0x30);

	ptemp=create_fx_for_him(FX_SONYA_ANIMIAL);
	ptemp->pdata.p_otherguy=current_proc->pa8;
	ptemp->pdata.p_otherproc=current_proc;

	shake_a11(0x8,0xc);
	tsound(0x24);
	tsound(0x25);
	process_sleep(0x20);

	tsound(0x24);
	tsound(0x25);
	process_sleep(0x10);
	death_blow_complete();
	wait_forever();
}

/******************************************************************************
 Function: void jax_lion(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   jax lion
******************************************************************************/
void jax_lion(void)
{
	animality_tune();

	//current_proc->pa9=a_jax_lion;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	sans_repell_for_good();
	process_sleep(0x30);

	towards_x_vel(current_proc,current_proc->pa8,SCX(0x20000));
	mframew(5);

	takeover_him(lion_mauled);

	stop_me(current_proc->pa8);
	stop_him(current_proc->pdata.p_otherguy);

	animate_a0_frames(0x5,0x20);
	wfe_him;
	process_sleep(8);

	tsound(0x27);
	//current_proc->pa9=a_jax_lion;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	backwards_ani(5,0xffff);

	stack_jump(animality_complete);
}

void lion_mauled(void)
{
	death_scream;
	face_opponent(current_proc->pa8);
	animate_a9(3,ANIM_KDOWN);
	mframew(3);

	/* maul3 */
	do
	{
		createBLOOD_Proc(BLOOD_LION);
		death_scream;
		tsound(0x24);
		shake_a8_up(current_proc->pa8,3,0,3,5);

		createBLOOD_Proc(BLOOD_LION);
		tsound(0x25);
		shake_a8_up(current_proc->pa8,5,0,3,3);
	}
	while(1);
}

/******************************************************************************
 Function: void indian_wolf(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   jax lion
******************************************************************************/
//extern void *a_indiam_wolf[];
void indian_wolf(void)
{
	animality_tune();

	//current_proc->pa9=a_indiam_wolf;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	animal_morph(18);
	sans_repell_for_good();
	process_sleep(0x18);

	tsound(0x3c);
	towards_x_vel(current_proc,current_proc->pa8,SCX(0x20000));
	mframew(5);

	takeover_him(lion_mauled);
	away_x_vel(current_proc->pdata.p_otherproc,current_proc->pdata.p_otherguy,SCX(0x20000));

	animate_a0_frames(0x6,0x2);
	stop_me(current_proc->pa8);
	process_sleep(8);
	stop_him(current_proc->pdata.p_otherguy);

	animate_a0_frames(5,10);

	//current_proc->pa9=a_indiam_wolf;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	find_part_a14(4);
	do_next_a9_frame(current_proc->pa8);
	wfe_him;
	process_sleep(0x28);

	tsound(0x27);
//      current_proc->pa9=a_indiam_wolf;
	get_char_ani(ANIM_TABLE2,ANIM_FT1_ANIMAL);
	backwards_ani(5,0xffff);

	stack_jump(animality_complete);
}

/******************************************************************************
 Function: void next_anirate_a10(WORD pa10)

 By: David Schwartz

 Date: May 1995

 Parameters: pa10 - # of frames to animate

 Returns: None

 Description:   animate
******************************************************************************/
void next_anirate_a10(WORD pa10)
{
	do
	{
		process_sleep(1);
		next_anirate();
	}
	while(--pa10>0);

	return;
}

/******************************************************************************
 Function: void create_fx_for_him(WORD pa0)

 By: David Schwartz

 Date: May 1995

 Parameters: pa0 - fx #

 Returns: None

 Description:   set other dude fx
******************************************************************************/
PROCESS *create_fx_for_him(WORD pa0)
{
	OBJECT *ta8=current_proc->pa8;
	PROCESS *ptemp;

	current_proc->pa8=current_proc->pdata.p_otherguy;
	ptemp=create_fx(pa0);
	current_proc->pa8=ta8;

	return(ptemp);
}

/******************************************************************************
 Function: void unmorph_and_exit(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: None

 Description:   revert to normal
******************************************************************************/
void unmorph_and_exit(void)
{
	backwards_ani(5,0xffff);
	animality_complete();
}

/******************************************************************************
 Function: void animal_morph(WORD pa10)

 By: David Schwartz

 Date: May 1995

 Parameters: pa10 -sleep time

 Returns: None

 Description:   change into the beast within
******************************************************************************/
//extern void *animality_anims[];
void animal_morph(WORD pa10)
{
	ADDRESS *animframe;
	OBJECT *obj=current_proc->pa8;

	process_sleep(0x20);

#if 0
	/* sony add for memory */
	heap_ptr=(current_proc->pa8)->oheap;
	(current_proc->pa8)->oheap=animality_anims;             // make sure and restore at end of animality
#endif

	animframe=(ADDRESS *)COMPUTE_ADDR(obj->oheap,GET_LONG(current_proc->pa9));
	animframe=(ADDRESS *)COMPUTE_ADDR(obj->oheap,GET_LONG(animframe));
	((OIMGTBL *)animframe)++;                               // get ptr palette
	player_swpal(current_proc,(void*)GET_LONG(animframe),current_proc->pa8);
	do_next_a9_frame(current_proc->pa8);
	process_sleep(0x10);

	tsound(0x27);
	mframew(5);

	process_sleep(pa10);
	return;
}

WORD TUNE_ANIMAL[] = { TUNE_ANIMAL1, 0 };

void animality_tune(void)
{
	//send_code_a3(0x3a);
	play_generic_tune(TUNE_ANIMAL);

	if ( f_music!=0 )
	{
//WIN95:
		process_sleep(100);
#if 0 
#if _CD_VERSION_ == 1
		while ( psxcd_elapsed_sectors()<75)
			process_sleep(1);
#endif
#endif 
	}
	return;
}

void animality_complete(void)
{
	death_blow_complete();
	player_normpal();

#if 1
	/* sony add for memory */
	(current_proc->pa8)->oheap=player_heap_ptr;             // make sure and restore at end of animality
#endif

	stack_jump(victory_animation);
}

void face_him_at_me(void)
{
	PROCESS *ptemp;

	/* calla_for_him */
	ptemp=current_proc;
	current_proc=current_proc->pdata.p_otherproc;
	face_opponent(current_proc->pa8);
	current_proc=ptemp;

	return;
}

void kill_and_stop_scrolling(void)
{
	stop_scrolling();
	dallprc(PID_SCROLL);
	return;
}

void center_around_him(void)
{
	PROCESS *ptemp;

	/* calla_for_him */
	ptemp=current_proc;
	current_proc=current_proc->pdata.p_otherproc;
	center_around_me();
	current_proc=ptemp;

	return;
}

