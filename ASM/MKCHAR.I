
;****************************************
;** MUST MATCH DEFINITIONS IN mkutil.h **
;****************************************
ani_jump		=	1		; animation script "jump" command
ani_flip		=	2		; animation script "flip" command
ani_adjustx		=	3		; animation script "adjust x" command
ani_adjustxy	=	4		; animation script "adjust xy" command
ani_nosleep		=	5		; animation script "skip sleep" command
ani_calla		=	6		; animation script call routine (next long)
ani_sound		=	7		; animation script make a sound call
ani_ochar_jump	=	8		; animation script ochar conditional jump
ani_flip_v		=	9		; animation script vertical flip
ani_offset_xy	=	10		; animation script offset xy
ani_sladd		=	11		; animation script add slave
ani_slani		=	12		; animation script slave animate
ani_swpal		=	13		; animation script switch to next img pal
ani_slani_sleep =	14		; animation script slave animate then sleep
ani_ochar_sound	= 	15		; animation script player char sound
ani_rnd_jump	=	16		; animation script "jump" command
ani_lastcom		=	16		; last animation command

ft_kano			= 0
ft_sonya		= 1
ft_jax			= 2
ft_indian		= 3
ft_subzero		= 4
ft_swat			= 5
ft_lia			= 6
ft_robo1		= 7
ft_robo2		= 8
ft_lao			= 9
ft_tusk			= 10
ft_sg			= 11		;// she goro
ft_st			= 12		;// shang tsu
ft_lk			= 13		;// liu kang
ft_smoke		= 14
ft_motaro		= 15
ft_sk			= 16
ft_noob			= 17


;FONT INFO
FONT15			= 0			;15 pt italic
FONT7			= 1			;7 pt italic
FONT7N			= 2			;7 pt normal

;TEXT ROUTINES
STRCNRMOS		= 0
STRCNRMOS_SCR	= 1
STRLNRMOS_SCR	= 2
STRRNRMOS_SCR	= 3
STRCNRMO_SCR	= 4
STRLNRMO_SCR	= 5
STRRNRMO_SCR	= 6


;FLASH STUFF
END_STUFF = 00000h
RGB_BLACK = 08000h
RGB_RED = 0001fh
RGB_BLUE = 07c00h
RGB_WHITE = 07fffh
RGB_GREY = 00636h
RGB_YELLOW = 003ffh
RGB_GREEN = 00380h
RGB_DARK_BLUE =	05000h

;calla codes index, must match in mkani.h
;JAX
sweep_sounds		equ	1
lineup_number_2		equ	2

;INDIAN
delete_slave		equ	3

;TUSK
rsnd_big_whoosh		equ	4

;SONYA
player_normpal		equ	5
sans_repell_3		equ	6
sonya_zap_pal		equ	7
rsnd_footstep		equ	8

;LIU KANG
air_dragon			equ	9
lower_dragon		equ 10

;LIA
slave_inviso		equ	11
slave_viso			equ	12
new_float_ani		equ	13

;ROBO1 ROBO2
shock_init			equ	14
stun_speed_3		equ	15
stun_speed_6		equ	16
shock_check			equ	17
set_a10_to_him		equ	18
set_a10_to_slave	equ	19

;SWAT
stsw_sound		equ	20

;SHANG
st_tumble_sound		equ	21
morph_swpal		equ	22

;MOTARO
motaro_leg_stance	equ	23

rsnd_stab		equ	24
rsnd_whoosh equ 25
rsnd_big_block equ 26
camp_fire_sound equ 27
beep_sound equ 28
robo_laugh_sound equ 29

;Shao
sk_ray1 equ 30
sk_ray2 equ 31
sk_ray3 equ 32



ifndef OVERLAY_SYMBOLS
	EXTERN	_SCORE_P         : DWORD
	EXTERN	_bpal_black_P	 : DWORD
;	EXTERN	_bpal_red_P		 : DWORD
;	EXTERN	_bpal_blue_P	 : DWORD
	EXTERN	_bpal_white_P	 : DWORD
	EXTERN	_bpal_flash1_P	 : DWORD
	EXTERN	_bpal_flash2_P	 : DWORD
	EXTERN	_bpal_flash3_P	 : DWORD
	EXTERN	_WHITE_p		 : DWORD
;	EXTERN	_RED_p			 : DWORD
	EXTERN	_BLACK_p		 : DWORD


endif ; OVERLAY_SYMBOLS
