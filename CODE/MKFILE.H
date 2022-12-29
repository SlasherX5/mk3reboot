/******************************************************************************
 File: mkfile.h

 By: David Schwartz

 Date: March 1995

 (C) Williams Entertainment

 Mortal Kombat III file Header
******************************************************************************/

#ifndef __mk_mkfile_h__
#define __mk_mkfile_h__

#include "psxcd.h"

#include "SYSTEM.H"

/*
 * 	DEFINITIONS
 */
#define CD_FILE	_CD_VERSION_
#define PC_FILE	(CD_FILE^1)

typedef struct ovl
{
	char **ovl_addr;
	char *ovl_file;
} OVL;

/* character data type */
#define CHAR_BABY   0
#define CHAR_NORMAL	1
#define CHAR_ANIMAL 2
#define CHAR_FRIEND 3
#define CHAR_FATAL1  4
#define CHAR_FATAL2  5
#define CHAR_VS  6

/* special character loads */
#define NO_FILE					0xffff					// EQUIVALENT TO NULL
#define CHAR_SPECIAL_1			0xfff1					// KANO SKEL REACH
#define CHAR_SPECIAL_2			0xfff2					// LIA SKIN RIP
#define CHAR_SPECIAL_3			0xfff3					// KABAL INFLATE
#define CHAR_SPECIAL_4			0xfff4					// SHEEVA SKIN RIP
#define CHAR_SPECIAL_5			0xfff5					// SHANG FLOAT
#define CHAR_SPECIAL_6			0xfff6					// SMOKE ARM BOMB
#define CHAR_SPECIAL_7			0xfff7

/* load types */
#define SYNC_LOAD	0x0000			// normal sync load
#define ASYNC_LOAD 	0x0001			// async load
#define FATAL_LOAD	0x0002			// load at dest-length addr

/* generic overlay indexs, overlays for various stuff */
#define OVL_SELECT	0x00					// select screen fighter data
#define OVL_OPTIONS 0x01					// option screen data
#define OVL_SINVADE	0x02					// hidden game overlay

/* special end of figght fxs load */
#define FX_FATAL_LOAD 0
#define FX_ANIMAL_LOAD 1
#define FX_FRIEND_LOAD 2
#define FX_BABY_LOAD 3

/* level textures & code file index */
#define LVL_NONE			0xff
#define LVL_SUBWAY_STREET	0
#define LVL_BANK			2
#define LVL_CITY			2
#define LVL_BALCONY			5
#define LVL_BRIDGE			4
#define LVL_SOUL			5
#define LVL_BELL			6
#define LVL_TEMPLE			7
#define LVL_GRAVE			8
#define LVL_PIT				9
#define LVL_BUYIN			10
#define LVL_BIO				11
#define LVL_LADDER		15 	//12
#define LVL_VERSE			13
#define LVL_COIN			14
#define LVL_SELECT			15
#define LVL_TITLE			16

#define LVL_BIO_KANO		17
#define LVL_BIO_SONYA		18
#define LVL_BIO_JAX			19
#define LVL_BIO_INDIAN		20
#define LVL_BIO_SUBZERO		21
#define LVL_BIO_SWAT		22
#define LVL_BIO_LIA			23
#define LVL_BIO_ROBO1		24
#define LVL_BIO_ROBO2		25
#define LVL_BIO_LAO			26
#define LVL_BIO_TUSK		27
#define LVL_BIO_SHEEVA		28
#define LVL_BIO_SHANG		29
#define LVL_BIO_LKANG		30

#define LVL_OPTIONS			31

#define LVL_STORY2			32
#define LVL_STORY3			33
#define LVL_KANOSTORY		34
#define LVL_SZSTORY			35
#define LVL_LKSTORY			36

#define LVL_OPTTEXT			38
#define LVL_CONTROL			39
#define LVL_FONTS			40
#define LVL_LOADING		41

#define LVL_PORTAL 			42
#define LVL_GRADIENT		43

#define LVL_END_KANO		44
#define LVL_END_SONYA		45
#define LVL_END_JAX			46
#define LVL_END_INDIAN		47
#define LVL_END_SUBZERO		48
#define LVL_END_SWAT		49
#define LVL_END_LIA			50
#define LVL_END_ROBO1		51
#define LVL_END_ROBO2		52
#define LVL_END_LAO			53
#define LVL_END_TUSK		54
#define LVL_END_SHEEVA		55
#define LVL_END_SHANG		56
#define LVL_END_LKANG		57
#define LVL_END_SMOKE		58
#define LVL_END_GODS		59
#define LVL_SKEND				60
#define LVL_HSCORE			61
#define LVL_MOCKPIT			62
#define LVL_DTEAM				63

/*
 *	RAM
 */
__EXTERN__ File_IO_Struct *module_int;

__EXTERN__ BYTE load_level;				// current level in load_addr area
__EXTERN__ BYTE load_pal;				// current img palette overlay loaded (0-NTSC, 1-RGB)

__EXTERN__ void *finish_heap_ptr;		// ptr for finishing heap info
__EXTERN__ void *player_heap_ptr;		// remember what my heap ptr was before fatality
/*
 *	PROTOTYPES
 */

int LoadBinToVram(char *path,int x,int y); // by peter k.

int module_io_init(void);
File_IO_Struct *module_os_open(char *filename);
int module_os_read(void *destptr,int readbytes,File_IO_Struct *fileptr);
int module_os_seek(File_IO_Struct *fileptr,int seekpos,int seekmode);
int module_os_size(File_IO_Struct *fileptr);
//int module_os_close(File_IO_Struct *fileptr);

int texture_level_load(WORD level,WORD sync);
int character_texture_load(WORD pchar,WORD pver,WORD type,void *dest,WORD sync);
int generic_overlay_load(WORD overnum);
BYTE *special_fx_load(WORD fxtype);
int level_overlay_load(WORD level);
void file_load_message(WORD);



/*
 *	MACROS
 */

#endif /* __mk_mkfile_h__ */
