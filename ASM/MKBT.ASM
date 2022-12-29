;******************************************************************************
; File: mkbt.s
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Background Module Composition Tables
;******************************************************************************/
; DATA DEFINITIONS, BETTER MATCH IN MKBKGD.H

;************************************************
;* NOTE: ADDING BACKGROUND INFO
;*1) update: makefile.mak, mkbt.s
;*
;*2) change all bit offsets into byte offsets by dividing by 8 (important)
;************************************************


	include win95.i
	include mkbkgd.i

	BEGIN_DATA

;*********************************
;**			EXTERNALS			**
;*********************************

IF 0

	EXTERN	roof_module:
	EXTERN	subway_module:
	EXTERN	street_module:
	EXTERN	temple_module:
	EXTERN	bridge_module:
	EXTERN	tower_module:
	EXTERN	bell_module:
	EXTERN	grave_module:
	EXTERN	soul_module:
	EXTERN	pit_module:
	EXTERN	bank_module:
	EXTERN	portal_module:
	EXTERN	nowall_module:

	EXTERN	buyin_module:
	EXTERN	ladder_module:
	EXTERN	vs_module:
	EXTERN	coin_module:
	EXTERN	psel_module:

	EXTERN	kanobio_module:
	EXTERN	sonyabio_module:
	EXTERN	jaxbio_module:
	EXTERN	indbio_module:
	EXTERN	subbio_module:
	EXTERN	swatbio_module:
	EXTERN	liabio_module:
	EXTERN	robo1bio_module:
	EXTERN	robo2bio_module:
	EXTERN	laobio_module:
	EXTERN	tuskbio_module:
	EXTERN	sgbio_module:
	EXTERN	stbio_module:
	EXTERN	lkbio_module:

	EXTERN	kanoend_module:
	EXTERN	sonyaend_module:
	EXTERN	jaxend_module:
	EXTERN	indianend_module:
	EXTERN	subzeroend_module:
	EXTERN	swatend_module:
	EXTERN	liaend_module:
	EXTERN	robo1end_module:
	EXTERN	robo2end_module:
	EXTERN	laoend_module:
	EXTERN	tuskend_module:
	EXTERN	sheevaend_module:
	EXTERN	shangend_module:
	EXTERN	lkangend_module:
	EXTERN	smokeend_module:
	EXTERN	godsend_module:

	EXTERN	options_module:
	EXTERN	optcoin_module:
	EXTERN	title_module:
	EXTERN	raidfly_module:
	EXTERN	legal_module:
	EXTERN	story2a_module:
	EXTERN	story2b_module:
	EXTERN	story2c_module:
	EXTERN	story3a_module:
	EXTERN	story3b_module:
	EXTERN	story3c_module:
	EXTERN	story3d_module:
	EXTERN	storykn_module:
	EXTERN	storysz_module:
	EXTERN	storylk_module:

	EXTERN	redgrad_module:
	EXTERN	greengrad_module:
	EXTERN	bluegrad_module:

	EXTERN	skdie1_module:
	EXTERN	skdie2_module:
	EXTERN	skdiepit_module:
	EXTERN	hscore_module:
	EXTERN	mockpit_module:			



	ALIGN 4
	PUBLIC	table_o_mods
table_o_mods:
;	module name					; background #
; ---------------------			------------------------
	DD subway_module			; 0
	DD street_module			; 1
	DD bank_module				; 2
	DD roof_module				; 3
	DD tower_module			; 4
	DD bridge_module 			; 5
	DD soul_module				; 6
	DD bell_module				; 7
	DD temple_module 			; 8
	DD grave_module			; 9
	DD pit_module				; a
	DD portal_module			; b
	DD buyin_module			; c
	DD hscore_module			; d
	DD ladder_module 			; e
	DD vs_module				; f
	DD coin_module				; 10
	DD 0						; 11, not used
	DD nowall_module			; 12
	DD redgrad_module		; 13
	DD greengrad_module	; 14
	DD bluegrad_module		; 15
	DD raidfly_module		; 16
	DD title_module			; 17
	DD psel_module				; 18
	DD kanobio_module			; 19, start of bios
	DD sonyabio_module			; 1a
	DD jaxbio_module			; 1b
	DD indbio_module			; 1c
	DD subbio_module			; 1d
	DD swatbio_module			; 1e
	DD liabio_module			; 1f
	DD robo1bio_module			; 20
	DD robo2bio_module			; 21
	DD laobio_module			; 22
	DD tuskbio_module			; 23
	DD sgbio_module			; 24
	DD stbio_module			; 25
	DD lkbio_module			; 26
	DD options_module			; 27
	DD optcoin_module			; 28,
	DD legal_module			; 29, legals
	DD story2a_module			; 2a, grnkahn
	DD story2b_module			; 2b, lia
	DD story2c_module			; 2c, earth
	DD story3a_module			; 2d, city
	DD story3b_module			; 2e, souls
	DD story3c_module			; 2f, heroes
	DD story3d_module			; 30, centaurs
	DD storykn_module			; 31, kano story
	DD storysz_module			; 32, subzero story
	DD storylk_module			; 33, liu kang story
	DD kanoend_module			; 34, start of endings
	DD sonyaend_module			; 35
	DD jaxend_module			; 36
	DD indianend_module		; 37
	DD subzeroend_module		; 38
	DD swatend_module			; 39
	DD liaend_module			; 3a
	DD robo1end_module			; 3b
	DD robo2end_module			; 3c
	DD laoend_module			; 3d
	DD tuskend_module			; 3e
	DD sheevaend_module		; 3f
	DD shangend_module			; 40
	DD lkangend_module			; 41
	DD smokeend_module			; 42
	DD godsend_module			; 43
	DD skdie1_module					; 44
	DD skdie2_module					; 45
	DD skdiepit_module			; 46
	DD mockpit_module			; 47
;*	Format of Module Table
;*	WORD	autoerase color
;*	WORD	ground y position
;*	WORD	initial _world y coord
;*	WORD	initial _world x coord
;*	WORD	scroll left limit
;*	WORD	scroll right limit
;*	LONG	ptr to a function that will initiate various processes for the background module
;*	LONG	ptr to a table of longs used to specify scroll rates
;*	LONG	ptr to a table of two longs per record. [object list for module, _worldtlx variable to use]
;*	LONG	ptr to first background mod variable to fill
;*
;*	FOLLOWING DATA REPEATED DEPENDING ON BACKGROUND:
;*	LONG	command to skip background level
;*
;*	LONG	ptr to background module (OMODULE) data
;*
;*	LONG	command to center x coord of background modules
;*
;*	LONG,LONG	list of background modules and _world x variables used to center


ENDIF


	ALIGN 4
	PUBLIC _dlists_buyin
_dlists_buyin:
	DD _baklst4,_worldtlx+16/8
	DD _baklst3,_worldtlx+16/8
	DD _baklst2,_worldtlx+16/8
	DD _baklst1,_worldtlx+16/8
	DD _objlst,_worldtlx+16/8
	DD _objlst2,_worldtlx+16/8
	DD 0

	PUBLIC _dlists_end1
_dlists_end1:
	DD _baklst1,_worldtlx+16/8
	DD _baklst2,_worldtlx+16/8
	DD _objlst,_worldtlx+16/8
	DD _objlst2,_worldtlx+16/8
	DD 0

	PUBLIC _dlists_end2
_dlists_end2:
	DD _baklst1,_worldtlx+16/8
	DD _baklst3,_worldtlx+16/8
	DD _objlst,_worldtlx+16/8
	DD _objlst2,_worldtlx+16/8
	DD 0

	ALIGN 4
	PUBLIC _no_scroll
_no_scroll:
	DD 0*SCX/100 			; 8
	DD 0*SCX/100 			; 7
	DD 0*SCX/100 			; 6
	DD 0*SCX/100 			; 5 -
	DD 010000h*SCX/100 		; 4 -
	DD 010000h*SCX/100 		; 3 - fence
	DD 018000h*SCX/100 		; 2 - wall
	DD 020000h*SCX/100 		; 1 - players
	DD 0*SCX/100 			; 0

	ALIGN 4
	PUBLIC _dlists_bogus
_dlists_bogus:
	DD _baklst8,_worldtlx8+2
	DD _baklst7,_worldtlx7+2
	DD _baklst6,_worldtlx6+2
	DD _baklst5,_worldtlx5+2
	DD _baklst4,_worldtlx4+2
	DD _baklst3,_worldtlx3+2
	DD _baklst2,_worldtlx2+2
	DD _baklst1,_worldtlx+2
	PUBLIC _dlists__objlst
_dlists__objlst:
	DD _objlst,_worldtlx+2
	DD _objlst2,_worldtlx+2
	DD 0

	END_DATA
	end
