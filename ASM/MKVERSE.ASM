;******************************************************************************
 include win95.i  ;: mkverse.s
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Mortal Kombat Versus Module
;******************************************************************************/

     

    include win95.i
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN _no_scroll : DWORD
    EXTERN _dlists_bogus : DWORD

;*********************************
;**         PALETTES                                **
;*********************************

    BEGIN_DATA

    ;CNOP 0,4
    include palsrc\mkvspal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ;CNOP 0,4
    PUBLIC _vs_anims
_vs_anims:
;*************************************************************************
    ;CNOP 0,4
    PUBLIC _a_mklight
_a_mklight:
    DD _MKLIGHT1-_vs_anims
    DD MKLIGHT2-_vs_anims
    DD MKLIGHT3-_vs_anims
    DD MKLIGHT4-_vs_anims
    DD MKLIGHT5-_vs_anims
    DD MKLIGHT6-_vs_anims
    DD MKLIGHT7-_vs_anims
    DD MKLIGHT8-_vs_anims
    DD MKLIGHT9-_vs_anims
    DD _MKLIGHT10-_vs_anims
    DD _MKLIGHT11-_vs_anims
    DD _MKLIGHT12-_vs_anims
    DD _MKLIGHT13-_vs_anims
    DD _MKLIGHT14-_vs_anims
    DD _MKLIGHT15-_vs_anims
    DD _MKLIGHT16-_vs_anims
    DD _MKLIGHT17-_vs_anims
    DD _MKLIGHT18-_vs_anims
    DD _MKLIGHT19-_vs_anims
    DD MKLIGHT20-_vs_anims
    DD ani_jump
    DD _a_mklight-_vs_anims

    PUBLIC _MKLIGHT1
_MKLIGHT1:
    DD MKLIGHT1_IMG-_vs_anims
    DW 65, 54, 0, 0
    DD   _mKlIGHT_p
MKLIGHT2:
    DD MKLIGHT2_IMG-_vs_anims
    DW 65, 53, 0, 0
MKLIGHT3:
    DD MKLIGHT3_IMG-_vs_anims
    DW 65, 54, 0, 0
MKLIGHT4:
    DD MKLIGHT4_IMG-_vs_anims
    DW 65, 54, 0, 0
MKLIGHT5:
    DD MKLIGHT5_IMG-_vs_anims
    DW 65, 54, 0, 0
MKLIGHT6:
    DD MKLIGHT6_IMG-_vs_anims
    DW 65, 53, 0, 0
MKLIGHT7:
    DD MKLIGHT7_IMG-_vs_anims
    DW 65, 53, 0, 0
MKLIGHT8:
    DD MKLIGHT8_IMG-_vs_anims
    DW 65, 53, 0, 0
MKLIGHT9:
    DD MKLIGHT9_IMG-_vs_anims
    DW 65, 54, 0, 0
_MKLIGHT10:
    DD MKLIGHT10_IMG-_vs_anims
    DW 65, 53, 0, 0
_MKLIGHT11:
    DD MKLIGHT11_IMG-_vs_anims
    DW 65, 54, 0, 0
_MKLIGHT12:
    DD MKLIGHT12_IMG-_vs_anims
    DW 65, 53, 0, 0
_MKLIGHT13:
    DD MKLIGHT13_IMG-_vs_anims
    DW 65, 53, 0, 0
_MKLIGHT14:
    DD MKLIGHT14_IMG-_vs_anims
    DW 65, 53, 0, 0
_MKLIGHT15:
    DD MKLIGHT15_IMG-_vs_anims
    DW 65, 53, 0, 0
_MKLIGHT16:
    DD MKLIGHT16_IMG-_vs_anims
    DW 65, 54, 0, 0
_MKLIGHT17:
    DD MKLIGHT17_IMG-_vs_anims
    DW 65, 53, 0, 0
_MKLIGHT18:
    DD MKLIGHT18_IMG-_vs_anims
    DW 65, 54, 0, 0
_MKLIGHT19:
    DD MKLIGHT19_IMG-_vs_anims
    DW 65, 53, 0, 0
MKLIGHT20:
    DD MKLIGHT20_IMG-_vs_anims
    DW 65, 54, 0, 0


;*************************************************************************
    ;CNOP 0,4
    PUBLIC _symbol_table
_symbol_table:
    DD _I_DRAGON-_vs_anims
    DD I_MK-_vs_anims
    DD I_YINYANG-_vs_anims
    DD I_THREE-_vs_anims
    DD I_QUESTION-_vs_anims
    DD I_LIGHTNING-_vs_anims
    DD I_GORO-_vs_anims
    DD I_RAIDEN-_vs_anims
    DD I_SHOKAHN-_vs_anims
    DD I_SKULL-_vs_anims

    PUBLIC _I_DRAGON
_I_DRAGON:
    DD I_DRAGON_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IDRAG_P
I_MK:
    DD I_MK_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IMK_P
I_YINYANG:
    DD I_YINYANG_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IYIN_P
I_THREE:
    DD I_THREE_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _ITHREE_P
I_QUESTION:
    DD I_QUESTION_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IQ_P
I_LIGHTNING:
    DD I_LIGHTNING_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _ILIGHT_P
I_GORO:
    DD I_GORO_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IGORO_P
I_RAIDEN:
    DD I_RAIDEN_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IRAID_P
I_SHOKAHN:
    DD I_SHOKAHN_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _IKAHN_P
I_SKULL:
    DD I_SKULL_IMG-_vs_anims
    DW 17, 14, 0, 0
    DD   _ISKULL_P

    PUBLIC _BOX2
_BOX2:
    DD BOX2_IMG-_vs_anims
    DW 118, 18, 0, 0
    DD _BOX1_P

;*************************************************************************
    ;CNOP 0,4
    PUBLIC _a_vs_v
_a_vs_v:
    DD _BURNV1-_vs_anims
    DD BURNV2-_vs_anims
    DD BURNV3-_vs_anims
    DD BURNV4-_vs_anims
    DD BURNV5-_vs_anims
    DD BURNV6-_vs_anims
    DD BURNV7-_vs_anims
    DD BURNV8-_vs_anims
    DD BURNV9-_vs_anims
    DD _BURNV10-_vs_anims
    DD _BURNV11-_vs_anims
    DD _BURNV12-_vs_anims
    DD _BURNV13-_vs_anims
    DD 0

    PUBLIC _BURNS1
_BURNS1:
    DD BURNS1_IMG-_vs_anims
    DW 10, 14, -21, -1
    DD   _BURNVS_P
BURNS2:
    DD BURNS2_IMG-_vs_anims
    DW 10, 16, -21, 1
BURNS3:
    DD BURNS3_IMG-_vs_anims
    DW 15, 14, -16, -3
BURNS4:
    DD BURNS4_IMG-_vs_anims
    DW 17, 16, -14, -3
BURNS5:
    DD BURNS5_IMG-_vs_anims
    DW 20, 20, -11, -3
BURNS6:
    DD BURNS6_IMG-_vs_anims
    DW 26, 26, -5, -3
BURNS7:
    DD BURNS7_IMG-_vs_anims
    DW 22, 26, -9, -3
BURNS8:
    DD BURNS8_IMG-_vs_anims
    DW 22, 26, -9, -3
BURNS9:
    DD BURNS9_IMG-_vs_anims
    DW 22, 31, -9, -3
_BURNS10:
    DD BURNS10_IMG-_vs_anims
    DW 22, 34, -9, -3
_BURNS11:
    DD BURNS11_IMG-_vs_anims
    DW 22, 38, -9, -3
_BURNS12:
    DD BURNS12_IMG-_vs_anims
    DW 22, 43, -9, -3
_BURNS13:
    DD BURNS13_IMG-_vs_anims
    DW 25, 46, -6, -3
_BURNS14:
    DD BURNS14_IMG-_vs_anims
    DW 28, 48, -3, -3
_BURNS15:
    DD BURNS15_IMG-_vs_anims
    DW 31, 49, 0, -3


;*************************************************************************
    ;CNOP 0,4
    PUBLIC _a_vs_s
_a_vs_s:
    DD _BURNS1-_vs_anims
    DD BURNS2-_vs_anims
    DD BURNS3-_vs_anims
    DD BURNS4-_vs_anims
    DD BURNS5-_vs_anims
    DD BURNS6-_vs_anims
    DD BURNS7-_vs_anims
    DD BURNS8-_vs_anims
    DD BURNS9-_vs_anims
    DD _BURNS10-_vs_anims
    DD _BURNS11-_vs_anims
    DD _BURNS12-_vs_anims
    DD _BURNS13-_vs_anims
    DD _BURNS14-_vs_anims
    DD _BURNS15-_vs_anims
    DD 0

    PUBLIC _BURNV1
_BURNV1:
    DD BURNV1_IMG-_vs_anims
    DW 14, 18, -1, -8
    DD _BURNVS_P
BURNV2:
    DD BURNV2_IMG-_vs_anims
    DW 14, 20, 0, -10
BURNV3:
    DD BURNV3_IMG-_vs_anims
    DW 12, 25, 0, -10
BURNV4:
    DD BURNV4_IMG-_vs_anims
    DW 11, 31, -1, -10
BURNV5:
    DD BURNV5_IMG-_vs_anims
    DW 12, 41, -1, -10
BURNV6:
    DD BURNV6_IMG-_vs_anims
    DW 14, 39, -3, -10
BURNV7:
    DD BURNV7_IMG-_vs_anims
    DW 18, 38, -3, -10
BURNV8:
    DD BURNV8_IMG-_vs_anims
    DW 19, 38, -3, -10
BURNV9:
    DD BURNV9_IMG-_vs_anims
    DW 22, 38, -3, -10
_BURNV10:
    DD BURNV10_IMG-_vs_anims
    DW 27, 43, -3, -5
_BURNV11:
    DD BURNV11_IMG-_vs_anims
    DW 29, 44, -3, -4
_BURNV12:
    DD BURNV12_IMG-_vs_anims
    DW 30, 48, -3, 0
_BURNV13:
    DD BURNV13_IMG-_vs_anims
    DW 31, 49, -3, 1
;*************************************************************************
    ;CNOP 0,4
    PUBLIC _battle_digits
_battle_digits:
    DD _BATTLE0
    DD _BATTLE1
    DD _BATTLE2
    DD _BATTLE3
    DD _BATTLE4
    DD _BATTLE5
    DD _BATTLE6
    DD _BATTLE7
    DD _BATTLE8
    DD _BATTLE9


    PUBLIC _BATTLE
_BATTLE:
    DD BATTLE_IMG-_vs_anims
    DW 140, 16, 0, 0
    DD   _BATTLE_P

    PUBLIC _BATTLE0
_BATTLE0:
    DD BATTLE0_IMG-_vs_anims
    DW 28, 15, 14, -5
    DD   _BATTLE_P
_BATTLE1:
    DD BATTLE1_IMG-_vs_anims
    DW 19, 15, 11, -5
_BATTLE2:
    DD BATTLE2_IMG-_vs_anims
    DW 27, 15, 14, -5
_BATTLE3:
    DD BATTLE3_IMG-_vs_anims
    DW 26, 16, 14, -5
_BATTLE4:
    DD BATTLE4_IMG-_vs_anims
    DW 30, 15, 14, -5
_BATTLE5:
    DD BATTLE5_IMG-_vs_anims
    DW 26, 15, 13, -5
_BATTLE6:
    DD BATTLE6_IMG-_vs_anims
    DW 28, 15, 14, -5
_BATTLE7:
    DD BATTLE7_IMG-_vs_anims
    DW 25, 15, 11, -5
_BATTLE8:
    DD BATTLE8_IMG-_vs_anims
    DW 26, 15, 14, -5
_BATTLE9:
    DD BATTLE9_IMG-_vs_anims
    DW 29, 15, 14, -5


;*********************************
;**      MODULE DATA            **
;*********************************
    ;CNOP 0,4
    include attract\vs\steelvs.mod

    ;CNOP 0,4
    PUBLIC _vs_module
_vs_module:
    DW 0                ; autoerase color
    DW 000h             ; initial world y
    DW 000h                 ; ground y
    DW 000h             ; initial worldx
    DW -0500h               ; scroll left limit
    DW 0500h                ; scroll right limit

    DD _calla_return
    DD _no_scroll           ; scroll table
    DD _dlists_bogus
    DD _bakmods

    DD STEELMODBMOD
    DW 0fffeh,007h
    DD 0ffffffffh
    DD 0                ; no floor here !!


    ;CNOP 0,4
    include attract\vs\mkbgvs.psi
;**********************************************************************

    END_DATA
    end
