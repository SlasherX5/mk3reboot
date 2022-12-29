/******************************************************************************
 File: mkguys.c

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III Fighter Routines
******************************************************************************/

/* INCLUDES */
#include "system.h"

#ifdef SONY_PSX
#include "mksony.h"
#endif /* SONY_PSX */

#include "mkbkgd.h"
#include "mkobj.h"

#include "mkos.h"
#include "mkfile.h"
#include "mkutil.h"
#include "mkani.h"
#include "mkgame.h"
#include "mkinit.h"
#include "mkpal.h"

#include "mkjoy.h"
#include "mkdrone.h"
#include "mkguys.h"
#include "psxsnd.h"

/* player select animation tables */
extern void *kano_panitab1[];
extern void *sonya_panitab1[];
extern void *jax_panitab1[];
extern void* jax2_panitab1[];
extern void *ind_panitab1[];
extern void *sz_panitab1[];
extern void *swat_panitab1[];
extern void *lia_panitab1[];
extern void *robo1_panitab1[];
extern void *robo2_panitab1[];
extern void *lao_panitab1[];
extern void *tusk_panitab1[];
extern void *sg_panitab1[];
extern void *st_panitab1[];
extern void *lk_panitab1[];

void *character_sel_anitabs[][2] =
{
	{kano_panitab1,0},
	{sonya_panitab1,0},
	{jax_panitab1,jax2_panitab1},
	{ind_panitab1,0},
	{sz_panitab1,0},
	{swat_panitab1,0},
	{lia_panitab1,0},
	{robo1_panitab1,0},
	{robo2_panitab1,0},
	{lao_panitab1,0},
	{tusk_panitab1,0},
	{sg_panitab1,0},
	{st_panitab1,0},
	{lk_panitab1,0},
	{robo1_panitab1,0},
	{robo1_panitab1,0},
};

short shadow_adjustments[] =
{
	0xfff6,				// 0 - kano
	-9,					// 1 - sonya
	0xfff7,				// 2 - jax
	0xfff9,	 			// 3 - indian
	0xfff9,				// 4 - turk (subzero)
	-9,					// 5 - swat dude
	0xfff9,				// 6 - lia
	0xfff8,				// 7 - robot ninja
	0xfff8,				// 8 - robot ninja
	0xfff9,				// 9 - kung lao
	0xfffa,					// 10 - tusk
	0xfff6,					// 11 - she goro
	0xfff9,					// 12 - shang tsung
	0xfff9,				// 13 - liu kang
	0xfff8,					// 14 - smoke
	-6,					// 15 - motaro
	-6,					// 16 - shao kahn
	-6					// 17 - noob saibot
};

short ochar_ground_offsets[2][32] = {
	{
		SCY(0x90) - 2,			// kano
		SCY(0x8f),				// sonya
		SCY(0x9e) - 2,			// jax
		SCY(0x90) - 3,			// indian
		SCY(0x8e) - 2,			// turk (subzero)
		SCY(0x93) - 2,			// swat
		SCY(0x90) - 3,			// lia
		SCY(0x93),				// robo
		SCY(0x93),				// robo
		SCY(0x8c) - 4,			// kung lao
		SCY(0x94) - 1,			// tusk
		SCY(0x9e) - 2,			// she goro
		SCY(0x88) - 3,			// shang tsung
		SCY(0x8b) - 2,			// kang
		SCY(0x93),				// smoke
		SCY(0xaa),				// motaro
		SCY(0xad),				// kahn
		SCY(0x90) - 2			// noob
	},
	{
		SCY(0x90) - 2,			// kano
		SCY(0x8f),				// sonya
		SCY(0x9e),			// jax
		SCY(0x90) - 3,			// indian
		SCY(0x8e) - 2,			// turk (subzero)
		SCY(0x93) - 2,			// swat
		SCY(0x90) - 3,			// lia
		SCY(0x93),				// robo
		SCY(0x93),				// robo
		SCY(0x8c) - 4,			// kung lao
		SCY(0x94) - 1,			// tusk
		SCY(0x9e) - 2,			// she goro
		SCY(0x88) - 3,			// shang tsung
		SCY(0x8b) - 2,			// kang
		SCY(0x93),				// smoke
		SCY(0xaa),				// motaro
		SCY(0xad),				// kahn
		SCY(0x90) - 2			// noob
	},
};

void* character_palettes_1[2][32] = 
{
	{
		KANORED_P,    	// 0 - kano
		SBGREEN_P,    	// 1 - sonya
		JAXPRP_P,     	// 2 - jax
		INBLU_P,     	// 3 - indian
		SZBLU_P,	     	// 4 - turk (subzero)
		OLTBLU_P,	     	// 5 - swat
		LPRP_P,	     	// 6 - lia
		R1PAL1_P,	    	// 7 - robo1
		R2PAL1_P,		// 8 - robo2
		KUNG_P,			// 9 - kung lao
		TSKTAN_P,		//10 - tusk
		FGRED_P,			//11 - she goro
		TSYEL_P,			//12 - shang tsun
		LKRED_P,			//13 - kang
		SMOKE1_P,			//14 - smoke
		MOTARO_P,			//15 - motaro
		BGPAL1_P,			// 16 - shao kahn
		noob_p				// 17 - noob palette
	},
	{
		KANORED_P,    	// 0 - kano
		SBGREEN_P,    	// 1 - sonya
		JAX2PRP_P,     	// 2 - jax
		INBLU_P,     	// 3 - indian
		SZBLU_P,	     	// 4 - turk (subzero)
		OLTBLU_P,	     	// 5 - swat
		LPRP_P,	     	// 6 - lia
		R1PAL1_P,	    	// 7 - robo1
		R2PAL1_P,		// 8 - robo2
		KUNG_P,			// 9 - kung lao
		TSKTAN_P,		//10 - tusk
		FGRED_P,			//11 - she goro
		TSYEL_P,			//12 - shang tsun
		LKRED_P,			//13 - kang
		SMOKE1_P,			//14 - smoke
		MOTARO_P,			//15 - motaro
		BGPAL1_P,			// 16 - shao kahn
		noob_p				// 17 - noob palette
	}
};

void *character_palettes_2[2][32] =
{
{
	KANOBLU_P,		// 0 - kano
	SBLTBLU_P,		// 1 - sonya
	JZXGRN_P,		// 2 - jax
	INYEL_P,		// 3 - indian
	SZBLUGR_P,		// 4 - turk
	OBRED_P,		// 5 - swat
	LBLU_P,			// 6 - lia
	R1PAL2_P,	    // 7 - robo1
	R2PAL2_P,		// 8 - robo2
	KUNGBLU_P,		//  9 - kung lao
	TSBLU_P,		// 10 - tusk
	FGBLUE_P,		// 11 - she goro
	TSRED_P,		// 12 - shang tsung
	LKYELO_P,		// 13 - kang
	SMOKE2_P,		// 14 - smoke
	MOTARO_P,		// 15 - motaro
	BGPAL1_P,		// 16 - shao kahn
	noob_p	 		// 17 - noob palette
}, {
	KANOBLU_P,		// 0 - kano
	SBLTBLU_P,		// 1 - sonya
	JZX2GRN_P,		// 2 - jax
	INYEL_P,		// 3 - indian
	SZBLUGR_P,		// 4 - turk
	OBRED_P,		// 5 - swat
	LBLU_P,			// 6 - lia
	R1PAL2_P,	    // 7 - robo1
	R2PAL2_P,		// 8 - robo2
	KUNGBLU_P,		//  9 - kung lao
	TSBLU_P,		// 10 - tusk
	FGBLUE_P,		// 11 - she goro
	TSRED_P,		// 12 - shang tsung
	LKYELO_P,		// 13 - kang
	SMOKE2_P,		// 14 - smoke
	MOTARO_P,		// 15 - motaro
	BGPAL1_P,		// 16 - shao kahn
	noob_p	 		// 17 - noob palette
}
};

/******************************************************************************
 Function: void setup_players(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: None

 Description:	Initialize players 1 & 2
******************************************************************************/
void setup_players(void)
{
	/* setup shadow adjust ram */
	p1_shadadj=	shadow_adjustments[p1_char];
	p2_shadadj=shadow_adjustments[p2_char];

	/* give advantage to players */
	if (random()<0)
	{
		/* advantage p2 */
		setup_player_2();
		setup_player_1();
	}
	else
	{
		/* advantage p1 */
		setup_player_1();
		setup_player_2();
	}

	init_p_others();

	return;
}

void init_p_others(void)
{
	p1_proc->pdata.p_otherguy=p2_obj;
	p1_proc->pdata.p_otherproc=p2_proc;

	p2_proc->pdata.p_otherguy=p1_obj;
	p2_proc->pdata.p_otherproc=p1_proc;

	return;
}

void setup_player_1(void)
{
	WORD tid;

	tid=current_proc->procid;
	current_proc->procid=PID_P1;
	make_player_1_obj();
	current_proc->procid=tid;

	if (p1_state==PS_ACTIVE)
		p1_proc=process_create(PID_P1,joy_begin);
	else p1_proc=process_create(PID_P1,drone_begin);

	p1_proc->pdata.p_ganiy=p1_obj->oypos.u.intpos;				/* set grounded y pos */

	(p1_proc->pa8)=p1_obj;									/* save object to process local a8 */

	memset(&p1_proc->pdata,0,sizeof(PDATA));					/* clear pdata structure */

	p1_proc->pdata.p_ganiy=p1_obj->oypos.u.intpos;				/* set grounded y pos */

	p1_proc->pdata.p_joyport=&swcurr.u.p1pad;						/* setup switch stuff */

	get_player_palette(character_palettes_1[p1_version]);

	insert_object(p1_obj,&objlst);

	return;
}

void setup_player_2(void)
{
	WORD tid;

    tid=current_proc->procid;
	current_proc->procid=PID_P2;
	make_player_2_obj();
	current_proc->procid=tid;

	if (p2_state==PS_ACTIVE)
		p2_proc=process_create(PID_P2,joy_begin);
	else p2_proc=process_create(PID_P2,drone_begin);

	p2_proc->pdata.p_ganiy=p2_obj->oypos.u.intpos;				/* set grounded y pos */

	p2_proc->pa8=p2_obj;									/* save object to process local a8 */

	memset(&p2_proc->pdata,0,sizeof(PDATA));					/* clear pdata structure */

	p2_proc->pdata.p_ganiy=p2_obj->oypos.u.intpos;				/* set grounded y pos */

	p2_proc->pdata.p_joyport=&swcurr.u.p2pad;						/* setup switch stuff */

	/* player --> check player 1 ochar (dont use same palette) */
	if (gstate!=GS_PSEL && q_nice_pal()==SYSTEM_CARRY_CLR)
	{
		p2_obj->oflags2|=M_UGLY_PAL;
		get_player_palette(character_palettes_2[p2_version]);
	}
	else get_player_palette(character_palettes_1[p2_version]);

	insert_object(p2_obj,&objlst);

	return;
}

/******************************************************************************
 Function: void get_player_palette(void *paltbl)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	retrieve correct player palette
******************************************************************************/
void get_player_palette(void *paltbl)
{
	OBJECT *obj=current_proc->pa8;

	obj->opal=get_fore_pal( (WORD *) (*((ADDRESS *)paltbl+obj->ochar)));

	return;
}

/******************************************************************************
 Function: void make_player_1_obj(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: None

 Description:	Setup player 1 object
******************************************************************************/
void make_player_1_obj(void)
{
	WORD ltype;

	ltype=(gstate==GS_GAMEOVER && p1_char==FT_SK)?CHAR_FATAL1:CHAR_NORMAL;

	void* anitab = character_sel_anitabs[p1_char][p1_version];
	if (anitab == 0) {
		anitab = character_sel_anitabs[p1_char][0];
	}

	if (gstate==GS_PSEL)
	{
#if MULTI_OFF
		p1_obj=make_player_obj(p1_char, p1_version, SHADOW_MODE,PLAYER1_TYPE, anitab, NULL);
#else
		p1_obj=make_player_obj(p1_char, p1_version, SHADOW_MODE,PLAYER1_TYPE, anitab, &p1_ram);
#endif
	}
	else
	{
		/* if chars not equal and randper not enabled or char not equal rand per active in first round */
		if ( (p1_heap_char != p1_char && round_23_jsrp!=6) || (p1_heap_char !=p1_char && round_23_jsrp==6 & round_num==1))
		{
			if ( !p1_preload )
				character_texture_load(p1_char,p1_version,ltype,p1_heap,SYNC_LOAD);
			p1_preload=0;
			PsxSoundLoadFighter1(p1_char);
			p1_heap_char=p1_char;							// assign character with heap
		}

#if MULTI_OFF
		if ( round_23_jsrp==6 && p1_char!=p1_heap_char )
			p1_obj=make_player_obj(p1_char, p1_version, SHADOW_MODE,PLAYER1_TYPE,p2_heap,0);
		else p1_obj=make_player_obj(p1_char, p1_version, SHADOW_MODE,PLAYER1_TYPE,p1_heap,0);
#else
		if ( round_23_jsrp==6  && p1_char!=p1_heap_char )
			p1_obj=make_player_obj(p1_char,SHADOW_MODE,PLAYER1_TYPE,p2_heap,&p1_ram);
		else p1_obj=make_player_obj(p1_char,SHADOW_MODE,PLAYER1_TYPE,p1_heap,&p1_ram);
#endif
	}

	p1_obj->oid=OID_P1;
	p1_obj->ozval=FRONT_Z;
	set_x_woff(p1_obj);

	current_proc->pa8=p1_obj;
	do_first_a9_frame(ANIM_STANCE);

	return;
}

/******************************************************************************
 Function: void make_player_2_obj(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: None

 Description:	Setup player 2 object
******************************************************************************/
void make_player_2_obj(void)
{
	LONG *compptr;

	WORD ltype;

	ltype=(gstate==GS_GAMEOVER && p1_char==FT_SK)?CHAR_FATAL1:CHAR_NORMAL;


	void* anitab = character_sel_anitabs[p2_char][p2_version];
	if (anitab == 0) {
		anitab = character_sel_anitabs[p2_char][0];
	}

	if (gstate==GS_PSEL)
	{
#if MULTI_OFF
		p2_obj=make_player_obj(p2_char, p2_version, SHADOW_MODE,PLAYER2_TYPE, anitab, 0);
#else
		p2_obj=make_player_obj(p2_char,SHADOW_MODE,PLAYER2_TYPE,character_sel_anitabs[p2_char],&p2_ram);
#endif
	}
	else
	{
		if ( (p2_heap_char != p2_char && round_23_jsrp!=6) || (p2_heap_char !=p2_char && round_23_jsrp==6 & round_num==1))
		{
			character_texture_load(p2_char,p2_version,ltype,p2_heap,SYNC_LOAD);
			PsxSoundLoadFighter2(p2_char);
			p2_heap_char=p2_char;							// assign character with heap
		}


#if MULTI_OFF
		if ( round_23_jsrp==6  && p2_char!=p2_heap_char )
			p2_obj=make_player_obj(p2_char, p2_version, SHADOW_MODE,PLAYER2_TYPE,p1_heap,0);
		else p2_obj=make_player_obj(p2_char, p2_version,SHADOW_MODE,PLAYER2_TYPE,p2_heap,0);
#else
		if ( round_23_jsrp==6 && p2_char!=p2_heap_char )
			p2_obj=make_player_obj(p2_char,SHADOW_MODE,PLAYER2_TYPE,p1_heap,&p2_ram);
		else p2_obj=make_player_obj(p2_char,SHADOW_MODE,PLAYER2_TYPE,p2_heap,&p2_ram);
#endif
	}

	p2_obj->oid=OID_P2;
	p2_obj->ozval=BACK_Z;
	set_x_woff(p2_obj);

	current_proc->pa8=p2_obj;

	compptr=idcomp_ptr;						// save start of decomp buffer
	do_first_a9_frame(ANIM_STANCE);
	idcomp_ptr=compptr;						// restore since we will overwrite image
	flip_multi(p2_obj);

	return;
}

/******************************************************************************
 Function: OBJECT *make_player_obj(WORD pchar,WORD f_shad,WORD player,void *heap,void *mram)

 By: David Schwartz

 Date: Sept 1994

 Parameters: pchar - id of character
			 f_shad - shadows on/off (1=on 0=off)
			 player - player 1(0) or player 2(1)
			 heap - base start addr
			 mram - multipart ram area for player

 Returns: ptr to created object

 Description:	create a player object
******************************************************************************/
OBJECT *make_player_obj(WORD pchar,WORD ver,WORD f_shad,WORD player,void *heap,void *mram)
{
  	WORD obj_flags=0;
	OBJECT *obj;
	ADDRESS *animframe;
	WORD palflag;

	palflag=(player==0) ? PFLAG_FIGHTER:(PFLAG_FIGHTER|PFLAG_FIGHTER2);

	animframe=(ADDRESS *)COMPUTE_ADDR(heap,*((ADDRESS *)heap));			// frame #1 stance

	/* mpo5 */
	while (*animframe==ANI_OCHAR_JUMP)
	{
		animframe+=2;
		animframe=(ADDRESS *)COMPUTE_ADDR(heap,*(animframe));
	}

	/* mpo7 */
	obj=get_multi_obj((ADDRESS *)COMPUTE_ADDR(heap,*animframe),mram,heap,palflag);			// init the object (palflag set for fighters)

	obj->ochar=pchar;								// set character
	obj->over = ver;

	obj->oflags |=(M_FIGHTER);					// set fighter flag for sony vram management

	obj->oflags2 |=(obj_flags);								// set palette & multipart bit

	ochar_bank_bit(obj);
	ground_ochar();

	current_proc->pdata.p_flags=0;						// clear process flags

	player_normpal();

	return(obj);
}

/******************************************************************************
 Function: void set_x_woff(OBJECT *pa8)

 By: David Schwartz

 Date: Mar 1995

 Parameters: pa8 - object

 Returns: None

 Description:	set starting position
******************************************************************************/
void set_x_woff(OBJECT *pa8)
{
	short ta3;
	short ta2;

	ta3=(pa8->ochar==FT_MOTARO)?SCX(0x30)+SCX(0x60):SCX(0x60);

	/* setx3 */
	ta2=worldtlx.u.intpos;
	if (p1_obj!=pa8)
	{
		ta2+=SCRRGT;
		ta3=-ta3;
	}

	pa8->oxpos.u.intpos=ta2+ta3;

	return;
}


/******************************************************************************
 Function: void ochar_bank_bit(OBJECT *pa8)

 By: David Schwartz

 Date: Feb 1995

 Parameters: pa8 - object

 Returns: ptr to created object

 Description:	set bank bit if neccessary
******************************************************************************/
void ochar_bank_bit(OBJECT *pa8)
{
	if (pa8->ochar<FT_SG)
		clear_bank_bit(pa8);
	else set_bank_bit(pa8);

	return;
}

/******************************************************************************
 Function: void *get_char_ani(WORD tableindex,short animnum)

 By: David Schwartz

 Date: Sept 1994

 Parameters: tableindex - which animation tables to use
				ANIM_TABLE1 = basic move tables
				ANIM_TABLE2 = special move tables
			animnum - which animation to get

 Returns: ptr to animation table
		  current_proc->pa9 - ptr to anim table

 Description:	finds the first frame to display of a character
******************************************************************************/
void *get_char_ani(WORD tableindex,short animnum)
{
	ADDRESS *animtab;

	animtab=(tableindex==ANIM_TABLE1) ? (ADDRESS *)(current_proc->pa8->oheap):((ADDRESS *)(current_proc->pa8->oheap)+ANIM_TABLE2_OFFSET);
	return((ADDRESS *)current_proc->pa9=(ADDRESS *)COMPUTE_ADDR(current_proc->pa8->oheap,(*(animtab+animnum))));
}

/******************************************************************************
 Function: void ground_ochar(void);

 By: David Schwartz

 Date: Sept 1994

 Parameters: current_proc->pa8 - object ptr

 Returns: None

 Description:	places fighter on ground
******************************************************************************/
 void ground_ochar(void)
{
	OBJECT *obj;

	obj=current_proc->pa8;
	obj->oypos.u.intpos=ground_y-ochar_ground_offsets[obj->over][obj->ochar];

	return;
}

/******************************************************************************
 Function: void player_normpal(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: current_proc->pa8 - object ptr
			 current_proc - controlling process

 Returns: None

 Description:	players use this routine to switch back to their normal palette
******************************************************************************/
void player_normpal(void)
{
	OBJECT *otherobj,*currobj;
	short palindex=0;

	if ((current_proc->pdata.p_flags & PM_ALT_PAL) != 0)
	{
		currobj=current_proc->pa8;
		otherobj=current_proc->pdata.p_otherguy;

		/* if same character and other char is using nice pal then use ugly pal */
		if (q_nice_pal()==SYSTEM_CARRY_CLR)
		{
			/* ugly pal */
			currobj->oflags2 |=M_UGLY_PAL;			// flag: set ugly palette
			swpal(character_palettes_2[currobj->over][currobj->ochar], currobj);
			current_proc->pdata.p_flags &=(~PM_ALT_PAL);		// flag: i am not using alt palette
			return;
		}
		else
		{
			/* nice pal */
			currobj->oflags2 &=(~M_UGLY_PAL);		// flag: clear ugly palette
			swpal(character_palettes_1[currobj->over][currobj->ochar],currobj);
			current_proc->pdata.p_flags &=(~PM_ALT_PAL);		// flag: i am not using alt palette
			return;
		}
	}

	return;
}

/******************************************************************************
 Function: void stance_setup(void)

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: None

 Description:	set fighter into his stance animation
******************************************************************************/
void stance_setup(void)
{
static BYTE stance_speeds[] = {
	6,   					// 0 - kano
	6,						// 1 - sonya
	6,						// 2 - jax
	6,						// 3 - indian
	6,						// 4 - turk (subzero)
	6,						// 5 - swat
	6,						// 6 - lia
	6,						// 7 - robot ninja
	8,						// 8 - robot ninja
	6,						// 9 - kung lao
	8,						// 10 - tusk
	6,						// 11 - she goro
	6,						// 12 - shang tsu
	4,						// 13 - liu kang
	6,						// 14 - smoke
	6,						// 15 - motaro
	8,						// 16 - shao kahn
	6,						// 17 - noob saibot
};

	current_proc->pdata.p_action=ACT_STANCE;

	current_proc->a5=current_proc->a9;

	get_char_ani(ANIM_TABLE1,ANIM_STANCE);

	/* stset2 */
	current_proc->a7=current_proc->a9;		// a7 = stance frame #1

	init_anirate(stance_speeds[current_proc->pa8->ochar]);

	/* stset0 */
	while (GET_LONG(current_proc->a7)==ANI_OCHAR_JUMP)		// are we at the "loop back pt"
	{
		((ADDRESS *)current_proc->pa7)+=2;
		current_proc->a7=GET_LONG(current_proc->a7);
	}

	/* stset1 */
	((ADDRESS *)current_proc->pa7)+=6;			// set least this far

	/* stset3 */
	while (GET_LONG(current_proc->a7)!=ANI_JUMP)		// are we at the "loop back pt"
	{
		((ADDRESS *)current_proc->pa7)++;
	}

	if (current_proc->a5>current_proc->a7)			// we were not in stance ---> new ani
		return;

	if (current_proc->a5<current_proc->a9)			// we were not in stance ---> new ani
		return;

	current_proc->a9=current_proc->a5;				// we were in stance ---> keep same ani
	return;
}

/******************************************************************************
 Function: LONG get_walk_info_f(void);

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: walk forward ani offset
		current_proc->a0 - walk forward animate speed
		current_proc->a1 - walk forward velocity
		current_proc->a2 - walk forward ani offset

 Description:	returns the walk forward info
******************************************************************************/
LONG get_walk_info_f(void)
{
	OBJECT *obj=current_proc->pa8;

	static short walk_forward_info[][2] = {
		/* anim speed, velocity */
		{5,SCX(0x3800)},	//  0 - kano
		{5,SCX(0x3000)},	//  1 - sonya
		{5,SCX(0x3000)},	//  2 - jax
		{5,SCX(0x3400)},	//  3 - indian
		{5,SCX(0x3400)},	//  4 - turk (subzero)
		{5,SCX(0x3000)},	//  5 - swat
		{5,SCX(0x3800)},	//  6 - lia
		{5,SCX(0x3400)},	//  7 - robot ninja
		{5,SCX(0x3400)},	//  8 - robot ninja
		{5,SCX(0x3400)},	//  9 - kung lao
		{5,SCX(0x3000)},	// 10 - tusk
		{5,SCX(0x3000)},	// 11 - she goro
		{5,SCX(0x3200)},	// 12 - shang tsung
		{5,SCX(0x3200)},	// 13 - kang
		{5,SCX(0x3400)},	// 14 - smoke
		{5,SCX(0x4000)},	// 15 - motaro
		{4,SCX(0x4200)},	// 16 - shao kahn
		{3,SCX(0x5000)}		// 17 - noob saibot
	};

	(LONG)current_proc->a0=walk_forward_info[obj->ochar][0];

	(long)current_proc->a1=(obj->oflags & M_FLIPH) ? -((long)(walk_forward_info[obj->ochar][1]<<4)):((long)(walk_forward_info[obj->ochar][1]<<4));

	return((LONG)current_proc->a2=ANIM_WALKF);
}

/******************************************************************************
 Function: LONG get_walk_info_b(void);

 By: David Schwartz

 Date: Sept 1994

 Parameters: None

 Returns: walk backword ani offset
		current_proc->a0 - walk backward animate speed
		current_proc->a1 - walk backward velocity
		current_proc->a2 - walk backward ani offset

 Description:	returns the walk backward info
******************************************************************************/
LONG get_walk_info_b(void)
{
	OBJECT *obj=current_proc->pa8;

	static short walk_backward_info[][2] = {
		/* anim speed, velocity */
		{5,SCX(0x2400)},	// 0 - kano
		{5,SCX(0x2400)},	// 1 - sonya
		{5,SCX(0x2400)},	// 2 - jax
		{5,SCX(0x2400)},	// 3 - indian
		{5,SCX(0x2400)},	// 4 - turk (subzero)
		{5,SCX(0x2400)},	// 5 - swat
		{5,SCX(0x2400)},	// 6 - lia
		{5,SCX(0x2400)},	// 7 - robo
		{5,SCX(0x2400)},	// 8 - robo
		{5,SCX(0x2400)},	// 9 - kung lao
		{5,SCX(0x2400)},	//10 - tusk
		{5,SCX(0x2400)},	//11 - she goro
		{5,SCX(0x2400)},	//12 - shang tsung
		{5,SCX(0x2400)},	//13 - kang
		{5,SCX(0x2400)},	// 14 - smoke
		{5,SCX(0x3000)},	// 15 - motaro
		{4,SCX(0x3000)},	// 16 - shao kahn
		{4,SCX(0x4000)}		// 17 - noob saibot
	};

	(LONG)current_proc->a0=walk_backward_info[obj->ochar][0];

	(long)current_proc->a1=(obj->oflags & M_FLIPH) ? ((long)(walk_backward_info[obj->ochar][1]<<4)):-((long)(walk_backward_info[obj->ochar][1]<<4));

	return((LONG)current_proc->a2=ANIM_WALKB);
}

void *ochar_froze_pals[] =
{
	KNFROZN_P,	// 0
	SBFROZN_P,	// 1
	JXFROZN_P,	// 2
	INFROZN_P,	// 3
	SZFROZN_P,	// 4
	OBFROZN_P,	// 5
	LIFROZN_P,	// 6
	RBFROZN_P,	// 7
	RBFROZN_P,	// 8
	KLFROZN_P,	// 9 - kung lao
	TRFROZN_P,	// 10
	SHFROZN_P,	// 11
	TSFROZN_P,	// 12
	LUFROZN_P,	// 13
	RBFROZN_P,	// 14

	white_froze_p,	// 15
	sk_shadow_p,	// 16
	white_froze_p,	// 15
	white_froze_p,	// 15
	white_froze_p,	// 15
	white_froze_p,	// 15
	white_froze_p	// 15
};

/******************************************************************************
 Function: void player_froze_pal(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	freeze the current obj
******************************************************************************/
void player_froze_pal(void)
{
	player_swpal(current_proc,ochar_froze_pals[(current_proc->pa8)->ochar],current_proc->pa8);
	return;
}

/******************************************************************************
 Function: WORD q_nice_pal(void)

 By: David Schwartz

 Date: May 1995

 Parameters: None

 Returns: SYSTEM_CARRY_SET - use nice palette
		  SYSTEM_CARRY_CLR - use ugly palette

 Description:	determine if both guys are same, if so then use ugly palette
******************************************************************************/
WORD q_nice_pal(void)
{
	if (current_proc->pa8==p1_obj)
	{
		current_proc->a0=p1_char;
		current_proc->a1=p2_char;
	}
	else
	{
		current_proc->a0=p2_char;
		current_proc->a1=p1_char;
	}

	/* pnp3 */
	if (current_proc->a1!=FT_ST)
	{
		/* he_is_not_shang */
		if (current_proc->a0==FT_ST)
		{
			/* i_am_shang_he_is_not */
			if ((current_proc->pa8)->ochar==FT_ST)
				return(SYSTEM_CARRY_SET);

			if ((current_proc->pa8)->ochar==current_proc->a1)
				return(SYSTEM_CARRY_CLR);
		}
		else
		{
			/* neither_are_shang */
			if (current_proc->a0==current_proc->a1)
			{
				/* neither_shang_same */
				if (p2_obj==current_proc->pa8)
					return(SYSTEM_CARRY_CLR);
				else return(SYSTEM_CARRY_SET);
			}
			else return(SYSTEM_CARRY_SET);				// neither_shang_different
		}
	}
	else
	{
		/* he_is_shang */
		if (current_proc->a0==current_proc->a1)
		{
			/* we_are_shangs */
			if (current_proc->pa8==p2_obj)
				return(SYSTEM_CARRY_CLR);		// 2 shangs p2=ugly
			else return(SYSTEM_CARRY_SET);		// 2 shangs p1=nice
		}
	}
	return(SYSTEM_CARRY_SET);			// he_is_shang_i_am_not

}

/******************************************************************************
 Function: void player_swpal_a0_image(void *pal)

 By: David Schwartz

 Date: Jan 1995

 Parameters: pal - palette to switch to

 Returns: None

 Description:	switch pal
******************************************************************************/
void player_swpal_a0_image(void *pal)
{
	/* any changes to this routine and you will need to see
	   how this affects any code that uses it.  -NOTE-
	*/

	player_swpal(current_proc,pal,current_proc->pa8);

	return;
}

/******************************************************************************
 Function: void shock_init(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	init robo shock move
******************************************************************************/
void shock_init(void)
{
	current_proc->pdata.p_store1=1;
	return;
}

/******************************************************************************
 Function: void shock_check(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	check for shock
******************************************************************************/
void shock_check(void)
{
	WORD temp;
	if ((temp=(current_proc->pdata.p_store1-1))==0)
	{
		current_proc->pdata.p_anirate=3;		// only show this for 2 ticks

		/* this is a change from the code.  We do not have the same struct, since our
		   multi part objs are really only 1 part.  This routine call is supoose to
		   load the palette from the multipart image "ROBOSHOCK1A".  We are simulate the
		   correct results.
		*/
		player_swpal_a0_image(ROBSHKB_P);
		((ADDRESS *)(current_proc->pa9))-=3;		// counter 2 lines ahead

		temp=(WORD)randu(4);
	}

	current_proc->pdata.p_store1=temp;
	((ADDRESS *)(current_proc->pa9))+=3;		// skip shock stuff

	return;
}

/******************************************************************************
 Function: void stun_speed_3(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	set stun anirate to 3
******************************************************************************/
void stun_speed_3(void)
{
	player_normpal();
	current_proc->pdata.p_anirate=((current_proc->pa8)->ochar==FT_ROBO2)?5:3;
	return;
}

/******************************************************************************
 Function: void stun_speed_6(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	set stun anirate to 6
******************************************************************************/
void stun_speed_6(void)
{
	player_normpal();
	current_proc->pdata.p_anirate=((current_proc->pa8)->ochar==FT_ROBO2)?9:6;
	return;
}

/******************************************************************************
 Function: void set_a10_to_him(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	switch other guy to a10
******************************************************************************/
void set_a10_to_him(void)
{
	(OBJECT *)current_proc->pa10=current_proc->pdata.p_otherguy;
	return;
}

/******************************************************************************
 Function: void set_a10_to_slave(void)

 By: David Schwartz

 Date: Jan 1995

 Parameters: None

 Returns: None

 Description:	switch slave  to a10
******************************************************************************/
void set_a10_to_slave(void)
{
	(OBJECT *)current_proc->pa10=current_proc->pdata.p_slave;
	return;
}

/******************************************************************************
 Function: void lineup_number_2(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: current_proc->a10

 Returns: None

 Description: 	lineup jax's 2nd missile
******************************************************************************/
void lineup_number_2(void)
{
	adjust_xy_a5((OBJECT *)current_proc->a10,-0x1a,-0x25);
	return;
}

/******************************************************************************
 Function: void sonya_zap_pal(void)

 By: David Schwartz

 Date: Nov 1994

 Parameters: None

 Returns: None

 Description: 	setup zap pal for sonya
******************************************************************************/
void sonya_zap_pal(void)
{
	if ((current_proc->pa8)->oflags2 & M_UGLY_PAL)
		player_swpal(current_proc,sbENG2_p,current_proc->pa8);		// we are using ugly pal, correct color
	else player_swpal(current_proc,sbENG_p,current_proc->pa8);
	return;
}

