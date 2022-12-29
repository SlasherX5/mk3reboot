;#******************************************************************************
;# File  mkcombo.s
;#
;# By  David Schwartz
;#
;# Date  August 1994
;#
;# (C) Williams Entertainment
;#
;# Mortal Kombat III Combo Tables
;#******************************************************************************/

    include win95.i  

    BEGIN_DATA

sw_hi_punch = 0
sw_lo_punch = 1
sw_block    = 2
sw_hi_kick  = 3
sw_lo_kick  = 4
sw_run      = 5
sw_up       = 6
sw_down     = 7
sw_left     = 8
sw_right    = 9

x_ground = 0
x_airborn = 1
x_fatal = 2
x_mercy = 3
x_animal = 4
x_close_animal = 5
x_friend = 6
x_baby  = 7

    EXTERN  _do_animality                : DWORD
    EXTERN  _do_baby                     : DWORD
    EXTERN  _do_floor_blade              : DWORD
    EXTERN  _do_friendship               : DWORD
    EXTERN  _do_ind_zap                  : DWORD
    EXTERN  _do_inviso                   : DWORD
    EXTERN  _do_kano_swipe               : DWORD
    EXTERN  _do_kano_zap                 : DWORD
    EXTERN  _do_lao_spin                 : DWORD
    EXTERN  _do_lia_forward              : DWORD
    EXTERN  _do_lia_scream               : DWORD
    EXTERN  _do_mercy                    : DWORD
    EXTERN  _do_noogy                    : DWORD
    EXTERN  _do_pit_fatality             : DWORD
    EXTERN  _do_robo_tele                : DWORD
    EXTERN  _do_smoke_spear              : DWORD
    EXTERN  _do_square_wave              : DWORD
    EXTERN  _do_st_2_ind                 : DWORD
    EXTERN  _do_st_2_jax                 : DWORD
    EXTERN  _do_st_2_kano                : DWORD
    EXTERN  _do_st_2_lao                 : DWORD
    EXTERN  _do_st_2_lia                 : DWORD
    EXTERN  _do_st_2_lk                  : DWORD
    EXTERN  _do_st_2_robo1               : DWORD
    EXTERN  _do_st_2_robo2               : DWORD
    EXTERN  _do_st_2_sg                  : DWORD
    EXTERN  _do_st_2_swat                : DWORD
    EXTERN  _do_st_2_tusk                : DWORD
    EXTERN  _do_st_2_smoke               : DWORD
    EXTERN  _do_sz_forward_zap           : DWORD
    EXTERN  _q_animal_req                : DWORD
    EXTERN  _q_bubble_fatal              : DWORD
    EXTERN  _q_close_animal              : DWORD
    EXTERN  _q_dinger_friend             : DWORD
    EXTERN  _q_earth_fatal               : DWORD
    EXTERN  _q_eatit_fatal               : DWORD
    EXTERN  _q_floor_blade               : DWORD
    EXTERN  _q_friend                    : DWORD
    EXTERN  _q_grow_fatal                : DWORD
    EXTERN  _q_ind_axe_fatal             : DWORD
    EXTERN  _q_ind_friend                : DWORD
    EXTERN  _q_inflate_fatal             : DWORD
    EXTERN  _q_kabal_animal              : DWORD
    EXTERN  _q_kano_animal               : DWORD
    EXTERN  _q_lao_hat_fatal             : DWORD
    EXTERN  _q_lia_hair_fatal            : DWORD
    EXTERN  _q_lia_scream                : DWORD
    EXTERN  _q_lk_animal                 : DWORD
    EXTERN  _q_lk_friend                 : DWORD
    EXTERN  _q_lk_mk_fatal               : DWORD
    EXTERN  _q_mercy_req                 : DWORD
    EXTERN  _q_pit_fatal                 : DWORD
    EXTERN  _q_robo_crush_fatal          : DWORD
    EXTERN  _q_scream_fatal              : DWORD
    EXTERN  _q_shang_animal              : DWORD
    EXTERN  _q_sherip_fatal              : DWORD
    EXTERN  _q_skel_fatal                : DWORD
    EXTERN  _q_smoke_animal              : DWORD
    EXTERN  _q_smoke_friend              : DWORD
    EXTERN  _q_smoke_tele                : DWORD
    EXTERN  _q_sonya_friend              : DWORD
    EXTERN  _q_spear_ok                  : DWORD
    EXTERN  _q_st_spike_fatal            : DWORD
    EXTERN  _q_swat_animal               : DWORD
    EXTERN  _q_sz_forward_zap            : DWORD
    EXTERN  _q_shang_morph_lk            : DWORD
    EXTERN  _q_shang_morph_sg            : DWORD
    EXTERN  _q_shang_morph_lao           : DWORD
    EXTERN  _q_shang_morph_robo1         : DWORD
    EXTERN  _q_shang_morph_swat          : DWORD
    EXTERN  _q_shang_morph_tusk          : DWORD
    EXTERN  _q_shang_morph_ind           : DWORD
    EXTERN  _q_shang_morph_robo2         : DWORD
    EXTERN  _q_shang_morph_kano          : DWORD
    EXTERN  _q_shang_morph_jax           : DWORD
    EXTERN  _q_shang_morph_sz            : DWORD
    EXTERN  _q_shang_morph_lia           : DWORD
    EXTERN  _q_shang_morph_smoke         : DWORD
    EXTERN  _do_axe_up                   : DWORD
    EXTERN  _do_fast_axe_up              : DWORD
    EXTERN  _do_fatality_1               : DWORD
    EXTERN  _do_fatality_2               : DWORD
    EXTERN  _do_reflect                  : DWORD
    EXTERN  _do_sg_pounce                : DWORD
    EXTERN  _do_sg_quake                 : DWORD
    EXTERN  _do_sg_zap                   : DWORD
    EXTERN  _do_shake                    : DWORD
    EXTERN  _do_st_2_sz                  : DWORD
    EXTERN  _do_st_zap1                  : DWORD
    EXTERN  _do_st_zap2                  : DWORD
    EXTERN  _do_st_zap3                  : DWORD
    EXTERN  _do_stick_sweep              : DWORD
    EXTERN  _do_summon                   : DWORD
    EXTERN  _do_super_kang               : DWORD
    EXTERN  _do_swat_bomb_hi             : DWORD
    EXTERN  _do_swat_bomb_lo             : DWORD
    EXTERN  _do_swat_zoom                : DWORD
    EXTERN  _do_sz_decoy                 : DWORD
    EXTERN  _do_tusk_blur                : DWORD
    EXTERN  _do_tusk_zap                 : DWORD
    EXTERN  _lk_bike_kick                : DWORD
    EXTERN  _lk_zap_hi                   : DWORD
    EXTERN  _lk_zap_lo                   : DWORD
    EXTERN  _q_babality                  : DWORD
    EXTERN  _q_bike_req                  : DWORD
    EXTERN  _q_blurred_req               : DWORD
    EXTERN  _q_close_fatal               : DWORD
    EXTERN  _q_fatality_req              : DWORD
    EXTERN  _q_half_screen_fatal         : DWORD
    EXTERN  _q_pounce_ok_now             : DWORD
    EXTERN  _q_robo_flame_fatal          : DWORD
    EXTERN  _q_sz_decoy                  : DWORD
    EXTERN  _q_taser_fatal               : DWORD
    EXTERN  _hc_smoke                    : DWORD
    EXTERN  _hc_cheat                    : DWORD
    EXTERN  _hc_cheat1                   : DWORD
    EXTERN  _hc_free_play                : DWORD


    MASK_JLEFT      =   08000H
    MASK_JRIGHT     =   02000H
    MASK_JDOWN      =   04000H
    MASK_JUP        =   01000H
    MASK_JBLOCK     =   00008H
    MASK_JRUN       =   00004H
    MASK_JHIP       =   00010H
    MASK_JLOP       =   00080H
    MASK_JHIK       =   00020H
    MASK_JLOK       =   00040H

    p1b0 = (MASK_JHIP)
    p1b1 = (MASK_JLOP)
    p1b2 = (MASK_JBLOCK)
    p1b3 = (MASK_JHIK)
    p1b4 = (MASK_JLOK)
    p1b5 = (MASK_JRUN)
    p1sf2 = 0

    p2b0 =  (MASK_JHIP)
    p2b1 =  (MASK_JLOP)
    p2b2 =  (MASK_JBLOCK)
    p2b3 =  (MASK_JHIK)
    p2b4 =  (MASK_JLOK)
    p2b5 =  (MASK_JRUN)
    p2sf2 = 0


    ALIGN 4
PUBLIC _scom_robo_zap1
_scom_robo_zap1: 
    DW  020H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_robo_zap2
_scom_robo_zap2: 
    DW  016H            ; time to do entire switch combo
    DW  sw_left
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0

    DW  sw_right
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_robo_net
_scom_robo_net: 
    DW  020H            ; time to do entire switch combo
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_bomb_mid
_scom_bomb_mid: 
    DW  018H            ; time to do entire switch combo
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_bomb_full
_scom_bomb_full: 
PUBLIC _scom_robo_tele
_scom_robo_tele: 
    DW  018H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_robo2_tele
_scom_robo2_tele: 
    DW  018H            ; time to do entire switch combo
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_robo_air_grab
_scom_robo_air_grab: 
    DW  018H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0



    ALIGN 4
PUBLIC _scom_fly
_scom_fly: 
    DW  028H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_lia_anglez
_scom_lia_anglez: 
    DW  012H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_dash
_scom_dash: 
    DW  010H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_jax_zap2
_scom_jax_zap2: 
    DW  02aH            ; time to do entire switch combo
    DW  sw_left
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_jax_zap1
_scom_jax_zap1: 
    DW  010H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_bike
_scom_bike: 
    DW  020H            ; time to do entire switch combo
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_ind_charge
_scom_ind_charge: 
    DW  018H
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_sonya_zap
_scom_sonya_zap: 
    DW  018H
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_sky_zap_on
_scom_sky_zap_on: 
    DW  020H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_sky_zap_behind
_scom_sky_zap_behind: 
    DW  030H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_sky_zap_front
_scom_sky_zap_front: 
    DW  030H            ; time to do entire switch combo
    DW  sw_left
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0

    DW  sw_right
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_sw_zap
_scom_sw_zap: 
    DW  024H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_lao_teleport
_scom_lao_teleport: 
    DW  010H
    DW  sw_up
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0

    ALIGN 4
PUBLIC _scom_lao_angle_kick
_scom_lao_angle_kick: 
    DW  020H            ; time to do entire switch combo
    DW  sw_down
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0

    DW  sw_down
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0


    ALIGN 4
PUBLIC _scom_lao_zap
_scom_lao_zap: 
    DW  018H
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0

;**************************************************************************
;*                                               *
;*  Secret Move tables                                       *
;*                                               *
;* entry format 
;* typedef struct smove {
;*  WORD s_p1leg;           // p1 requirements, format change long-$word
;*  WORD s_p2leg;           // p2 requirements, format change long-$word
;*  LONG s_xfer;            // xfer type index, format change word-$long
;*  LONG s_yes_no;          // yes/no routine
;*  FUNC *s_routine;            // address of secret move
;*
;*  WORD s_time;            // time for move
;*  WORD s_r1;              // move right 1
;*  WORD s_r2;              // move right 2
;*  WORD s_r3;              // move right 3
;*  WORD s_r4;              // move right 4
;*  WORD s_r5;              // move right 5
;*  WORD s_r6;              // move right 6
;*  WORD s_l1;              // move left 1
;*  WORD s_l2;              // move left 2
;*  WORD s_l3;              // move left 3
;*  WORD s_l4;              // move left 4
;*  WORD s_l5;              // move left 5
;*  WORD s_l6;              // move left 6
;*  WORD s_pad;             // padding added to keep alignment
;* } SMOVE;
;**************************************************************************
    ALIGN 4
PUBLIC _sm_home_codes
_sm_home_codes: 
    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  0
    DD  0               ; yes/no routine
    DD  _hc_free_play    ; address of secret move
    DW  050H
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0               ; added field

    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  0
    DD  0               ; yes/no routine
    DD  _hc_smoke    ; address of secret move
    DW  060H
    DW  sw_up
    DW  sw_left
    DW  sw_down
    DW  sw_right
    DW  sw_up
    DW  sw_left
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0               ; added field

    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  0
    DD  0               ; yes/no routine
    DD  _hc_cheat1   ; address of secret move
    DW  060H
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_block
    DW  sw_block
    DW  sw_hi_kick
    DW  sw_lo_kick
    DW  sw_lo_punch
    DW  sw_hi_punch
    DW  0
    DW  0
    DW  0               ; added field

    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  0
    DD  0               ; yes/no routine
    DD  _hc_cheat    ; address of secret move
    DW  058H
    DW  sw_run
    DW  sw_block
    DW  sw_lo_punch
    DW  sw_hi_punch
    DW  sw_lo_kick
    DW  sw_hi_kick
    DW  sw_lo_punch
    DW  sw_hi_punch
    DW  sw_lo_kick
    DW  sw_hi_kick
    DW  0
    DW  0
    DW  0

    DW  0               ; ending zero needed here to terminate

    ALIGN 4
PUBLIC _sm_all_ro
_sm_all_ro: 
    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  x_mercy
    DD  _q_mercy_req ; yes/no routine
    DD  _do_mercy    ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0               ; added field
    DW  0               ; ending zero needed here to terminate

    ALIGN 4
PUBLIC _sm_smoke_lkc
_sm_smoke_lkc: 
    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_airborn
    DD  _q_smoke_tele        ; yes/no routine
    DD  _do_robo_tele        ; address of secret move
    DW  018H
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4
    DW  p2b4
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  020H
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

    ALIGN 4
PUBLIC _sm_smoke_uc
_sm_smoke_uc: 
    DW  p1b2 OR p1b5            ; player 1 requirements
    DW  p2b2 OR p2b5            ; player 2 requirements
    DD  x_fatal
    DD  _q_eatit_fatal       ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_up
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_up
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_smoke_dc
_sm_smoke_dc: 
    DW  p1b2 OR p1b5            ; player 1 requirements
    DW  p2b2 OR p2b5            ; player 2 requirements
    DD  x_fatal
    DD  _q_earth_fatal       ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  030H
    DW  sw_down
    DW  sw_right
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_smoke_hkc
_sm_smoke_hkc: 
    DW  p1b3                ; player 1 requirements
    DW  p2b3                ; player 2 requirements
    DD  x_friend
    DD  _q_smoke_friend      ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_hi_kick
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  sw_hi_kick
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3
    DW  p2b3
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0



    ALIGN 4
PUBLIC _sm_smoke_bc
_sm_smoke_bc: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_animal
    DD  _q_smoke_animal  ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_smoke_lpc
_sm_smoke_lpc: 
    DW  p1b1        ; player 1 requirements
    DW  p2b1        ; player 2 requirements
    DD  x_ground
    DD  _q_spear_ok  ; yes/no routine
    DD  _do_smoke_spear  ; address of secret move
    DW  014H
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_smoke_rc
_sm_smoke_rc: 
    DW  p1b5 OR p1b2        ; player 1 requirements
    DW  p2b5 OR p2b2        ; player 2 requirements
    DD  x_ground
    DD  0       ; yes/no routine
    DD  _do_inviso   ; address of secret move
    DW  028H
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

;*************************************************************************
;                                                *
;     Kano                                           *
;                                                *
;*************************************************************************
    ALIGN 4
PUBLIC _sm_kano_hpc
_sm_kano_hpc: 
    DW  p1b0 OR p1b4        ; player 1 requirements
    DW  p2b0 OR p2b4        ; player 2 requirements
    DD  x_ground
    DD  0       ; yes/no routine
    DD  _do_kano_swipe   ; address of secret move
    DW  018H
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0 OR p1b4        ; player 1 requirements
    DW  p2b0 OR p2b4        ; player 2 requirements
    DD  x_ground
    DD  0       ; yes/no routine
    DD  _do_kano_zap     ; address of secret move
    DW  018H
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_kano_lpo
_sm_kano_lpo: 
    DW  p1b1            ; player 1 requirements
    DW  p2b1            ; player 2 requirements
    DD  x_fatal
    DD  _q_skel_fatal        ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_kano_lkc
_sm_kano_lkc: 
    DW  p1b4
    DW  p2b4
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b2 OR p1b4
    DW  p2b2 OR p2b4
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_kano_hpo
_sm_kano_hpo: 
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_animal
    DD  _q_kano_animal   ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  028H
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0
    DW  0
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


;
; Sektor !!
;
    ALIGN 4
PUBLIC _sm_robo2_uc
_sm_robo2_uc: 
    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

    ALIGN 4
PUBLIC _sm_robo1_dc
_sm_robo1_dc: 
    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_friend
    DD  _q_dinger_friend     ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5
    DW  p2b5
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  020H
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0



    ALIGN 4
PUBLIC _sm_robo1_uc
_sm_robo1_uc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal      ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  028H            ; time to do entire switch combo
    DW  sw_up
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_up
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_robo_hkc
_sm_robo_hkc: 
    DW  p1b3
    DW  p2b3
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0



    ALIGN 4
PUBLIC _sm_robo_bc
_sm_robo_bc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_fatal
    DD  _q_robo_flame_fatal  ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_fatal
    DD  _q_robo_crush_fatal  ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  028H
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

;
; Cyrax
;
    ALIGN 4
PUBLIC _sm_robo2_hpc
_sm_robo2_hpc: 
    DW  p1b0 OR p1b2            ; player 1 requirements
    DW  p2b0 OR p2b2            ; player 2 requirements
    DD  x_fatal
    DD  _q_fatality_req      ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_up
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_down
    DW  sw_up
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0
    DW  p2b0
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_robo2_dc
_sm_robo2_dc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal      ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  028H            ; time to do entire switch combo
    DW  sw_down
    DW  sw_down
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_robo2_rc
_sm_robo2_rc: 
    DW  p1b5
    DW  p2b5
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  012H
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5 OR p1b2            ; player 1 requirements
    DW  p2b5 OR p2b2            ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  028H
    DW  sw_up
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_up
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

;********************************************

    ALIGN 4
PUBLIC _sm_lia_uc
_sm_lia_uc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0                   ; added field

    DW  p1b2
    DW  p2b2
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lia_hpc
_sm_lia_hpc: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_ground
    DD  _q_lia_scream        ; yes/no routine
    DD  _do_lia_scream       ; address of secret move
    DW  020H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_animal
    DD  _q_animal_req        ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  02aH            ; time to do entire switch combo
    DW  sw_up
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

;********************************************

    ALIGN 4
PUBLIC _sm_lia_bc
_sm_lia_bc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_fatal
    DD  _q_lia_hair_fatal    ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0                   ; added field

    DW  p1b2 OR p1b5            ; player 1 requirements
    DW  p2b2 OR p2b5            ; player 2 requirements
    DD  x_fatal
    DD  _q_scream_fatal      ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  030H
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lia_lpc
_sm_lia_lpc: 
    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_lia_forward      ; address of secret move
    DW  018H
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1
    DW  p2b1
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  020H
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


;
; Subzero
;
    ALIGN 4
PUBLIC _sm_sz_rc
_sm_sz_rc: 
    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_fatal
    DD  _q_half_screen_fatal ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  028H
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_block
    DW  0
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sz_uc
_sm_sz_uc: 
    DW  p1b2 OR p1b5            ; player 1 requirements
    DW  p2b2 OR p2b5            ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal      ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  028H
    DW  sw_up
    DW  sw_up
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_up
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sz_lpc
_sm_sz_lpc: 
    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_airborn
    DD  _q_sz_decoy      ; yes/no routine
    DD  _do_sz_decoy     ; address of secret move
    DW  014H            ; time to do entire switch combo
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_ground
    DD  _q_sz_forward_zap    ; yes/no routine
    DD  _do_sz_forward_zap   ; address of secret move
    DW  014H            ; time to do entire switch combo
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

;*************************

    ALIGN 4
PUBLIC _sm_sz_hkc
_sm_sz_hkc: 
    DW  p1b3
    DW  p2b3
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3
    DW  p2b3
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

;****************************************************************


    ALIGN 4
PUBLIC _sm_ind_lpc
_sm_ind_lpc: 
    DW  p1b1
    DW  p2b1
    DD  x_ground
    DD  0
    DD  _do_ind_zap
    DW  018H
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1
    DW  p2b1
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_right
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_ind_bc
_sm_ind_bc: 
    DW  p1b2
    DW  p2b2
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  018H
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  02aH
    DW  sw_right
    DW  sw_left
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  sw_left
    DW  sw_right
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_ind_dc
_sm_ind_dc: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal  ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_friend
    DD  _q_ind_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_hi_punch
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_hi_punch
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_ind_hpo
_sm_ind_hpo: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_fatal
    DD  _q_ind_axe_fatal     ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_ind_hpc
_sm_ind_hpc: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_axe_up       ; address of secret move
PUBLIC _scom_axe_up
_scom_axe_up: 
    DW  018H
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_ind_hkc
_sm_ind_hkc: 
    DW  p1b3                ; player 1 requirements
    DW  p2b3                ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_reflect      ; address of secret move
    DW  020H
    DW  sw_left
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_sonya_hpc
_sm_sonya_hpc: 
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_square_wave      ; address of secret move
    DW  018H
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_fatal
    DD  _q_pit_fatal     ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  022H
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0



    ALIGN 4
PUBLIC _sm_sonya_dc
_sm_sonya_dc: 
    DW  p1b2 OR p1b5        ; player 1 requirements
    DW  p2b2 OR p2b5        ; player 2 requirements
    DD  x_fatal
    DD  _q_bubble_fatal  ; yes/no routine
    DD  _do_fatality_2   ; address of secret move
    DW  030H
    DW  sw_down
    DW  sw_left
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  sw_down
    DW  sw_right
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_sonya_rc
_sm_sonya_rc: 
    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_friend
    DD  _q_sonya_friend      ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_down
    DW  sw_left
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  sw_down
    DW  sw_right
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_fatal
    DD  _q_fatality_req      ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sonya_lpo
_sm_sonya_lpo: 
    DW  p1b1            ; player 1 requirements
    DW  p2b1            ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal  ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0



    ALIGN 4
PUBLIC _sm_sonya_lkc
_sm_sonya_lkc: 
    DW  p1b4
    DW  p2b4
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_jax_lpc
_sm_jax_lpc: 
    DW  p1b1 OR p1b4
    DW  p2b1 OR p1b4
    DD  x_ground
    DD   0          ; yes/no routine
    DD  _do_noogy
    DW  018H
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1
    DW  p2b1
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_jax_lkc
_sm_jax_lkc: 
    DW  p1b4            ; player 1 requirements
    DW  p2b4        ; player 2 requirements
    DD  x_fatal
    DD  _q_grow_fatal    ; yes/no routine
    DD  _do_fatality_2   ; address of secret move
    DW  030H
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0                   ; added field

    DW  p1b4
    DW  p2b4
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  02aH
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_jax_bo
_sm_jax_bo: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal   ; yes/no routine
    DD  _do_fatality_1   ; address of secret move
    DW  028H
    DW  sw_up
    DW  sw_right
    DW  sw_down
    DW  sw_up
    DW  0
    DW  0
    DW  sw_up
    DW  sw_left
    DW  sw_down
    DW  sw_up
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_jax_lpo
_sm_jax_lpo: 
    DW  p1b1            ; player 1 requirements
    DW  p2b1            ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal  ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0
;
; Swat
;
    ALIGN 4
PUBLIC _sm_sw_bc
_sm_sw_bc: 
    DW  p1b2 OR p1b5            ; player 1 requirements
    DW  p2b2 OR p2b5            ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_animal
    DD  _q_swat_animal   ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  028H
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sw_lkc
_sm_sw_lkc: 
    DW  p1b4                ; player 1 requirements
    DW  p2b4                ; player 2 requirements
    DD  x_fatal
    DD  _q_taser_fatal       ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  01fH
    DW  sw_right
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4                ; player 1 requirements
    DW  p2b4                ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  030H
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_lo_punch
    DW  sw_run
    DW  0
    DW  0
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_lo_punch
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_swat_hkc
_sm_swat_hkc: 
    DW  p1b2 OR p1b3            ; player 1 requirements
    DW  p2b2 OR p2b3            ; player 2 requirements
    DD  x_ground
    DD  0               ; yes/no routine
    DD  _do_swat_zoom        ; address of secret move
    DW  01fH
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3 OR p1b2
    DW  p2b3 OR p2b2
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_up
    DW  sw_up
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_up
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_swat_lpc
_sm_swat_lpc: 
    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_ground
    DD  0               ; yes/no routine
    DD  _do_swat_bomb_lo     ; address of secret move
    DW  010H
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_ground
    DD  0               ; yes/no routine
    DD  _do_stick_sweep      ; address of secret move
    DW  010H
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_friend
    DD  _q_friend            ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  028H
    DW  sw_lo_punch
    DW  sw_run
    DW  sw_run
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  sw_lo_punch
    DW  sw_run
    DW  sw_run
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_swat_hpc
_sm_swat_hpc: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_ground
    DD  0               ; yes/no routine
    DD  _do_swat_bomb_hi         ; address of secret move
    DW  010H
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0
    DW  p2b0
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

;
; Sheeva
;
    ALIGN 4
PUBLIC _sm_sg_bc
_sm_sg_bc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal      ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  028H
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_sg_hko
_sm_sg_hko: 
    DW  p1b3                ; player 1 requirements
    DW  p2b3                ; player 2 requirements
    DD  x_fatal
    DD  _q_sherip_fatal      ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sg_lpc
_sm_sg_lpc: 
    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1
    DW  p2b1
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sg_hkc
_sm_sg_hkc: 
    DW  p1b3                ; player 1 requirements
    DW  p2b3                ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_sg_quake     ; address of secret move
    DW  01aH
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3
    DW  p2b3
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_sg_hpc
_sm_sg_hpc: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_ground
    DD  0               ; yes/no routine
    DD  _do_sg_zap           ; address of secret move
    DW  010H
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

    ALIGN 4
PUBLIC _sm_sg_uc
_sm_sg_uc: 
    DW  p1b0 OR p1b1 OR p1b2 OR p1b3 OR p1b4        ; player 1 requirements
    DW  p2b0 OR p2b1 OR p2b2 OR p2b3 OR p2b4        ; player 2 requirements
    DD  x_ground
    DD  _q_pounce_ok_now             ; yes/no routine
    DD  _do_sg_pounce                ; address of secret move
    DW  010H
    DW  sw_up
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

;
; Kung Lao
;
    ALIGN 4
PUBLIC _sm_lao_lkc
_sm_lao_lkc: 
    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  030H
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_lo_punch
    DW  sw_run
    DW  0
    DW  0
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_lo_punch
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4
    DW  p2b4
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_lao_bc
_sm_lao_bc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_animal
    DD  _q_close_animal      ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  028H
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

    ALIGN 4
PUBLIC _sm_lao_hpc
_sm_lao_hpc: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_fatal
    DD  _q_lao_hat_fatal     ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_down
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_down
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b0
    DW  p2b0
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lao_dc
_sm_lao_dc: 
    DW  p1b0                ; player 1 requirements
    DW  p2b0                ; player 2 requirements
    DD  x_fatal
    DD  _q_fatality_req      ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  02aH
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lao_rc
_sm_lao_rc: 
    DW  p1b5        ; player 1 requirements
    DW  p2b5        ; player 2 requirements
    DD  x_ground
    DD  0       ; yes/no routine
    DD  _do_lao_spin ; address of secret move
    DW  010H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

;
; Liu Kang
;
    ALIGN 4
PUBLIC _sm_lk_dc
_sm_lk_dc: 
    DW  p1b2 OR p1b5        ; player 1 requirements
    DW  p2b2 OR p2b5        ; player 2 requirements
    DD  x_friend
    DD  _q_lk_friend     ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  020H
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_lk_uc
_sm_lk_uc: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_animal
    DD  _q_lk_animal ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  030H
    DW  sw_up
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!



    ALIGN 4
PUBLIC _sm_lk_bc
_sm_lk_bc: 
    DW  p1b2 OR p1b5            ; player 1 requirements
    DW  p2b2 OR p2b5            ; player 2 requirements
    DD  x_fatal
    DD  _q_lk_mk_fatal       ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_up
    DW  sw_up
    DW  sw_down
    DW  sw_up
    DW  0
    DW  0
    DW  sw_up
    DW  sw_up
    DW  sw_down
    DW  sw_up
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lk_lkc
_sm_lk_lkc: 
    DW  p1b4                ; player 1 requirements
    DW  p2b4                ; player 2 requirements
    DD  x_fatal
    DD  _q_fatality_req      ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  030H
    DW  sw_down
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4
    DW  p2b4
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_lo_kick
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  sw_lo_kick
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lk_hkc
_sm_lk_hkc: 
    DW  p1b3 OR p1b4        ; player 1 requirements
    DW  p2b3 OR p2b4        ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_super_kang       ; address of secret move
    DW  01eH
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3
    DW  p2b3
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  020H
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lk_hpc
_sm_lk_hpc: 
    DW  p1b0 OR p1b4        ; player 1 requirements
    DW  p2b0 OR p2b4        ; player 2 requirements
    DD  x_airborn
    DD  0           ; yes/no routine
    DD  _lk_zap_hi       ; address of secret move
    DW  01aH
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lk_lko
_sm_lk_lko: 
    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_ground
    DD  _q_bike_req      ; yes/no routine
    DD  _lk_bike_kick        ; address of secret move
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_lk_lpc
_sm_lk_lpc: 
    DW  p1b1 OR p1b4        ; player 1 requirements
    DW  p2b1 OR p2b4        ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _lk_zap_lo       ; address of secret move
    DW  01aH
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


;
; Shang Tsung
;
    ALIGN 4
PUBLIC _sm_st_hpo
_sm_st_hpo: 
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_animal
    DD  _q_shang_animal  ; yes/no routine
    DD  _do_animality    ; address of secret move
    DW  022H
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

    ALIGN 4
PUBLIC _sm_st_lpo
_sm_st_lpo: 
    DW  p1b1                ; player 1 requirements
    DW  p2b1                ; player 2 requirements
    DD  x_fatal
    DD  _q_st_spike_fatal    ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  030H
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1 OR p1b2 OR p1b5        ; player 1 requirements
    DW  p2b1 OR p2b2 OR p2b5        ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  sw_block
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_st_dc
_sm_st_dc: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_lk    ; yes/no routine
    DD  _do_st_2_lk      ; address of secret move
    DW  018H
    DW  sw_down
    DW  sw_right
    DW  sw_up
    DW  sw_left
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_up
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  028H
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0

    ALIGN 4
PUBLIC _sm_st_lko
_sm_st_lko: 
    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_sg            ; yes/no routine
    DD  _do_st_2_sg      ; address of secret move
    DW  020H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_st_rc
_sm_st_rc: 
    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_lao           ; yes/no routine
    DD  _do_st_2_lao     ; address of secret move
    DW  020H
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  sw_run
    DW  sw_block
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_robo1         ; yes/no routine
    DD  _do_st_2_robo1       ; address of secret move
    DW  020H
    DW  sw_left
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0



    ALIGN 4
PUBLIC _sm_st_hkc
_sm_st_hkc: 
    DW  p1b3            ; player 1 requirements
    DW  p2b3            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_swat          ; yes/no routine
    DD  _do_st_2_swat        ; address of secret move
    DW  020H
    DW  sw_right
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3            ; player 1 requirements
    DW  p2b3            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_tusk          ; yes/no routine
    DD  _do_st_2_tusk        ; address of secret move
    DW  010H
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  0
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_st_uc
_sm_st_uc: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_ind           ; yes/no routine
    DD  _do_st_2_ind     ; address of secret move
    DW  020H
    DW  sw_up
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  sw_up
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_st_bc
_sm_st_bc: 
    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_robo2         ; yes/no routine
    DD  _do_st_2_robo2       ; address of secret move
    DW  013H
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0
    DW  0
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b2            ; player 1 requirements
    DW  p2b2            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_kano          ; yes/no routine
    DD  _do_st_2_kano        ; address of secret move
    DW  008H
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_st_lpc
_sm_st_lpc: 
    DW  p1b1            ; player 1 requirements
    DW  p2b1            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_jax           ; yes/no routine
    DD  _do_st_2_jax     ; address of secret move
    DW  01dH
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b1 OR p1b2
    DW  p2b1 OR p2b2
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_up
    DW  sw_up
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_st_hpc
_sm_st_hpc: 
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_sz            ; yes/no routine
    DD  _do_st_2_sz      ; address of secret move
    DW  018H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
;
; shang tsung zap 1
;
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_st_zap1      ; address of secret move
    DW  024H
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
;
; shang zap 2
;
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_st_zap2      ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
;
; shang zap 3
;
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_st_zap3      ; address of secret move
    DW  030H
    DW  sw_right
    DW  sw_right
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  sw_left
    DW  sw_left
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

;
; Kabal (Tusk)
;
    ALIGN 4
PUBLIC _sm_tusk_hpo
_sm_tusk_hpo: 
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_close_animal
    DD  _q_kabal_animal      ; yes/no routine
    DD  _do_animality        ; address of secret move
    DW  028H
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0                   ; added field

    DD  0


    ALIGN 4
PUBLIC _sm_st_lkc
_sm_st_lkc: 
    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_lia           ; yes/no routine
    DD  _do_st_2_lia     ; address of secret move
    DW  018H
    DW  sw_left
    DW  sw_down
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_down
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_ground
    DD  _q_shang_morph_smoke         ; yes/no routine
    DD  _do_st_2_smoke       ; address of secret move
    DW  018H
    DW  sw_down
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_down
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field


;
; summon
;
    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_summon       ; address of secret move
    DW  028H
    DW  sw_left
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4
    DW  p2b4
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_tusk_uc
_sm_tusk_uc: 
    DW  p1b5            ; player 1 requirements
    DW  p2b5            ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  038H
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  sw_run
    DW  0
    DW  0
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  sw_run
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_tusk_hkc
_sm_tusk_hkc: 
    DW  p1b3                ; player 1 requirements
    DW  p2b3                ; player 2 requirements
    DD  x_fatal
    DD  _q_close_fatal       ; yes/no routine
    DD  _do_fatality_2       ; address of secret move
    DW  030H
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_block
    DW  sw_block
    DW  sw_run
    DW  0
    DW  0                   ; added field

    DW  p1b3
    DW  p2b3
    DD  x_ground
    DD   _q_pit_fatal        ; yes/no routine
    DD  _do_pit_fatality     ; address of secret move
    DW  018H
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0
    DW  0
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_block
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

    ALIGN 4
PUBLIC _sm_tusk_lkc
_sm_tusk_lkc: 
    DW  p1b4            ; player 1 requirements
    DW  p2b4            ; player 2 requirements
    DD  x_ground
    DD  _q_blurred_req       ; yes/no routine
    DD  _do_tusk_blur        ; address of secret move
    DW  012H
    DW  sw_right
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b4
    DW  p2b4
    DD  x_baby
    DD  _q_babality  ; yes/no routine
    DD  _do_baby     ; address of secret move
    DW  028H
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  sw_lo_kick
    DW  sw_run
    DW  sw_run
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_tusk_bc
_sm_tusk_bc: 
    DW  p1b2                ; player 1 requirements
    DW  p2b2                ; player 2 requirements
    DD  x_fatal
    DD  _q_inflate_fatal     ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  030H
    DW  sw_right
    DW  sw_left
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  sw_left
    DW  sw_right
    DW  sw_down
    DW  sw_down
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_tusk_rc
_sm_tusk_rc: 
    DW  p1b5                ; player 1 requirements
    DW  p2b5                ; player 2 requirements
    DD  x_ground
    DD  _q_floor_blade       ; yes/no routine
    DD  _do_floor_blade      ; address of secret move
    DW  020H
    DW  sw_left
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

    ALIGN 4
PUBLIC _sm_tusk_zap
_sm_tusk_zap: 
    DW  p1b0            ; player 1 requirements
    DW  p2b0            ; player 2 requirements
    DD  x_airborn
    DD  0           ; yes/no routine
    DD  _do_tusk_zap     ; address of secret move
    DW  018H
    DW  sw_left
    DW  sw_left
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_right
    DW  sw_right
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_kano_hkc
_sm_kano_hkc: 
    DW  p1b3            ; player 1 requirements
    DW  p2b3            ; player 2 requirements
    DD  x_fatal
    DD  _q_half_screen_fatal ; yes/no routine
    DD  _do_fatality_1       ; address of secret move
    DW  028H
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_block
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  sw_hi_kick
    DW  sw_block
    DW  sw_block
    DW  sw_lo_punch
    DW  0
    DW  0
    DW  0                   ; added field

    DW  p1b3            ; player 1 requirements
    DW  p2b3            ; player 2 requirements
    DD  x_friend
    DD  _q_friend        ; yes/no routine
    DD  _do_friendship       ; address of secret move
    DW  028H
    DW  sw_hi_kick
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  sw_hi_kick
    DW  sw_run
    DW  sw_run
    DW  sw_lo_kick
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!


    ALIGN 4
PUBLIC _sm_kano_lpc
_sm_kano_lpc: 
    DW  p1b1 OR p1b4        ; player 1 requirements
    DW  p2b1 OR p2b4        ; player 2 requirements
    DD  x_ground
    DD  0           ; yes/no routine
    DD  _do_shake        ; address of secret move
    DW  018H
    DW  sw_right
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  sw_left
    DW  sw_down
    DW  0
    DW  0
    DW  0
    DW  0
    DW  0                   ; added field
    DW  0           ; NEEDED !!

;****************************************************************
; COMBO MOVE TABLES
;****************************************************************
;**************************************************************************
;*                                               *
;*  combo table format                                       *
;*                                               *
;*     dh   $aa         where aa = time allowed                 *
;*     dh   $bbcc       where bb = attack ani    cc = attack ani part  *
;*     dh   $ddee       where dd = attack speed  ee = button number    *
;*     dh   $ffgg       where ff = retract ani   gg = retract ani part *
;*     dh   $hhii       where hh = stk offset      ii = requirement      *
;*     dh   0          padding (not in arcade, make sure add to new entries)
;*     dw   $jjjjjjjj   where jj = success pointer                   *
;*                                               *
;**************************************************************************
    cb_hipunch  equ 000H
    cb_lopunch  equ 001H
    cb_block    equ 002H
    cb_hikick   equ 003H
    cb_lokick   equ 004H

    cb_jump_address equ 01111H


    stk_0       equ 00000H  ; hit in face
    stk_1       equ 00100H  ; stumble away
    stk_2       equ 00200H  ; knocked on back
    stk_3       equ 00300H  ; knocked high on back
    stk_4       equ 00400H  ; NAILED !
    stk_5       equ 00500H  ; uppercutted
    stk_klang   equ     00600H  ; hit but with a klang sound !!

    stk_1_stab  equ     00700H  ; stumble away
    stk_2_stab  equ     00800H  ; knocked on back
    stk_6       equ     00900H  ; knocked almost vertical on your back

    stk_h0      equ     01000H  ; hit in face
    stk_h1      equ     01100H  ; stumble away
    stk_h2      equ     01200H  ; knocked on back

    c_speed1        equ 00100H
    c_speed2        equ 00200H
    c_speed3        equ 00300H

    last_option equ 08000H
    b_last_option   equ 15

    req_none        equ 0   ; requirement  none
    req_stkaway equ 1   ; requirement  joystick away
    req_stktow  equ 3   ; requirement  joystick towards
    req_stkdown equ 4
    req_halfdamage equ 5

    retract_elbow   equ 01002H
    retract_knee    equ 01302H
    retract_lokick  equ 01202H

    atk_upcut   equ 00b01H

    atk_elbow1  equ 01001H
    atk_elbow2  equ 01003H
    atk_elbow3  equ 01004H
    atk_elbow4  equ 01005H
    atk_knee1   equ 01301H
    atk_knee2   equ 01303H
    atk_knee3   equ 01304H
    atk_knee4   equ 01305H
    atk_hikick  equ 01101H
    atk_lokick  equ 01201H
    atk_roundh  equ 01501H


;***********************
;***********************
    ALIGN 4
PUBLIC _ct_tusk_elbow2
_ct_tusk_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow2      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1_stab OR req_halfdamage    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_tusk_elbow3

PUBLIC _ct_tusk_elbow3
_ct_tusk_elbow3: 
    DW  9           ; time allowed
    DW  atk_hikick      ; attack
    DW  c_speed2 OR cb_hikick   ; speed,button
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_tusk_knee4

    DW  9           ; time allowed
    DW  atk_upcut       ; attack = uppercut
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_5 OR req_stkdown    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

    DW  9 OR last_option            ; time allowed
    DW  atk_elbow3          ; attack
    DW  c_speed3 OR cb_lopunch      ; speed,button = hi kick
    DW  retract_elbow           ; retract = elbow
    DW  stk_1_stab OR req_stkdown   ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_tusk_elbow4

PUBLIC _ct_tusk_elbow4
_ct_tusk_elbow4: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow4      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2_stab OR req_stkdown   ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  01aH

    ALIGN 4
PUBLIC _ct_tusk_knee2
_ct_tusk_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee2       ; attack
    DW  c_speed2 OR cb_lokick   ; speed,button
    DW  retract_knee        ; retract = knee
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_tusk_knee3

PUBLIC _ct_tusk_knee3
_ct_tusk_knee3: 
    DW  9           ; time allowed
    DW  atk_roundh      ; attack = knee #1
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  01304H          ; retract = knee 2
    DW  stk_h2 OR req_stkaway   ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

    DW  9           ; time allowed
    DW  atk_elbow1      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  01304H          ; retract = knee 2
    DW  stk_1_stab OR req_none  ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_tusk_elbow2

    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack
    DW  c_speed2 OR cb_hikick   ; speed,button
    DW  01304H          ; retract = knee 2
    DW  stk_h1 OR req_none      ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_tusk_knee4

PUBLIC _ct_tusk_knee4
_ct_tusk_knee4: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = knee #1
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  01102H          ; retract = hi kick
    DW  stk_h2 OR req_stkaway   ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;***********************

    ALIGN 4
PUBLIC _ct_sg_knee2
_ct_sg_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee2       ; attack
    DW  c_speed3 OR cb_hikick   ; speed,button
    DW  retract_knee        ; retract = knee
    DW  stk_h1 OR req_none      ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sg_knee3

PUBLIC _ct_sg_knee3
_ct_sg_knee3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee3       ; attack
    DW  c_speed2 OR cb_lokick   ; speed,button
    DW  retract_knee        ; retract = knee
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sg_knee4

PUBLIC _ct_sg_knee4
_ct_sg_knee4: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack
    DW  c_speed2 OR cb_hikick   ; speed,button
    DW  retract_knee        ; retract = knee
    DW  stk_h2 OR req_stkaway   ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  012H


    ALIGN 4
PUBLIC _ct_sg_elbow2
_ct_sg_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow2      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_h1 OR req_none      ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sg_elbow3

PUBLIC _ct_sg_elbow3
_ct_sg_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow3      ; attack
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_h1 OR req_none      ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sg_elbow4

PUBLIC _ct_sg_elbow4
_ct_sg_elbow4: 
    DW  9           ; time allowed
    DW  atk_knee1       ; attack
    DW  c_speed2 OR cb_hikick   ; speed,button
    DW  retract_elbow       ; retract = knee
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sg_knee2

    DW  9 OR last_option        ; time allowed
    DW  atk_elbow4      ; attack
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
;   dh  stk_2 OR req_stktow ; strike check / requirements
    DW  stk_6 OR req_stktow ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  01aH

;***********************

    ALIGN 4
PUBLIC _ct_sonya_knee2
_ct_sonya_knee2: 
    DW  6           ; time allowed
    DW  atk_hikick      ; attack
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sonya_roundh

    DW  9 OR last_option        ; time allowed
    DW  atk_elbow1
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sonya_elbow2

PUBLIC _ct_sonya_roundh
_ct_sonya_roundh: 
    DW  9           ; time allowed
    DW  atk_roundh
    DW  c_speed3 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

PUBLIC _ct_sonya_elbow1
_ct_sonya_elbow1: 
    DW  9 OR last_option        ; time allowed

;***********
    DW  01007H
;   dh  atk_elbow1      ; attack
;***********

    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sonya_elbow2

;***********************

    ALIGN 4
PUBLIC _ct_ind_knee2
_ct_ind_knee2: 
    DW  9           ; time allowed
    DW  atk_elbow1      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_ind_elbow2

    DW  6 OR last_option        ; time allowed
    DW  atk_hikick      ; attack
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_ind_roundh

PUBLIC _ct_ind_roundh
_ct_ind_roundh: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = knee #1
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;***********************

    ALIGN 4
PUBLIC _ct_swat_knee2
_ct_swat_knee2: 
    DW  9           ; time allowed
    DW  atk_elbow1      ; attack
    DW  c_speed1 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_swat_elbow2

PUBLIC _ct_swat_hikick
_ct_swat_hikick: 
    DW  6 OR last_option        ; time allowed
    DW  atk_hikick      ; attack
    DW  c_speed2 OR cb_lokick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_swat_baton

PUBLIC _ct_swat_baton
_ct_swat_baton: 
    DW  9           ; time allowed
    DW  atk_elbow3      ; attack = knee #1
    DW  c_speed1 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_swat_roundh

PUBLIC _ct_swat_roundh
_ct_swat_roundh: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = knee #1
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;***********************

    ALIGN 4
PUBLIC _ct_swat_elbow2
_ct_swat_elbow2: 
    DW  6 OR last_option        ; time allowed
    DW  atk_elbow2      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_swat_elbow3

PUBLIC _ct_swat_elbow3
_ct_swat_elbow3: 
    DW  4 OR last_option        ; time allowed
    DW  atk_elbow3      ; attack
    DW  c_speed1 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_5 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  008H

;***********************

    ALIGN 4
PUBLIC _ct_lk_elbow2
_ct_lk_elbow2: 
    DW  9           ; time allowed
    DW  atk_elbow2      ; attack
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lk_elbow3

PUBLIC _ct_lk_knee1
_ct_lk_knee1: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee1       ; attack
    DW  c_speed3 OR cb_lokick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lk_knee2

PUBLIC _ct_lk_elbow3
_ct_lk_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow3      ; attack
    DW  c_speed3 OR cb_block    ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lk_knee1

    ALIGN 4
PUBLIC _ct_lk_knee2
_ct_lk_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee2       ; attack
    DW  c_speed3 OR cb_lokick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_h1 OR req_none      ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lk_knee3

PUBLIC _ct_lk_knee3
_ct_lk_knee3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee3       ; attack
    DW  c_speed3 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lk_knee4

PUBLIC _ct_lk_knee4
_ct_lk_knee4: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee4       ; attack
    DW  c_speed3 OR cb_lokick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_4 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  014H

;***********************

    ALIGN 4
PUBLIC _ct_st_knee2
_ct_st_knee2: 
    DW  9           ; time allowed
    DW  atk_elbow1      ; attack = elbow 3rd hit
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_st_elbow2

    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = elbow 3rd hit
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_st_roundh

    ALIGN 4
PUBLIC _ct_st_elbow2
_ct_st_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow2      ; attack = elbow 3rd hit
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_st_elbow3

PUBLIC _ct_st_elbow3
_ct_st_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow3      ; attack = elbow 3rd hit
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_st_roundh

PUBLIC _ct_st_roundh
_ct_st_roundh: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = knee #1
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;***********************

    ALIGN 4
PUBLIC _ct_kano_elbow2
_ct_kano_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01001H          ; attack = elbow #1 AGAIN
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_kano_post_elbow2

    ALIGN 4
PUBLIC _ct_kano_knee2
_ct_kano_knee2: 
PUBLIC _ct_kano_post_elbow2
_ct_kano_post_elbow2: 
    DW  9           ; time allowed
    DW  atk_knee1       ; attack = knee #1
    DW  c_speed3 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_kano_hikick

    DW  9               ; time allowed
    DW  atk_elbow2          ; attack = elbow #2 (head butt)
    DW  c_speed3 OR cb_lopunch      ; speed,button = hi kick
    DW  retract_elbow           ; retract = elbow
    DW  stk_klang OR req_stkdown    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_kano_diff_upcut

    DW  9 OR last_option        ; time allowed
    DW  atk_upcut       ; attack = uppercut
    DW  c_speed2 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_5 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

PUBLIC _ct_kano_diff_upcut
_ct_kano_diff_upcut: 
    DW  9 OR last_option        ; time allowed
    DW  atk_upcut       ; attack = uppercut
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  01004H          ; retract = head butt
    DW  stk_5 OR req_stkdown    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

PUBLIC _ct_kano_hikick
_ct_kano_hikick: 
    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = knee #1
    DW  c_speed2 OR cb_lokick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_kano_roundh

PUBLIC _ct_kano_roundh
_ct_kano_roundh: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = knee #1
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;************************

    ALIGN 4
PUBLIC _ct_jax_knee2
_ct_jax_knee2: 
    DW  10 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = elbow #2
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_jax_roundh

PUBLIC _ct_jax_roundh
_ct_jax_roundh: 
    DW  9           ; time allowed
    DW  atk_roundh      ; attack = roundhouse
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

PUBLIC _ct_jax_elbow1
_ct_jax_elbow1: 
    DW  10 OR last_option        ; time allowed
    DW  atk_elbow1      ; attack
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_1 OR req_stkdown    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_jax_elbow2


    ALIGN 4
PUBLIC _ct_jax_elbow2
_ct_jax_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01003H          ; attack = elbow #2
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_jax_elbow3

PUBLIC _ct_jax_elbow3
_ct_jax_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  01004H          ; attack = elbow #3
    DW  c_speed2 OR cb_block    ; speed,button = hi kick
    DW  00e05H          ; retract = unhipunch 2
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_jax_elbow4

PUBLIC _ct_jax_elbow4
_ct_jax_elbow4: 
    DW  9 OR last_option        ; time allowed
    DW  01005H          ; attack = elbow #4
    DW  c_speed2 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_3 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_jax_elbow5

PUBLIC _ct_jax_elbow5
_ct_jax_elbow5: 
    DW  9 OR last_option        ; time allowed
    DW  01006H          ; attack = elbow #5
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  00e04H          ; retract = elbow
    DW  stk_4 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00fH

;********************************************************************

    ALIGN 4
PUBLIC _ct_sonya_elbow2
_ct_sonya_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01003H          ; attack = elbow #2
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sonya_elbow3

PUBLIC _ct_sonya_elbow3
_ct_sonya_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  01004H          ; attack = elbow #3
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sonya_elbow4

PUBLIC _ct_sonya_elbow4
_ct_sonya_elbow4: 
    DW  9 OR last_option        ; time allowed
    DW  01005H          ; attack = elbow #3
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00fH

;**************************************

    ALIGN 4
PUBLIC _ct_lia_elbow2
_ct_lia_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01003H          ; attack = elbow #2
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1_stab OR req_none  ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lia_elbow3_up

PUBLIC _ct_lia_elbow3_up
_ct_lia_elbow3_up: 
    DW  9           ; time allowed
    DW  01004H          ; attack = elbow #3
    DW  c_speed2 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1_stab OR req_none  ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lia_hikick

    DW  9 OR last_option        ; time allowed
    DW  atk_upcut       ; attack = uppercut
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_5 OR req_stkdown    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

PUBLIC _ct_lia_hikick
_ct_lia_hikick: 
    DW  9 OR last_option        ; time allowed
    DW  01101H          ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  008H

PUBLIC _ct_lia_knee
_ct_lia_knee: 
    DW  9           ; time allowed
    DW  01001H          ; attack = elbow #1
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee
    DW  stk_1_stab OR req_none  ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lia_elbow2

    DW  9 OR last_option        ; time allowed
    DW  01101H          ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lia_roundh

PUBLIC _ct_lia_roundh
_ct_lia_roundh: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = roundhouse
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;**********************************

    ALIGN 4
PUBLIC _ct_sektor_elbow2
_ct_sektor_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow2      ; attack = elbow #2
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sektor_knee1

PUBLIC _ct_sektor_knee1
_ct_sektor_knee1: 
    DW  9           ; time allowed
    DW  atk_knee1       ; attack = elbow #2
    DW  c_speed3 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sektor_roundh1

    DW  9 OR last_option        ; time allowed
    DW  atk_upcut       ; attack = uppercut
    DW  c_speed2 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_5 OR req_stkdown    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

PUBLIC _ct_sektor_roundh1
_ct_sektor_roundh1: 
    DW  9           ; time allowed
    DW  atk_knee2       ; attack = elbow #2 (backwards roundh)
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

PUBLIC _ct_wimpy_hikick
_ct_wimpy_hikick: 
    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sektor_roundh2

PUBLIC _ct_sektor_roundh2
_ct_sektor_roundh2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee2       ; attack = elbow #2 (backwards roundh)
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;**************************************************

    ALIGN 4
PUBLIC _ct_cyrax_elbow2
_ct_cyrax_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow2      ; attack = elbow #2
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_cyrax_eknee1

PUBLIC _ct_cyrax_eknee1
_ct_cyrax_eknee1: 
    DW  9           ; time allowed
    DW  01004H          ; attack = elbow #3
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

    DW  9 OR last_option        ; time allowed
    DW  atk_knee1       ; attack = elbow #2
    DW  c_speed3 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_cyrax_elbow3

PUBLIC _ct_cyrax_elbow3
_ct_cyrax_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_elbow1      ; attack = elbow #2
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_cyrax_eknee2

    ALIGN 4
PUBLIC _ct_cyrax_eknee2
_ct_cyrax_eknee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee1       ; attack = elbow #2
    DW  c_speed3 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_cyrax_hikick

PUBLIC _ct_cyrax_hikick
_ct_cyrax_hikick: 
    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

    ALIGN 4
PUBLIC _ct_cyrax_knee2
_ct_cyrax_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW      retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_cyrax_roundh2

PUBLIC _ct_cyrax_roundh2
_ct_cyrax_roundh2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = elbow #2 (backwards roundh)
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  010H

;**************************************************

    ALIGN 4
PUBLIC _ct_sektor_knee2
_ct_sektor_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

;***************************************************

    ALIGN 4
PUBLIC _ct_smoke_elbow2
_ct_smoke_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01003H          ; attack = elbow #2
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_smoke_elbow3

PUBLIC _ct_smoke_elbow3
_ct_smoke_elbow3: 
    DW  9           ; time allowed
    DW  01301H          ; attack = knee #1
    DW  c_speed3 OR cb_lokick   ; speed,button
    DW  retract_elbow       ; retract = knee
    DW  stk_0 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_smoke_knee2

    DW  9           ; time allowed
    DW  01101H          ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

    DW  9 OR last_option        ; time allowed
    DW  01004H          ; attack = elbow #3
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

    ALIGN 4
PUBLIC _ct_smoke_knee2
_ct_smoke_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_hikick      ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_smoke_turnaround

PUBLIC _ct_smoke_turnaround
_ct_smoke_turnaround: 
    DW  9 OR last_option        ; time allowed
    DW  01004H          ; attack = elbow #3
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

;***************************************************

    ALIGN 4
PUBLIC _ct_sz_elbow2
_ct_sz_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01003H          ; attack = elbow 2nd hit
    DW  c_speed2 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00000H          ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sz_elbow3

PUBLIC _ct_sz_elbow3
_ct_sz_elbow3: 
    DW  9           ; time allowed
    DW  atk_elbow3      ; attack = elbow 2nd hit
    DW  c_speed2 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00000H          ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sz_knee1

PUBLIC _ct_sz_knee1
_ct_sz_knee1: 
    DW  9           ; time allowed
    DW  01305H          ; move closer !!!

    DW  c_speed3 OR cb_lokick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00100H OR req_halfdamage            ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sz_knee2

    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = elbow 2nd hit
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00100H OR req_stkaway   ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

    ALIGN 4
PUBLIC _ct_sz_knee2
_ct_sz_knee2: 
    DW  12 OR last_option       ; time allowed
    DW  01303H          ; attack = 2nd knee
    DW  c_speed3 OR cb_hikick   ; speed,button
    DW  retract_knee        ; retract = knee
    DW  00100H          ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_sz_roundh

PUBLIC _ct_sz_roundh
_ct_sz_roundh: 
    DW  9 OR last_option        ; time allowed
    DW  atk_roundh      ; attack = elbow 2nd hit
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  retract_knee        ; retract = elbow
    DW  stk_4 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH

;**********************************

    ALIGN 4
PUBLIC _ct_ind_elbow2
_ct_ind_elbow2: 
    DW  9 OR last_option        ; time allowed
    DW  01003H          ; attack = chop
    DW  c_speed3 OR cb_hipunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00000H          ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_ind_elbow3

PUBLIC _ct_ind_elbow3
_ct_ind_elbow3: 
    DW  9 OR last_option        ; time allowed
    DW  01004H          ; attack = chop
    DW  c_speed2 OR cb_lopunch  ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00000H          ; strike check
    DW  0                   ; padding to align structure
    DD  _ct_ind_hikick

PUBLIC _ct_ind_hikick
_ct_ind_hikick: 
    DW  9           ; time allowed
    DW  cb_jump_address
    DW  cb_hipunch      ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  00002H          ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _do_fast_axe_up

    DW  9 OR last_option        ; time allowed
    DW  01101H          ; attack = hi kick
    DW  c_speed1 OR cb_hikick   ; speed,button = hi kick
    DW  retract_elbow       ; retract = elbow
    DW  stk_2 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  020H

;*************************************************************************
;                                                *
;  Kung Lao Combos                                       *
;                                                *
;*************************************************************************
    ALIGN 4
PUBLIC _ct_lao_elbow2
_ct_lao_elbow2: 
    DW  9           ; time
    DW  atk_hikick      ; attack = hi kick
    DW  c_speed1 OR cb_lokick   ; speed,button = hi kick
    DW  01002H          ; retract = elbow
    DW  00000H          ; strike check
    DW  0                   ; padding to align structure
    DD  _ct_lao_roundh

    DW  9 OR last_option        ; time allowed
    DW  atk_elbow2      ; ani ---$ [offset,part #]
    DW  c_speed3 OR cb_lopunch  ; speed,button = hi kick
    DW  01002H          ; retract [ani,part #]
    DW  00000H          ; strike check
    DW  0                   ; padding to align structure
    DD  _ct_lao_elbow3       ; success pointer

PUBLIC _ct_lao_elbow3
_ct_lao_elbow3: 
    DW  9 OR last_option        ; 9 ticks
    DW  01004H              ; ani ---$ [offset,part #]
    DW  00300H              ; ani ---$ [ speed,button #]
    DW  01002H          ; retract [ani,part #]
    DW  00000H          ; strike check
    DW  0                   ; padding to align structure
    DD  _ct_lao_elbow4       ; success pointer

PUBLIC _ct_lao_elbow4
_ct_lao_elbow4: 
    DW  9 OR last_option        ; 9 ticks
    DW  01005H              ; ani ---$ [offset,part #]
    DW  00301H              ; ani ---$ [ speed,button #]
    DW  01002H          ; retract [ani,part #]
    DW  00000H          ; strike check
    DW  0                   ; padding to align structure
    DD  _ct_lao_e2k      ; success = "elbow to knee"

;***********

PUBLIC _ct_lao_e2k
_ct_lao_e2k: 
    DW  9 OR last_option        ; time
    DW  atk_knee1       ; attack = roundhouse
    DW  c_speed2 OR cb_lokick   ; speed,button = hi kick
    DW  retract_elbow
    DW  stk_1 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  _ct_lao_knee2        ; success

PUBLIC _ct_lao_roundh
_ct_lao_roundh: 
    DW  9 OR last_option        ; time
    DW  atk_roundh      ; attack = roundhouse
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  01102H          ; retract = hi kick
    DW  stk_2 OR req_stkaway    ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH            ; success

    ALIGN 4
PUBLIC _ct_lao_knee2
_ct_lao_knee2: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee2       ; attack = knee #2
    DW  c_speed3 OR cb_lokick   ; speed,button = hi kick
    DW  retract_knee        ; retract = knee
    DW  00000H          ; strike check
    DW  0                   ; padding to align structure
    DD  _ct_lao_knee3        ; success pointer

PUBLIC _ct_lao_knee3
_ct_lao_knee3: 
    DW  9 OR last_option        ; time allowed
    DW  atk_knee3       ; attack = knee #3
    DW  c_speed2 OR cb_hikick   ; speed,button = hi kick
    DW  01102H          ; retract = hi kick
    DW  stk_4 OR req_none       ; strike check / requirements
    DW  0                   ; padding to align structure
    DD  00eH            ; final sleep time













    END_DATA
    end
