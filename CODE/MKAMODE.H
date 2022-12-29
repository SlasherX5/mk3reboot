/******************************************************************************
 File: mkamode.h

 By: David Schwartz

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III Attract Mode Header File
******************************************************************************/

#ifndef __mk_amode_h__
#define __mk_amode_h__

/*
 *	DEFINITIONS
 */
#define MKLOGO_TADA_SLEEP_TIME 40*3
#define AMODE_BIO_COUNT 12					/* # of bios that can be shown */

/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void amode(void);
void quote(void);
void amode_init(void);

void midway_presents(void);
void raiden_intro(void);
void title_page(void);
void coin_bio_fight(void);
void amode_story(WORD pa0);
void amode_demo_fight(void);
void coin_page(void);
void amode_init(void);
void amode_shutup(void);
void aama_message(void);
void amode_init_no_score(void);
void amode_oinit(void);
void amode_init_system(void);
void gover_amode_entry(void);
void amode_fade_retp(void);
void smooth_black_retp(void);
void amode_display_reset(void);

/*
 *	MACROS
 */
#define amode_coin_page	coinflag=0,coin_page()
#endif /* __mk_amode_h__ */
