/******************************************************************************
 File: mkos.h

 By: David Schwartz

 Date: August 1994

 (C) Williams Entertainment

 Mortal Kombat III Operating System Header
******************************************************************************/

#ifndef __mk_os_h__
#define __mk_os_h__

/*
 *	DEFINITIONS
 */
#define NUM_PROCESS	94			/* total # of process in the system */

/* p_comp_flag sync values */
#define PC_CLEAR			0x0000				// no sync
#define PC_DIZZY			0x0002				// dude dizzy sync
#define PC_ROBO_AIR			0x0003				// robo2 air grab slam sync
#define PC_SCREAM_WAKE		0x0004				// lia scream sync
#define PC_PSEL_JOIN		0x0005				// psel join in sync
#define PC_FLASH_WAKE		0x0006				// psel white box flash sync
#define PC_SPEECH_WAKE		0x0007				// psel speech call sync
#define PC_ROBO_LIMB_WAKE	0x0008				// robot tele explode limb sync
#define PC_NET_WAKE			0x0009				// robot net sync
#define PC_SUSPEND_WAKE		0x000a				// general suspend wake sync
#define PC_TARGET_WAKE		0x000b				// robot cruise missle target sync
#define PC_RHAT_WAKE		0x000c				// kung lao hat wake
#define PC_PSEL_WAIT		0x000d				// waiting for psel wake
#define PC_CURSOR_LOOP		0x000e				// select cursor loop
#define PC_WAITF_WAKE		0x000f				// wait forever wakeup
#define PC_WAIT_SPEAR2		0x0010				// at waiting_for_spear2
#define PC_WAIT_SPEAR		0x0011				// at waiting_for_spear
#define PC_BLOCK_SHAKE_WAKE	0x0012				// wake from block_shake_ani
#define PC_FATAL_WAIT		0x0013				// fataility waiting
#define PC_PIT_STOP			0x0014				// end of pit scroll
#define PC_INIT_DONE		0x0015				// initials done
/* Process strorage */
typedef struct ps_data {
	WORD *p_joyport;				/* points to joystick switch port location */
	struct object *p_otherguy;				/* ptr to other guys object */
	struct process *p_otherproc;		/* other guys process */
	OBJECT *p_slave;				/* slave object */
	ADDRESS *p_anitab;					/* current animation table */
	union
	{
		struct
		{
			ADDRESS p_store1;					/* long storage #1 */
			ADDRESS p_store2;					/* long storage #2 */
			ADDRESS p_store3;					/* long storage #3 */
			ADDRESS p_store4;					/* long storage #4 */
			ADDRESS p_store5;					/* long storage #5 */
			ADDRESS p_store6;					/* long storage #6 */
			ADDRESS p_store7;					/* long storage #7 */
			ADDRESS p_store8;					/* long storage #8 */
		};

		struct
		{
			VPTR v_store1;					/* long storage #1 */
			VPTR v_store2;					/* long storage #2 */
			VPTR v_store3;					/* long storage #3 */
			VPTR v_store4;					/* long storage #4 */
			VPTR v_store5;					/* long storage #5 */
			VPTR v_store6;					/* long storage #6 */
			VPTR v_store7;					/* long storage #7 */
			VPTR v_store8;					/* long storage #8 */
		};
	};
	LONG p_dronevar1;					/* drone variable 1 */
	WORD p_otheract;				/* drone info: other dudes last action */
	WORD p_anirate;					/* animation speed */
	WORD p_anicount;				/* animation count */
	WORD p_action;					/* current action */
	short p_ganiy;					/* grounded animation point y */
	WORD p_flags;					/* more flags */
	WORD p_downcount;				/* # of ticks i have been ducking */
	WORD p_stk;							/* strike table i am using */
	WORD p_hitby;						/* i was "hit by" this last */
	WORD p_damage;					// (16) - damage (for combo message)
	WORD p_power;					// (8)  - power (for invincibilities)
	WORD p_block;					// (8)  - block count
	WORD p_hit;						// (8)  - hit count
} PDATA;

/* Process Structure */
typedef struct process {
	struct process *plink;			// link THIS MUST BE FIRST FIELD
	CONTEXT	p_context;				// registers for context switching
	int		endmark;				// Check for stack overflow
	ADDRESS Stack[STKSIZE-2];       // Stack ram for process 
	ADDRESS StackTop[2];			// Top of Stack with pad
	const char* NAME;
	PDATA pdata;					/* process data */
	WORD procid;					/* process ID */
	WORD ptime;						/* sleep timer */
	WORD joyindex;					/* joy jump table index */
	WORD p_comp_flag;				/* used in place of looking if a process is at a code point */

	union
	{
		struct object* pa8;				/* ptr to object */
		DWORD a8;
	};

	union
	{
		void* pa9;						/* ptr to animation table */
		DWORD a9;
	};	

	union
	{
		struct {
			ADDRESS a0;						/* temp storage for parameter passing */
			ADDRESS a1;						/* temp storage for parameter passing */
			ADDRESS a2;						/* temp storage for parameter passing */
			ADDRESS a3;						/* temp storage for parameter passing */
			ADDRESS a4;						/* temp storage for parameter passing */
			ADDRESS a5;						/* temp storage for parameter passing */
			ADDRESS a6;						/* temp storage for parameter passing */
			ADDRESS a7;						/* temp storage for parameter passing */
			ADDRESS a10;					/* temp storage for parameter passing */
			ADDRESS a11;					/* temp storage for parameter passing */
			ADDRESS a14;					/* temp storage for parameter passing */
		};

		struct {
			VPTR pa0;						/* temp storage for parameter passing */
			VPTR pa1;						/* temp storage for parameter passing */
			VPTR pa2;						/* temp storage for parameter passing */
			VPTR pa3;						/* temp storage for parameter passing */
			VPTR pa4;						/* temp storage for parameter passing */
			VPTR pa5;						/* temp storage for parameter passing */
			VPTR pa6;						/* temp storage for parameter passing */
			VPTR pa7;						/* temp storage for parameter passing */
			VPTR pa10;					/* temp storage for parameter passing */
			VPTR pa11;					/* temp storage for parameter passing */
			VPTR pa14;					/* temp storage for parameter passing */
		};
	};
	
	
} PROCESS;


#define InitProcessStack( pr ) 	    \
	(pr->p_context.c_stackptr = pr->p_context.c_frameptr = pr->StackTop)

#define process_create(id,func) process_create0(id,func,#func)

/*
 *	RAM
 */
__EXTERN__ PROCESS *active_head;			/* ptr to head of active process list */
__EXTERN__ PROCESS *free_head;				/* ptr to head of available process list */
__EXTERN__ PROCESS *current_proc;			/* ptr to the ptr of the current process */
__EXTERN__ PROCESS process_ram[NUM_PROCESS];	/* memory allocation for all processes */
__EXTERN__ CONTEXT main_context;			/* storage for main context switcher */
__EXTERN__ volatile WORD irq_timer;						/* irq timer */
__EXTERN__ volatile WORD tick;							/* game clock tick counter */

#if MK_EJBBUG
__EXTERN__ WORD pcount;
__EXTERN__ WORD pmax;
#endif

/*
 *	PROTOTYPES
 */
void process_initialize(void);
PROCESS *process_create0(WORD,void (*func)(void),const char*);
void process_kill(PROCESS *);
void process_kill_class(WORD,WORD);
PROCESS *process_exist(WORD,WORD);
void process_suicide(void);
void process_dispatch(void);
void process_sleep(WORD);
void timer_interrupt(void);

// in context.asm  note the "int" return types.  This hopefully wil flag the MSVC compiler that EAX is trashed
// by these functions.

// for debugging
///int _swapstacks_(CONTEXT *);
///#define swapstacks() { _swapstacks_(&main_context); }

int context_switch(CONTEXT *,CONTEXT *);
int context_kill_switch(CONTEXT *);
int context_init_main(CONTEXT *);
int context_jump(CONTEXT *);

/*
 *	MACROS
 */
#define CREATE(id,func)	process_create(id,func)

/* stack_jump, this routine resets the stack and jumps to the
	specified routine, essentially starting from scratch
*/
#define stack_jump_joy(_wake,_joy) \
		{ \
		current_proc->joyindex=(_joy); \
		stack_jump(_wake); \
		}

#define stack_jump(_wakeup) \
		{ \
		current_proc->p_context.c_frameptr=current_proc->p_context.c_stackptr=current_proc->StackTop; \
		current_proc->p_context.c_wakeup=_wakeup; \
		context_jump(&(current_proc->p_context)); \
		}


#endif	/* __mk_os_h__ */

