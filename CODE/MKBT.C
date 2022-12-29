/*==>> PORTED TO MKBT.C
;******************************************************************************
; File: mkbt.s
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Background Module Composition Tables
;******************************************************************************
; DATA DEFINITIONS, BETTER MATCH IN MKBKGD.H

	opt c+

;************************************************
;* NOTE: ADDING BACKGROUND INFO
;*1) update: makefile.mak, mkbt.s
;*
;*2) change all bit offsets into byte offsets by dividing by 8 (important)
;************************************************


	section	.tabledata

	include mkbkgd.inc

;*********************************
;**			EXTERNALS			**
;*********************************
	xref	roof_module
	xref	subway_module
	xref	street_module
	xref	temple_module
	xref	bridge_module
	xref	tower_module
	xref	bell_module
	xref	grave_module
	xref	soul_module
	xref	pit_module
	xref	bank_module
	xref	portal_module
	xref	nowall_module

	xref	buyin_module
	xref	ladder_module
	xref	vs_module
	xref	coin_module
	xref	psel_module

	xref	kanobio_module
	xref	sonyabio_module
	xref	jaxbio_module
	xref	indbio_module
	xref	subbio_module
	xref	swatbio_module
	xref	liabio_module
	xref	robo1bio_module
	xref	robo2bio_module
	xref	laobio_module
	xref	tuskbio_module
	xref	sgbio_module
	xref	stbio_module
	xref	lkbio_module

	xref	kanoend_module
	xref	sonyaend_module
	xref	jaxend_module
	xref	indianend_module
	xref	subzeroend_module
	xref	swatend_module
	xref	liaend_module
	xref	robo1end_module
	xref	robo2end_module
	xref	laoend_module
	xref	tuskend_module
	xref	sheevaend_module
	xref	shangend_module
	xref	lkangend_module
	xref	smokeend_module
	xref	godsend_module

	xref	options_module
	xref	optcoin_module
	xref	title_module
	xref	raidfly_module
	xref	legal_module
	xref	story2a_module
	xref	story2b_module
	xref	story2c_module
	xref	story3a_module
	xref	story3b_module
	xref	story3c_module
	xref	story3d_module
	xref	storykn_module
	xref	storysz_module
	xref	storylk_module

	xref	redgrad_module
	xref	greengrad_module
	xref	bluegrad_module

	xref	skdie1_module
	xref	skdie2_module
	xref	skdiepit_module
	xref	hscore_module
	xref	mockpit_module			

	CNOP 0,4
	global	table_o_mods
table_o_mods
;	module name					; background #
; ---------------------			------------------------
	dw	subway_module			; 0
	dw	street_module			; 1
	dw	bank_module				; 2
	dw	roof_module				; 3
	dw	tower_module			; 4
	dw	bridge_module 			; 5
	dw	soul_module				; 6
	dw	bell_module				; 7
	dw	temple_module 			; 8
	dw	grave_module			; 9
	dw	pit_module				; a
	dw	portal_module			; b
	dw	buyin_module			; c
	dw	hscore_module			; d
	dw	ladder_module 			; e
	dw	vs_module				; f
	dw	coin_module				; 10
	dw	0						; 11, not used
	dw	nowall_module			; 12
	dw	redgrad_module		; 13
	dw	greengrad_module	; 14
	dw	bluegrad_module		; 15
	dw	raidfly_module		; 16
	dw	title_module			; 17
	dw	psel_module				; 18
	dw	kanobio_module			; 19, start of bios
	dw	sonyabio_module			; 1a
	dw	jaxbio_module			; 1b
	dw	indbio_module			; 1c
	dw	subbio_module			; 1d
	dw	swatbio_module			; 1e
	dw	liabio_module			; 1f
	dw	robo1bio_module			; 20
	dw	robo2bio_module			; 21
	dw	laobio_module			; 22
	dw	tuskbio_module			; 23
	dw	sgbio_module			; 24
	dw	stbio_module			; 25
	dw	lkbio_module			; 26
	dw	options_module			; 27
	dw	optcoin_module			; 28,
	dw	legal_module			; 29, legals
	dw	story2a_module			; 2a, grnkahn
	dw	story2b_module			; 2b, lia
	dw	story2c_module			; 2c, earth
	dw	story3a_module			; 2d, city
	dw	story3b_module			; 2e, souls
	dw	story3c_module			; 2f, heroes
	dw	story3d_module			; 30, centaurs
	dw	storykn_module			; 31, kano story
	dw	storysz_module			; 32, subzero story
	dw	storylk_module			; 33, liu kang story
	dw	kanoend_module			; 34, start of endings
	dw	sonyaend_module			; 35
	dw	jaxend_module			; 36
	dw	indianend_module		; 37
	dw	subzeroend_module		; 38
	dw	swatend_module			; 39
	dw	liaend_module			; 3a
	dw	robo1end_module			; 3b
	dw	robo2end_module			; 3c
	dw	laoend_module			; 3d
	dw	tuskend_module			; 3e
	dw	sheevaend_module		; 3f
	dw	shangend_module			; 40
	dw	lkangend_module			; 41
	dw	smokeend_module			; 42
	dw	godsend_module			; 43
	dw	skdie1_module					; 44
	dw	skdie2_module					; 45
	dw	skdiepit_module			; 46
	dw	mockpit_module			; 47
;*	Format of Module Table
;*	WORD	autoerase color
;*	WORD	ground y position
;*	WORD	initial world y coord
;*	WORD	initial world x coord
;*	WORD	scroll left limit
;*	WORD	scroll right limit
;*	LONG	ptr to a function that will initiate various processes for the background module
;*	LONG	ptr to a table of longs used to specify scroll rates
;*	LONG	ptr to a table of two longs per record. [object list for module, worldtlx variable to use]
;*	LONG	ptr to first background mod variable to fill
;*
;*	FOLLOWING DATA REPEATED DEPENDING ON BACKGROUND:
;*	LONG	command to skip background level
;*
;*	LONG	ptr to background module (OMODULE) data
;*
;*	LONG	command to center x coord of background modules
;*
;*	LONG,LONG	list of background modules and world x variables used to center

******************************************************************************/

#include "win_port.h"

#if 0///ndef BLOCK_MKBT_ADDITIONAL_ASSEMBLY
	CNOP 0,4
	global dlists_buyin
dlists_buyin
	dw	baklst4,worldtlx+16/8
	dw	baklst3,worldtlx+16/8
	dw	baklst2,worldtlx+16/8
	dw	baklst1,worldtlx+16/8
	dw	objlst,worldtlx+16/8
	dw	objlst2,worldtlx+16/8
	dw	0

	global dlists_end1
dlists_end1
	dw	baklst1,worldtlx+16/8
	dw	baklst2,worldtlx+16/8
	dw	objlst,worldtlx+16/8
	dw	objlst2,worldtlx+16/8
	dw	0

	global dlists_end2
dlists_end2
	dw	baklst1,worldtlx+16/8
	dw	baklst3,worldtlx+16/8
	dw	objlst,worldtlx+16/8
	dw	objlst2,worldtlx+16/8
	dw	0

	CNOP 0,4
	global no_scroll
no_scroll
	dw	0*SCX/100 			; 8
	dw	0*SCX/100 			; 7
	dw	0*SCX/100 			; 6
	dw	0*SCX/100 			; 5 -
	dw	$10000*SCX/100 		; 4 -
	dw	$10000*SCX/100 		; 3 - fence
	dw	$18000*SCX/100 		; 2 - wall
	dw	$20000*SCX/100 		; 1 - players
	dw	0*SCX/100 			; 0

	CNOP 0,4
	global dlists_bogus
dlists_bogus
	dw	baklst8,worldtlx8+2
	dw	baklst7,worldtlx7+2
	dw	baklst6,worldtlx6+2
	dw	baklst5,worldtlx5+2
	dw	baklst4,worldtlx4+2
	dw	baklst3,worldtlx3+2
	dw	baklst2,worldtlx2+2
	dw	baklst1,worldtlx+2
	global dlists_objlst
dlists_objlst
	dw	objlst,worldtlx+2
	dw	objlst2,worldtlx+2
	dw	0
#endif

extern	long roof_module[];
extern	long subway_module[];
extern	long street_module[];
extern	long temple_module[];
extern	long bridge_module[];
extern	long tower_module[];
extern	long bell_module[];
extern	long grave_module[];
extern	long soul_module[];
extern	long pit_module[];
extern	long bank_module[];
extern	long portal_module[];
extern	long nowall_module[];
extern	long buyin_module[];
extern	long ladder_module[];
extern	long vs_module[];
extern	long coin_module[];
extern	long psel_module[];
extern	long kanobio_module[];
extern	long sonyabio_module[];
extern	long jaxbio_module[];
extern	long indbio_module[];
extern	long subbio_module[];
extern	long swatbio_module[];
extern	long liabio_module[];
extern	long robo1bio_module[];
extern	long robo2bio_module[];
extern	long laobio_module[];
extern	long tuskbio_module[];
extern	long sgbio_module[];
extern	long stbio_module[];
extern	long lkbio_module[];
extern	long kanoend_module[];
extern	long sonyaend_module[];
extern	long jaxend_module[];
extern	long indianend_module[];
extern	long subzeroend_module[];
extern	long swatend_module[];
extern	long liaend_module[];
extern	long robo1end_module[];
extern	long robo2end_module[];
extern	long laoend_module[];
extern	long tuskend_module[];
extern	long sheevaend_module[];
extern	long shangend_module[];
extern	long lkangend_module[];
extern	long smokeend_module[];
extern	long godsend_module[];
extern	long options_module[];
extern	long optcoin_module[];
extern	long title_module[];
extern	long raidfly_module[];
extern	long legal_module[];
extern	long story2a_module[];
extern	long story2b_module[];
extern	long story2c_module[];
extern	long story3a_module[];
extern	long story3b_module[];
extern	long story3c_module[];
extern	long story3d_module[];
extern	long storykn_module[];
extern	long storysz_module[];
extern	long storylk_module[];
extern	long redgrad_module[];
extern	long greengrad_module[];
extern	long bluegrad_module[];
extern	long skdie1_module[];
extern	long skdie2_module[];
extern	long skdiepit_module[];
extern	long hscore_module[];
extern	long mockpit_module[];

void *table_o_mods[] = {
	&subway_module,		//subway_module			; 0
	&street_module,		//street_module			; 1
	&bank_module,			//bank_module				; 2
	&roof_module,			//roof_module				; 3
	&tower_module,			//tower_module				; 4
	&bridge_module,		//bridge_module 			; 5
	&soul_module,			//soul_module				; 6
	&bell_module,			//bell_module				; 7
	&temple_module,		//temple_module 			; 8
	&grave_module,			//grave_module				; 9
	&pit_module,			//pit_module				; a
	&portal_module,		//portal_module			; b
	&buyin_module,			//buyin_module				; c
	&hscore_module,		//hscore_module			; d
	&ladder_module,		//ladder_module 			; e
	&vs_module,				//vs_module					; f
	&coin_module,			//coin_module				; 10
	0,							//0							; 11, not used
	&nowall_module,		//nowall_module			; 12
	&redgrad_module,		//redgrad_module			; 13
	&greengrad_module, 	//greengrad_module		; 14
	&bluegrad_module,		//bluegrad_module			; 15
	&raidfly_module,		//raidfly_module			; 16
	&title_module,			//title_module				; 17
	&psel_module,			//psel_module				; 18
	&kanobio_module,		//kanobio_module			; 19, start of bios
	&sonyabio_module,		//sonyabio_module			; 1a
	&jaxbio_module,		//jaxbio_module			; 1b
	&indbio_module,		//indbio_module			; 1c
	&subbio_module,		//subbio_module			; 1d
	&swatbio_module,		//swatbio_module			; 1e
	&liabio_module,		//liabio_module			; 1f
	&robo1bio_module,		//robo1bio_module			; 20
	&robo2bio_module,		//robo2bio_module			; 21
	&laobio_module,		//laobio_module			; 22
	&tuskbio_module,		//tuskbio_module			; 23
	&sgbio_module,			//sgbio_module				; 24
	&stbio_module,			//stbio_module				; 25
	&lkbio_module,			//lkbio_module				; 26
	&options_module,		//options_module			; 27
	&optcoin_module,		//optcoin_module			; 28,
	&legal_module,			//legal_module				; 29, legals
	&story2a_module,		//story2a_module			; 2a, grnkahn
	&story2b_module,		//story2b_module			; 2b, lia
	&story2c_module,		//story2c_module			; 2c, earth
	&story3a_module,		//story3a_module			; 2d, city
	&story3b_module,		//story3b_module			; 2e, souls
	&story3c_module,		//story3c_module			; 2f, heroes
	&story3d_module,		//story3d_module			; 30, centaurs
	&storykn_module,		//storykn_module			; 31, kano story
	&storysz_module,		//storysz_module			; 32, subzero story
	&storylk_module,		//storylk_module			; 33, liu kang story
	&kanoend_module,		//kanoend_module			; 34, start of endings
	&sonyaend_module,		//sonyaend_module			; 35
	&jaxend_module,		//jaxend_module			; 36
	&indianend_module,	//indianend_module		; 37
	&subzeroend_module,	//subzeroend_module		; 38
	&swatend_module,		//swatend_module			; 39
	&liaend_module,		//liaend_module			; 3a
	&robo1end_module,		//robo1end_module			; 3b
	&robo2end_module,		//robo2end_module			; 3c
	&laoend_module,		//laoend_module			; 3d
	&tuskend_module,		//tuskend_module			; 3e
	&sheevaend_module,	//sheevaend_module		; 3f
	&shangend_module,		//shangend_module			; 40
	&lkangend_module,		//lkangend_module			; 41
	&smokeend_module,		//smokeend_module			; 42
	&godsend_module,		//godsend_module			; 43
	&skdie1_module,		//skdie1_module			; 44
	&skdie2_module,		//skdie2_module			; 45
	&skdiepit_module,		//skdiepit_module			; 46
	&mockpit_module		//mockpit_module			; 47
};
