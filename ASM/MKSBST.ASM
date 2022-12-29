;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Subway Street Module
;******************************************************************************/

 	include win95.i  ;: mksbst.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
; SUBWAY REFERENCES
    EXTERN  _calla_subway : DWORD

; STREET REFERENCES
    EXTERN  _calla_street : DWORD

;*********************************
;**         PALETTES
;*********************************
    EXTERN _MKSUBRAW_CLT    : DWORD
    EXTERN _RAIL_P          : DWORD
    EXTERN _P_RAILGLM       : DWORD
    EXTERN _P_DLITE         : DWORD
    EXTERN _P_DARK11        : DWORD
    EXTERN _P_DARK3         : DWORD
    EXTERN _P_DARK6         : DWORD
    EXTERN _P_DARK8         : DWORD
    EXTERN _TRAIN_P         : DWORD
    EXTERN _P_LITE11        : DWORD
    EXTERN _P_LITE8         : DWORD
    EXTERN _SMALL_p         : DWORD
    EXTERN _MEDIUM_p        : DWORD
    EXTERN _STBREAK_P       : DWORD
    EXTERN _subflor_PAL     : DWORD
    EXTERN _mkstreet_CLT    : DWORD
    EXTERN _street_PAL      : DWORD
    EXTERN _NUSTORM_P       : DWORD
    EXTERN _PAPER_P         : DWORD

;*********************************
;**         ANIMATIONS          **
;*********************************
;*****************
;*  module: subway
;*****************

	BEGIN_DATA

    ALIGN 4
    PUBLIC _bkgd_subway_anims
    PUBLIC _street_anims
_street_anims:
_bkgd_subway_anims:

    PUBLIC _BKRAIL
_BKRAIL:
    DD _BKRAIL_TPG - _bkgd_subway_anims
    DW 161, 8, 0, 0
    DD   _RAIL_P
_BKRAIL_TPG:
    DW 0,     1,   192,   0

    PUBLIC _FRTRAIL
_FRTRAIL:
    DD _FRTRAIL_TPG - _bkgd_subway_anims
    DW 161, 9, 0, 0
    DD   _RAIL_P
_FRTRAIL_TPG:
    DW 0,     1,   183,   0

    PUBLIC _RAILGLEAM
_RAILGLEAM:
    DD _RAILGLEAM_TPG - _bkgd_subway_anims
    DW 103, 1, 0, 0
    DD   _P_RAILGLM
_RAILGLEAM_TPG:
    DW 0,     1,   251,   0

    PUBLIC _DARK10
_DARK10:
    DD _DARK10_TPG - _bkgd_subway_anims
    DW 58, 5, 31, 20
_DARK10_TPG:
    DW 0,   181,   168,    0

    PUBLIC _DARK11
_DARK11:
    DD _DARK11_TPG - _bkgd_subway_anims
    DW 25, 31, 29,  - 25
_DARK11_TPG:
    DW 1,    93,   214,    0

    PUBLIC _DARK1
_DARK1:
    DD _DARK1_TPG - _bkgd_subway_anims
    DW 88, 10, 94, 31
_DARK1_TPG:
    DW 2,     1,   201,    0

    PUBLIC _DARK2
_DARK2:
    DD _DARK2_TPG - _bkgd_subway_anims
    DW 90, 10, 6, 31
_DARK2_TPG:
    DW 1,   153,    77,    0

    PUBLIC _DARK3
_DARK3:
    DD _DARK3_TPG - _bkgd_subway_anims
    DW 6, 92, 83, 27
_DARK3_TPG:
    DW 1,   245,   101,     0

    PUBLIC _DARK4
_DARK4:
    DD _DARK4_TPG - _bkgd_subway_anims
    DW 6, 90, 83, 27
_DARK4_TPG:
    DW 3,    77,   128,     0

    PUBLIC _DARK6
_DARK6:
    DD _DARK6_TPG - _bkgd_subway_anims
    DW 87, 11, 94,  - 56
_DARK6_TPG:
    DW 2,     1,   222,    0

    PUBLIC _DARK7
_DARK7:
    DD _DARK7_TPG - _bkgd_subway_anims
    DW 90, 11, 7,  - 56
_DARK7_TPG:
    DW 1,   153,    98,    0

    PUBLIC _DARK8
_DARK8:
    DD _DARK8_TPG - _bkgd_subway_anims
    DW 90, 11, 94,  - 56
_DARK8_TPG:
    DW 1,     1,   235,    0

    PUBLIC _DARK9
_DARK9:
    DD _DARK9_TPG - _bkgd_subway_anims
    DW 60, 5, 34, 20
_DARK9_TPG:
    DW 0,   181,   178,    0

    PUBLIC _LITE1
_LITE1:
    DD _LITE1_TPG - _bkgd_subway_anims
    DW 88, 10, 94, 31
_LITE1_TPG:
    DW 2,   113,   235,    0

    PUBLIC _LITE10
_LITE10:
    DD _LITE10_TPG - _bkgd_subway_anims
    DW 58, 5, 34, 20
_LITE10_TPG:
    DW 0,   181,   163,    0

    PUBLIC _LITE11
_LITE11:
    DD _LITE11_TPG - _bkgd_subway_anims
    DW 25, 31, 29,  - 25
_LITE11_TPG:
    DW 1,   217,   213,    0

    PUBLIC _LITE2
_LITE2:
    DD _LITE2_TPG - _bkgd_subway_anims
    DW 90, 10, 6, 31
_LITE2_TPG:
    DW 1,     1,   214,    0

    PUBLIC _LITE3
_LITE3:
    DD _LITE3_TPG - _bkgd_subway_anims
    DW 6, 91, 83, 27
_LITE3_TPG:
    DW 3,   245,     1,     0

    PUBLIC _LITE4
_LITE4:
    DD _LITE4_TPG - _bkgd_subway_anims
    DW 6, 90, 83, 27
_LITE4_TPG:
    DW 3,   245,    92,     0

    PUBLIC _LITE6
_LITE6:
    DD _LITE6_TPG - _bkgd_subway_anims
    DW 87, 11, 94,  - 56
_LITE6_TPG:
    DW 2,     1,   211,    0

    PUBLIC _LITE7
_LITE7:
    DD _LITE7_TPG - _bkgd_subway_anims
    DW 90, 11, 7,  - 56
_LITE7_TPG:
    DW 1,   153,    87,    0

    PUBLIC _LITE8
_LITE8:
    DD _LITE8_TPG - _bkgd_subway_anims
    DW 90, 11, 94,  - 56
_LITE8_TPG:
    DW 1,     1,   224,    0

    PUBLIC _LITE9
_LITE9:
    DD _LITE9_TPG - _bkgd_subway_anims
    DW 60, 5, 34, 20
_LITE9_TPG:
    DW 0,   181,   173,    0

    PUBLIC _TRAINA
_TRAINA:
    DD _TRAINA_TPG - _bkgd_subway_anims
    DW 74, 81, 0, 0
    DD   _TRAIN_P
_TRAINA_TPG:
    DW 3,     1,   115,    0

    PUBLIC _TRAINB
_TRAINB:
    DD _TRAINB_TPG - _bkgd_subway_anims
    DW 65, 81, 0, 0
    DD   _TRAIN_P
_TRAINB_TPG:
    DW 0,   181,    82,    0

    PUBLIC _TRAINC
_TRAINC:
    DD _TRAINC_TPG - _bkgd_subway_anims
    DW 80, 81, 0, 0
    DD   _TRAIN_P
_TRAINC_TPG:
    DW 3,    89,    85,    0

    PUBLIC _STBREAK1
_STBREAK1:
    DD _STBREAK1_TPG - _bkgd_subway_anims
    DW 74,53,0,0
    DD _STBREAK_P
_STBREAK1_TPG:
    DW 3,    89,   166,    0

    PUBLIC _STBREAK2
_STBREAK2:
    DD _STBREAK2_TPG - _bkgd_subway_anims
    DW 90,54, - 73,0
    DD _STBREAK_P
_STBREAK2_TPG:
    DW 1,   153,   109,    0

    PUBLIC _STBREAK3
_STBREAK3:
    DD _STBREAK3_TPG - _bkgd_subway_anims
    DW 71,54,0,0
    DD _STBREAK_P
_STBREAK3_TPG:
    DW 3,   109,    31,    0

;*****************
;*  module: street                                      *
;*****************
    ;CNOP   0,4

    PUBLIC _a_storm
_a_storm:
    DD _STORM01 - _street_anims
    DD _STORM03 - _street_anims
    DD _STORM05 - _street_anims
    DD _STORM07 - _street_anims
    DD _STORM09 - _street_anims
    DD _STORM11 - _street_anims
    DD ani_jump
    DD _a_storm - _street_anims

    PUBLIC _STORM01
_STORM01:
    DD _STORM01_TPG - _street_anims
    DW 165, 52,  - 15,  - 9
    DD   _NUSTORM_P
_STORM01_TPG:
    DW  0,     1,   131,   0

    PUBLIC _STORM03
_STORM03:
    DD _STORM03_TPG - _street_anims
    DW 151, 61,  - 15,  - 4
_STORM03_TPG:
    DW  1,     1,    66,   0

    PUBLIC _STORM05
_STORM05:
    DD _STORM05_TPG - _street_anims
    DW 173, 54,  - 9,  - 9
_STORM05_TPG:
    DW  0,     1,    56,   0

    PUBLIC _STORM07
_STORM07:
    DD _STORM07_TPG - _street_anims
    DW 162, 51,  - 6,  - 8
_STORM07_TPG:
    DW  0,     1,   200,   0

    PUBLIC _STORM09
_STORM09:
    DD _STORM09_TPG - _street_anims
    DW 155, 65,  - 20, 0
_STORM09_TPG:
    DW  1,     1,     1,   0

    PUBLIC _STORM11
_STORM11:
    DD _STORM11_TPG - _street_anims
    DW 177, 55,  - 14,  - 5
_STORM11_TPG:
    DW  0,     1,     1,   0

    PUBLIC _a_paper1_strt
_a_paper1_strt:
    DD _PAPER1_STRT - _street_anims
    DD _PAPER2_STRT - _street_anims
    DD _PAPER3_STRT - _street_anims
    DD _PAPER4_STRT - _street_anims
    DD _PAPER5_STRT - _street_anims
    DD _PAPER6_STRT - _street_anims
    DD _PAPER7_STRT - _street_anims
    DD _PAPER8_STRT - _street_anims
    DD _PAPER9_STRT - _street_anims
    DD 0

    PUBLIC _a_big_paper_strt
_a_big_paper_strt:
    DD _LGSHEET1_STRT - _street_anims
    DD _LGSHEET2_STRT - _street_anims
    DD _LGSHEET3_STRT - _street_anims
    DD _LGSHEET4_STRT - _street_anims
    DD _LGSHEET5_STRT - _street_anims
    DD _LGSHEET6_STRT - _street_anims
    DD _LGSHEET7_STRT - _street_anims
    DD _LGSHEET8_STRT - _street_anims
    DD _LGSHEET9_STRT - _street_anims
    DD ani_jump
    DD _a_big_paper_strt - _street_anims

    PUBLIC _a_lil_paper_strt
_a_lil_paper_strt:
    DD _SMSHEET1_STRT - _street_anims
    DD _SMSHEET2_STRT - _street_anims
    DD _SMSHEET3_STRT - _street_anims
    DD _SMSHEET4_STRT - _street_anims
    DD _SMSHEET5_STRT - _street_anims
    DD _SMSHEET6_STRT - _street_anims
    DD _SMSHEET7_STRT - _street_anims
    DD _SMSHEET8_STRT - _street_anims
    DD _SMSHEET9_STRT - _street_anims
    DD ani_jump
    DD _a_lil_paper_strt - _street_anims

    PUBLIC _a_leaf_strt
_a_leaf_strt:
    DD _LEAF1_STRT - _street_anims
    DD _LEAF2_STRT - _street_anims
    DD _LEAF3_STRT - _street_anims
    DD _LEAF4_STRT - _street_anims
    DD _LEAF5_STRT - _street_anims
    DD _LEAF6_STRT - _street_anims
    DD _LEAF7_STRT - _street_anims
    DD _LEAF8_STRT - _street_anims
    DD ani_jump
    DD _a_leaf_strt - _street_anims

    ALIGN 4
    PUBLIC _PAPER1_STRT
_PAPER1_STRT:
    DD _PAPER1_STRT_TPG - _street_anims
    DW 18, 12, 7, 11
    DD   _PAPER_P
_PAPER1_STRT_TPG:
    DW  1,   133,   127,    0

    ALIGN 4
    PUBLIC _PAPER2_STRT
_PAPER2_STRT:
    DD _PAPER2_STRT_TPG - _street_anims
    DW 18, 12, 7, 11
_PAPER2_STRT_TPG:
    DW  1,   133,   149,    0

    ALIGN 4
    PUBLIC _PAPER3_STRT
_PAPER3_STRT:
    DD _PAPER3_STRT_TPG - _street_anims
    DW 18, 12, 7, 11
_PAPER3_STRT_TPG:
    DW  1,   133,   173,    0

    ALIGN 4
    PUBLIC _PAPER4_STRT
_PAPER4_STRT:
    DD _PAPER4_STRT_TPG - _street_anims
    DW 18, 11, 7, 10
_PAPER4_STRT_TPG:
    DW  1,   133,   199,    0

    ALIGN 4
    PUBLIC _PAPER5_STRT
_PAPER5_STRT:
    DD _PAPER5_STRT_TPG - _street_anims
    DW 18, 10, 7, 9
_PAPER5_STRT_TPG:
    DW  2,    89,   201,    0

    ALIGN 4
    PUBLIC _PAPER6_STRT
_PAPER6_STRT:
    DD _PAPER6_STRT_TPG - _street_anims
    DW 19, 10, 7, 9
_PAPER6_STRT_TPG:
    DW  1,   133,   139,    0

    ALIGN 4
    PUBLIC _PAPER7_STRT
_PAPER7_STRT:
    DD _PAPER7_STRT_TPG - _street_anims
    DW 20, 12, 7, 11
_PAPER7_STRT_TPG:
    DW  1,   133,   161,    0

    ALIGN 4
    PUBLIC _PAPER8_STRT
_PAPER8_STRT:
    DD _PAPER8_STRT_TPG - _street_anims
    DW 19, 14, 9, 13
_PAPER8_STRT_TPG:
    DW  1,   133,   185,    0

    ALIGN 4
    PUBLIC _PAPER9_STRT
_PAPER9_STRT:
    DD _PAPER9_STRT_TPG - _street_anims
    DW 20, 15, 8, 14
_PAPER9_STRT_TPG:
    DW  1,   133,   210,    0

    ALIGN 4
    PUBLIC _LGSHEET1_STRT
_LGSHEET1_STRT:
    DD _LGSHEET1_STRT_TPG - _street_anims
    DW 9, 17, 4, 8
    DD   _PAPER_P
_LGSHEET1_STRT_TPG:
    DW  0,   241,   177,    0

    ALIGN 4
    PUBLIC _LGSHEET2_STRT
_LGSHEET2_STRT:
    DD _LGSHEET2_STRT_TPG - _street_anims
    DW 12, 12, 3, 4
_LGSHEET2_STRT_TPG:
    DW  0,   241,   216,    0

    ALIGN 4
    PUBLIC _LGSHEET3_STRT
_LGSHEET3_STRT:
    DD _LGSHEET3_STRT_TPG - _street_anims
    DW 14, 11, 2, 3
_LGSHEET3_STRT_TPG:
    DW  0,   165,   198,    0

    ALIGN 4
    PUBLIC _LGSHEET4_STRT
_LGSHEET4_STRT:
    DD _LGSHEET4_STRT_TPG - _street_anims
    DW 11, 13, 2, 3
_LGSHEET4_STRT_TPG:
    DW  0,   229,   197,    0

    ALIGN 4
    PUBLIC _LGSHEET5_STRT
_LGSHEET5_STRT:
    DD _LGSHEET5_STRT_TPG - _street_anims
    DW 5, 14, 0, 4
_LGSHEET5_STRT_TPG:
    DW  1,   245,    87,     0

    ALIGN 4
    PUBLIC _LGSHEET6_STRT
_LGSHEET6_STRT:
    DD _LGSHEET6_STRT_TPG - _street_anims
    DW 11, 13, 5, 3
_LGSHEET6_STRT_TPG:
    DW  0,   241,   194,    0

    ALIGN 4
    PUBLIC _LGSHEET7_STRT
_LGSHEET7_STRT:
    DD _LGSHEET7_STRT_TPG - _street_anims
    DW 14, 14, 6, 3
_LGSHEET7_STRT_TPG:
    DW  0,   165,   184,    0

    ALIGN 4
    PUBLIC _LGSHEET8_STRT
_LGSHEET8_STRT:
    DD _LGSHEET8_STRT_TPG - _street_anims
    DW 11, 14, 3, 4
_LGSHEET8_STRT_TPG:
    DW  0,   169,   147,    0

    ALIGN 4
    PUBLIC _LGSHEET9_STRT
_LGSHEET9_STRT:
    DD _LGSHEET9_STRT_TPG - _street_anims
    DW 9, 14, 3, 6
_LGSHEET9_STRT_TPG:
    DW  0,   241,   239,    0

    ALIGN 4
    PUBLIC _SMSHEET1_STRT
_SMSHEET1_STRT:
    DD _SMSHEET1_STRT_TPG - _street_anims
    DW 7, 14, 3, 7
    DD   _PAPER_P
_SMSHEET1_STRT_TPG:
    DW  0,   241,   163,     0

    ALIGN 4
    PUBLIC _SMSHEET2_STRT
_SMSHEET2_STRT:
    DD _SMSHEET2_STRT_TPG - _street_anims
    DW 8, 9, 2, 4
_SMSHEET2_STRT_TPG:
    DW  0,   173,   117,     0

    ALIGN 4
    PUBLIC _SMSHEET3_STRT
_SMSHEET3_STRT:
    DD _SMSHEET3_STRT_TPG - _street_anims
    DW 10, 9, 2, 3
_SMSHEET3_STRT_TPG:
    DW  0,   229,   188,    0

    ALIGN 4
    PUBLIC _SMSHEET4_STRT
_SMSHEET4_STRT:
    DD _SMSHEET4_STRT_TPG - _street_anims
    DW 8, 10, 0, 3
_SMSHEET4_STRT_TPG:
    DW  0,   173,   126,     0

    ALIGN 4
    PUBLIC _SMSHEET5_STRT
_SMSHEET5_STRT:
    DD _SMSHEET5_STRT_TPG - _street_anims
    DW 3, 11, 0, 4
_SMSHEET5_STRT_TPG:
    DW  0,   177,    63,     0

    ALIGN 4
    PUBLIC _SMSHEET6_STRT
_SMSHEET6_STRT:
    DD _SMSHEET6_STRT_TPG - _street_anims
    DW 9, 9, 4, 3
_SMSHEET6_STRT_TPG:
    DW  0,   241,   207,    0

    ALIGN 4
    PUBLIC _SMSHEET7_STRT
_SMSHEET7_STRT:
    DD _SMSHEET7_STRT_TPG - _street_anims
    DW 10, 11, 6, 4
_SMSHEET7_STRT_TPG:
    DW  0,   169,   136,    0

    ALIGN 4
    PUBLIC _SMSHEET8_STRT
_SMSHEET8_STRT:
    DD _SMSHEET8_STRT_TPG - _street_anims
    DW 9, 11, 4, 5
_SMSHEET8_STRT_TPG:
    DW  0,   241,   228,    0

    ALIGN 4
    PUBLIC _SMSHEET9_STRT
_SMSHEET9_STRT:
    DD _SMSHEET9_STRT_TPG - _street_anims
    DW 6, 10, 4, 5
_SMSHEET9_STRT_TPG:
    DW  1,   245,    77,     0

    ALIGN 4
    PUBLIC _LEAF1_STRT
_LEAF1_STRT:
    DD _LEAF1_STRT_TPG - _street_anims
    DW 5, 3, 3, 1
    DD   _PAPER_P
_LEAF1_STRT_TPG:
    DW  0,   173,   114,     0

    ALIGN 4
    PUBLIC _LEAF2_STRT
_LEAF2_STRT:
    DD _LEAF2_STRT_TPG - _street_anims
    DW 3, 3, 2, 2
_LEAF2_STRT_TPG:
    DW  0,   249,    82,     0

    ALIGN 4
    PUBLIC _LEAF3_STRT
_LEAF3_STRT:
    DD _LEAF3_STRT_TPG - _street_anims
    DW 3, 3, 1, 2
_LEAF3_STRT_TPG:
    DW  0,   177,    60,     0

    ALIGN 4
    PUBLIC _LEAF4_STRT
_LEAF4_STRT:
    DD _LEAF4_STRT_TPG - _street_anims
    DW 4, 3, 1, 1
_LEAF4_STRT_TPG:
    DW  0,   169,   131,     0

    ALIGN 4
    PUBLIC _LEAF5_STRT
_LEAF5_STRT:
    DD _LEAF5_STRT_TPG - _street_anims
    DW 2, 4, 0, 2
_LEAF5_STRT_TPG:
    DW  0,   177,    56,     0

    ALIGN 4
    PUBLIC _LEAF6_STRT
_LEAF6_STRT:
    DD _LEAF6_STRT_TPG - _street_anims
    DW 2, 3, 0, 0
_LEAF6_STRT_TPG:
    DW  0,   173,   110,     0

    ALIGN 4
    PUBLIC _LEAF7_STRT
_LEAF7_STRT:
    DD _LEAF7_STRT_TPG - _street_anims
    DW 3, 1, 2,  - 1
_LEAF7_STRT_TPG:
    DW  0,   249,    85,     0

    ALIGN 4
    PUBLIC _LEAF8_STRT
_LEAF8_STRT:
    DD _LEAF8_STRT_TPG - _street_anims
    DW 3, 1, 2, 0
_LEAF8_STRT_TPG:
    DW  0,   173,   113,     0

    PUBLIC _SMALL01
_SMALL01:
    DD _SMALL01_TPG - _street_anims
    DW 9, 12, 5, 6
    DD   _SMALL_p
_SMALL01_TPG:
    DW 0,   229,   210,    0

    PUBLIC _SMALL02
_SMALL02:
    DD _SMALL02_TPG - _street_anims
    DW 7, 12, 4, 6
    DD   _SMALL_p
_SMALL02_TPG:
    DW 1,   125,   214,     0

    PUBLIC _SMALL03
_SMALL03:
    DD _SMALL03_TPG - _street_anims
    DW 8, 12, 4, 6
    DD   _SMALL_p
_SMALL03_TPG:
    DW 1,   245,   203,     0

    PUBLIC _SMALL04
_SMALL04:
    DD _SMALL04_TPG - _street_anims
    DW 10, 11, 5, 6
    DD   _SMALL_p
_SMALL04_TPG:
    DW 0,   229,   243,    0

    PUBLIC _SMALL05
_SMALL05:
    DD _SMALL05_TPG - _street_anims
    DW 10, 12, 5, 6
    DD   _SMALL_p
_SMALL05_TPG:
    DW 1,   121,   178,    0

    PUBLIC _SMALL06
_SMALL06:
    DD _SMALL06_TPG - _street_anims
    DW 10, 11, 5, 5
    DD   _SMALL_p
_SMALL06_TPG:
    DW 1,   121,   203,    0

    PUBLIC _SMALL07
_SMALL07:
    DD _SMALL07_TPG - _street_anims
    DW 11, 10, 6, 5
    DD   _SMALL_p
_SMALL07_TPG:
    DW 0,   169,   161,    0

    PUBLIC _SMALL08
_SMALL08:
    DD _SMALL08_TPG - _street_anims
    DW 12, 13, 6, 7
    DD   _SMALL_p
_SMALL08_TPG:
    DW 0,   169,   171,    0

    PUBLIC _SMALL09
_SMALL09:
    DD _SMALL09_TPG - _street_anims
    DW 11, 12, 6, 6
    DD   _SMALL_p
_SMALL09_TPG:
    DW 0,   229,   231,    0

    PUBLIC _SMALL10
_SMALL10:
    DD _SMALL10_TPG - _street_anims
    DW 10, 13, 6, 6
    DD   _SMALL_p
_SMALL10_TPG:
    DW 1,   121,   165,    0

    PUBLIC _SMALL11
_SMALL11:
    DD _SMALL11_TPG - _street_anims
    DW 9, 13, 5, 6
    DD   _SMALL_p
_SMALL11_TPG:
    DW 1,   121,   190,    0

    PUBLIC _SMALL12
_SMALL12:
    DD _SMALL12_TPG - _street_anims
    DW 9, 13, 5, 6
    DD   _SMALL_p
_SMALL12_TPG:
    DW 3,    77,   115,    0

    PUBLIC _MEDIUM01
_MEDIUM01:
    DD _MEDIUM01_TPG - _street_anims
    DW 16, 17, 8, 9
    DD   _MEDIUM_p
_MEDIUM01_TPG:
    DW 0,   165,   222,    0

    PUBLIC _MEDIUM02
_MEDIUM02:
    DD _MEDIUM02_TPG - _street_anims
    DW 15, 17, 8, 9
    DD   _MEDIUM_p
_MEDIUM02_TPG:
    DW 3,   237,   182,    0

    PUBLIC _MEDIUM03
_MEDIUM03:
    DD _MEDIUM03_TPG - _street_anims
    DW 16, 15, 9, 6
    DD   _MEDIUM_p
_MEDIUM03_TPG:
    DW 0,   165,   239,    0

    PUBLIC _MEDIUM04
_MEDIUM04:
    DD _MEDIUM04_TPG - _street_anims
    DW 17, 17, 9, 7
    DD   _MEDIUM_p
_MEDIUM04_TPG:
    DW 2,    89,   226,    0

    PUBLIC _MEDIUM05
_MEDIUM05:
    DD _MEDIUM05_TPG - _street_anims
    DW 17, 19, 9, 9
    DD   _MEDIUM_p
_MEDIUM05_TPG:
    DW 2,   225,   231,    0

    PUBLIC _MEDIUM06
_MEDIUM06:
    DD _MEDIUM06_TPG - _street_anims
    DW 17, 19, 9, 9
    DD   _MEDIUM_p
_MEDIUM06_TPG:
    DW 3,    89,    66,    0

    PUBLIC _MEDIUM07
_MEDIUM07:
    DD _MEDIUM07_TPG - _street_anims
    DW 17, 18, 10, 9
    DD   _MEDIUM_p
_MEDIUM07_TPG:
    DW 2,   201,   235,    0

    PUBLIC _MEDIUM08
_MEDIUM08:
    DD _MEDIUM08_TPG - _street_anims
    DW 17, 15, 10, 7
    DD   _MEDIUM_p
_MEDIUM08_TPG:
    DW 2,    89,   211,    0

    PUBLIC _MEDIUM09
_MEDIUM09:
    DD _MEDIUM09_TPG - _street_anims
    DW 17, 15, 10, 8
    DD   _MEDIUM_p
_MEDIUM09_TPG:
    DW 2,   225,   199,    0

    PUBLIC _MEDIUM10
_MEDIUM10:
    DD _MEDIUM10_TPG - _street_anims
    DW 17, 17, 9, 9
    DD   _MEDIUM_p
_MEDIUM10_TPG:
    DW 2,   225,   214,    0

    PUBLIC _MEDIUM11
_MEDIUM11:
    DD _MEDIUM11_TPG - _street_anims
    DW 16, 18, 8, 9
    DD   _MEDIUM_p
_MEDIUM11_TPG:
    DW 3,   237,   199,    0

    PUBLIC _MEDIUM12
_MEDIUM12:
    DD _MEDIUM12_TPG - _street_anims
    DW 15, 18, 8, 9
    DD   _MEDIUM_p
_MEDIUM12_TPG:
    DW 3,   165,   189,    0

    PUBLIC _LARGE01
_LARGE01:
    DD _LARGE01_TPG - _street_anims
    DW 42, 31, 24, 17
    DD   _MEDIUM_p
_LARGE01_TPG:
    DW 4,    89,     1,    0

    PUBLIC _LARGE02
_LARGE02:
    DD _LARGE02_TPG - _street_anims
    DW 46, 30, 25, 16
    DD   _MEDIUM_p
_LARGE02_TPG:
    DW 0,   181,   217,    0

    PUBLIC _LARGE03
_LARGE03:
    DD _LARGE03_TPG - _street_anims
    DW 40, 30, 20, 16
    DD   _MEDIUM_p
_LARGE03_TPG:
    DW 4,   129,    32,    0

    PUBLIC _LARGE04
_LARGE04:
    DD _LARGE04_TPG - _street_anims
    DW 41, 30, 18, 16
    DD   _MEDIUM_p
_LARGE04_TPG:
    DW 4,   177,     1,    0

    PUBLIC _LARGE05
_LARGE05:
    DD _LARGE05_TPG - _street_anims
    DW 34, 30, 13, 16
    DD   _MEDIUM_p
_LARGE05_TPG:
    DW 4,    89,   189,    0

    PUBLIC _LARGE06
_LARGE06:
    DD _LARGE06_TPG - _street_anims
    DW 26, 29, 9, 16
    DD   _MEDIUM_p
_LARGE06_TPG:
    DW 2,   225,   170,    0

    PUBLIC _LARGE07
_LARGE07:
    DD _LARGE07_TPG - _street_anims
    DW 38, 29, 16, 16
    DD   _MEDIUM_p
_LARGE07_TPG:
    DW 4,    41,   158,    0

    PUBLIC _LARGE08
_LARGE08:
    DD _LARGE08_TPG - _street_anims
    DW 45, 29, 22, 16
    DD   _MEDIUM_p
_LARGE08_TPG:
    DW 0,   181,   188,    0

    PUBLIC _LARGE09
_LARGE09:
    DD _LARGE09_TPG - _street_anims
    DW 42, 29, 22, 16
    DD   _MEDIUM_p
_LARGE09_TPG:
    DW 4,   133,     1,    0

    PUBLIC _LARGE10
_LARGE10:
    DD _LARGE10_TPG - _street_anims
    DW 40, 29, 23, 16
    DD   _MEDIUM_p
_LARGE10_TPG:
    DW 4,   177,    31,    0

    PUBLIC _LARGE11
_LARGE11:
    DD _LARGE11_TPG - _street_anims
    DW 38, 30, 25, 17
    DD   _MEDIUM_p
_LARGE11_TPG:
    DW 4,     1,   187,    0

    PUBLIC _LARGE12
_LARGE12:
    DD _LARGE12_TPG - _street_anims
    DW 30, 30, 22, 17
    DD   _MEDIUM_p
_LARGE12_TPG:
    DW 4,   221,     1,    0

    PUBLIC _XPLODE01
_XPLODE01:
    DD _XPLODE01_TPG - _street_anims
    DW 7, 10, 3, 9
    DD   _SMALL_p
_XPLODE01_TPG:
    DW 1,   245,   193,     0

    PUBLIC _XPLODE02
_XPLODE02:
    DD _XPLODE02_TPG - _street_anims
    DW 9, 9, 4, 10
    DD   _SMALL_p
_XPLODE02_TPG:
    DW 0,   229,   222,    0

    PUBLIC _XPLODE03
_XPLODE03:
    DD _XPLODE03_TPG - _street_anims
    DW 14, 10, 6, 12
    DD   _SMALL_p
_XPLODE03_TPG:
    DW 3,   165,   179,    0

    PUBLIC _XPLODE04
_XPLODE04:
    DD _XPLODE04_TPG - _street_anims
    DW 20, 11, 9, 12
    DD   _SMALL_p
_XPLODE04_TPG:
    DW 2,    89,   243,    0

    PUBLIC _XPLODE05
_XPLODE05:
    DD _XPLODE05_TPG - _street_anims
    DW 26, 10, 11, 9
    DD   _SMALL_p
_XPLODE05_TPG:
    DW 2,   225,   160,    0

    PUBLIC _XPLODE06
_XPLODE06:
    DD _XPLODE06_TPG - _street_anims
    DW 31, 9, 14, 7
    DD   _SMALL_p
_XPLODE06_TPG:
    DW 1,   217,   244,    0

    PUBLIC _XPLODE07
_XPLODE07:
    DD _XPLODE07_TPG - _street_anims
    DW 35, 8, 15, 5
    DD   _SMALL_p
_XPLODE07_TPG:
    DW 1,   125,   246,    0

    PUBLIC _XPLODE08
_XPLODE08:
    DD _XPLODE08_TPG - _street_anims
    DW 38, 8, 16, 5
    DD   _SMALL_p
_XPLODE08_TPG:
    DW 1,    85,   246,    0

    PUBLIC _XPLODE09
_XPLODE09:
    DD _XPLODE09_TPG - _street_anims
    DW 40, 8, 17, 5
    DD   _SMALL_p
_XPLODE09_TPG:
    DW 1,    45,   246,    0

    PUBLIC _XPLODE10
_XPLODE10:
    DD _XPLODE10_TPG - _street_anims
    DW 42, 7, 18, 4
    DD   _SMALL_p
_XPLODE10_TPG:
    DW 0,   181,   247,    0

    PUBLIC _XPLODE11
_XPLODE11:
    DD _XPLODE11_TPG - _street_anims
    DW 43, 3, 18, 1
    DD   _SMALL_p
_XPLODE11_TPG:
    DW 1,     1,   246,    0

    PUBLIC _XPLODE12
_XPLODE12:
    DD _XPLODE12_TPG - _street_anims
    DW 45, 3, 19, 1
    DD   _SMALL_p
_XPLODE12_TPG:
    DW 0,   105,   251,    0

    ALIGN 4

    PUBLIC _a_small_rock
_a_small_rock:
    DD  _SMALL01 - _street_anims
    DD  _SMALL02 - _street_anims
    DD  _SMALL03 - _street_anims
    DD  _SMALL04 - _street_anims
    DD  _SMALL05 - _street_anims
    DD  _SMALL06 - _street_anims
_a_small_rock2:
    DD  _SMALL07 - _street_anims
    DD  _SMALL08 - _street_anims
    DD  _SMALL09 - _street_anims
    DD  _SMALL10 - _street_anims
    DD  _SMALL11 - _street_anims
    DD  _SMALL12 - _street_anims
    DD  ani_jump,_a_small_rock - _street_anims

    PUBLIC _a_med_rock
_a_med_rock:
    DD  _MEDIUM01 - _street_anims
    DD  _MEDIUM02 - _street_anims
    DD  _MEDIUM03 - _street_anims
    DD  _MEDIUM04 - _street_anims
    DD  _MEDIUM05 - _street_anims
    DD  _MEDIUM06 - _street_anims
    DD  _MEDIUM07 - _street_anims
    DD  _MEDIUM08 - _street_anims
    DD  _MEDIUM09 - _street_anims
    DD  _MEDIUM10 - _street_anims
    DD  _MEDIUM11 - _street_anims
    DD  _MEDIUM12 - _street_anims
    DD  ani_jump,_a_med_rock - _street_anims

    PUBLIC _a_large_rock
_a_large_rock:
    DD  _LARGE01 - _street_anims
    DD  _LARGE02 - _street_anims
    DD  _LARGE03 - _street_anims
    DD  _LARGE04 - _street_anims
    DD  _LARGE05 - _street_anims
    DD  _LARGE06 - _street_anims
    DD  _LARGE07 - _street_anims
    DD  _LARGE08 - _street_anims
    DD  _LARGE09 - _street_anims
    DD  _LARGE10 - _street_anims
    DD  _LARGE11 - _street_anims
    DD  _LARGE12 - _street_anims
    DD  ani_jump,_a_large_rock - _street_anims

    PUBLIC _a_crumple
_a_crumple:
    DD  _XPLODE01 - _street_anims
    DD  _XPLODE02 - _street_anims
    DD  _XPLODE03 - _street_anims
    DD  _XPLODE04 - _street_anims
    DD  _XPLODE05 - _street_anims
    DD  _XPLODE06 - _street_anims
    DD  _XPLODE07 - _street_anims
    DD  _XPLODE08 - _street_anims
    DD  _XPLODE09 - _street_anims
    DD  _XPLODE10 - _street_anims
    DD  _XPLODE11 - _street_anims
    DD  _XPLODE12 - _street_anims
    DD  0


;*********************************
;**      MODULE DATA            **
;*********************************
;*****************
;*  module: subway
;*****************
    ALIGN 4
    include bkgd\subway\mksubway.mod

    ALIGN 4
    PUBLIC _subway_module
_subway_module:
    DW  0                   ; autoerase color
    DW  16                  ; initial world y
    DW  0e5H                ; ground y offset
    DW  480                 ; initial world x
    DW  0 + 64                ; scroll left limit
    DW  944 - 64 ;999         ; scroll right limit

    DD  _calla_subway
    DD  subway_scroll       ; scroll table
    DD  dlists_subway

    DD  _bakmods
    DD  SKIP_BAKMOD         ; _baklst1 = skip (players)
    DD  SKIP_BAKMOD         ; _baklst2 = skip (gleam)
    DD  SKIP_BAKMOD         ; _baklst3 = skip (gleam)
    DD  SKIP_BAKMOD         ; _baklst4 = skip (rails)
    DD  SUBWAY1BMOD         ; _baklst5 = front plane / pillars
    DW  000H,0ff84H + 16
    DD  SKIP_BAKMOD         ; _baklst6 = train
    DD  SUBWAY2BMOD         ; _baklst7 = blurry back wall
    DW  000H,023H + 16 + 1

    DD  CENTER_X
    DD  SUBWAY1BMOD,_worldtlx1   ; gleam
    DD  SUBWAY1BMOD,_worldtlx2   ; gleam
    DD  SUBWAY1BMOD,_worldtlx4   ; lit/unlit
    DD  SUBWAY1BMOD,_worldtlx5   ; front plane
    DD  SUBWAY2BMOD,_worldtlx7   ; blurry back wall
    DD  END_LIST                ; endlist

    DD  _subflor_FLR             ; sag
    DD  _subflor_PAL             ; palette for floor
    DD  72                      ; floor height
    DD  _scrollx5                ; which scroll variable to follow
    DD  _skew_7

subway_scroll:
    DD  0*SCX/100           ; 8
    DD  08000H*SCX/100      ; 7  -  back
    DD  0*SCX/100           ; 6  -  train
    DD  014000H*SCX/100         ; 5  -  front
    DD  014000H*SCX/100         ; 4  -  lit/unlit images
    DD  0*SCX/100           ; 3  -  rails
    DD  014000H*SCX/100         ; 2  -  gleams of light #2
    DD  014000H*SCX/100         ; 1  -  gleams of light #1
    DD  020000H*SCX/100         ; player list

dlists_subway:
    DD  _baklst7,_worldtlx7 + 16/8      ; blurry wall
    DD  _baklst6,_worldtlx6 + 16/8      ; train
    DD  _baklst4,_worldtlx4 + 16/8      ; lit / unlit
    DD  _baklst5,_worldtlx5 + 16/8      ; front / pillars
    DD   - 1,_floor_code
    DD   - 1,_shadow_p1p2
    DD  _baklst3,_worldtlx3 + 16/8      ; rails
    DD  _baklst2,_worldtlx2 + 16/8      ; gleam
    DD  _baklst1,_worldtlx1 + 16/8      ; gleam
    DD  _objlst,_worldtlx + 16/8        ; players
    DD  _objlst2,_worldtlx + 16/8       ; text
    DD  0

;*****************
;*  module: street                                      *
;*****************
    ALIGN 4
    include bkgd\street\mkstreet.mod

    ALIGN 4
    PUBLIC  _street_module
_street_module:
    DW  000H            ; background color
    DW  000H            ; initial world y
    DW  0e0H    ;$f6    ; ground y offset

    DW  320         ; initial world x
    DW  0           ; scroll left limit
    DW  694         ; scroll right limit
    DD  _calla_street
    DD  street_scroll       ; scroll table
    DD  dlists_street
    DD  _bakmods
    DD  street1BMOD     ; _baklst1 = strip ontop of floor
    DW  000H,14 - 010H
    DD  street2BMOD     ; _baklst2 = small street
    DW  000H,0a5H - 010H
    DD  street3BMOD     ; _baklst3 = blds
    DW  04H,0ffe0H
    DD  SKIP_BAKMOD     ; _baklst4
    DD  street4BMOD     ; _baklst5 = tower
    DW  0fff8H,02aH - 010H

    DD  CENTER_X
    DD  street1BMOD,_worldtlx1
    DD  street2BMOD,_worldtlx2
    DD  street3BMOD,_worldtlx3
    DD  street4BMOD,_worldtlx5
    DD  END_LIST

    DD  street_FLR          ; sag
    DD  _street_PAL      ; palette for floor
    DD  43  ;51         ; skew height
    DD  _scrollx1        ; which scroll variable to follow
    DD  _skew_7

street_scroll:
    DD  0*SCX/100       ; 8
    DD  0*SCX/100       ; 7
    DD  0*SCX/100       ; 6
    DD  0*SCX/100       ; 5
    DD  0*SCX/100       ; 4
    DD  010000H*SCX/100         ; 3
    DD  014000H*SCX/100             ; 2
    DD  01a000H*SCX/100             ; 1
    DD  020000H*SCX/100             ; player object list

dlists_street:
    DD  _baklst6,_worldtlx6 + 16/8
    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD   - 1,_floor_code
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _baklst4,_worldtlx1 + 16/8
    DD   - 1,_shadow_p1p2
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

    ALIGN 4
    PUBLIC _dlists_subway_to_street
_dlists_subway_to_street:
    DD   - 1,_useworldtly_t
    DD  _baklst8_t,_worldtlx8_t + 16/8      ; blurry wall
    DD  _baklst7_t,_worldtlx7_t + 16/8      ; train
    DD  _baklst6_t,_worldtlx6_t + 16/8      ; front / pillars
    DD  _baklst5_t,_worldtlx5_t + 16/8      ; lit / unlit
    DD  _baklst4_t,_worldtlx4_t + 16/8      ; rails
    DD  _baklst3_t,_worldtlx3_t + 16/8      ; gleam
    DD  _baklst2_t,_worldtlx2_t + 16/8      ; gleam
    DD  _objlst_t,_worldtlx_t + 16/8        ; players

    DD   - 1,_check_only_t
    DD   - 1,_useworldtly
    DD  _baklst6,_worldtlx6 + 16/8
    DD  _baklst5,_worldtlx5 + 16/8
;   dw  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD   - 1,_floor_code
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _baklst4,_worldtlx1 + 16/8
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

    PUBLIC _dlists_end
_dlists_end:
    DD  0

;*********************************
;**      FLOOR DATA             **
;*********************************
    ALIGN 4
PUBLIC _subflor_addr
_subflor_addr:
    DD  _subflor_FLR

    PUBLIC _subflor_FLR
_subflor_FLR:
    include bkgd\floors\subway\subflor.asm

    ALIGN 4
street_FLR:
    include bkgd\floors\street\street.asm




    END_DATA
    end
