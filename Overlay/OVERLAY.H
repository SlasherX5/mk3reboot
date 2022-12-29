#ifndef __OVERLAY_H
#define __OVERLAY_H

#include <sys/types.h>

// from pharlap include libraries

#ifndef PLEXP_H
#define PLEXP_H


#define u_short unsigned short
#define u_long  unsigned int

typedef char SBYTE;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned int DWORD;


/* Phar Lap .EXP file definitions */
/************************************************************************/
/*	Copyright (C) 1986-1988 Phar Lap Software, Inc.			*/
/*	Unpublished - rights reserved under the Copyright Laws of the	*/
/*	United States.  Use, duplication, or disclosure by the 		*/
/*	Government is subject to restrictions as set forth in 		*/
/*	subparagraph (c)(1)(ii) of the Rights in Technical Data and 	*/
/*	Computer Software clause at 252.227-7013.			*/
/*	Phar Lap Software, Inc., 60 Aberdeen Ave., Cambridge, MA 02138	*/
/************************************************************************/

/* Old .EXP file header */



#pragma pack(1)

typedef struct
{
	u_short exe_sign;		/* [00] Signature word (MP) */
	u_short exe_szrem;		/* [02] Remainder of the image size
					        when divided by the page
					        size (512 bytes) */
	u_short exe_size;		/* [04] Size of image in pages */
	u_short exe_relcnt;		/* [06] Number of relocation entries*/
	u_short exe_hsize;		/* [08] Header size in paragraphs */
	u_short exe_minpg;		/* [0A] Minimum number of extra 
					        4K pages to be allocated
					        at the end of a program when
					        it is loaded */
	u_short exe_maxpg;		/* [0C] Maximum number of extra
					        4K pages to be allocated
					        at the end of a program when
					        it is loaded */
	u_long	exe_esp;		/* [0E] Initial ESP */
	u_short exe_chksum;		/* [12] Word checksum of file */
	u_long	exe_eip;		/* [14] Initial EIP */
	u_short exe_reloff;		/* [18] Offset of first relocation
					        item */
	u_short exe_ovlno;		/* [1A] Overlay number */
	u_short exe_unkw;		/* [1C] Unknown word, wants to be 1 */
} OEXP_HDR;


/* .EXP file header */

typedef struct
{

	/* Signature and level */

	u_short exp_sign;		/* Signature word (P2 or P3) */
	u_short exp_level;		/* Level */
	u_short exp_hsize;		/* Header size */
	u_long exp_flsize;		/* File size in bytes */
	u_short exp_chksum;		/* Checksum */

	/* Table of contents */

	u_long exp_rtp;			/* File offset of the run-time
					   parameters */
	u_long exp_rtpsize;		/* Size in bytes of the run-time
					   parameters */	
	u_long exp_rel;			/* File offset of the relocation
					   table */
	u_long exp_relsize;		/* Size in bytes of the relocation
					   table */
	u_long exp_sit;			/* File offset of the segment
					   information table */
	u_long exp_sitsize;		/* Size in bytes of the segment
					   information table */
	u_short exp_sitesize;		/* Size in bytes of a segment
					   information table entry */
	u_long exp_ldimg;		/* File offset of the load image */
	u_long exp_ldisize;		/* Load image size on disk */
	u_long exp_sym;			/* File offset of the symbol table */
	u_long exp_symsize;		/* Size in bytes of the symbol table*/
	u_long exp_gdt;			/* GDT offset in load image */
	u_long exp_gdtsize;		/* Size in bytes of the GDT */
	u_long exp_ldt;			/* LDT offset in load image */
	u_long exp_ldtsize;		/* Size in bytes of the LDT */
	u_long exp_idt;			/* IDT offset in load image */
	u_long exp_idtsize;		/* Size in bytes of the IDT */
	u_long exp_tss;			/* TSS offset in load image */
	u_long exp_tsssize;		/* Size in bytes of the TSS */

	/* Program load params, level 1 files only */

	u_long exp_minext;		/* Minimum number of extra 
					   bytes to be allocated
					   at the end of a program when
					   it is loaded */
	u_long exp_maxext;		/* Maximum number of extra
					   bytes to be allocated
					   at the end of a program when
					   it is loaded */
	u_long exp_boff;			/* Base load offset */

	/* Initial register contents */

	u_long exp_iesp;			/* Initial ESP */
	u_short exp_iss;			/* Initial SS */
	u_long exp_ieip;			/* Initial EIP */
	u_short exp_ics;			/* Initial CS */
	u_short exp_ildt;		/* Initial LDT */
	u_short exp_itss;		/* Initial TSS */

	/* New stuff */

	u_short exp_flags;		/* Flags */
	u_long exp_mreq;			/* Memory requirements for the load
					   image (packed or unpacked) */
	u_long exp_xsum32;		/* 32-bit checksum */

	/* An .EXP header is 384 bytes long.  The remaining bytes of the
	   header are always zero, to allow for future expansion. */

} EXP_HDR;


// File signatures 

#define EXP_286 0x3250		/* 286 .EXP signature (P2) */

#define EXP_386 0x3350		/* 386 .EXP signature (P3) */

#define EXP_OLD 0x504D		/* Old .EXP signature (MP) */

#define REX_OLD 0x514D		/* Old .REX signature (MQ) */

#define RTP_SIGN 0x5844		/* 386|DOS-Extender run-time parameters */

// constants

#define	 REX_BLK_SIZE  512	/* size of rex block */
#define  REL32	0x80000000	/* if bit set: relocate 32 bit value */

// Page table constants

#define PAGE_SIZE	0x1000	/* page size, in bytes */
#define PAGE_SHIFT	12		/* # bits to shift a page number */
#define NPARA_PAGE	0x100	/* number of paragraphs in a page */


#if 0

/*

Flags in exp_flags word.

*/

#define EXP_PACKED 0x0001	/* Load image is packed */
#define EXP_XSUM 0x0002		/* 32-bit checksum is present */

/*

Segment information table entry

*/

typedef struct
{
	u_short sit_selector;		/* Selector number */
	u_short sit_flags;		/* Flags */
	u_long sit_boff;			/* Base offset of selector */
	u_long sit_minext;		/* Minimum number of extra bytes
					   to be allocated to the segment */
} SIT_ENT;


/*

386|DOS-Extender run-time parameters

*/

typedef struct
{
	u_short rtp_sign;		/* Signature = 'DX' */
	u_short rtp_minrf;		/* Minimum number of real mode paras
					   to leave free at run-time */
	u_short rtp_maxrf;		/* Maximum number of real mode paras
					   to leave free at run-time */
	u_short rtp_minib;		/* Minimum interrupt buffer size in
					   K bytes */
	u_short rtp_maxib;		/* Maximum interrupt buffer size in
					   K bytes */
	u_short rtp_nist;		/* Number of interrupt stacks */
	u_short rtp_istks;		/* Size in K bytes of each interrupt
					   stack */
	u_long rtp_rbr;			/* Offset where the real mode code/
					   data ends + 1 */
	u_short rtp_cbsize;		/* Size in K bytes of the call 
					   buffers */
	u_short rtp_flags;		/* Flags - bit def'ns below */

	/* The run-time parameters are 128 bytes long.  The remaining
	   bytes of the header are always zero to allow for future
	   expansion. */

} DOSX_RTP;

/*
 * DOS-X flags word bit definitions
 */
#define RTP_VMM	0x0001		/* File is virtual memory manager */

/*

Values for DOS-X run-time params

*/

#define REAL_MAX	64	/* max. legal value for minrf and maxrf */
#define MINR_DEF	0	/* default for minrf */
#define MAXR_DEF	0	/* default for maxrf */

#define IBUF_MIN	1	/* min. legal value for minib and maxib */
#define IBUF_MAX	64	/* max. legal value for minib and maxib */
#define MINIB_DEF	1	/* default for minib */
#define MAXIB_DEF	64	/* default for maxib */

#define NIST_MIN	4	/* min. legal value for nist */
#define ISTKS_MIN	1	/* min. legal value for istks */
#define ISTKS_MAX	64	/* max. legal value for nist * istks */
#define NIST_DEF	4	/* default for nist */
#define ISTKS_DEF	1	/* default for istks */

#define RBRK_DEF	0	/* default for rbr */

#define CBSIZE_MAX	64	/* max. legal value for cbsize */
#define CBSIZE_DEF	0	/* default for cbsize */


/*

File header and run-time parameter sizes 

*/

#define EXP_SIZE 384		/* Size of an .EXP header */

#define RTP_SIZE 128		/* Size of the run-time parameters */

#define SIT_ESIZE 12		/* Size of an SIT entry */


/*

Level numbers

*/

#define LVL_FLAT  1		/* Flat model file */
#define LVL_MULTI 2		/* Multisegmented file */


/*

Repeat block header (for packed files)

*/

typedef struct
{
	u_short rpt_bcnt;		/* Byte count */
	UBYTE rpt_rptl;			/* Repeat string length */
} EXP_RPT;

#endif // 0

#endif /* PLEXP_H */
			
typedef struct ovlfile {
	EXP_HDR exphdr;
	int loadsize;
	FILE* fileno;
} Ovlfile;

#pragma pack()

#endif // __OVERLAY_H
