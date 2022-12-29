/******************************************************************************
 File: mkbonus.h

 By: David Schwartz

 Date: Dec 1994

 (C) Williams Entertainment

 Mortal Kombat III bonus Header
******************************************************************************/

#ifndef __mk_mkbonus_h__
#define __mk_mkbonus_h__

/*
 * 	DEFINITIONS
 */


/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void bonus_count(void);
void kill_lingerings(void);
 char *get_winner_text(void);
void wait_for_bonusv(WORD sector);

/*
 *	MACROS
 */
#define get_winner_ochar ((winner_status==1)?p1_char:p2_char)

#endif /* __mk_mkbonus_h__ */

