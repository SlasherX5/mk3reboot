;******************************************************************************
; File: mktextdt.s
;
; By: David Schwartz
;
; Date: Dec 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Text Data
;******************************************************************************/

	include win95.i
	include mkchar.i
	include mkbkgd.i



	BEGIN_DATA
;
; KEEP PALETTE FROM BEING NTSC CORRECTED, MAKES THIS LOOK UGLY IF IT IS
;
	ALIGN  4
	PUBLIC _YELLOW_p
_YELLOW_p:
	DD 16
	DW 00000h, 08000h, 00210h, 00231h, 00252h, 00294h, 002B5h, 002D6h, 002F7h, 00318h
	DW 00339h, 0035Ah, 0039Ch, 003BDh, 003DEh, 003FFh

;public on
;*************************************************
;buyin text, mkbuyin.c
;*************************************************
	ALIGN 4
PUBLIC _pf_credit_info1
_pf_credit_info1:
	DW FONT7N,2,84,200
	DD  _WHITE_p
	DW STRCNRMOS,0
	db	"KREDITS %d",0

	ALIGN 4
PUBLIC _pf_credit_info2
_pf_credit_info2:
	DW FONT7N,2,244,200
	DD  _WHITE_p
	DW STRCNRMOS,0
	db	"KREDITS %d",0

	ALIGN 4
PUBLIC _pf_player1
_pf_player1:
	DW FONT7N,2,84,143+12
	DD  _WHITE_p
	DW STRCNRMOS,0
	db	"PLAYER 1",0

	ALIGN 4
PUBLIC _pf_player2
_pf_player2:
	DW FONT7N,2,244,143+12
	DD  _WHITE_p
	DW STRCNRMOS,0
	db	"PLAYER 2",0

	ALIGN 4
PUBLIC _pf_pmessage
_pf_pmessage:
	DW FONT15,0,14,82
	DD _WHITE_p
	DW STRCNRMOS,0
	db	0

PUBLIC _txt_prepare
_txt_prepare:
	db	"PREPARE",13
	db	"FOR YOUR",13
	db	"NEXT",13
	db	"CHALLENGE",0

PUBLIC _txt_start_to_continue
_txt_start_to_continue:
	db	"PRESS START",13
	db	"TO KONTINUE"
	db	0

	ALIGN 4
PUBLIC _txt_press_join
_txt_press_join:
	db	"PRESS START",13
	db	"TO",13
	db	"JOIN IN"
	db	0

	ALIGN 4
PUBLIC _txt_insert_start
_txt_insert_start:
	db	13,"GAME OVER",13,0
	db	"INSERT KOIN",13
	db	"TO",13
	db	"JOIN IN"
	db	0

	ALIGN 4
PUBLIC _txt_1_coin
_txt_1_coin:
	db	"1 KREDIT",13
	db	"TO KONTINUE",0

	ALIGN 4
PUBLIC _txt_2_coins
_txt_2_coins:
	db	"2 KREDITS",13
	db	"TO KONTINUE",0

	ALIGN 4
PUBLIC _txt_x_coins
_txt_x_coins:
	db	"INSERT KOIN",13
	db	"TO KONTINUE",0

	ALIGN 4
PUBLIC _txt_press_start
_txt_press_start:
	db	"PRESS",13
	db	"START"
	db	0

	ALIGN 4
PUBLIC _txt_insert_coin
_txt_insert_coin:
	db	"INSERT KOIN",0

	ALIGN 4
PUBLIC _fl_num
_fl_num:
	DD _bpal_flash2_P
	DW 6
	DW RGB_RED
	DW RGB_WHITE
	DW END_STUFF

;*************************************************
; main text, mkmain.c
;*************************************************
	ALIGN 4
PUBLIC _pf_round_num
_pf_round_num:
	DW FONT15,0ffffh,160,75
	DD  _WHITE_p
	DW STRCNRMOS_SCR,0
	db "ROUND %d",0

	ALIGN 4
PUBLIC _fl_entered
_fl_entered:
	DD _bpal_flash1_P
	DW 4
	DW RGB_BLUE
	DW 0ffffh
	DW END_STUFF

	ALIGN 4
PUBLIC _fl_finish
_fl_finish:
	DD _bpal_flash1_P
	DW 4
	DW 0ffffh
	DW RGB_RED
	DW END_STUFF


	ALIGN 4
PUBLIC _pf_entered
_pf_entered:
	DW FONT15,0,320/2,040h
	DD  _bpal_flash1_P
	DW STRCNRMOS_SCR,0
	db	0

;*************************************************
; text, mktext.c
;*************************************************
	ALIGN 4
PUBLIC _pf_15point
_pf_15point:
	DW FONT15,0ffffh,0,0
	DD  _WHITE_p
	DW STRCNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_15point_soff
_pf_15point_soff:
	DW FONT15,00h,0,0
	DD  _WHITE_p
	DW STRCNRMO_SCR,0
	db	0



	ALIGN 4
PUBLIC _pf_7point
_pf_7point:
	DW FONT7N,2,0,0
	DD  _WHITE_p
	DW STRCNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_7point_soff
_pf_7point_soff:
	DW FONT7N,2,0,0
	DD  _WHITE_p
	DW STRCNRMO_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_dave_smallc_soff
_pf_dave_smallc_soff:
	DW FONT7,00h,0,0
	DD  _WHITE_p
	DW STRCNRMO_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_dave_smallc
_pf_dave_smallc:
	DW FONT7,00h,0,0
	DD  _WHITE_p
	DW STRCNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_dave_smallr
_pf_dave_smallr:
	DW FONT7,0ffffh,0,0
	DD  _WHITE_p
	DW STRRNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_dave_smalll
_pf_dave_smalll:
	DW FONT7,0ffffh,0,0
	DD  _WHITE_p
	DW STRLNRMOS_SCR,0
	db	0

;*************************************************
; player select text, mksel.c
;*************************************************
	ALIGN 4
PUBLIC _fl_cursor1
_fl_cursor1:
	DD _bpal_flash1_P
	DW 4
	DW 001E0h ; %0000000111100000
	DW 002E0h ; %0000001111100000
	DW END_STUFF

	ALIGN 4
PUBLIC _fl_cursor2
_fl_cursor2:
	DD _bpal_flash2_P
	DW 4
	DW 0Fh ; %0000000000001111
	DW 01Fh ; %0000000000011111
	DW END_STUFF

	ALIGN 4
PUBLIC _fl_auto
_fl_auto:
	DD _bpal_flash3_P
	DD 4
	DW RGB_BLUE
	DW 0ffffh
	DW END_STUFF

	ALIGN 4
PUBLIC _pf_auto_msg_1
_pf_auto_msg_1:
	DW FONT7N,2,26,68
	DD  _bpal_flash3_P
	DW STRCNRMOS_SCR,0
	db "RANDOM",13,"SELECT",0

	ALIGN 4
PUBLIC _pf_auto_msg_2
_pf_auto_msg_2:
	DW FONT7N,2,290,68
	DD  _bpal_flash3_P
	DW STRCNRMOS_SCR,0
	db "RANDOM",13,"SELECT",0

	ALIGN 4
PUBLIC _pf_bk_setup
_pf_bk_setup:
	DW FONT7N,2,160,214
	DD  _YELLOW_p
	DW STRCNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_iar_num
_pf_iar_num:
	DW FONT7N,2,38,54
	DD  _YELLOW_p
	DW STRCNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _pf_new_champ
_pf_new_champ:
	DW FONT7N,2,160,54
	DD  _YELLOW_p
	DW STRCNRMOS_SCR,0
	db	0

	ALIGN 4
PUBLIC _coin_mess
_coin_mess:
	DW FONT7,1,160,198
	DD  _YELLOW_p
	DW STRCNRMOS,0
	db	0

	ALIGN 4
PUBLIC buyin_coin_mess
buyin_coin_mess:
	DW FONT7,1,160,198
	DD  _YELLOW_p
	DW STRCNRMOS,0
	db	0

	ALIGN 4
PUBLIC _txt_p1_entered
_txt_p1_entered:
	db	"PLAYER 1 HAS ENTERED",13,"THE TOURNAMENT !"

	ALIGN 4
PUBLIC _txt_p2_entered
_txt_p2_entered:
	db	"PLAYER 2 HAS ENTERED",13,"THE TOURNAMENT !"


;*************************************************
; round intro messages, mkr1.asm
;*************************************************
	ALIGN 4
PUBLIC _fl_r1
_fl_r1:
	DD _bpal_white_P
	DW 4
	DW RGB_BLUE
	DW 0ffffh
	DW END_STUFF

;*************************************************
; attract mode, amode
;*************************************************
	ALIGN 4
PUBLIC _txt_quote1
_txt_quote1:
	db "THERE IS NO KNOWLEDGE THAT IS NOT POWER",0

	ALIGN 4
PUBLIC _txt_quote2
_txt_quote2:
	db "YOU KNOW, THATS THE THING",0

	ALIGN 4
PUBLIC _txt_quote3
_txt_quote3:
	db "THE MEEK SHALL INHERIT THE EARTH",0

	ALIGN 4
PUBLIC _txt_quote4
_txt_quote4:
	db "IMAGINATION IS MORE IMPORTANT",13,"THAN KNOWLEDGE",0

;
;	CNOP 0,4
;txt_warning
;	db	"PARENTAL ADVISORY",13,13
;	db	"LIFE-LIKE VIOLENCE - STRONG",13
;	db	"CONTAINS SELECTED, GRAPHIC SCENES",13
;	db	"INVOLVING HUMAN-LIKE CHARACTERS",13
;	db	"ENGAGED IN INTENSE COMBATIVE ACTIVITY.",0

	ALIGN 4
PUBLIC _txt_space_game_intro
_txt_space_game_intro:
	db	"YOU HAVE BEEN TRANSPORTED",13
	db	"TO ANOTHER REALM",13,13
	db	"A REALM WHERE NEITHER",13
	db	"THE EARTH WARRIORS",13
	db	"NOR SHAO KAHN HAVE ANY CONTROL",13,13
	db	"BEWARE THE REALM OF",13
	db	"RELLIM OHCANEP",0


; Ending Stuff (MKEND.C)
	ALIGN 4
PUBLIC _txt_smoke1
_txt_smoke1:
	 db "ENTER",13,"THE ULTIMATE KOMBAT KODE",0


	ALIGN 4
PUBLIC _end_winner_text
_end_winner_text:
	DD _txt_victory1
	DD _txt_victory2

	ALIGN 4
PUBLIC _txt_victory1
_txt_victory1:
	db "SHAO KAHN IS NO MORE",0

	ALIGN 4
PUBLIC _txt_victory2
_txt_victory2:
	db	"YOU ARE THE MK3",13
	db	"CHAMPION",0

	ALIGN 4
PUBLIC _pf_rise
_pf_rise:
	DW FONT15,0ffffh,160,240
	DD _WHITE_p
	DW STRCNRMOS_SCR,0
	db	0

;*********************************
	ALIGN 4
PUBLIC _txt_execs
_txt_execs:
	db	"EXECUTIVE PRODUCERS",13,13
	db	"NEIL NICASTRO",13
	db	"KEN FEDESNA",13
	db	"PAUL DUSSAULT",13
	db	"JOHN ROWE",13
	db	"MIKE ABBOT",13
	db	"KEVIN LYDY",13,13,0

;	CNOP 0,4
;txt_dcs
;	db	"WILLIAMS AUDIO SOUND SYSTEM:",13
;	db	"SCOTT PATTERSON",13,13,0

	ALIGN 4
PUBLIC _txt_ssr
_txt_ssr:
	db	"STEVE RITCHIE",13,"AS",13,"THE VOICE OF SHAO KAHN",13,0

	ALIGN 4
PUBLIC _txt_voices
_txt_voices:
	db	"GRUNTS, SCREAMS, GROANS AND GIBBERISH",13,13
	db	"JON HEY",13
	db	"PEG BURR",13
	db	"DAN FORDEN",13
	db	"ANN MAZZA",13
	db	"VINCE PONTARELLI",13
	db	"ED BOON",13,13,0

	ALIGN 4
PUBLIC _txt_scea
_txt_scea:
	db	"SCEA PRODUCER",13,13
	db	"PERRY RODGERS",13,13,0

	ALIGN 4
PUBLIC _txt_thanx_alot
_txt_thanx_alot:
	db	"MANY THANKS GO TO",13,13
	db	"ED BOON",13,13
	db	"JOHN TOBIAS",13,13
	db	"DAN FORDEN",13,13
	db	"TOM BOYD",13,13
	db	"ANGUS GUSCHWAN",13,13
	db	"PETER CLARK",13,13
	db	"KERRY",13,13,0

	ALIGN 4
PUBLIC _txt_testers
_txt_testers:
	db	"UNBEATABLE KOMBAT MASTERS",13,"(GAME TESTERS)",13,13
	db  "BRIAN JOHNSON",13
	db	"WILL SHEN",13
	db	"TIM HEYDELAAR",13
	db	"JOHN STOOKEY",13
	db	"STEVE KRAMER",13
	db	"DANNY LEWIS",13
	db	"RANDY ESTRELLA",13
	db	"EDDIE FERRIER",13
	db	"MIKE VINIKOUR",13,13,0

PUBLIC _txt_mk3_design
_txt_mk3_design:
	db	"MK3 DESIGN TEAM",13,13
	db	"ED BOON",13
	db	"JOHN TOBIAS",13
	db	"STEVE BERAN",13
	db	"DAN FORDEN",13
	db	"TONY GOSKIE",13
	db	"DAVE MICHICICH",13
	db	"JOHN VOGEL",13,13,0

;high score stuff (mkhstd.h)
	ALIGN 4
PUBLIC _txt_p1_enter
_txt_p1_enter:
	db	"PLAYER 1",13
	db	"INCREDIBLE WINNING STREAK",0

	ALIGN 4
PUBLIC _txt_p2_enter
_txt_p2_enter:
	db	"PLAYER 2",13
	db	"INCREDIBLE WINNING STREAK",0

	ALIGN 4
PUBLIC _txt_enter_your
_txt_enter_your:
	db	"ENTER YOUR INITIALS",13
	db	"TO BECOME IMMORTALIZED",0

	ALIGN 4
PUBLIC _txt_gods
_txt_gods:
	db "YOU HAVE PROVEN TO BE THE SUPREME",13
	db "MORTAL KOMBAT WARRIOR. THE ELDER",13
	db "GODS NOW DESCEND UPON YOUR WORLD TO",13
	db "GRANT YOU ETERNAL POWER.",13,13,0
	db	"MORE KOMBAT . . . . WINTER OF 96",0

	ALIGN 4
PUBLIC _pf_dave_smalll_soff
_pf_dave_smalll_soff:
	DW FONT7,00h,8,16
	DD  _WHITE_p
	DW STRLNRMO_SCR,0
	db	0


	ALIGN 4
PUBLIC _pf_dave_smallr_soff
_pf_dave_smallr_soff:
	DW FONT7,00h,8,16
	DD  _WHITE_p
	DW STRRNRMO_SCR,0
	db	0


	ALIGN 4
PUBLIC _txt_rank_wiar
_txt_rank_wiar:
	db	"%d  WINS IN A ROW",13,0

;ending stuff
	ALIGN 4
PUBLIC _txt_david
_txt_david:
	db	"DAVID SCHWARTZ",13,"SOFTWARE",0

	ALIGN 4
PUBLIC _txt_greg
_txt_greg:
	db	"GREG MILLER",13,"GRAPHICS",0

	ALIGN 4
PUBLIC _txt_markm
_txt_markm:
	db	"MARK MAY",13,"GRAPHICS",0

	ALIGN 4
PUBLIC _txt_markg
_txt_markg:
	db	"MARK GUIDARELLI",13,"ART TOOLS",0

	ALIGN 4
PUBLIC _txt_scott
_txt_scott:
	db	"SCOTT PATTERSON",13,"WILLIAMS AUDIO SOUND SYSTEM",0

	ALIGN 4
PUBLIC _txt_rob
_txt_rob:
	db	"ROB ATESALP",13,"SOUND",0

	ALIGN 4
PUBLIC _txt_ed
_txt_ed:
	db	"ED BOON",13,"SOFTWARE",0

	ALIGN 4
PUBLIC _txt_johnt
_txt_johnt:
	db	"JOHN TOBIAS",13,"GRAPHICS",0

	ALIGN 4
PUBLIC _txt_steve
_txt_steve:
	db	"STEVE BERAN",13,"GRAPHICS",0

	ALIGN 4
PUBLIC _txt_dan
_txt_dan:
	db "DAN FORDEN",13,"SOUNDS AND MUSIC",0

	ALIGN 4
PUBLIC _txt_tonyg
_txt_tonyg:
	db	"TONY GOSKIE",13,"GRAPHICS",0

	ALIGN 4
PUBLIC _txt_dave
_txt_dave:
	db	"DAVE MICHICICH",13,"GRAPHICS",0

	ALIGN 4
PUBLIC _txt_johnv
_txt_johnv:
	db	"JOHN VOGEL",13,"GRAPHICS",0

;cast table
	ALIGN 4
PUBLIC _cast_table
_cast_table:
	DD _txt_rich		; name
	DW 160,020h			; position
	DD 0				; terminate names
	DW ft_kano,90		; character & x pos
	DW ft_tusk,230

	DD _txt_kerri
	DW 80,020h
	DD _txt_johnp
	DW 240,020h
	DD 0
	DW ft_sonya,86		; character & x pos
	DW ft_jax,238

	DD _txt_tony
	DW 80,020h
	DD _txt_mike
	DW 240,020h
	DD 0
	DW ft_lao,86		; character & x pos
	DW ft_swat,236

	DD _txt_sal1		; name
	DW 160,020h			; position
	DD 0				; terminate names
	DW ft_indian,86		; character & x pos
	DW ft_robo1,246

	DD _txt_turk		; name
	DW 160,020h			; position
	DD 0				; terminate names
	DW ft_subzero,86		; character & x pos
	DW ft_st,230

	DD _txt_lia
	DW 80,020h
	DD _txt_wong
	DW 240,020h
	DD 0
	DW ft_lia,70		; character & x pos
	DW ft_lk,234

	DD _txt_sal2		; name
	DW 160,020h			; position
	DD 0				; terminate names
	DW ft_robo2,74		; character & x pos
	DW ft_smoke,230

	DD _txt_brian		; name
	DW 160,020h			; position
	DD 0				; terminate names
	DW ft_sk,160		; character & x pos
	DW 0ffffh,0

	DD 0				; terminate cast list



	ALIGN 4
PUBLIC _txt_rich
_txt_rich:
	db	"RICHARD DIVIZIO",13,"AS",13,"KANO AND KABAL",0

	ALIGN 4
PUBLIC _txt_kerri
_txt_kerri:
	db	"KERRI HOSKINS",13,"AS",13,"SONYA",0

	ALIGN 4
PUBLIC _txt_johnp
_txt_johnp:
	db	"JOHN PARRISH",13,"AS",13,"JAX",0

	ALIGN 4
PUBLIC _txt_tony
_txt_tony:
	db	"TONY MARQUEZ",13,"AS",13,"KUNG LAO",0

	ALIGN 4
PUBLIC _txt_mike
_txt_mike:
	db	"MICHAEL OBRIEN",13,"AS",13,"STRYKER",0

	ALIGN 4
PUBLIC _txt_turk
_txt_turk:
	db	"JOHN TURK",13,"AS",13,"SUB-ZERO  AND  SHANG TSUNG",0

	ALIGN 4
PUBLIC _txt_lia
_txt_lia:
	db	"LIA MONTELONGO",13,"AS",13,"SINDEL",0

	ALIGN 4
PUBLIC _txt_wong
_txt_wong:
	db	"EDDIE WONG",13,"AS",13,"LIU KANG",0

	ALIGN 4
PUBLIC _txt_sal1
_txt_sal1:
	db	"SAL DIVITA",13,"AS",13,"NIGHTWOLF  AND  SEKTOR",0

	ALIGN 4
PUBLIC _txt_sal2
_txt_sal2:
	db	"SAL DIVITA",13,"AS",13,"CYRAX  AND  SMOKE",0

	ALIGN 4
PUBLIC _txt_brian
_txt_brian:
	db	"BRIAN GLYNN",13,"AS",13,"SHAO KAHN",0

	END_DATA
	end
