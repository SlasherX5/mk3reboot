;#******************************************************************************
;# File: mkstk.s
;#
;# By: David Schwartz
;#
;# Date: August 1994
;#
;# (C) Williams Entertainment
;#
;# Mortal Kombat III Strike Tables
;#******************************************************************************/
	include win95.i

;**************************************************************
;* THESE FLAGS MUST MATCH IN (MKUTIL.H)
;**************************************************************
SF_SQUEEZE	=	1	; flag: squeeze:
SB_SQUEEZE	=	0	; flag: squeeze:
SF_DUCK		=	2	; flag: must duck/block to block:


	BEGIN_DATA

	ALIGN 4
	PUBLIC _strike_tables
_strike_tables:
	DD kano_strikes			; 0
	DD sonya_strikes			; 1
	DD jax_strikes				; 2
	DD indian_strikes			; 3
	DD sz_strikes				; 4
	DD swat_strikes			; 5
	DD lia_strikes				; 6
	DD robo_strikes			; 7
	DD robo_strikes			; 8
	DD lao_strikes				; 9
	DD tusk_strikes			; 10
	DD sg_strikes				; 11
	DD st_strikes				; 12
	DD lk_strikes				; 13
	DD robo_strikes			; 14
	DD mot_strikes				; 15
	DD sk_strikes				; 16
	DD kano_strikes			; 17
	DD kano_strikes			; 18

	ALIGN 4
sk_strikes:
	DD stk_sk_punch		; 0 - punch
	DD stk_sk_kick		; 1 - kick
	DD stk_sk_hammer		; 2 - hammah time !
	DD stk_sk_charge		; 3 - charge
	DD stk_sk_zap		; 4 - zap
	DD stk_sk_air_charge	; 5 - air charge

	ALIGN 4
stk_sk_punch:
	DW 053h		; x offset of collision box
	DW 012h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 075h		; y size of collision box
	DW 06215h		; strike routine
	DW 02206h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sk_kick:
	DW 06dh		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 03dh		; y size of collision box
	DW 06215h		; strike routine
	DW 02706h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sk_hammer:
	DW 086h		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 077h		; x size of collision box
	DW 039h		; y size of collision box
	DW 06315h		; strike routine
	DW 02706h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sk_charge:
	DW 040h		; x offset of collision box
	DW 011h		; y offset of collision box
	DW 042h		; x size of collision box
	DW 090h		; y size of collision box
	DW 06415h		; strike routine
	DW 02005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sk_zap:
	DW 078h		; x offset of collision box
	DW 029h		; y offset of collision box
	DW 034h		; x size of collision box
	DW 031h		; y size of collision box
	DW 06415h		; strike routine
	DW 02306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sk_air_charge:
	DW 04dh		; x offset of collision box
	DW 017h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 04ah		; y size of collision box
	DW 06515h		; strike routine
	DW 02005h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Motaro Strikes									     *
;											     *
;*************************************************************************
	ALIGN 4
mot_strikes:
	DD stk_mot_punch		; 0
	DD stk_mot_kick
	DD stk_mot_sweep
	DD stk_mot_zap
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy


	ALIGN 4
stk_mot_punch:
	DW 06bh		; x offset of collision box
	DW 012h		; y offset of collision box
	DW 05fh		; x size of collision box
	DW 075h		; y size of collision box
	DW 06015h		; strike routine
	DW 02809h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_mot_kick:
	DW 00bh		; x offset of collision box
	DW 023h		; y offset of collision box
	DW 072h		; x size of collision box
	DW 064h		; y size of collision box
	DW 06115h		; strike routine
	DW 0300dh		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_mot_sweep:
	DW 0e3h		; x offset of collision box
	DW 06eh		; y offset of collision box
	DW 0bdh		; x size of collision box
	DW 034h		; y size of collision box
	DW 00403h		; strike routine
	DW 02007h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_mot_zap:
	DW 00dh		; x offset of collision box
	DW 0fff2h		; y offset of collision box
	DW 019h		; x size of collision box
	DW 01ch		; y size of collision box
	DW 06015h		; strike routine
	DW 02005h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Liu Kang strikes 									     *
;											     *
;*************************************************************************
	ALIGN 4
lk_strikes:
	DD stk_lk_hikick			; 0
	DD stk_lk_lokick			; 1
	DD stk_lk_hi_punch   		; 2
	DD stk_lk_lo_punch   		; 3
	DD stk_lk_sweep			; 4
	DD stk_lk_duck_punch		; 5
	DD stk_lk_duck_kickh		; 6
	DD stk_lk_duck_kickl		; 7
	DD stk_lk_uppercut   		; 8
	DD stk_lk_jump_punch		; 9
	DD stk_lk_jump_kick		; a
	DD stk_lk_flip_kick		; d
	DD stk_lk_flip_punch		; c
	DD stk_lk_roundh 		; d
	DD stk_lk_knee			; e
	DD stk_lk_elbow			; f
	DD stk_dummy			; 10
	DD stk_lk_zap			; 11
	DD stk_lk_bike			; 12
	DD stk_super_kang			; 13
	DD stk_dummy			; 14
	DD stk_dummy			;
	DD stk_dummy			;
	DD stk_dummy			;

	ALIGN 4
stk_lk_hikick:
	DW 04eh		; x offset of collision box
	DW 00eh		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 02ah		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_lokick:
	DW 05fh		; x offset of collision box
	DW 030h		; y offset of collision box
	DW 04fh		; x size of collision box
	DW 00fh		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_hi_punch:
	DW 048h		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 035h		; x size of collision box
	DW 01dh		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_lk_lo_punch:
	DW 054h		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 041h		; x size of collision box
	DW 015h		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_sweep:
	DW 06ah		; x offset of collision box
	DW 06ch		; y offset of collision box
	DW 04ah		; x size of collision box
	DW 019h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_lk_duck_punch:
	DW 04dh		; x offset of collision box
	DW 049h		; y offset of collision box
	DW 03bh		; x size of collision box
	DW 010h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_duck_kickh:
	DW 050h		; x offset of collision box
	DW 037h		; y offset of collision box
	DW 040h		; x size of collision box
	DW 021h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_duck_kickl:
	DW 051h		; x offset of collision box
	DW 06dh		; y offset of collision box
	DW 03ch		; x size of collision box
	DW 018h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_uppercut:
	DW 046h		; x offset of collision box
	DW 0fff6h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 043h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_jump_punch:
	DW 055h		; x offset of collision box
	DW 005h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 028h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_jump_kick:
	DW 03dh		; x offset of collision box
	DW 0fffah		; y offset of collision box
	DW 036h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_flip_kick:
	DW 057h		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 02ch		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_flip_punch:
	DW 055h		; x offset of collision box
	DW 005h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 028h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_roundh:
	DW 06bh		; x offset of collision box
	DW 005h		; y offset of collision box
	DW 053h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_knee:
	DW 047h		; x offset of collision box
	DW 021h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 03dh		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_elbow:
	DW 040h		; x offset of collision box
	DW 00ch		; y offset of collision box
	DW 02eh		; x size of collision box
	DW 032h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_zap:
	DW 0d0h		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 051h		; x size of collision box
	DW 014h		; y size of collision box
	DW 05501h		; strike routine
	DW 01603h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lk_bike:
	DW 042h		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 041h		; x size of collision box
	DW 02ah		; y size of collision box
	DW 05600h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_super_kang:
	DW 063h		; x offset of collision box
	DW 021h		; y offset of collision box
	DW 04bh		; x size of collision box
	DW 01ch		; y size of collision box
	DW 05700h		; strike routine
	DW 01704h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Shang Tsung strikes 									     *
;											     *
;*************************************************************************
	ALIGN 4
st_strikes:
	DD stk_st_hikick			; 0
	DD stk_st_lokick			; 1
	DD stk_st_hi_punch   		; 2
	DD stk_st_lo_punch   		; 3
	DD stk_st_sweep			; 4
	DD stk_st_duck_punch		; 5
	DD stk_st_duck_kickh		; 6
	DD stk_st_duck_kickl		; 7
	DD stk_st_uppercut   		; 8
	DD stk_st_jump_punch		; 9
	DD stk_st_jump_kick		; a
	DD stk_st_flip_kick		; d
	DD stk_st_flip_punch		; c
	DD stk_st_roundh 		; d
	DD stk_st_knee			; e
	DD stk_st_elbow			; f
	DD stk_dummy			; 10
	DD stk_st_zap			; 11
	DD stk_summon			; 12
	DD stk_dummy			; 13
	DD stk_dummy			; 14
	DD stk_dummy			;
	DD stk_dummy			;
	DD stk_dummy			;


	ALIGN 4
stk_st_hikick:
	DW 055h		; x offset of collision box
	DW 0fffbh		; y offset of collision box
	DW 049h		; x size of collision box
	DW 031h		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_lokick:
	DW 06ah		; x offset of collision box
	DW 027h		; y offset of collision box
	DW 053h		; x size of collision box
	DW 014h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_hi_punch:
	DW 054h		; x offset of collision box
	DW 003h		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 01dh		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_st_lo_punch:
	DW 053h		; x offset of collision box
	DW 018h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 01bh		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_sweep:
	DW 060h		; x offset of collision box
	DW 067h		; y offset of collision box
	DW 052h		; x size of collision box
	DW 01ah		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_st_duck_punch:
	DW 04dh		; x offset of collision box
	DW 037h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 010h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_duck_kickh:
	DW 059h		; x offset of collision box
	DW 03ch		; y offset of collision box
	DW 040h		; x size of collision box
	DW 01ch		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_duck_kickl:
	DW 05ah		; x offset of collision box
	DW 069h		; y offset of collision box
	DW 044h		; x size of collision box
	DW 015h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_uppercut:
	DW 055h		; x offset of collision box
	DW 0fff2h		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 040h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_jump_punch:
	DW 057h		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 028h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_jump_kick:
	DW 05dh		; x offset of collision box
	DW 0fff5h		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 02dh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_flip_kick:
	DW 057h		; x offset of collision box
	DW 017h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 02ch		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_flip_punch:
	DW 057h		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 028h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_roundh:
	DW 065h		; x offset of collision box
	DW 0fff6h		; y offset of collision box
	DW 049h		; x size of collision box
	DW 037h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_knee:
	DW 04ah		; x offset of collision box
	DW 021h		; y offset of collision box
	DW 036h		; x size of collision box
	DW 03dh		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_elbow:
	DW 047h		; x offset of collision box
	DW 0fffeh		; y offset of collision box
	DW 032h		; x size of collision box
	DW 030h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_st_zap:
	DW 09ah		; x offset of collision box
	DW 015h		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 016h		; y size of collision box
	DW 05101h		; strike routine
	DW 00d02h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_summon:
	DW 014h		; x offset of collision box
	DW 0ff9bh		; y offset of collision box
	DW 027h		; x size of collision box
	DW 05dh		; y size of collision box
	DW 05001h		; strike routine
	DW 00803h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   She Goro strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
sg_strikes:
	DD stk_sg_hikick			; 0
	DD stk_sg_lokick			; 1
	DD stk_sg_hi_punch   		; 2
	DD stk_sg_lo_punch   		; 3
	DD stk_sg_sweep			; 4
	DD stk_sg_duck_punch		; 5
	DD stk_sg_duck_kickh		; 6
	DD stk_sg_duck_kickl		; 7
	DD stk_sg_uppercut   		; 8
	DD stk_sg_jump_punch		; 9
	DD stk_sg_jump_kick		; a
	DD stk_sg_flip_kick		; d
	DD stk_sg_flip_punch		; c
	DD stk_sg_roundh 		; d
	DD stk_sg_knee			; e
	DD stk_sg_elbow			; f
	DD stk_dummy			; 10
	DD stk_sg_zap			; 11
	DD stk_pounce			; 12
	DD stk_boss_pounce			; 13
	DD stk_dummy			; 14
	DD stk_dummy			;
	DD stk_dummy			;
	DD stk_dummy			;


	ALIGN 4
stk_sg_hikick:
	DW 065h		; x offset of collision box
	DW 016h		; y offset of collision box
	DW 050h		; x size of collision box
	DW 02ah		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_lokick:
	DW 06bh		; x offset of collision box
	DW 031h		; y offset of collision box
	DW 053h		; x size of collision box
	DW 014h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_hi_punch:
	DW 052h		; x offset of collision box
	DW 012h		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 01ah		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_sg_lo_punch:
	DW 04ah		; x offset of collision box
	DW 02bh		; y offset of collision box
	DW 039h		; x size of collision box
	DW 01eh		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_sweep:
	DW 063h		; x offset of collision box
	DW 073h		; y offset of collision box
	DW 052h		; x size of collision box
	DW 021h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_sg_duck_punch:
	DW 056h		; x offset of collision box
	DW 04ah		; y offset of collision box
	DW 047h		; x size of collision box
	DW 013h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_duck_kickh:
	DW 05dh		; x offset of collision box
	DW 03dh		; y offset of collision box
	DW 046h		; x size of collision box
	DW 02fh		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_duck_kickl:
	DW 060h		; x offset of collision box
	DW 07ah		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 020h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_uppercut:
	DW 056h		; x offset of collision box
	DW 0fff0h		; y offset of collision box
	DW 04bh		; x size of collision box
	DW 053h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_jump_punch:
	DW 049h		; x offset of collision box
	DW 00ah		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 02fh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_jump_kick:
	DW 05ah		; x offset of collision box
	DW 015h		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 02ch		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_flip_kick:
	DW 04fh		; x offset of collision box
	DW 028h		; y offset of collision box
	DW 049h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_flip_punch:
	DW 049h		; x offset of collision box
	DW 00ah		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 02fh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_roundh:
	DW 077h		; x offset of collision box
	DW 003h		; y offset of collision box
	DW 051h		; x size of collision box
	DW 038h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_knee:
	DW 051h		; x offset of collision box
	DW 021h		; y offset of collision box
	DW 03ch		; x size of collision box
	DW 04ah		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_elbow:
	DW 04bh		; x offset of collision box
	DW 018h		; y offset of collision box
	DW 032h		; x size of collision box
	DW 030h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sg_zap:
	DW 001h		; x offset of collision box
	DW 0ffedh		; y offset of collision box
	DW 030h		; x size of collision box
	DW 026h		; y size of collision box
	DW 05c01h		; strike routine
	DW 01a03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_pounce:
	DW 023h		; x offset of collision box
	DW 026h		; y offset of collision box
	DW 032h		; x size of collision box
	DW 04bh		; y size of collision box
	DW 05b0eh		; strike routine (unblockable)
	DW 02020h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_boss_pounce:
	DW 023h		; x offset of collision box
	DW 026h		; y offset of collision box
	DW 032h		; x size of collision box
	DW 04bh		; y size of collision box
	DW 05b01h		; strike routine (unblockable)
	DW 02020h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Tusk strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
tusk_strikes:
	DD stk_tusk_hikick			; 0
	DD stk_tusk_lokick			; 1
	DD stk_tusk_hi_punch   		; 2
	DD stk_tusk_lo_punch   		; 3
	DD stk_tusk_sweep			; 4
	DD stk_tusk_duck_punch		; 5
	DD stk_tusk_duck_kickh		; 6
	DD stk_tusk_duck_kickl		; 7
	DD stk_tusk_uppercut   		; 8
	DD stk_tusk_jump_punch		; 9
	DD stk_tusk_jump_kick		; a
	DD stk_tusk_flip_kick		; d
	DD stk_tusk_flip_punch		; c
	DD stk_tusk_roundh 		; d
	DD stk_tusk_knee			; e
	DD stk_tusk_elbow			; f
	DD stk_dummy			; 10
	DD stk_tusk_zap			; 11
	DD stk_tusk_blur			; 12
	DD stk_tusk_saw			; 13
	DD stk_dummy			; 14
	DD stk_dummy			;
	DD stk_dummy			;
	DD stk_dummy			;

	ALIGN 4
stk_tusk_hikick:
	DW 058h		; x offset of collision box
	DW 015h		; y offset of collision box
	DW 050h		; x size of collision box
	DW 02ah		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_lokick:
	DW 063h		; x offset of collision box
	DW 031h		; y offset of collision box
	DW 04ch		; x size of collision box
	DW 014h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_hi_punch:
	DW 054h		; x offset of collision box
	DW 011h		; y offset of collision box
	DW 034h		; x size of collision box
	DW 021h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_lo_punch:
	DW 05fh		; x offset of collision box
	DW 028h		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 015h		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_sweep:
	DW 068h		; x offset of collision box
	DW 070h		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 01ch		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_tusk_duck_punch:
	DW 051h		; x offset of collision box
	DW 050h		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 00eh		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_duck_kickh:
	DW 051h		; x offset of collision box
	DW 045h		; y offset of collision box
	DW 040h		; x size of collision box
	DW 01ah		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_duck_kickl:
	DW 056h		; x offset of collision box
	DW 074h		; y offset of collision box
	DW 043h		; x size of collision box
	DW 01ah		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_uppercut:
	DW 047h		; x offset of collision box
	DW 000h		; y offset of collision box
	DW 040h		; x size of collision box
	DW 043h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_jump_punch:
	DW 056h		; x offset of collision box
	DW 01ch		; y offset of collision box
	DW 034h		; x size of collision box
	DW 029h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_jump_kick:
	DW 051h		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 042h		; x size of collision box
	DW 024h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_flip_kick:
	DW 05ah		; x offset of collision box
	DW 02bh		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 02dh		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_flip_punch:
	DW 056h		; x offset of collision box
	DW 01ch		; y offset of collision box
	DW 034h		; x size of collision box
	DW 029h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_roundh:
	DW 065h		; x offset of collision box
	DW 015h		; y offset of collision box
	DW 04dh		; x size of collision box
	DW 030h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_knee:
	DW 04ah		; x offset of collision box
	DW 03ah		; y offset of collision box
	DW 031h		; x size of collision box
	DW 032h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_elbow:
	DW 047h		; x offset of collision box
	DW 02ch		; y offset of collision box
	DW 03bh		; x size of collision box
	DW 022h		; y size of collision box
	DW 04c07h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_zap:
	DW 031h		; x offset of collision box
	DW 0ffefh		; y offset of collision box
	DW 02ah		; x size of collision box
	DW 019h		; y size of collision box
	DW 04a01h		; strike routine
	DW 01703h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_blur:
	DW 021h		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 035h		; x size of collision box
	DW 07eh		; y size of collision box
	DW 04b00h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_tusk_saw:
	DW 014h		; x offset of collision box
	DW 0ffd4h		; y offset of collision box
	DW 022h		; x size of collision box
	DW 02bh		; y size of collision box
	DW 04d00h		; strike routine
	DW 01202h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Kung Lao strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
lao_strikes:
	DD stk_lao_hikick			; 0
	DD stk_lao_lokick			; 1
	DD stk_lao_hi_punch   		; 2
	DD stk_lao_lo_punch   		; 3
	DD stk_lao_sweep			; 4
	DD stk_lao_duck_punch		; 5
	DD stk_lao_duck_kickh		; 6
	DD stk_lao_duck_kickl		; 7
	DD stk_lao_uppercut   		; 8
	DD stk_lao_jump_punch		; 9
	DD stk_lao_jump_kick		; a
	DD stk_lao_flip_kick		; d
	DD stk_lao_flip_punch		; c
	DD stk_lao_roundh 		; d
	DD stk_lao_knee			; e
	DD stk_lao_elbow			; f
	DD stk_dummy			; 10
	DD stk_lao_zap			; 11
	DD stk_lao_angle			; 12
	DD stk_lao_spin			; 13
	DD stk_dummy			; 14
	DD stk_dummy			;
	DD stk_dummy			;
	DD stk_dummy			;

	ALIGN 4
stk_lao_hikick:
	DW 055h		; x offset of collision box
	DW 006h		; y offset of collision box
	DW 040h		; x size of collision box
	DW 02eh		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_lokick:
	DW 064h		; x offset of collision box
	DW 025h		; y offset of collision box
	DW 04ch		; x size of collision box
	DW 014h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_hi_punch:
	DW 04ah		; x offset of collision box
	DW 003h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 023h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_lao_lo_punch:
	DW 051h		; x offset of collision box
	DW 01bh		; y offset of collision box
	DW 033h		; x size of collision box
	DW 01ch		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_sweep:
	DW 06eh		; x offset of collision box
	DW 069h		; y offset of collision box
	DW 04ch		; x size of collision box
	DW 018h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_lao_duck_punch:
	DW 04ah		; x offset of collision box
	DW 039h		; y offset of collision box
	DW 03bh		; x size of collision box
	DW 013h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_duck_kickh:
	DW 04bh		; x offset of collision box
	DW 039h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 031h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_duck_kickl:
	DW 057h		; x offset of collision box
	DW 069h		; y offset of collision box
	DW 043h		; x size of collision box
	DW 01ah		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_uppercut:
	DW 03ah		; x offset of collision box
	DW 0ffefh		; y offset of collision box
	DW 034h		; x size of collision box
	DW 046h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_jump_punch:
	DW 068h		; x offset of collision box
	DW 015h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 02eh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_jump_kick:
	DW 052h		; x offset of collision box
	DW 00ch		; y offset of collision box
	DW 039h		; x size of collision box
	DW 03bh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_flip_kick:
	DW 04ch		; x offset of collision box
	DW 02dh		; y offset of collision box
	DW 02ch		; x size of collision box
	DW 01dh		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_flip_punch:
	DW 067h		; x offset of collision box
	DW 019h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 02dh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_roundh:
	DW 061h		; x offset of collision box
	DW 007h		; y offset of collision box
	DW 045h		; x size of collision box
	DW 031h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_knee:
	DW 040h		; x offset of collision box
	DW 021h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 030h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_elbow:
	DW 03dh		; x offset of collision box
	DW 00ch		; y offset of collision box
	DW 030h		; x size of collision box
	DW 024h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_zap:
	DW 054h		; x offset of collision box
	DW 024h		; y offset of collision box
	DW 02ah		; x size of collision box
	DW 029h		; y size of collision box
	DW 04504h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_angle:
	DW 056h		; x offset of collision box
	DW 034h		; y offset of collision box
	DW 02dh		; x size of collision box
	DW 009h		; y size of collision box
	DW 04600h		; strike routine
	DW 00f02h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_lao_spin:
	DW 028h		; x offset of collision box
	DW 0fff9h		; y offset of collision box
	DW 03ch		; x size of collision box
	DW 052h		; y size of collision box
	DW 00801h		; strike routine
	DW 01603h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Robo strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
robo_strikes:
	DD stk_ro_hikick			; 0
	DD stk_ro_lokick			; 1
	DD stk_ro_hi_punch			; 2
	DD stk_ro_lo_punch			; 3
	DD stk_ro_sweep			; 4
	DD stk_ro_duck_punch		; 5
	DD stk_ro_duck_kickh		; 6
	DD stk_ro_duck_kickl		; 7
	DD stk_ro_uppercut			; 8
	DD stk_ro_jump_punch		; 9
	DD stk_ro_jump_kick		; a
	DD stk_ro_flip_kick		; d
	DD stk_ro_flip_punch		; c
	DD stk_ro_roundh 		; d
	DD stk_ro_knee			; e
	DD stk_ro_elbow			; f
	DD stk_dummy			; 10
	DD stk_ro_net			; 11
	DD stk_ro_zap			; 12
	DD stk_ro_tele			; 13
	DD stk_ro_bomb			; 14
	DD stk_spear			; 15

	ALIGN 4
stk_ro_hikick:
	DW 05fh		; x offset of collision box
	DW 00dh		; y offset of collision box
	DW 047h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_lokick:
	DW 06ah		; x offset of collision box
	DW 030h		; y offset of collision box
	DW 047h		; x size of collision box
	DW 010h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_hi_punch:
	DW 04bh		; x offset of collision box
	DW 00eh		; y offset of collision box
	DW 036h		; x size of collision box
	DW 021h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_ro_lo_punch:
	DW 046h		; x offset of collision box
	DW 023h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 01fh		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_sweep:
	DW 06ah		; x offset of collision box
	DW 06bh		; y offset of collision box
	DW 04fh		; x size of collision box
	DW 021h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_ro_duck_punch:
	DW 044h		; x offset of collision box
	DW 03fh		; y offset of collision box
	DW 037h		; x size of collision box
	DW 013h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_duck_kickh:
	DW 048h		; x offset of collision box
	DW 03ah		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 038h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_duck_kickl:
	DW 060h		; x offset of collision box
	DW 070h		; y offset of collision box
	DW 040h		; x size of collision box
	DW 017h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_uppercut:
	DW 03ch		; x offset of collision box
	DW 0fffah		; y offset of collision box
	DW 038h		; x size of collision box
	DW 04ah		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_jump_punch:
	DW 04bh		; x offset of collision box
	DW 011h		; y offset of collision box
	DW 032h		; x size of collision box
	DW 031h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_jump_kick:
	DW 04bh		; x offset of collision box
	DW 0fff6h		; y offset of collision box
	DW 045h		; x size of collision box
	DW 049h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_flip_kick:
	DW 050h		; x offset of collision box
	DW 02dh		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 023h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_flip_punch:
	DW 04bh		; x offset of collision box
	DW 011h		; y offset of collision box
	DW 032h		; x size of collision box
	DW 031h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_roundh:
	DW 068h		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 04ah		; x size of collision box
	DW 033h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_knee:
	DW 047h		; x offset of collision box
	DW 02ch		; y offset of collision box
	DW 030h		; x size of collision box
	DW 03fh		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_elbow:
	DW 03dh		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 036h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_zap:
	DW 010h		; x offset of collision box
	DW 0fff1h		; y offset of collision box
	DW 023h		; x size of collision box
	DW 01fh		; y size of collision box
	DW 03b04h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_net:
	DW 037h		; x offset of collision box
	DW 0ffe0h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 04ah		; y size of collision box
	DW 03c00h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_tele:
	DW 049h		; x offset of collision box
	DW 0fff7h		; y offset of collision box
	DW 049h		; x size of collision box
	DW 057h		; y size of collision box
	DW 03d00h		; strike routine
	DW 01002h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ro_bomb:
	DW 02fh		; x offset of collision box
	DW 0ffb8h		; y offset of collision box
	DW 053h		; x size of collision box
	DW 057h		; y size of collision box
	DW 03e09h		; strike routine
	DW 01212h		; damage
	DW 0

	ALIGN 4
stk_spear:
	DW 0147h		; x offset of collision box
	DW 0ffffh		; y offset of collision box
	DW 050h		; x size of collision box
	DW 010h		; y size of collision box
	DW 03f00h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Lia guy strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
lia_strikes:
	DD stk_li_hikick			; 0
	DD stk_li_lokick			; 1
	DD stk_li_hi_punch			; 2
	DD stk_li_lo_punch			; 3
	DD stk_li_sweep			; 4
	DD stk_li_duck_punch		; 5
	DD stk_li_duck_kickh		; 6
	DD stk_li_duck_kickl		; 7
	DD stk_li_uppercut			; 8
	DD stk_li_jump_punch		; 9
	DD stk_li_jump_kick		; a
	DD stk_li_flip_kick		; d
	DD stk_li_flip_punch		; c
	DD stk_li_roundh 		; d
	DD stk_li_knee			; e
	DD stk_li_elbow			; f
	DD stk_dummy			; 10
	DD stk_li_scream			; 11
	DD stk_li_angle_zap 		; 12
	DD stk_li_angle_zap2 		; 13
	DD stk_li_angle_zap3 		; 14
	DD stk_li_forward			; 15

	ALIGN 4
stk_li_hikick:
	DW 059h		; x offset of collision box
	DW 00bh		; y offset of collision box
	DW 047h		; x size of collision box
	DW 02dh		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_lokick:
	DW 05fh		; x offset of collision box
	DW 02fh		; y offset of collision box
	DW 042h		; x size of collision box
	DW 00fh		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_hi_punch:
	DW 054h		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 02fh		; x size of collision box
	DW 023h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_li_lo_punch:
	DW 054h		; x offset of collision box
	DW 026h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 016h		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_sweep:
	DW 06bh		; x offset of collision box
	DW 066h		; y offset of collision box
	DW 04ch		; x size of collision box
	DW 021h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_li_duck_punch:
	DW 04dh		; x offset of collision box
	DW 049h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 013h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_duck_kickh:
	DW 059h		; x offset of collision box
	DW 040h		; y offset of collision box
	DW 047h		; x size of collision box
	DW 02ch		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_duck_kickl:
	DW 059h		; x offset of collision box
	DW 072h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 018h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_uppercut:
	DW 04ah		; x offset of collision box
	DW 0fff3h		; y offset of collision box
	DW 034h		; x size of collision box
	DW 047h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_jump_punch:
	DW 055h		; x offset of collision box
	DW 006h		; y offset of collision box
	DW 02fh		; x size of collision box
	DW 02bh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_jump_kick:
	DW 04fh		; x offset of collision box
	DW 0fff8h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 048h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_flip_kick:
	DW 059h		; x offset of collision box
	DW 01ah		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 033h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_flip_punch:
	DW 056h		; x offset of collision box
	DW 00ch		; y offset of collision box
	DW 035h		; x size of collision box
	DW 02ah		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_roundh:
	DW 04ah		; x offset of collision box
	DW 001h		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 039h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_knee:
	DW 051h		; x offset of collision box
	DW 022h		; y offset of collision box
	DW 02fh		; x size of collision box
	DW 03ah		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_elbow:
	DW 04ch		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 02dh		; x size of collision box
	DW 02ch		; y size of collision box

	DW 04c07h		; strike routine

	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_angle_zap:
	DW 053h		; x offset of collision box
	DW 030h		; y offset of collision box
	DW 025h		; x size of collision box
	DW 025h		; y size of collision box
	DW 03704h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_scream:
	DW 09ah		; x offset of collision box
	DW 008h		; y offset of collision box
	DW 06ah		; x size of collision box
	DW 042h		; y size of collision box
	DW 03608h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_angle_zap2:
	DW 07dh		; x offset of collision box
	DW 051h		; y offset of collision box
	DW 02ah		; x size of collision box
	DW 02ch		; y size of collision box
	DW 03704h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_angle_zap3:
	DW 085h		; x offset of collision box
	DW 05bh		; y offset of collision box
	DW 02fh		; x size of collision box
	DW 02bh		; y size of collision box
	DW 03704h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_li_forward:
	DW 072h		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 02dh		; x size of collision box
	DW 011h		; y size of collision box
	DW 03704h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Swat guy strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
swat_strikes:
	DD stk_sw_hikick			; 0
	DD stk_sw_lokick			; 1
	DD stk_sw_hi_punch			; 2
	DD stk_sw_lo_punch			; 3
	DD stk_sw_sweep			; 4
	DD stk_sw_duck_punch		; 5
	DD stk_sw_duck_kickh		; 6
	DD stk_sw_duck_kickl		; 7
	DD stk_sw_uppercut			; 8
	DD stk_sw_jump_punch		; 9
	DD stk_sw_jump_kick		; a
	DD stk_sw_flip_kick		; d
	DD stk_sw_flip_punch		; c
	DD stk_sw_roundh 		; d
	DD stk_sw_knee			; e
	DD stk_sw_elbow			; f
	DD stk_sw_bomb			; 10
	DD stk_dummy			; 11
	DD stk_sw_zap			; 12
	DD stk_sw_prezap1			; 13
	DD stk_sw_prezap2			; 14
	DD stk_sw_zoom			; 15
	DD stk_sw_diag_zap2		; 16
	DD stk_sw_stick_sweep		; 17

	ALIGN 4
stk_sw_hikick:
	DW 05fh		; x offset of collision box
	DW 00dh		; y offset of collision box
	DW 051h		; x size of collision box
	DW 02ch		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_lokick:
	DW 067h		; x offset of collision box
	DW 031h		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 010h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_hi_punch:
	DW 058h		; x offset of collision box
	DW 00dh		; y offset of collision box
	DW 035h  		; x size of collision box
	DW 024h  		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_sw_lo_punch:
	DW 050h		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 014h		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_sweep:
	DW 06dh		; x offset of collision box
	DW 066h		; y offset of collision box
	DW 04bh		; x size of collision box
	DW 024h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_sw_duck_punch:
	DW 04dh		; x offset of collision box
	DW 046h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 013h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_duck_kickh:
	DW 051h		; x offset of collision box
	DW 03ah		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 031h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_duck_kickl:
	DW 05dh		; x offset of collision box
	DW 06fh		; y offset of collision box
	DW 046h		; x size of collision box
	DW 01fh		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_uppercut:
	DW 04eh		; x offset of collision box
	DW 0fff6h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 04dh		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_jump_punch:
	DW 05ah		; x offset of collision box
	DW 011h		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 02ch		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_jump_kick:
	DW 04eh		; x offset of collision box
	DW 002h		; y offset of collision box
	DW 03ch		; x size of collision box
	DW 048h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_flip_kick:
	DW 05dh		; x offset of collision box
	DW 01dh		; y offset of collision box
	DW 041h		; x size of collision box
	DW 036h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_flip_punch:
	DW 05ah		; x offset of collision box
	DW 011h		; y offset of collision box
	DW 03dh		; x size of collision box
	DW 02ch		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_roundh:
	DW 06dh		; x offset of collision box
	DW 0fff7h		; y offset of collision box
	DW 048h		; x size of collision box
	DW 03bh		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_knee:
	DW 04eh		; x offset of collision box
	DW 027h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 036h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_elbow:
	DW 041h		; x offset of collision box
	DW 00dh		; y offset of collision box
	DW 02ch		; x size of collision box
	DW 028h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_zap:
	DW 0e9h		; x offset of collision box
	DW 02bh		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 013h		; y size of collision box
	DW 03004h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_prezap1:
	DW 087h		; x offset of collision box
	DW 02bh		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 013h		; y size of collision box
	DW 03004h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_prezap2:
	DW 0adh		; x offset of collision box
	DW 02bh		; y offset of collision box
	DW 05bh		; x size of collision box
	DW 013h		; y size of collision box
	DW 03004h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_diag_zap1:
	DW 05fh		; x offset of collision box
	DW 0ffe4h		; y offset of collision box
	DW 02bh		; x size of collision box
	DW 030h		; y size of collision box
	DW 03000h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_diag_zap2:
	DW 08ch		; x offset of collision box
	DW 0ffbch		; y offset of collision box
	DW 02bh		; x size of collision box
	DW 030h		; y size of collision box
	DW 03000h		; strike routine
	DW 01402h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_bomb:
	DW 017h		; x offset of collision box
	DW 0ffedh		; y offset of collision box
	DW 02dh		; x size of collision box
	DW 025h		; y size of collision box
	DW 03104h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_zoom:
	DW 0fff2h		; x offset of collision box
	DW 01ch		; y offset of collision box
	DW 028h		; x size of collision box
	DW 024h		; y size of collision box
	DW 03200h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sw_stick_sweep:
	DW 083h		; x offset of collision box
	DW 064h		; y offset of collision box
	DW 074h		; x size of collision box
	DW 004h		; y size of collision box
	DW 03303h		; strike routine
	DW 01a04h		; damage
	DW SF_DUCK

;*************************************************************************
;											     *
;   subzero strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
sz_strikes:
	DD stk_sz_hikick			; 0
	DD stk_sz_lokick			; 1
	DD stk_sz_hi_punch			; 2
	DD stk_sz_lo_punch			; 3
	DD stk_sz_sweep			; 4
	DD stk_sz_duck_punch		; 5
	DD stk_sz_duck_kickh		; 6
	DD stk_sz_duck_kickl		; 7
	DD stk_sz_uppercut			; 8
	DD stk_sz_jump_punch		; 9
	DD stk_sz_jump_kick		; a
	DD stk_sz_flip_kick		; d
	DD stk_sz_flip_punch		; c
	DD stk_sz_roundh 		; d
	DD stk_sz_knee			; e
	DD stk_sz_elbow			; f
	DD stk_sz_slide			; 10
	DD stk_dummy			; 11
	DD stk_sz_zap			; 12
	DD stk_sz_forward_zap		; 13
	DD stk_dummy			; 14
	DD stk_dummy			; 15
	DD stk_dummy			; 16
	DD stk_dummy			; 17


	ALIGN 4
stk_sz_hikick:
	DW 068h		; x offset of collision box
	DW 00ah		; y offset of collision box
	DW 04eh		; x size of collision box
	DW 02bh		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_lokick:
	DW 06fh		; x offset of collision box
	DW 02eh		; y offset of collision box
	DW 04dh		; x size of collision box
	DW 00fh		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_hi_punch:
	DW 052h		; x offset of collision box
	DW 006h		; y offset of collision box
	DW 035h		; x size of collision box
	DW 025h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
 	DW SF_SQUEEZE

	ALIGN 4
stk_sz_lo_punch:
	DW 057h		; x offset of collision box
	DW 01ch		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 01ch		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_sweep:
	DW 065h		; x offset of collision box
	DW 067h		; y offset of collision box
	DW 052h		; x size of collision box
	DW 01fh		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_sz_duck_punch:
	DW 046h		; x offset of collision box
	DW 03ch		; y offset of collision box
	DW 037h		; x size of collision box
	DW 018h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_duck_kickh:
	DW 049h		; x offset of collision box
	DW 035h		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 031h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_duck_kickl:
	DW 05eh		; x offset of collision box
	DW 060h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 024h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_uppercut:
	DW 051h		; x offset of collision box
	DW 0ffeeh		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 048h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_jump_punch:
	DW 065h		; x offset of collision box
	DW 0fff4h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_jump_kick:
	DW 060h		; x offset of collision box
	DW 0ffefh		; y offset of collision box
	DW 04ch		; x size of collision box
	DW 042h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_flip_kick:
	DW 064h		; x offset of collision box
	DW 01ah		; y offset of collision box
	DW 041h		; x size of collision box
	DW 029h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_flip_punch:
	DW 065h		; x offset of collision box
	DW 000h		; y offset of collision box
	DW 034h		; x size of collision box
	DW 035h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_roundh:
	DW 05ah		; x offset of collision box
	DW 000h		; y offset of collision box
	DW 048h		; x size of collision box
	DW 036h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_knee:
	DW 041h		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 032h		; x size of collision box
	DW 035h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_elbow:
	DW 03eh		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 02bh		; x size of collision box
	DW 024h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_zap:
	DW 017h		; x offset of collision box
	DW 03fh		; y offset of collision box
	DW 030h		; x size of collision box
	DW 07eh		; y size of collision box
	DW 02c05h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_slide:
	DW 059h		; x offset of collision box
	DW 065h		; y offset of collision box
	DW 055h		; x size of collision box
	DW 022h		; y size of collision box
	DW 02d00h		; strike routine
	DW 00d03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sz_forward_zap:
	DW 082h		; x offset of collision box
	DW 0fff5h		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 006h		; y size of collision box
	DW 02c05h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   indian strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
indian_strikes:
	DD stk_ind_hikick			; 0
	DD stk_ind_lokick			; 1
	DD stk_ind_hi_punch		; 2
	DD stk_ind_lo_punch		; 3
	DD stk_ind_sweep			; 4
	DD stk_ind_duck_punch		; 5
	DD stk_ind_duck_kickh		; 6
	DD stk_ind_duck_kickl		; 7
	DD stk_ind_uppercut		; 8
	DD stk_ind_jump_punch		; 9
	DD stk_ind_jump_kick		; a
	DD stk_ind_flip_kick		; d
	DD stk_ind_flip_punch		; c
	DD stk_ind_roundh 		; d
	DD stk_ind_knee			; e
	DD stk_ind_elbow			; f
	DD stk_dummy			; 10
	DD stk_ind_charge			; 11
	DD stk_ind_zap			; 12
	DD stk_axe_horz			; 13
	DD stk_dummy			; 14
	DD stk_axe_up			; 15
	DD stk_dummy			; 16
	DD stk_dummy			; 17


	ALIGN 4
stk_ind_hikick:
	DW 064h		; x offset of collision box
	DW 007h		; y offset of collision box
	DW 053h		; x size of collision box
	DW 02fh		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_lokick:
	DW 06ah		; x offset of collision box
	DW 02eh		; y offset of collision box
	DW 04dh		; x size of collision box
	DW 013h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_hi_punch:
	DW 04bh		; x offset of collision box
	DW 00bh		; y offset of collision box
	DW 035h		; x size of collision box
	DW 025h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_lo_punch:
	DW 045h+4		; x offset of collision box
	DW 01fh		; y offset of collision box
	DW 037h		; x size of collision box
	DW 01ah		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_sweep:
	DW 06dh+4		; x offset of collision box
	DW 068h		; y offset of collision box
	DW 049h		; x size of collision box
	DW 021h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_ind_duck_punch:
	DW 045h+4		; x offset of collision box
	DW 041h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 01dh		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_duck_kickh:
	DW 03bh+4		; x offset of collision box
	DW 033h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 03ch		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_duck_kickl:
	DW 05eh+4		; x offset of collision box
	DW 066h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 020h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_uppercut:
	DW 03eh		; x offset of collision box
	DW 0fff3h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 04bh		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_jump_punch:
	DW 04dh		; x offset of collision box
	DW 019h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 02bh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_jump_kick:
	DW 052h+4		; x offset of collision box
	DW 004h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 047h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_flip_kick:
	DW 052h+4		; x offset of collision box
	DW 01bh		; y offset of collision box
	DW 03ch		; x size of collision box
	DW 037h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_flip_punch:
	DW 049h+4		; x offset of collision box
	DW 019h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_roundh:
	DW 053h		; x offset of collision box
	DW 00ah		; y offset of collision box
	DW 040h		; x size of collision box
	DW 034h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_knee:
	DW 045h		; x offset of collision box
	DW 03ah		; y offset of collision box
	DW 044h		; x size of collision box
	DW 035h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_elbow:
	DW 043h		; x offset of collision box
	DW 014h		; y offset of collision box
	DW 02bh		; x size of collision box
	DW 016h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_zap:
	DW 074h		; x offset of collision box
	DW 024h		; y offset of collision box
	DW 04ch		; x size of collision box
	DW 012h		; y size of collision box
	DW 02805h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_ind_charge:
	DW 034h		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 028h		; y size of collision box
	DW 02901h		; strike routine
	DW 01804h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_axe_horz:
	DW 05dh		; x offset of collision box
	DW 022h		; y offset of collision box
	DW 047h		; x size of collision box
	DW 016h		; y size of collision box
	DW 02a01h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_axe_up:
	DW 058h		; x offset of collision box
	DW 0fffeh		; y offset of collision box
	DW 049h		; x size of collision box
	DW 03eh		; y size of collision box
	DW 02b01h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   jax strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
jax_strikes:
	DD stk_jax_hikick			; 0
	DD stk_jax_lokick			; 1
	DD stk_jax_hi_punch		; 2
	DD stk_jax_lo_punch		; 3
	DD stk_jax_sweep			; 4
	DD stk_jax_duck_punch		; 5
	DD stk_jax_duck_kickh		; 6
	DD stk_jax_duck_kickl		; 7
	DD stk_jax_uppercut		; 8
	DD stk_jax_jump_punch		; 9
	DD stk_jax_jump_kick		; a
	DD stk_jax_flip_kick		; d
	DD stk_jax_flip_punch		; c
	DD stk_jax_roundh 		; d
	DD stk_jax_knee			; e
	DD stk_jax_elbow			; f
	DD stk_jax_dash			; 10
	DD stk_dummy			; 11
	DD stk_jax_zap			; 12
	DD stk_jax_prezap			; 13
	DD stk_noogy			; 14

	ALIGN 4
stk_jax_hikick:
	DW 05fh		; x offset of collision box
	DW 01eh		; y offset of collision box
	DW 051h		; x size of collision box
	DW 02eh		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_lokick:
	DW 069h		; x offset of collision box
	DW 039h		; y offset of collision box
	DW 049h		; x size of collision box
	DW 014h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_hi_punch:
	DW 050h		; x offset of collision box
	DW 01ah		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 020h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_lo_punch:
	DW 04eh		; x offset of collision box
	DW 02dh		; y offset of collision box
	DW 03eh		; x size of collision box
	DW 01dh		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_sweep:
	DW 065h		; x offset of collision box
	DW 07ah		; y offset of collision box
	DW 049h		; x size of collision box
	DW 01fh		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_jax_duck_punch:
	DW 051h		; x offset of collision box
	DW 048h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 01dh		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_duck_kickh:
	DW 065h		; x offset of collision box
	DW 055h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 042h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_duck_kickl:
	DW 063h		; x offset of collision box
	DW 078h		; y offset of collision box
	DW 046h		; x size of collision box
	DW 020h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_uppercut:
	DW 04bh		; x offset of collision box
	DW 0fff8h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 04ch		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_jump_punch:
	DW 058h		; x offset of collision box
	DW 012h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 039h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_jump_kick:
	DW 047h		; x offset of collision box
	DW 00fh		; y offset of collision box
	DW 039h		; x size of collision box
	DW 047h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_flip_kick:
	DW 058h		; x offset of collision box
	DW 031h		; y offset of collision box
	DW 042h		; x size of collision box
	DW 029h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_flip_punch:
	DW 047h		; x offset of collision box
	DW 00fh		; y offset of collision box
	DW 039h		; x size of collision box
	DW 047h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_roundh:
	DW 053h		; x offset of collision box
	DW 009h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 036h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_knee:
	DW 052h		; x offset of collision box
	DW 02eh		; y offset of collision box
	DW 030h		; x size of collision box
	DW 037h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_elbow:
	DW 041h		; x offset of collision box
	DW 013h		; y offset of collision box
	DW 036h		; x size of collision box
	DW 029h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_zap:
	DW 073h		; x offset of collision box
	DW 036h		; y offset of collision box
	DW 05ch		; x size of collision box
	DW 010h		; y size of collision box
	DW 02304h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_prezap:
	DW 04fh		; x offset of collision box
	DW 02fh		; y offset of collision box
	DW 04ah		; x size of collision box
	DW 01ah		; y size of collision box
	DW 02304h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_noogy:
	DW 060h 		; x offset of collision box
	DW 00ch		; y offset of collision box
	DW 036h		; x size of collision box
	DW 028h		; y size of collision box
	DW 00d00h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_jax_dash:
	DW 05dh		; x offset of collision box
	DW 024h		; y offset of collision box
	DW 044h		; x size of collision box
	DW 016h		; y size of collision box
	DW 02401h		; strike routine
	DW 01603h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Sonya strikes    									     *
;											     *
;*************************************************************************
	ALIGN 4
sonya_strikes:
	DD stk_sonya_hikick		; 0
	DD stk_sonya_lokick		; 1
	DD stk_sonya_hi_punch		; 2
	DD stk_sonya_lo_punch		; 3
	DD stk_sonya_sweep			; 4
	DD stk_sonya_duck_punch		; 5
	DD stk_sonya_duck_kickh		; 6
	DD stk_sonya_duck_kickl		; 7
	DD stk_sonya_uppercut		; 8
	DD stk_sonya_jump_punch		; 9
	DD stk_sonya_jump_kick		; a
	DD stk_sonya_flip_kick		; d
	DD stk_sonya_flip_punch		; c
	DD stk_sonya_roundh 	; d
	DD stk_sonya_knee			; e
	DD stk_sonya_elbow			; f
	DD stk_sonya_leg			; 10
	DD stk_sonya_square		; 11
	DD stk_sonya_zap			; 12
	DD stk_sonya_prezap		; 13
	DD stk_sonya_bike			; 14

; 1. new stk table entry
; 2. set hit/block offsets
; 3. set hit/block damage

	ALIGN 4
stk_sonya_hikick:
	DW 04bh+8		; x offset of collision box
	DW 00fh		; y offset of collision box
	DW 044h		; x size of collision box
	DW 02eh		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_lokick:
	DW 052h+8		; x offset of collision box
	DW 030h		; y offset of collision box
	DW 049h		; x size of collision box
	DW 01fh		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_duck_punch:
	DW 039h+8		; x offset of collision box
	DW 040h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 022h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_duck_kickh:
	DW 047h+8		; x offset of collision box
	DW 033h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 03eh		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_duck_kickl:
	DW 062h+8		; x offset of collision box
	DW 06dh		; y offset of collision box
	DW 046h		; x size of collision box
	DW 01eh		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_uppercut:
	DW 04eh		; x offset of collision box
	DW 0fff9h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 043h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_elbow:
	DW 03dh+8		; x offset of collision box
	DW 013h		; y offset of collision box
	DW 029h		; x size of collision box
	DW 027h		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_knee:
	DW 040h+8		; x offset of collision box
	DW 02eh		; y offset of collision box
	DW 02bh		; x size of collision box
	DW 037h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_roundh:
	DW 048h+8		; x offset of collision box
	DW 00dh		; y offset of collision box
	DW 037h		; x size of collision box
	DW 010h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_sweep:
	DW 05dh+8		; x offset of collision box
	DW 06eh		; y offset of collision box
	DW 049h		; x size of collision box
	DW 01bh		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_sonya_flip_kick:
	DW 041h+8		; x offset of collision box
	DW 023h		; y offset of collision box
	DW 042h		; x size of collision box
	DW 022h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_flip_punch:
	DW 03eh+8		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 031h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_jump_punch:
	DW 03eh+8		; x offset of collision box
	DW 010h		; y offset of collision box
	DW 031h		; x size of collision box
	DW 031h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_jump_kick:
	DW 03eh+8		; x offset of collision box
	DW 015h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 03fh		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_hi_punch:
	DW 041h		; x offset of collision box
	DW 012h		; y offset of collision box
	DW 035h		; x size of collision box
	DW 01eh		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_lo_punch:
	DW 048h		; x offset of collision box
	DW 028h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 013h		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_leg:
	DW 06bh+8		; x offset of collision box
	DW 022h		; y offset of collision box
	DW 048h		; x size of collision box
	DW 04dh		; y size of collision box
	DW 00d00h		; strike routine
	DW 00000h		; damage
	DW SF_DUCK

	ALIGN 4
stk_sonya_square:
	DW 046h		; x offset of collision box
	DW 00fh		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 034h		; y size of collision box
	DW 01d00h		; strike routine
	DW 01b08h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_zap:
	DW 06ch		; x offset of collision box
	DW 023h		; y offset of collision box
	DW 024h		; x size of collision box
	DW 00bh		; y size of collision box
	DW 01e04h		; strike routine
	DW 01303h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_prezap:
	DW 04dh		; x offset of collision box
	DW 023h		; y offset of collision box
	DW 02fh		; x size of collision box
	DW 01bh		; y size of collision box
	DW 01e04h		; strike routine
	DW 01303h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_sonya_bike:
	DW 036h		; x offset of collision box
	DW 003h		; y offset of collision box
	DW 039h		; x size of collision box
	DW 035h		; y size of collision box
	DW 00d01h		; strike routine
	DW 01603h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;											     *
;   Kano strikes										     *
;											     *
;*************************************************************************
	ALIGN 4
kano_strikes:
	DD stk_kano_hikick		; 0
	DD stk_kano_lokick		; 1
	DD stk_kano_hi_punch	; 2
	DD stk_kano_lo_punch	; 3
	DD stk_kano_sweep		; 4
	DD stk_kano_duck_punch	; 5
	DD stk_kano_duck_kickh	; 6
	DD stk_kano_duck_kickl	; 7
	DD stk_kano_uppercut	; 8
	DD stk_kano_jump_punch	; 9
	DD stk_kano_jump_kick	; a
	DD stk_kano_flip_kick	; d
	DD stk_kano_flip_punch	; c
	DD stk_kano_roundh 	; d
	DD stk_kano_knee		; e
	DD stk_kano_elbow		; f
	DD stk_kano_shake		;10
	DD 0			;11
	DD stk_kano_swipe		;12
	DD stk_kano_roll		;13 - kano ball roll
	DD stk_kano_prezap		;14
	DD stk_kano_zap		;15

; 1. new stk table entry
; 2. set hit/block offsets
; 3. set hit/block damage

	ALIGN 4
stk_kano_hikick:
	DW 059h		; x offset of collision box
	DW 00dh		; y offset of collision box
	DW 040h		; x size of collision box
	DW 029h		; y size of collision box
	DW 00006h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_lokick:
	DW 06dh		; x offset of collision box
	DW 02ah		; y offset of collision box
	DW 049h		; x size of collision box
	DW 012h		; y size of collision box
	DW 00106h		; strike routine
	DW 01504h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_duck_punch:
	DW 056h		; x offset of collision box
	DW 044h		; y offset of collision box
	DW 03ah		; x size of collision box
	DW 015h		; y size of collision box
	DW 0050ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_duck_kickh:
	DW 03ah		; x offset of collision box
	DW 034h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 039h		; y size of collision box
	DW 0060bh		; strike routine
	DW 00c03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_duck_kickl:
	DW 05ch		; x offset of collision box
	DW 06dh		; y offset of collision box
	DW 046h		; x size of collision box
	DW 020h		; y size of collision box
	DW 0070ah		; strike routine
	DW 00602h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_uppercut:
	DW 04dh		; x offset of collision box
	DW 0fff7h		; y offset of collision box
	DW 035h		; x size of collision box
	DW 046h		; y size of collision box
	DW 00802h		; strike routine
	DW 02409h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_elbow:
	DW 041h		; x offset of collision box
	DW 004h		; y offset of collision box
	DW 029h		; x size of collision box
	DW 02dh		; y size of collision box
	DW 00907h		; strike routine
	DW 01003h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_knee:
	DW 053h		; x offset of collision box
	DW 026h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 038h		; y size of collision box
	DW 00907h		; strike routine
	DW 01203h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_roundh:
	DW 059h		; x offset of collision box
	DW 006h		; y offset of collision box
	DW 037h		; x size of collision box
	DW 036h		; y size of collision box
	DW 00c01h		; strike routine
	DW 01d04h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_sweep:
	DW 06ch		; x offset of collision box
	DW 06dh		; y offset of collision box
	DW 04fh		; x size of collision box
	DW 022h		; y size of collision box
	DW 00403h		; strike routine
	DW 01403h		; damage
	DW SF_DUCK

	ALIGN 4
stk_kano_flip_kick:
	DW 057h		; x offset of collision box
	DW 02eh		; y offset of collision box
	DW 042h		; x size of collision box
	DW 024h		; y size of collision box
	DW 00a01h		; strike routine
	DW 01a07h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_flip_punch:
	DW 04dh		; x offset of collision box
	DW 01fh		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 024h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_jump_punch:
	DW 04dh		; x offset of collision box
	DW 01fh		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 024h		; y size of collision box
	DW 00b01h		; strike routine
	DW 01005h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_jump_kick:
	DW 055h		; x offset of collision box
	DW 024h		; y offset of collision box
	DW 048h		; x size of collision box
	DW 01ah		; y size of collision box
	DW 00b01h		; strike routine
	DW 01306h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_hi_punch:
	DW 049h		; x offset of collision box
	DW 00eh		; y offset of collision box
	DW 035h		; x size of collision box
	DW 022h		; y size of collision box
	DW 00211h		; strike routine
	DW 00b03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_lo_punch:
	DW 04fh		; x offset of collision box
	DW 01dh		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 01dh		; y size of collision box
	DW 00311h		; strike routine
	DW 00802h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_swipe:
	DW 06dh		; x offset of collision box
	DW 014h		; y offset of collision box
	DW 04bh		; x size of collision box
	DW 043h		; y size of collision box
	DW 01c01h		; strike routine
	DW 01a03h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_roll:
	DW 039h		; x offset of collision box
	DW 00eh		; y offset of collision box
	DW 048h		; x size of collision box
	DW 01fh		; y size of collision box
	DW 01a00h		; strike routine
	DW 01805h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_zap:
	DW 023h		; x offset of collision box
	DW -018h		; y offset of collision box
	DW 033h		; x size of collision box
	DW 032h		; y size of collision box
	DW 01b04h		; strike routine
	DW 01303h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_prezap:
	DW 06bh		; x offset of collision box
	DW 004h		; y offset of collision box
	DW 04ah		; x size of collision box
	DW 01eh		; y size of collision box
	DW 01704h		; strike routine
	DW 01303h		; damage
	DW SF_SQUEEZE

	ALIGN 4
stk_kano_shake:
	DW 065h		; x offset of collision box
	DW 020h		; y offset of collision box
	DW 03fh		; x size of collision box
	DW 011h		; y size of collision box
	DW 00d00h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

;*************************************************************************
;*************************************************************************
	ALIGN 4
	PUBLIC _combo_strike_table
_combo_strike_table:
	DD stk_combo0	; 0
	DD stk_combo1	; 1
	DD stk_combo2	; 2
	DD stk_combo3	; 3
	DD stk_combo4  	; 4
	DD stk_combo5  	; 5
	DD stk_combo_klang	; 6
	DD stk_combo1_stab	; 7
	DD stk_combo2_stab	; 8
	DD stk_combo6  	; 9

	DD stk_combo0	; a - not used
	DD stk_combo0	; b - not used
	DD stk_combo0	; c - not used
	DD stk_combo0	; d - not used
	DD stk_combo0	; e - not used
	DD stk_combo0	; f - not used

	DD stk_hard_combo0	; 10
	DD stk_hard_combo1	; 11
	DD stk_hard_combo2	; 12
	DD stk_combo3	; 13
	DD stk_combo4  	; 14
	DD stk_combo5  	; 15



combo_damage	equ	0701h
hard_damage		equ	0a01h

	ALIGN 4
stk_combo0:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 0100fh 		; strike routine
	DW combo_damage	; damage
 	DW 0

	ALIGN 4
stk_hard_combo0:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 0100fh 		; strike routine
	DW hard_damage	; damage
 	DW 0

	ALIGN 4
stk_combo1:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 0110fh 		; strike routine
	DW combo_damage	; damage
 	DW 0

	ALIGN 4
stk_hard_combo1:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 0110fh 		; strike routine
	DW hard_damage	; damage
 	DW 0

	ALIGN 4
stk_combo1_stab:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 00f0fh 		; strike routine
	DW hard_damage	; damage
 	DW 0

	ALIGN 4
stk_combo2:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 01212h 		; strike routine
	DW combo_damage	; damage
 	DW 0

	ALIGN 4
stk_hard_combo2:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 01212h 		; strike routine
	DW hard_damage	; damage
 	DW 0

	ALIGN 4
stk_combo2_stab:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 00e12h 		; strike routine
	DW combo_damage	; damage
 	DW 0

	ALIGN 4
stk_combo3:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 01312h 		; strike routine
	DW combo_damage	; damage
 	DW 0

	ALIGN 4
stk_combo4:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 01412h 		; strike routine
	DW hard_damage	; damage
 	DW 0

	ALIGN 4
stk_combo5:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 01512h 		; strike routine
	DW combo_damage	; damage
 	DW 0


	ALIGN 4
stk_combo6:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 01712h 		; strike routine
	DW combo_damage	; damage
 	DW 0


	ALIGN 4
stk_combo_klang:
	DW 051h   		; x offset of collision box
	DW 00h    		; y offset of collision box
	DW 043h   		; x size of collision box
	DW 085h   		; y size of collision box
	DW 0160fh 		; strike routine
	DW combo_damage	; damage
 	DW 0

	ALIGN 4
stk_combo_axeup:
	DW 05ah		; x offset of collision box
	DW -002h		; y offset of collision box
	DW 036h		; x size of collision box
	DW 05ch		; y size of collision box
	DW 02b01h		; strike routine
	DW 01804h		; damage
	DW SF_SQUEEZE

;*************************************************************************

	ALIGN 4
stk_dummy:
	DW 10		; x offset of collision box
	DW 10		; y offset of collision box
	DW 10		; x size of collision box
	DW 10		; y size of collision box
	DW 00000h		; strike routine
	DW 00000h		; damage
	DW SF_SQUEEZE

	ALIGN 4
dummy_strikes:
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy
	DD stk_dummy

	END_DATA
	end
