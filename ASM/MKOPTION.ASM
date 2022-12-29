;******************************************************************************
; File: mkoption.s
;
; By: David Schwartz
;
; Date: March 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III option Animation Tables
;******************************************************************************/


	include win95.i
	include mkchar.i
	include mkbkgd.i

;*********************************
;**			EXTERNALS			**
;*********************************
;	EXTERN _logobg_CLT : DWORD
	EXTERN _no_scroll : DWORD
	EXTERN _dlists_bogus : DWORD
	EXTERN _dlists_buyin : DWORD

	PUBLIC _FRAME01
	PUBLIC _POLE01

	BEGIN_DATA


;*********************************
;**			PALETTES		**
;*********************************
	ALIGN 4
	include palsrc\option.mas

;*********************************
;**			ANIMATIONS			**
;*********************************
 	PUBLIC _options_anims
_options_anims:

	ALIGN 4
	PUBLIC _a_opt_dragon
_a_opt_dragon:
	DD ani_swpal
	DD _POLE01-_options_anims
	DD ani_swpal
	DD POLE02-_options_anims
	DD ani_swpal
	DD POLE03-_options_anims
	DD ani_swpal
	DD POLE04-_options_anims
	DD ani_swpal
	DD POLE05-_options_anims
	DD ani_swpal
	DD POLE06-_options_anims
	DD ani_swpal
	DD POLE07-_options_anims
	DD ani_swpal
	DD POLE08-_options_anims
	DD ani_swpal
	DD POLE09-_options_anims
	DD ani_swpal
	DD POLE10-_options_anims
	DD ani_swpal
	DD POLE11-_options_anims
	DD ani_swpal
	DD POLE12-_options_anims
	DD ani_swpal
	DD POLE13-_options_anims
	DD ani_swpal
	DD POLE14-_options_anims
	DD ani_swpal
	DD POLE15-_options_anims
	DD ani_swpal
	DD POLE16-_options_anims
	DD ani_swpal
	DD POLE17-_options_anims
	DD ani_swpal
	DD POLE18-_options_anims
	DD ani_swpal
	DD POLE19-_options_anims
	DD ani_swpal
	DD POLE20-_options_anims
	DD ani_swpal
	DD POLE21-_options_anims
	DD ani_swpal
	DD POLE22-_options_anims
	DD ani_swpal
	DD POLE23-_options_anims
	DD ani_swpal
	DD POLE24-_options_anims
	DD 0

	PUBLIC _a_logo
_a_logo:
	DD ani_swpal					; start
	DD _FRAME01-_options_anims
	DD ani_swpal
	DD FRAME02-_options_anims
	DD ani_swpal
	DD FRAME03-_options_anims
	DD ani_swpal
	DD FRAME04-_options_anims
	DD ani_swpal
	DD FRAME05-_options_anims
	DD 0

	DD ani_swpal					; game configure
	DD FRAME05-_options_anims
	DD ani_swpal
	DD FRAME06-_options_anims
	DD ani_swpal
	DD FRAME07-_options_anims
	DD ani_swpal
	DD FRAME08-_options_anims
	DD ani_swpal
	DD FRAME09-_options_anims
	DD 0

	DD ani_swpal					; control config
	DD FRAME09-_options_anims
	DD ani_swpal
	DD FRAME10-_options_anims
	DD ani_swpal
	DD FRAME11-_options_anims
	DD ani_swpal
	DD FRAME12-_options_anims
	DD ani_swpal
	DD FRAME13-_options_anims
	DD 0

	DD ani_swpal					; sound & music
	DD FRAME13-_options_anims
	DD ani_swpal
	DD FRAME14-_options_anims
	DD ani_swpal
	DD FRAME15-_options_anims
	DD ani_swpal
	DD FRAME16-_options_anims
	DD ani_swpal
	DD _FRAME01-_options_anims
	DD 0

	DD ani_swpal					; start
	DD FRAME05-_options_anims
	DD ani_swpal
	DD FRAME04-_options_anims
	DD ani_swpal
	DD FRAME03-_options_anims
	DD ani_swpal
	DD FRAME02-_options_anims
	DD ani_swpal
	DD _FRAME01-_options_anims
	DD 0

	DD ani_swpal					; game configure
	DD FRAME09-_options_anims
	DD ani_swpal
	DD FRAME08-_options_anims
	DD ani_swpal
	DD FRAME07-_options_anims
	DD ani_swpal
	DD FRAME06-_options_anims
	DD ani_swpal
	DD FRAME05-_options_anims
	DD 0

	DD ani_swpal					; control config
	DD FRAME13-_options_anims
	DD ani_swpal
	DD FRAME12-_options_anims
	DD ani_swpal
	DD FRAME11-_options_anims
	DD ani_swpal
	DD FRAME10-_options_anims
	DD ani_swpal
	DD FRAME09-_options_anims
	DD 0

	DD ani_swpal					; sound & music
	DD _FRAME01-_options_anims
	DD ani_swpal
	DD FRAME16-_options_anims
	DD ani_swpal
	DD FRAME15-_options_anims
	DD ani_swpal
	DD FRAME14-_options_anims
	DD ani_swpal
	DD FRAME13-_options_anims
	DD 0

	PUBLIC _a_credit
_a_credit:
	DD ani_swpal					; start ->credits
	DD _FRAME01-_options_anims
	DD ani_swpal
	DD QUEST1-_options_anims
	DD ani_swpal
	DD QUEST2-_options_anims
;	DW ani_swpal
;	DW QUEST3-_options_anims
	DD ani_swpal
	DD QUEST4-_options_anims
	DD 0

	DD ani_swpal					; credits -> start
	DD QUEST4-_options_anims
;	DW ani_swpal
;	DW QUEST3-_options_anims
	DD ani_swpal
	DD QUEST2-_options_anims
	DD ani_swpal
	DD QUEST1-_options_anims
	DD ani_swpal
	DD _FRAME01-_options_anims
	DD 0

QUEST1:
	DD QUEST1_IMG-_options_anims
	DW 86, 71, 43, 70
	DD QUEST1P
QUEST2:
	DD QUEST2_IMG-_options_anims
	DW 88, 78, 44, 70
	DD QUEST2P
QUEST4:
	DD QUEST4_IMG-_options_anims
	DW 87, 71, 44, 69
	DD QUEST4P
_FRAME01:
	DD _FRAME01_IMG-_options_anims
	DW 87, 71, 44, 69
	DD FRAME01P
FRAME02:
	DD FRAME02_IMG-_options_anims
	DW 102, 77, 51, 70
	DD FRAME02P
FRAME03:
	DD FRAME03_IMG-_options_anims
	DW 109, 79, 54, 71
	DD FRAME03P
FRAME04:
	DD FRAME04_IMG-_options_anims
	DW 102, 77, 51, 70
	DD FRAME04P
FRAME05:
	DD FRAME05_IMG-_options_anims
	DW 87, 71, 44, 69
	DD FRAME05P
FRAME06:
	DD FRAME06_IMG-_options_anims
	DW 102, 77, 51, 70
	DD FRAME06P
FRAME07:
	DD FRAME07_IMG-_options_anims
	DW 109, 80, 54, 71
	DD FRAME07P
FRAME08:
	DD FRAME08_IMG-_options_anims
	DW 100, 77, 51, 70
	DD FRAME08P
FRAME09:
	DD FRAME09_IMG-_options_anims
	DW 88, 71, 44, 69
	DD FRAME09P
FRAME10:
	DD FRAME10_IMG-_options_anims
	DW 102, 77, 51, 70
	DD FRAME10P
FRAME11:
	DD FRAME11_IMG-_options_anims
	DW 109, 80, 54, 71
	DD FRAME11P
FRAME12:
	DD FRAME12_IMG-_options_anims
	DW 100, 77, 51, 70
	DD FRAME12P
FRAME13:
	DD FRAME13_IMG-_options_anims
	DW 87, 71, 44, 69
	DD FRAME13P
FRAME14:
	DD FRAME14_IMG-_options_anims
	DW 103, 77, 51, 70
	DD FRAME14P
FRAME15:
	DD FRAME15_IMG-_options_anims
	DW 109, 80, 54, 71
	DD FRAME15P
FRAME16:
	DD FRAME16_IMG-_options_anims
	DW 100, 77, 50, 70
	DD FRAME16P
_POLE01:
	DD _POLE01_IMG-_options_anims
	DW 114, 100, 58, 100
	DD POLE01P
POLE02:
	DD POLE02_IMG-_options_anims
	DW 112, 100, 57, 100
	DD POLE02P
POLE03:
	DD POLE03_IMG-_options_anims
	DW 102, 100, 52, 100
	DD POLE03P
POLE04:
	DD POLE04_IMG-_options_anims
	DW 84, 100, 43, 100
	DD POLE04P
POLE05:
	DD POLE05_IMG-_options_anims
	DW 62, 100, 32, 100
	DD POLE05P
POLE06:
	DD POLE06_IMG-_options_anims
	DW 35, 100, 18, 100
	DD POLE06P
POLE07:
	DD POLE07_IMG-_options_anims
	DW 16, 100, 8, 100
	DD POLE07P
POLE08:
	DD POLE08_IMG-_options_anims
	DW 36, 100, 18, 100
	DD POLE08P
POLE09:
	DD POLE09_IMG-_options_anims
	DW 63, 100, 31, 100
	DD POLE09P
POLE10:
	DD POLE10_IMG-_options_anims
	DW 85, 101, 42, 100
	DD POLE10P
POLE11:
	DD POLE11_IMG-_options_anims
	DW 101, 100, 50, 100
	DD POLE11P
POLE12:
	DD POLE12_IMG-_options_anims
	DW 111, 100, 55, 100
	DD POLE12P
POLE13:
	DD POLE13_IMG-_options_anims
	DW 114, 100, 56, 100
	DD POLE13P
POLE14:
	DD POLE14_IMG-_options_anims
	DW 111, 100, 55, 100
	DD POLE14P
POLE15:
	DD POLE15_IMG-_options_anims
	DW 101, 100, 50, 100
	DD POLE15P
POLE16:
	DD POLE16_IMG-_options_anims
	DW 85, 100, 42, 100
	DD POLE16P
POLE17:
	DD POLE17_IMG-_options_anims
	DW 62, 100, 31, 100
	DD POLE17P
POLE18:
	DD POLE18_IMG-_options_anims
	DW 36, 100, 18, 100
	DD POLE18P
POLE19:
	DD POLE19_IMG-_options_anims
	DW 16, 100, 8, 100
	DD POLE19P
POLE20:
	DD POLE20_IMG-_options_anims
	DW 36, 100, 18, 100
	DD POLE20P
POLE21:
	DD POLE21_IMG-_options_anims
	DW 62, 101, 31, 100
	DD POLE21P
POLE22:
	DD POLE22_IMG-_options_anims
	DW 85, 100, 43, 100
	DD POLE22P
POLE23:
	DD POLE23_IMG-_options_anims
	DW 101, 100, 51, 100
	DD POLE23P
POLE24:
	DD POLE24_IMG-_options_anims
	DW 112, 100, 57, 100
	DD POLE24P

	include attract\options\mk33dlog.psi

;*********************************
;**		 MODULE DATA			**
;*********************************
	ALIGN 4
	include attract\options\logobg.mod

	ALIGN 4
	PUBLIC _options_module
_options_module:
	DW 0		 		; autoerase color
	DW 000h				; initial world y
	DW 000h	     			; ground y
	DW 000h				; initial worldx
	DW -0500h 	  			; scroll left limit
	DW 0500h	  			; scroll right limit

	DD _calla_return
	DD _no_scroll			; scroll table
	DD _dlists_bogus

	DD _bakmods

	DD logomodBMOD
	DW 0fff6h,0fff0h
	DD 0ffffffffh
	DD 0				; no floor here !!



;*********************************
;**			PALETTES
;*********************************
	ALIGN 4
	include palsrc\coinpal.mas

;*********************************
;**			ANIMATIONS			**
;*********************************
	ALIGN 4

;*********************************
;**		 MODULE DATA			**
;*********************************
	ALIGN 4
	include attract\options\mk3coin.mod

	ALIGN 4
	PUBLIC _optcoin_module
_optcoin_module:
	DW NULL_IRQSKYE  	 	; autoerase color
	DW 0	      		; initial world y
	DW 0	      		; ground y
	DW 0	      		; initial worldx
	DW 0 	      		; scroll left limit
	DW 0	      		; scroll right limit
	DD _calla_return
	DD _no_scroll     		; scroll table
	DD _dlists_buyin
	DD _bakmods
	DD coinmodBMOD
	DW 0ffbeh,0ff98h
	DD FORCE_EXIT
	DD 0

	ALIGN 4
;	global option_text
;option_text
;	include ..\attract\options\optextbg.asm

	END_DATA
	end
