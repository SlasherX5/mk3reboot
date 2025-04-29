/******************************************************************************
 File: mkguys.h

 By: David Schwartz

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III Guys Header
******************************************************************************/

#ifndef __mk_mkguys_h__
#define __mk_mkguys_h__

/*
 * 	DEFINITIONS
 */
#define PLAYER1_START_OFFSET SCX(0x60)			// start offset in world for p1
#define PLAYER2_START_OFFSET SCX(0x120)			// start offset in world for p2

/* normal animation definitions */
#define ANIM_STANCE 		0x00 			// 00 - ready pose
#define ANIM_WALKF 			0x01 			// 01 - walk forward
#define ANIM_WALKB 			0x02 			// 02 - walk backward
#define ANIM_TURN 			0x03 			// 03 - turn
#define ANIM_DUCK 			0x04 			// 04 - duck
#define ANIM_DUCKTURN 		0x05 			// 05 - duck turn
#define ANIM_DUCKBLOCK 		0x06 			// 06 - duck block
#define ANIM_DUCKHIT 		0x07 			// 07 - hit while ducking
#define ANIM_DUCKPUNCH 		0x08 			// 08 - duck punch
#define ANIM_DUCKKICKH 		0x09 			// 09 - duck kick high
#define ANIM_DUCKKICKL 		0x0a 			// 0a - duck kick low
#define ANIM_UPPERCUT 		0x0b 			// 0b - uppercut
#define ANIM_STANDBLOCK 	0x0c 			// 0c - standing block
#define ANIM_VICTORY		0x0d			// 0d - victory
#define ANIM_HIPUNCH		0x0e 			// 0e - hi punch
#define ANIM_LOPUNCH		0x0f 			// 0f - lo punch
#define ANIM_ELBOW 			0x10 			// 10 - elbow
#define ANIM_HIKICK 		0x11 			// 11 - hi kick
#define ANIM_MEDKICK		0x12 			// 12 - lo/med kick
#define ANIM_LOKICK			0x12 			// 12 - lo/med kick
#define ANIM_KNEE 			0x13 			// 13 - knee
#define ANIM_SWEEP 			0x14 			// 14 - sweep kick
#define ANIM_RHOUSE			0x15 			// 15 - roundhouse kick
#define ANIM_JUMPUP 		0x16 			// 16 - jump straight up
#define ANIM_JUMPUPKICK		0x17 			// 17 - jump straight up kick
#define ANIM_FLIPPUNCH 		0x18 			// 18 - flip punch
#define ANIM_FLIPKICK 		0x19 			// 19 - flip kick
#define ANIM_FFLIP 			0x1a 			// 1a - forward flip
#define ANIM_BFLIP 			0x1b 			// 1b - backward flip
#define ANIM_HITHI 			0x1c 			// 1c - hit high
#define ANIM_HITLO 			0x1d 			// 1d - hit low
#define ANIM_KDOWN 			0x1e 			// 1e - knocked down
#define ANIM_SWEEPFALL 		0x1f 			// 1f - sweep fall
#define ANIM_STUMBLE 		0x20 			// 20 - stumble back
#define ANIM_GETUP 			0x21 			// 21 - normal getup
#define ANIM_SWEEPUP 		0x22 			// 22 - getup from sweep kick
#define ANIM_THROW 			0x23			// 23 - throw
#define ANIM_ZAP 			0x24 			// 24 - throwing fireball
#define ANIM_DIZZY 			0x25			// 25 - dizzy
#define ANIM_FB_KANO		0x26 			// 26 - flipped by kano
#define ANIM_FB_SONYA		0x27 			// 27 - flipped by sonya
#define ANIM_FB_JAX			0x28 			// 28 - flipped by jax
#define ANIM_FB_IND			0x29 			// 29 - flipped by indian
#define ANIM_FB_SZ			0x2a 			// 2a - flipped by subzero
#define ANIM_FB_SWAT		0x2b 			// 2b - flipped by swat
#define ANIM_FB_LIA			0x2c 			// 2c - flipped by lia
#define ANIM_FB_ROBO1		0x2d 			// 2d - flipped by robo1
#define ANIM_FB_ROBO2		0x2e 			// 2e - flipped by robo2
#define ANIM_FB_LAO			0x2f 			// 2f - flipped by lao
#define ANIM_FB_TUSK		0x30 			// 30 -	flipped by tusk
#define ANIM_FB_SG			0x31 			// 31 -	flipped by sheeva
#define ANIM_FB_ST			0x32 			// 32 -	flipped by shang
#define ANIM_FB_LK			0x33 			// 33 -	flipped by lkang
#define ANIM_FB_SMOKE		0x34 			// 34 -	flipped by smoke
#define ANIM_AFB_KANO		0x35 			// 35 - air flipped by kano
#define ANIM_LEGGED			0x36 			// 36 - legged by sonya
#define ANIM_PROJECTILE		0x37 			// 37 - projectile animation
#define ANIM_ROCKET			0x37 			// 37 - rocket
#define ANIM_SHOOK			0x38 			// 38 - shook by kano
#define ANIM_AFB_ROBO2		0x39			// 39 - air flipped by robo2
#define ANIM_ZOOM			0x3a 			// 3a - zoomed
#define ANIM_DUMMYC			0x3b 			// 3b -
#define ANIM_DUMMYD			0x3c 			// 3c -
#define ANIM_BACK_BROKE	0x3d 			// 3d - react to jax backbreaker
#define ANIM_RUN			0x3e			// 3e - run
#define ANIM_THUD			0x3f			// 3f - thud on death
#define ANIM_SCARED			0x40			// 40 - scared to death

#define ANIM_TABLE2_OFFSET 0x41				// total # of normal animations


/* jax special moves */
#define ANIM_JAX_QUAKE		0x00				// earth quake
#define ANIM_JAX_NOOGY		0x01				// noogy punch
#define ANIM_JAX_DASHP		0x02				// dash punch
#define ANIM_JAX_MORPH		0x03				// arm morph ala T9000
#define ANIM_JAX_GROW		0x04				// jax grow big
#define ANIM_JAX_BACK		0x05				// jax back breaker
#define ANIM_JAX_SNAP		0x06				// jax back break snap
#define ANIM_JAX_BOOT		0x09

/* sonya special moves */
#define ANIM_SONYA_LEG		0x00				// leg grab
#define ANIM_SONYA_BIKE		0x01				// bike kick
#define ANIM_SONYA_DKISS	0x02
#define ANIM_SONYA_SWAVE	0x03				// square wave
#define ANIM_SONYA_EBALL	0x04
#define ANIM_SONYA_GUTZ		0x05

/* kano special moves */
#define ANIM_KANO_AIR_SLAM	0x00				// body slam in air
#define ANIM_KANO_SKNIFE	0x01				// knife swipe
#define ANIM_KANO_SHAKE		0x02				// shake em up
#define ANIM_KANO_LASER		0x03
#define ANIM_KANO_RIP		0x04

/* lia special moves */
#define ANIM_LIA_SCREAM			0x00	// 0 - scream attack
#define ANIM_LIA_SHOCK			0x01	// 1 - shock wave
#define ANIM_LIA_FLY_UP			0x02	// 2 - fly straight up 0
#define ANIM_LIA_FLY_FORWARD  	0x03	// 3 - fly forward	  1
#define ANIM_LIA_FLY_BACKWARD	0x04	// 4 - fly backwards	  2
#define ANIM_LIA_UNFORWARD		0x05	// 5 - transition to normal float 3
#define ANIM_LIA_UNBACKOFF		0x06	// 6 -
#define ANIM_LIA_ANGLE_ZAP		0x07	// 7 - fireball
#define ANIM_LIA_TOP			0x08
#define ANIM_LIA_RIP			0x09
#define ANIM_LIA_HAIR			0x0a

/* sub zero special moves */
#define ANIM_SZ_SKYZAP		0x00				// throw ice into the air
#define ANIM_SZ_FREEZE_BLAST	0x01			// freeze explosion
#define ANIM_SZ_SLIDE		0x02				// slide attack
#define ANIM_SZ_BLOW		0x03
#define ANIM_SZ_THUD		0x04
#define ANIM_SZ_LIFT		0x05
#define ANIM_SZ_BOOMER		0x06

/* indian special moves */
#define ANIM_IND_HORZ		0x00				// horizontal swipe
#define ANIM_IND_AXE_CHOP	0x01				// axe chop
#define ANIM_IND_AXE_UP		0x02				// axe up
#define ANIM_IND_REFLECT	0x03				// reflect
#define ANIM_IND_CHARGE		0x04				// forward charge
#define ANIM_IND_SKY_LIGHT	0x05
#define ANIM_IND_SKY_ZAP	0x06
#define ANIM_IND_OCHOP		0x07

/* robot speical moves */
#define ANIM_ROBO_CHEST		0x00				// check open
#define ANIM_ROBO_NET		0x01				// net
#define ANIM_ROBO_BOLT		0x02				// robo dizzy bolt
#define ANIM_ROBO_TELEPUNCH	0x03				// teleport punch
#define ANIM_ROBO_BOMB		0x04				// robos bomb
#define ANIM_ROBO_TARGET	0x05				//
#define ANIM_ROBO_AIR_SLAM	0x06				// air slam
#define ANIM_ROBO_TELE_EXP	0x07				// teleport explode
#define ANIM_ROBO_CRUSH_ARMS 0x08				// robos crushin arms
#define ANIM_ROBO_CRUSH_BLOOD 0x09				//
#define ANIM_ROBO_FLAME		0x0a				// toast the dude
#define ANIM_ROBO_4BAR		0x0b
#define ANIM_ROBO_INVISO	0x0b				// smoke inviso move
#define ANIM_ROBO_SPEAR		0x0c
#define ANIM_ROBO_DESTRUCT	0x0d
#define ANIM_ROBO_HELI		0x0e
#define ANIM_ROBO_ARMBOMB	0x0f
#define ANIM_ROBO_EARTH		0x10
#define ANIM_ROBO_SBOMB		0x11

/* shang tsu moves */
#define ANIM_ST_MORPH	0x00
#define ANIM_ST_SOUL	0x11
#define ANIM_ST_SUMMON 	0x12
#define ANIM_ST_FIRE	0x13
#define ANIM_ST_SPIKE	0x14
#define ANIM_ST_SPIKEBED	0x15

/* tusk moves */
#define ANIM_TUSK_AIR_ZAP 0x00
#define ANIM_TUSK_BLUR	0x01
#define ANIM_TUSK_BLADE	0x02
#define ANIM_TUSK_GLOW	0x03
#define ANIM_TUSK_TUBE	0x05
#define ANIM_TUSK_UGLY	0x06
#define ANIM_TUSK_UGLY2	0x07
#define ANIM_TUSK_TOP	0x0b			// mod from arcade, need tusk dude to have top move

/* swat special moves */
#define ANIM_SWAT_BOMB		0x00
#define ANIM_SWAT_ZOOM		0x01
#define ANIM_SWAT_STICK		0x02
#define ANIM_SWAT_TASER		0x03
#define ANIM_SWAT_BOMBER	0x04

/* kung lao special moves */
#define ANIM_LAO_TELE_BLUR	0x00				// 0 - tele blur
#define ANIM_LAO_HAT_RING	0x01				// 1 - hat rings
#define ANIM_LAO_SPIN		0x02
#define ANIM_LAO_TOP		0x03
#define ANIM_LAO_SLICE		0x04

/* she goro special moves */
#define ANIM_SG_POUNCE		0x00
#define ANIM_SG_POUND		0x02
#define ANIM_SG_RIP			0x03
#define ANIM_SG_SMEXPLODE 0x05

/* liu kang */
#define ANIM_LK_ZAP_LO		0x00
#define ANIM_LK_ZAP_AIR		0x01
#define ANIM_LK_BIKE		0x02
#define ANIM_LK_SKANG		0x03
#define ANIM_LK_FIRE		0x05
#define ANIM_LK_REFORM		0x06
#define ANIM_LK_MK1GAME		0x0a

/* generals */
#define ANIM_SHOCKER			15
#define ANIM_OCHAR_POUND	15
#define ANIM_OCHAR_FLOAT	15
#define ANIM_SB_SKEL			16
#define ANIM_ROBO_SKEL		16
#define ANIM_OCHAR_RIP		16
#define ANIM_OCHAR_CUTUP	17
#define ANIM_OCHAR_HALF		17
#define ANIM_OCHAR_REACH	18

#define ANIM_BABY_LETTER	21
#define ANIM_GROUND_EXP		22
#define ANIM_OCHAR_BABY		23

#define ANIM_ANIMALITY		24
#define ANIM_FT1_ANIMAL		25
#define ANIM_FT2_ANIMAL		26

#define ANIM_FRIEND				27
#define ANIM_SHIP					28
#define ANIM_F1_FRIEND		29
#define ANIM_F2_FRIEND		30
#define ANIM_F3_FRIEND		31
#define ANIM_F4_FRIEND		32

#define ANIM_FATALITY			33
#define ANIM_BLOOD_EXP		34
#define ANIM_ARM					35
#define ANIM_ARM2					36
#define ANIM_LEG					37
#define ANIM_LEG2					38
#define ANIM_BONE					39
#define ANIM_PORK					40
#define ANIM_CAGE					41
#define ANIM_SKULL				42
#define ANIM_GARM					43
#define ANIM_LIMB					44

#define ANIM_LAST_ENTRY		0x100



/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
extern WORD *character_palettes_1[2][32];
extern WORD *character_palettes_2[2][32];

void setup_players(void);
void init_p_others(void);
void setup_player_1(void);
void setup_player_2(void);
void get_player_palette(void *);
void make_player_1_obj(void);
void make_player_2_obj(void);
void set_x_woff(OBJECT *pa8);
OBJECT *make_player_obj(WORD,WORD,WORD,WORD,void *,void *);
void *get_char_ani(WORD,short);
 void ground_ochar(void);
void player_normpal(void);
void stance_setup(void);
LONG get_walk_info_b(void);
LONG get_walk_info_f(void);
void player_swpal_a0_image(void *);
void player_froze_pal(void);
WORD q_nice_pal(void);

/* robo stuff */
void shock_init(void);
void shock_check(void);
void stun_speed_3(void);
void stun_speed_6(void);
void set_a10_to_him(void);
void set_a10_to_slave(void);

extern void *PUFF1[];
extern void *explode_fx_anims[];

extern void *a_puff[];
extern void *a_dave_explode[];
extern void *a_ground_explode[];
extern void *a_small_explode[];

/* sonya stuff */
void sonya_zap_pal(void);
void lineup_number_2(void);
void ochar_bank_bit(OBJECT *pa8);

#define mot_anitab1 lk_anitab1
#define mot_anitab2 lk_anitab2

// external palettes
extern WORD JAX2PRP_P[];
extern WORD JZX2GRN_P[];
extern WORD LK2RED_P[];
extern WORD LK2YELO_P[];


/* shadow pal */
extern WORD SHADOW_P[];

/* lia pal */
extern WORD LPRP_P[];
extern WORD LBLU_P[];
extern WORD BLUESCR_P[];
extern WORD SPARK_P[];
extern WORD LSKUL_P[];
extern WORD SHOCK_P[];
extern WORD LIFLASH_P[];
extern WORD LIASPIT_P[];
extern WORD LIXPLOD_P[];

/* jax pal */
extern WORD JAXPRP_P[];
extern WORD JZXGRN_P[];
extern WORD JAX2PRP_P[];
extern WORD JZX2GRN_P[];
extern WORD JAXGRN_P[];
extern WORD JQAK_P[];
extern WORD JAXPOW_P[];
extern WORD JXPROJT_P[];
extern WORD JXPREXP_P[];
extern WORD JAXPOW_P[];

/* sonya pal */
extern WORD SBGREEN_P[];
extern WORD sbENG_p[];
extern WORD sbzap_p[];
extern WORD dROP_p[];
extern WORD SPARKIS_P[];
extern WORD KISSORB_P[];
extern WORD SBLTBLU_P[];
extern WORD sbENG2_p[];

/* lao pal */
extern WORD KUNG_P[];
extern WORD LHATGLO_P[];
extern WORD LAHAT_P[];
extern WORD KUNGBLU_P[];

/* kano pal */
extern WORD KANOBLU_P[];
extern WORD KANORED_P[];
extern WORD SABER_P[];

/* indian pal */
extern WORD INBLU_P[];
extern WORD INYEL_P[];
extern WORD GRNFLM_P[];
extern WORD UPAXE_P[];
extern WORD ind_shadow_p[];

/* subzero pal */
extern WORD SZBLU_P[];
extern WORD SZBLUGR_P[];
extern WORD FRZBLST_P[];
extern WORD IC013P[];

/* freeze palettes */
extern WORD SBFROZN_P[];
extern WORD INFROZN_P[];
extern WORD LIFROZN_P[];
extern WORD OBFROZN_P[];
extern WORD KLFROZN_P[];
extern WORD JXFROZN_P[];
extern WORD RBFROZN_P[];
extern WORD SZFROZN_P[];
extern WORD KNFROZN_P[];
extern WORD SHFROZN_P[];
extern WORD TRFROZN_P[];
extern WORD TSFROZN_P[];
extern WORD LUFROZN_P[];
extern WORD white_froze_p[];
extern WORD sk_shadow_p[];

/* swat pal */
extern WORD OBRED_P[];
extern WORD OLTBLU_P[];
extern WORD CPBLAST_P[];
#define OBBLU_P OLTBLU_P

/* robo1 pal */
extern WORD ROBO_P[];
extern WORD MECARM_P[];
extern WORD ROCKET_P[];
extern WORD TARGET_P[];
extern WORD NET_P[];
extern WORD ROBSHKB_P[];
extern WORD ROBOMB_P[];

extern WORD R1PAL1_P[];
extern WORD R1PAL2_P[];

/* robo2 pal */
extern WORD ROBO3_P[];
extern WORD ROBOGLD_P[];

extern WORD R2PAL1_P[];
extern WORD R2PAL2_P[];

/* tusk palette */
extern WORD TSKTAN_P[];
extern WORD TSBLU_P[];

/* she goro palette */
extern WORD FGRED_P[];
extern WORD FGGREEN_P[];
extern WORD FGBLUE_P[];

/* shang tsu palette */
extern WORD TSRED_P[];
extern WORD TSYEL_P[];
extern WORD GLOW_P[];
extern WORD FIRE_P[];

/* liu kang palette */
extern WORD LKRED_P[];
extern WORD LKYELO_P[];

/* motaro palettes */
extern WORD MOTARO_P[];

/* shao kahn palette */
extern WORD BGPAL1_P[];

/* noob saibot palette */
extern WORD noob_p[];

/* smoke palette */
extern WORD SMOKE1_P[];
extern WORD SMOKE2_P[];

/*
 *	MACROS
 */

#define JOY_1_PROC joy_begin
#define JOY_2_PROC joy_begin

/* player switch palette */
#define player_swpal(_proc,_pal,_obj) \
		swpal((_pal),(_obj)),(current_proc->pdata.p_flags|=PM_ALT_PAL)

#endif /* __mk_mkguys_h__ */

