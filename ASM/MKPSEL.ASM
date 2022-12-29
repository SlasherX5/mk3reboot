;******************************************************************************
; File: mkpsel.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Mortal Kombat Player Select
;******************************************************************************/

	include win95.i
	include mkchar.i
	include mkbkgd.i

;*********************************
;**			EXTERNALS			**
;*********************************
	EXTERN _no_scroll : DWORD
	EXTERN _boonpal : DWORD
	EXTERN _mk3_calla : DWORD


	BEGIN_DATA

;*********************************
;**			PALETTES
;*********************************
	ALIGN 4
	include palsrc\selpal.mas
	ALIGN 4
	include palsrc\laddrpal.mas

;*********************************
;**			ANIMATIONS			**
;*********************************
	ALIGN 4
	PUBLIC _psel_anims
	PUBLIC _ladder_anims
_psel_anims:
mugshot_anims:
_ladder_anims:

	ALIGN 4
	PUBLIC _a_box_flip
_a_box_flip:
	DD _BOX_01-_psel_anims
	DD _BOX_02-_psel_anims
	DD _BOX_03-_psel_anims
	DD _BOX_04-_psel_anims
	DD _BOX_05-_psel_anims
	DD _BOX_06-_psel_anims
	DD _BOX_07-_psel_anims
	DD _BOX_08-_psel_anims
	DD _BOX_09-_psel_anims
	DD 0
	DD _BOX_08-_psel_anims
	DD _BOX_07-_psel_anims
	DD _BOX_06-_psel_anims
	DD _BOX_05-_psel_anims
	DD _BOX_04-_psel_anims
	DD _BOX_03-_psel_anims
	DD _BOX_02-_psel_anims
	DD _BOX_01-_psel_anims
	DD 0

	PUBLIC _a_badge_spin
_a_badge_spin:
	DD _MKCOIN_01-mugshot_anims
	DD _MKCOIN_02-mugshot_anims
	DD _MKCOIN_03-mugshot_anims
	DD _MKCOIN_04-mugshot_anims
	DD _MKCOIN_05-mugshot_anims
	DD _MKCOIN_06-mugshot_anims
	DD _MKCOIN_07-mugshot_anims
	DD _MKCOIN_08-mugshot_anims
	DD _MKCOIN_09-mugshot_anims
	DD ani_jump
	DD _a_badge_spin-mugshot_anims

	ALIGN 4
	PUBLIC _MKCOIN_01
_MKCOIN_01:
	DD _MKCOIN_01_TPG-mugshot_anims
	DW 35, 33, 0, 0
	DD _MKCOIN_P
_MKCOIN_01_TPG:
	DW 0,   217,     1,    0

	ALIGN 4
	PUBLIC _MKCOIN_02
_MKCOIN_02:
	DD _MKCOIN_02_TPG-mugshot_anims
	DW 34, 33, 0, 0
_MKCOIN_02_TPG:
	DW 0,   217,    34,    0

	ALIGN 4
	PUBLIC _MKCOIN_03
_MKCOIN_03:
	DD _MKCOIN_03_TPG-mugshot_anims
	DW 30, 33, 0, 0
_MKCOIN_03_TPG:
	DW 0,   185,    18,    0

	ALIGN 4
	PUBLIC _MKCOIN_04
_MKCOIN_04:
	DD _MKCOIN_04_TPG-mugshot_anims
	DW 23, 33, -3, 0
_MKCOIN_04_TPG:
	DW 0,   185,   118,    0

	ALIGN 4
	PUBLIC _MKCOIN_05
_MKCOIN_05:
	DD _MKCOIN_05_TPG-mugshot_anims
	DW 14, 33, -9, 0
_MKCOIN_05_TPG:
	DW 0,   165,   129,    0

	ALIGN 4
	PUBLIC _MKCOIN_06
_MKCOIN_06:
	DD _MKCOIN_06_TPG-mugshot_anims
	DW 10, 33, -12, 0
_MKCOIN_06_TPG:
	DW 0,   165,   162,    0

	ALIGN 4
	PUBLIC _MKCOIN_07
_MKCOIN_07:
	DD _MKCOIN_07_TPG-mugshot_anims
	DW 21, 33, -8, 0
_MKCOIN_07_TPG:
	DW 0,   181,   151,    0

	ALIGN 4
	PUBLIC _MKCOIN_08
_MKCOIN_08:
	DD _MKCOIN_08_TPG-mugshot_anims
	DW 30, 33, -3, 0
_MKCOIN_08_TPG:
	DW 0,   217,   179,    0

	ALIGN 4
	PUBLIC _MKCOIN_09
_MKCOIN_09:
	DD _MKCOIN_09_TPG-mugshot_anims
	DW 34, 33, -1, 0
_MKCOIN_09_TPG:
	DW 0,   217,    67,    0

	ALIGN 4
	PUBLIC _HDMOTARO
_HDMOTARO:
	DD _HDMOTARO_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDMOTA_P
_HDMOTARO_TPG:
	DW 2,    45,   173,    0

	;CNOP	0,4
	PUBLIC _HDSHANG
_HDSHANG:
	DD _HDSHANG_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSHAG_P
_HDSHANG_TPG:
	DW 4,   109,     1,    0

	;CNOP	0,4
	PUBLIC _HDSUBZERO
_HDSUBZERO:
	DD _HDSUBZERO_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSUBZ_P
_HDSUBZERO_TPG:
	DW 4,   149,    51,    0

	;CNOP	0,4
	PUBLIC _HDSWAT
_HDSWAT:
	DD _HDSWAT_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSWAT_P
_HDSWAT_TPG:
	DW 4,    81,   104,    0

	;CNOP	0,4
	PUBLIC _HDBRIDE
_HDBRIDE:
	DD _HDBRIDE_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDBRDE_P
_HDBRIDE_TPG:
	DW 4,   161,   151,    0

	;CNOP	0,4
	PUBLIC _HDJAX
_HDJAX:
	DD _HDJAX_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDJAX_P
_HDJAX_TPG:
	DW 2,    85,   173,    0
	
	PUBLIC _HDJAX2
_HDJAX2:
	DD _HDJAX2_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDJAX_P
_HDJAX2_TPG:
	DW 2,    85,   173,    0

	;CNOP	0,4
	PUBLIC _HDLAO
_HDLAO:
	DD _HDLAO_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDLAO_P
_HDLAO_TPG:
	DW 4,   149,     1,    0

	;CNOP	0,4
	PUBLIC _HDSONYA
_HDSONYA:
	DD _HDSONYA_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSOYN_P
_HDSONYA_TPG:
	DW 4,   189,    51,    0

	;CNOP	0,4
	PUBLIC _HDKANO
_HDKANO:
	DD _HDKANO_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDKANO_P
_HDKANO_TPG:
	DW 4,   121,   101,    0

	;CNOP	0,4
	PUBLIC _HDMUSTARD
_HDMUSTARD:
	DD _HDMUSTARD_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDMUST_P
_HDMUSTARD_TPG:
	DW 4,    81,   154,    0

	;CNOP	0,4
	PUBLIC _HDLIUKANG
_HDLIUKANG:
	DD _HDLIUKANG_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDKANG_P
_HDLIUKANG_TPG:
	DW 3,   141,   166,    0

	;CNOP	0,4
	PUBLIC _HDSHEGORO
_HDSHEGORO:
	DD _HDSHEGORO_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDGORO_P
_HDSHEGORO_TPG:
	DW 4,   189,     1,    0

	;CNOP	0,4
	PUBLIC _HDINDIAN
_HDINDIAN:
	DD _HDINDIAN_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDINDY_P
_HDINDIAN_TPG:
	DW 4,     1,   151,    0

	;CNOP	0,4
	PUBLIC _HDKETCHUP
_HDKETCHUP:
	DD _HDKETCHUP_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDKETC_P
_HDKETCHUP_TPG:
	DW 4,     1,   201,    0

	;CNOP	0,4
	PUBLIC _HDTUSKAN
_HDTUSKAN:
	DD _HDTUSKAN_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSAND_P
_HDTUSKAN_TPG:
	DW 4,   201,   168,    0

	;CNOP	0,4
	PUBLIC _HDSMOKE
_HDSMOKE:
	DD _HDSMOKE_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSMOK_P
_HDSMOKE_TPG:
	DW 3,   181,   166,    0

	;CNOP	0,4
	PUBLIC _HDSHAO
_HDSHAO:
	DD _HDSHAO_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _HDSHAO_P
_HDSHAO_TPG:
	DW 4,    41,   104,    0

	;CNOP	0,4
	PUBLIC _HDQUESTION
_HDQUESTION:
	DD _HDQUESTION_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD _REDQ_P
_HDQUESTION_TPG:
	DW 4,   161,   101,    0

	;CNOP	0,4
	PUBLIC _BOX_01
_BOX_01:
	DD _BOX_01_TPG-mugshot_anims
	DW 38, 50, 0, 0
	DD bOX_p
_BOX_01_TPG:
	DW 4,   121,   151,    0

	;CNOP	0,4
	PUBLIC _BOX_02
_BOX_02:
	DD _BOX_02_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_02_TPG:
	DW 0,   177,   184,    0

	;CNOP	0,4
	PUBLIC _BOX_03
_BOX_03:
	DD _BOX_03_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_03_TPG:
	DW 4,     1,   101,    0

	;CNOP	0,4
	PUBLIC _BOX_04
_BOX_04:
	DD _BOX_04_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_04_TPG:
	DW 4,    41,   154,    0

	;CNOP	0,4
	PUBLIC _BOX_05
_BOX_05:
	DD _BOX_05_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_05_TPG:
	DW 4,    41,   204,    0

	;CNOP	0,4
	PUBLIC _BOX_06
_BOX_06:
	DD _BOX_06_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_06_TPG:
	DW 4,    81,   204,    0

	;CNOP	0,4
	PUBLIC _BOX_07
_BOX_07:
	DD _BOX_07_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_07_TPG:
	DW 2,   213,   166,    0

	;CNOP	0,4
	PUBLIC _BOX_08
_BOX_08:
	DD _BOX_08_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_08_TPG:
	DW 3,    61,   187,    0

	;CNOP	0,4
	PUBLIC _BOX_09
_BOX_09:
	DD _BOX_09_TPG-mugshot_anims
	DW 38, 50, 0, 0
_BOX_09_TPG:
	DW 4,   109,    51,    0

	;CNOP	0,4
	PUBLIC _SCURSOR
_SCURSOR:
	DD _SCURSOR_TPG-mugshot_anims
	DW 42, 54, 0, 0
_SCURSOR_TPG:
	DW 2,     1,   173,    0

	ALIGN 4
	PUBLIC _MKBRICK
_MKBRICK:
	DD _MKBRICK_TPG-_ladder_anims
	DW 154, 82, -41, -17
	DD   _LADBRK_P
_MKBRICK_TPG:
	DW  2,     1,    91,   0

	ALIGN 4
	PUBLIC _MKBRICK2
_MKBRICK2:
	DD _MKBRICK2_TPG-_ladder_anims
	DW 154, 90, 0, 0
	DD   _LADBRK_P
_MKBRICK2_TPG:
	DW  2,     1,     1,   0

	ALIGN 4
	PUBLIC _UPEVILA
_UPEVILA:
	DD _UPEVILA_TPG-_ladder_anims
	DW 181, 88, 0, 0
	DD   _LADGND_P
_UPEVILA_TPG:
	DW  0,     1,    18,   0

	ALIGN 4
	PUBLIC _UPEVILB
_UPEVILB:
	DD _UPEVILB_TPG-_ladder_anims
	DW 140, 82, 0, 0
	DD _LADGND_P
_UPEVILB_TPG:
	DW  3,     1,     1,   0

	ALIGN 4
	PUBLIC _TXT_WARRIOR
_TXT_WARRIOR:
	DD _TXT_WARRIOR_TPG-_ladder_anims
	DW 46, 8, 0, 0
	DD _boonpal
_TXT_WARRIOR_TPG:
	DW 0,     1,   230,    0

	ALIGN 4
	PUBLIC _TXT_NOVICE
_TXT_NOVICE:
	DD _TXT_NOVICE_TPG-_ladder_anims
	DW 37, 8, 0, 0
	DD _boonpal
_TXT_NOVICE_TPG:
	DW 0,    93,   230,    0

	ALIGN 4
	PUBLIC _TXT_MASTER
_TXT_MASTER:
	DD _TXT_MASTER_TPG-_ladder_anims
	DW 41, 8, 0, 0
	DD _boonpal
_TXT_MASTER_TPG:
	DW 0,    49,   230,    0

	ALIGN 4
	PUBLIC _ochar_order_mugs
_ochar_order_mugs:
	DD _HDKANO
	DD _HDSONYA
	DD _HDJAX
	DD _HDINDIAN
	DD _HDSUBZERO
	DD _HDSWAT
	DD _HDBRIDE
	DD _HDKETCHUP
	DD _HDMUSTARD
	DD _HDLAO
	DD _HDTUSKAN
	DD _HDSHEGORO
	DD _HDSHANG
	DD _HDLIUKANG
	DD _HDSMOKE
	DD _HDMOTARO
	DD _HDSHAO

	ALIGN 4
	PUBLIC _emh_images
_emh_images:
	DD _TXT_WARRIOR
	DD _TXT_MASTER
	DD _TXT_NOVICE


;*********************************
;**		 MODULE DATA			**
;*********************************
	ALIGN 4
	include attract\select\select80.mod

	ALIGN 4
	PUBLIC _psel_module
_psel_module:
	DW 000h	 	 	; autoerase color
	DW 0	 		; initial _world y
	DW 0edh-32 		; ground y
	DW 0			; initial _worldx
	DW -050h 	  		; scroll left limit
	DW 0fffh	  		; scroll right limit

	DD _calla_return
	DD _no_scroll		; scroll table
	DD dlists_psel

	DD _bakmods
	DD MKSELECTBMOD
	DW 0ffe8h,0ffe8h
	DD 0ffffffffh
	DD END_LIST

dlists_psel:
	DD _baklst1,_worldtlx+16/8
	DD _objlst,_worldtlx+16/8
	DD _objlst2,_worldtlx+16/8
	DD 0

;*********************************
;**		 MODULE DATA			**
;*********************************
	ALIGN 4
	include attract\ladder\mkladder.mod

	ALIGN 4
	PUBLIC _ladder_module
_ladder_module:
	DW 0		 		; autoerase color
	DW 000h				; initial _world y
	DW 000h	     			; ground y
	DW 000h				; initial _worldx
	DW -0500h 	  			; scroll left limit
	DW 0500h	  			; scroll right limit

	DD _calla_return
	DD _no_scroll			; scroll table
	DD dlists_ladder

	DD _bakmods
	DD SKIP_BAKMOD 	 		; _baklst1 = lightning
	DD SKIP_BAKMOD 	 		; _baklst2 =
	DD SKIP_BAKMOD 	 		; _baklst3 =
	DD SKIP_BAKMOD 	 		; _baklst4 =
	DD SKIP_BAKMOD 	 		; _baklst5 =
	DD SKIP_BAKMOD 	 		; _baklst6 =

	DD LADDERBMOD			; _baklst7
	DW 0fff8h,0fff7h
	DD 0ffffffffh
	DD 0				; no floor here !!

dlists_ladder:
	DD _baklst7,_worldtlx+16/8
	DD _baklst5,_worldtlx+16/8
	DD _baklst4,_worldtlx+16/8
	DD _baklst3,_worldtlx+16/8		; mugs in front of stone !
	DD _baklst2,_worldtlx+16/8

	DD _baklst6,_worldtlx+16/8
;	dw	_objlst,_worldtlx+16/8			;removed from arcade to deal with sort bug (cant fix it yet)
	DD _baklst1,_worldtlx+16/8
	DD _objlst2,_worldtlx+16/8
	DD 0

;WIN95: FIX_REMOVED_EXECESS_HEAPS
;	ALIGN 4
;	PUBLIC _sel_ladder_heap
;_sel_ladder_heap:
;	db 	80*1024 dup(0)


	END_DATA
	end
