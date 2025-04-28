/******************************************************************************
 File: mksound.h

 By: David Schwartz

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III sound Header
******************************************************************************/

#ifndef __mk_mksound_h__
#define __mk_mksound_h__

#include "mk3snd.h"

/*
 * 	DEFINITIONS
 */

/* sound priorities */
#define SP_WOOSH1	0x10*0x100
#define SP_GROUND	0x18*0x100
#define SP_BLOCK1	0x1f*0x100

#define SP_DONTIN	0x30*0x100		// 30s = dont interupt myself
#define SP_RUNRUN	0x31*0x100

#define SP_ONLY1	0x40*0x100		// 40s = special (dont overlap)
#define SP_WINDY1	0x41*0x100

#define SP_EFFECT	0x50*0x100
#define SP_HIT1		0x55*0x100
#define SP_VOICE1	0x60*0x100
#define SP_HIT2		0x61*0x100
#define SP_KAHNVC	0x62*0x100
#define SP_COIN		0x7f*0x100

/* group offsets */
#define GP_FEMALE	  0
#define GP_MALE1	  1
#define GP_MALE2	  2
#define GP_MALE3	  3
#define GP_MALE4	  4
#define GP_ROBO		  5
#define GP_KANG		  6
#define GP_SHEEVA	  7
#define GP_SHAO_KAHN  8

/* tracks of the various tunes */
//>>>> find where this is being played 
//#define TRK_02				6 	//2
//#define TRK_LADDER_STRT  		10 	//3		/* ladder start screen, ONEPLAY0.RAW */
//#define TRK_ATTRACT	  			14	//4		/* attract mode, SLOWATTR.RAW */
//#define TRK_OPT_ATTRACT 		12	//5		/* attract mode, FASTATTR.RAW */
//#define TRK_VS					9 	//6		/* versus screen, VERSUSSC.RAW */
//#define TRK_SELECT		 		8 	//7		/* select screen, SELECTSC.RAW */
//#define TRK_BUYIN				3 	//8		/* buyin screen, BUYIN.RAW */
//#define TRK_YOUWIN				9 	//15
//#define TRK_BABYP1			6 	//10 	/* babality ending part 1, FATAL1.RAW */
//#define TRK_FATALP1			6 	//10		/* fatality ending part 1, FATAL1.RAW */
//#define TRK_FATALP3 			-1 	//11		/* fatality ending part 3, SKFATAL.RAW */
//#define TRK_ANIMALP1			16 	//12		/* animality ending part 1, ANIMAL1.RAW */
//#define TRK_ANIMALP3			-1 	//13		/* animality ending part 3, ANIMALIT.RAW */
//#define TRK_BABYP3				5 	//14		/* babality ending part 3, BABALITY.RAW */
//#define TRK_FRIENDP1			4 	//15		/* friendship ending part 1, FRIEND1.RAW */
//#define TRK_FRIENDP3			-1 	//16		/* friendship ending part 3, SKFRIEND.RAW */
//#define TRK_BANK				40 	//17		/* bank background, BANK.RAW */
//#define TRK_THRUBANK			34 	//18		/* thru bank to city , THRUBANK.RAW */
//#define TRK_PIT					46 	//19		/* the pit background, THEPIT.RAW */
//#define TRK_SOUL			 	24 	//20		/* souls background, GREENFLA.RAW */
//#define TRK_ROOF			 	34 	//21		/* city roof background, ROOF.RAW */
//#define TRK_CHURCH				29 	//22		/* temple background, CHRUCH.RAW */
//#define TRK_STREET				43 	//23		/* street background, STREET.RAW */
//>>>> double check what here 
//#define TRK_THRUSUB				43 	//24		/* thru subway to street, THRUSUBW.RAW */
//#define TRK_SUBWAY				37 	//25		/* subway background, TRAIN.RAW */
//#define TRK_HIDDEN				18 	//26		/* hidden background, SPECIALM.RAW */
//#define TRK_GRAVE			 	2 	//27		/* graveyard background, GRAVEYAR.RAW */
//#define TRK_BRIDGE				21	//28		/* bridge background, BRIDGE.RAW */

//#define TRK_SUBWAY_FIN				50// -
//#define TRK_STREET_FIN				51// -
//#define TRK_BANK_FIN				52// -
//#define TRK_ROOF_FIN				53// -
//#define TRK_PIT_FIN					54// -
//#define TRK_BRIDGE_FIN				55// -
//#define TRK_SOUL_FIN				56// -
//#define TRK_CHURCH_FIN				57// -
//#define TRK_GRAVE_FIN				58// -

//Win95: UNSED PUT BACK INTO LCD FILES 
#define TRK_KANO_WINS						-1 //33		/* all winning endings, STcharacter.RAW */
#define TRK_SONYA_WINS              		-1 //30
#define TRK_JAX_WINS                		-1 //35
#define TRK_INDIAN_WINS             		-1 //45
#define TRK_SUBZERO_WINS            		-1 //32
#define TRK_SWAT_WINS               		-1 //43
#define TRK_LIA_WINS                		-1 //40
#define TRK_ROBO1_WINS              		-1 //44
#define TRK_ROBO2_WINS              		-1 //36
#define TRK_LAO_WINS                		-1 //39
#define TRK_TUSK_WINS               		-1 //34
#define TRK_SHEEVA_WINS             		-1 //31
#define TRK_SHANG_WINS              		-1 //41
#define TRK_LIUKANG_WINS            		-1 //38
#define TRK_SMOKE_WINS              		-1 //37
#define TRK_MOTARO_WINS             		-1 //42
#define TRK_SK_WINS                 		-1 //29
#define TRK_FLAWLESS						-1 //62 	//46		/* flawless victory, STFLAWLS.RAW */
#define TRK_KANO_MERCY						-1 //59	//61		/* all mercy endings, SMcharacter.RAW */
#define TRK_SONYA_MERCY             		-1 //58	//60
#define TRK_JAX_MERCY               		-1 //49	//50
#define TRK_INDIAN_MERCY            		-1 //57	//59
#define TRK_SUBZERO_MERCY           		-1 //51	//53
#define TRK_SWAT_MERCY              		-1 //52	//54
#define TRK_LIA_MERCY               		-1 //56	//58
#define TRK_ROBO1_MERCY             		-1 //54	//56
#define TRK_ROBO2_MERCY             		-1 //46	//47
#define TRK_LAO_MERCY               		-1 //60	//62
#define TRK_TUSK_MERCY              		-1 //55	//57
#define TRK_SHEEVA_MERCY            		-1 //53	//55
#define TRK_SHANG_MERCY             		-1 //47	//48
#define TRK_LIUKANG_MERCY           		-1 //50	//52
#define TRK_SMOKE_MERCY             		-1 //48	//49
#define TRK_MOTARO_MERCY            		-1 //51

#define TRK_FIGHT					-1 //61	//79		/* fight, ROUND5.RAW */

/* wins with flawless streams */
#define TRK_KANO_FWINS				-1 //33 //	(63-30+33)		/* all winning endings, STcharacter.RAW */
#define TRK_SONYA_FWINS      		-1 //30	// 	(63-30+30)
#define TRK_JAX_FWINS        		-1 //35 //	 (63-30+35)
#define TRK_INDIAN_FWINS     		-1 //45 // 	(63-30+45)
#define TRK_SUBZERO_FWINS    		-1 //32 //	 (63-30+32)
#define TRK_SWAT_FWINS       		-1 //43 // 	(63-30+43)
#define TRK_LIA_FWINS        		-1 //40 //	 (63-30+40)
#define TRK_ROBO1_FWINS      		-1 //44 // 	(63-30+44)
#define TRK_ROBO2_FWINS      		-1 //36 //	 (63-30+36)
#define TRK_LAO_FWINS        		-1 //39 // 	(63-30+39)
#define TRK_TUSK_FWINS       		-1 //34	//	 (63-30+34)
#define TRK_SHEEVA_FWINS     		-1 //31	// 	(63-30+31)
#define TRK_SHANG_FWINS      		-1 //41	//	 (63-30+41)
#define TRK_LIUKANG_FWINS    		-1 //38	// 	(63-30+38)
#define TRK_SMOKE_FWINS      		-1 //37	//	 (63-30+37)
#define TRK_MOTARO_FWINS	 		-1 //42	// 	(63-30+42)

/* smod definitions */
#define SMOD_SELECT 	0x1
#define SMOD_FIGHT 		0x2
#define SMOD_REWARD 	0x3
#define SMOD_HIDDEN 	0x4
#define SMOD_SK_DEATH	0x5
#define SMOD_LADDER 	0x6
#define SMOD_CAST		0x7
#define SMOD_BUYIN		0x8
#define SMOD_VS			0x9
#define SMOD_GAMEOVER	0xa


/*
 *	RAM
 */
__EXTERN__ LONG snd_module_status;
__EXTERN__ WORD sound_background;

/*
 *	PROTOTYPES
 */
extern short triple_sndtab[];
extern short cd_vol_tbl[];

void group_sound(WORD);
void kill_group_sound(WORD,OBJECT *);
void his_group_sound(WORD);

void rsnd_splish(void);
void rsnd_stab(void);
void rsnd_enemy_boom(void);
void rsnd_klang(void);
void rsnd_footstep(void);
void rsnd_big_block(void);
void rsnd_small_block(void);
void rsnd_smack(void);
void rsnd_med_smack(void);
void rsnd_big_smack(void);
void rsnd_rocks(void);
void sweep_sounds(void);
void rsnd_ground(void);
void rsnd_whoosh(void);
void rsnd_big_whoosh(void);
void rsnd_react_voice(void);

void next_table_sound(WORD pa0,short *pa1);
void triple_sound(WORD pa0);
void tsnd0(short *pa0,WORD pan);
void playsnd(short id);

void psound_for_him(WORD offset);
void nosounds(void);
void send_code_a3(WORD pa3);

void hob_ochar_sound(WORD hit_off,WORD block_off);
void hit_or_blocked_sound(WORD hit_off,WORD block_off);

void ochar_sound(WORD);
void ochar_sound_stop(WORD);
void his_ochar_sound(WORD offset);
void rsnd_ochar_sound(WORD pa0l,WORD pa0h);
void borrow_ochar_sound(WORD pa0,WORD pa1);

void play_generic_tune(WORD* trklst);

void sound_module_fight(void);
void sound_module_load(WORD mod);

void rsnd_sk_bonus_win(void);

WORD sound_pan_value(void);
void sound_driver_config(void);

/*
 *	MACROS
 */
#define tsound(_off) triple_sound((_off))

#define local_group_sound(_pa0) group_sound(_pa0)

#define get_group_table(_ta0) group_table[_ta0]

#endif /* __mk_mksound_h__ */

