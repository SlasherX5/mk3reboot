;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III City Module
;******************************************************************************/


    include win95.i
    include mkchar.i
    include mkbkgd.i


;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN _calla_city  : DWORD
    EXTERN _calla_bank  : DWORD
    EXTERN _use_next_y  : DWORD
    EXTERN _MKCITY_CLT  : DWORD
    EXTERN _BURN_P      : DWORD
    EXTERN _NUSTORM_P   : DWORD
    EXTERN _CITYFLR_P   : DWORD
    EXTERN _STBREAK_P   : DWORD
    EXTERN _SMALL_p     : DWORD
    EXTERN _MEDIUM_p    : DWORD

;*********************************
;**         PALETTES                                **
;*********************************
    BEGIN_DATA

    ALIGN 4
;   include palsrc\citypal.mas

    EXTERN _mkbank_CLT : DWORD

;*********************************
;**         BANK ANIMATIONS         **
;*********************************
    ALIGN 4
    PUBLIC _bank_anims
_bank_anims:
    PUBLIC _BANK_STBREAK1
_BANK_STBREAK1:
    DD _BANK_STBREAK1_TPG-_bank_anims
    DW 74,53,0,0
    DD _STBREAK_P
_BANK_STBREAK1_TPG:
    DW 2,153,184,0

    PUBLIC _BANK_STBREAK2
_BANK_STBREAK2:
    DD _BANK_STBREAK2_TPG-_bank_anims
    DW 90,54,-73,0
    DD _STBREAK_P
_BANK_STBREAK2_TPG:
    DW 1,157,99,0

    PUBLIC _BANK_STBREAK3
_BANK_STBREAK3:
    DD _BANK_STBREAK3_TPG-_bank_anims
    DW 71,54,0,0
    DD _STBREAK_P
_BANK_STBREAK3_TPG:
    DW 2,153,116,0

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _city_anims
_city_anims:

    PUBLIC _a_burn
_a_burn:
    DD _BURNING1-_city_anims
    DD _BURNING2-_city_anims
    DD _BURNING3-_city_anims
    DD _BURNING4-_city_anims
    DD _BURNING5-_city_anims
    DD _BURNING6-_city_anims
    DD _BURNING7-_city_anims
    DD _BURNING8-_city_anims
    DD ani_jump
    DD _a_burn-_city_anims

    PUBLIC _a_storm_city
_a_storm_city:
    DD _CSTORM01-_city_anims
    DD _CSTORM03-_city_anims
    DD _CSTORM05-_city_anims
    DD _CSTORM07-_city_anims
    DD _CSTORM09-_city_anims
    DD _CSTORM11-_city_anims
    DD ani_jump
    DD _a_storm_city-_city_anims

    PUBLIC _CSTORM01
_CSTORM01:
    DD _CSTORM01_TPG-_city_anims
    DW 165, 52, -15, -9
    DD   _NUSTORM_P
_CSTORM01_TPG:
    DW  0,     1,   200,   0

    PUBLIC _CSTORM03
_CSTORM03:
    DD _CSTORM03_TPG-_city_anims
    DW 151, 61, -15, -4
_CSTORM03_TPG:
    DW  2,     1,     1,   0

    PUBLIC _CSTORM05
_CSTORM05:
    DD _CSTORM05_TPG-_city_anims
    DW 173, 54, -9, -9
_CSTORM05_TPG:
    DW  0,     1,    56,   0

    PUBLIC _CSTORM07
_CSTORM07:
    DD _CSTORM07_TPG-_city_anims
    DW 162, 51, -6, -8
_CSTORM07_TPG:
    DW  1,     1,     1,   0

    PUBLIC _CSTORM09
_CSTORM09:
    DD _CSTORM09_TPG-_city_anims
    DW 155, 65, -20, 0
_CSTORM09_TPG:
    DW  1,     1,    52,   0

    PUBLIC _CSTORM11
_CSTORM11:
    DD _CSTORM11_TPG-_city_anims
    DW 177, 55, -14, -5
_CSTORM11_TPG:
    DW  0,     1,     1,   0

    ALIGN 4
    PUBLIC _BURNING1
_BURNING1:
    DD _BURNING1_TPG-_city_anims
    DW 46, 26, 0, 0
    DD  _BURN_P
_BURNING1_TPG:
    DW  2,    53,   215,    0

    ALIGN 4
    PUBLIC _BURNING2
_BURNING2:
    DD _BURNING2_TPG-_city_anims
    DW 45, 27, -1, 1
_BURNING2_TPG:
    DW  3,     1,    94,    0

    ALIGN 4
    PUBLIC _BURNING3
_BURNING3:
    DD _BURNING3_TPG-_city_anims
    DW 45, 26, -1, 0
_BURNING3_TPG:
    DW  3,    49,    95,    0

    ALIGN 4
    PUBLIC _BURNING4
_BURNING4:
    DD _BURNING4_TPG-_city_anims
    DW 42, 25, -4, -1
_BURNING4_TPG:
    DW  3,    45,   202,    0

    ALIGN 4
    PUBLIC _BURNING5
_BURNING5:
    DD _BURNING5_TPG-_city_anims
    DW 43, 25, -3, -1
_BURNING5_TPG:
    DW  3,     1,   173,    0

    ALIGN 4
    PUBLIC _BURNING6
_BURNING6:
    DD _BURNING6_TPG-_city_anims
    DW 42, 26, -4, -0
_BURNING6_TPG:
    DW  3,    45,   176,    0

    ALIGN 4
    PUBLIC _BURNING7
_BURNING7:
    DD _BURNING7_TPG-_city_anims
    DW 44, 26, -2, 0
_BURNING7_TPG:
    DW  3,     1,   198,    0

    ALIGN 4
    PUBLIC _BURNING8
_BURNING8:
    DD _BURNING8_TPG-_city_anims
    DW 46, 26, 0, 0
_BURNING8_TPG:
    DW  3,   109,   178,    0

    ALIGN 4
    PUBLIC _CITY_SMALL01
_CITY_SMALL01:
    DD _CITY_SMALL01_TPG-_city_anims
    DW 9, 12, 5, 6
    DD   _SMALL_p
_CITY_SMALL01_TPG:
    DW 0,   241,    96,    0

    PUBLIC _CITY_SMALL02
_CITY_SMALL02:
    DD _CITY_SMALL02_TPG-_city_anims
    DW 7, 12, 4, 6
    DD _SMALL_p
_CITY_SMALL02_TPG:
    DW 0,   245,    11,     0

    PUBLIC _CITY_SMALL03
_CITY_SMALL03:
    DD _CITY_SMALL03_TPG-_city_anims
    DW 8, 12, 4, 6
    DD   _SMALL_p
_CITY_SMALL03_TPG:
    DW 0,   173,   122,     0

    PUBLIC _CITY_SMALL04
_CITY_SMALL04:
    DD _CITY_SMALL04_TPG-_city_anims
    DW 10, 11, 5, 6
    DD   _SMALL_p
_CITY_SMALL04_TPG:
    DW 2,   237,   105,    0

    PUBLIC _CITY_SMALL05
_CITY_SMALL05:
    DD _CITY_SMALL05_TPG-_city_anims
    DW 10, 12, 5, 6
    DD   _SMALL_p
_CITY_SMALL05_TPG:
    DW 2,   237,   129,    0

    PUBLIC _CITY_SMALL06
_CITY_SMALL06:
    DD _CITY_SMALL06_TPG-_city_anims
    DW 10, 11, 5, 5
    DD   _SMALL_p
_CITY_SMALL06_TPG:
    DW 2,   209,   238,    0

    PUBLIC _CITY_SMALL07
_CITY_SMALL07:
    DD _CITY_SMALL07_TPG-_city_anims
    DW 11, 10, 6, 5
    DD   _SMALL_p
_CITY_SMALL07_TPG:
    DW 0,   241,    86,    0

    PUBLIC _CITY_SMALL08
_CITY_SMALL08:
    DD _CITY_SMALL08_TPG-_city_anims
    DW 12, 13, 6, 7
    DD   _SMALL_p
_CITY_SMALL08_TPG:
    DW 0,   241,   108,    0

    PUBLIC _CITY_SMALL09
_CITY_SMALL09:
    DD _CITY_SMALL09_TPG-_city_anims
    DW 11, 12, 6, 6
    DD   _SMALL_p
_CITY_SMALL09_TPG:
    DW 2,   237,    93,    0

    PUBLIC _CITY_SMALL10
_CITY_SMALL10:
    DD _CITY_SMALL10_TPG-_city_anims
    DW 10, 13, 6, 6
    DD _SMALL_p
_CITY_SMALL10_TPG:
    DW 2,   237,   116,    0

    PUBLIC _CITY_SMALL11
_CITY_SMALL11:
    DD _CITY_SMALL11_TPG-_city_anims
    DW 9, 13, 5, 6
    DD _SMALL_p
_CITY_SMALL11_TPG:
    DW 2,   197,   238,    0

    PUBLIC _CITY_SMALL12
_CITY_SMALL12:
    DD _CITY_SMALL12_TPG-_city_anims
    DW 9, 13, 5, 6
    DD _SMALL_p
_CITY_SMALL12_TPG:
    DW 2,   237,   141,    0

    PUBLIC _CITY_MEDIUM01
_CITY_MEDIUM01:
    DD _CITY_MEDIUM01_TPG-_city_anims
    DW 16, 17, 8, 9
    DD   _MEDIUM_p
_CITY_MEDIUM01_TPG:
    DW 0,   217,   234,    0

    PUBLIC _CITY_MEDIUM02
_CITY_MEDIUM02:
    DD _CITY_MEDIUM02_TPG-_city_anims
    DW 15, 17, 8, 9
    DD   _MEDIUM_p
_CITY_MEDIUM02_TPG:
    DW 1,   137,   226,    0

    PUBLIC _CITY_MEDIUM03
_CITY_MEDIUM03:
    DD _CITY_MEDIUM03_TPG-_city_anims
    DW 16, 15, 9, 6
    DD   _MEDIUM_p
_CITY_MEDIUM03_TPG:
    DW 1,   237,   203,    0

    PUBLIC _CITY_MEDIUM04
_CITY_MEDIUM04:
    DD _CITY_MEDIUM04_TPG-_city_anims
    DW 17, 17, 9, 7
    DD   _MEDIUM_p
_CITY_MEDIUM04_TPG:
    DW 2,   229,   170,    0

    PUBLIC _CITY_MEDIUM05
_CITY_MEDIUM05:
    DD _CITY_MEDIUM05_TPG-_city_anims
    DW 17, 19, 9, 9
    DD   _MEDIUM_p
_CITY_MEDIUM05_TPG:
    DW 2,   229,   204,    0

    PUBLIC _CITY_MEDIUM06
_CITY_MEDIUM06:
    DD _CITY_MEDIUM06_TPG-_city_anims
    DW 17, 19, 9, 9
    DD   _MEDIUM_p
_CITY_MEDIUM06_TPG:
    DW 2,   229,   223,    0

    PUBLIC _CITY_MEDIUM07
_CITY_MEDIUM07:
    DD _CITY_MEDIUM07_TPG-_city_anims
    DW 17, 18, 10, 9
    DD   _MEDIUM_p
_CITY_MEDIUM07_TPG:
    DW 0,   233,   198,    0

    PUBLIC _CITY_MEDIUM08
_CITY_MEDIUM08:
    DD _CITY_MEDIUM08_TPG-_city_anims
    DW 17, 15, 10, 7
    DD   _MEDIUM_p
_CITY_MEDIUM08_TPG:
    DW 0,   233,   216,    0

    PUBLIC _CITY_MEDIUM09
_CITY_MEDIUM09:
    DD _CITY_MEDIUM09_TPG-_city_anims
    DW 17, 15, 10, 8
    DD   _MEDIUM_p
_CITY_MEDIUM09_TPG:
    DW 0,   233,   231,    0

    PUBLIC _CITY_MEDIUM10
_CITY_MEDIUM10:
    DD _CITY_MEDIUM10_TPG-_city_anims
    DW 17, 17, 9, 9
    DD   _MEDIUM_p
_CITY_MEDIUM10_TPG:
    DW 2,   229,   187,    0

    PUBLIC _CITY_MEDIUM11
_CITY_MEDIUM11:
    DD _CITY_MEDIUM11_TPG-_city_anims
    DW 16, 18, 8, 9
    DD   _MEDIUM_p
_CITY_MEDIUM11_TPG:
    DW 1,   237,   218,    0

    PUBLIC _CITY_MEDIUM12
_CITY_MEDIUM12:
    DD _CITY_MEDIUM12_TPG-_city_anims
    DW 15, 18, 8, 9
    DD   _MEDIUM_p
_CITY_MEDIUM12_TPG:
    DW 1,   237,   236,    0

    PUBLIC _CITY_LARGE01
_CITY_LARGE01:
    DD _CITY_LARGE01_TPG-_city_anims
    DW 42, 31, 24, 17
    DD   _MEDIUM_p
_CITY_LARGE01_TPG:
    DW 4,   181,     1,    0

    PUBLIC _CITY_LARGE02
_CITY_LARGE02:
    DD _CITY_LARGE02_TPG-_city_anims
    DW 46, 30, 25, 16
    DD   _MEDIUM_p
_CITY_LARGE02_TPG:
    DW 3,   157,   220,    0

    PUBLIC _CITY_LARGE03
_CITY_LARGE03:
    DD _CITY_LARGE03_TPG-_city_anims
    DW 40, 30, 20, 16
    DD   _MEDIUM_p
_CITY_LARGE03_TPG:
    DW 4,    41,   174,    0

    PUBLIC _CITY_LARGE04
_CITY_LARGE04:
    DD _CITY_LARGE04_TPG-_city_anims
    DW 41, 30, 18, 16
    DD   _MEDIUM_p
_CITY_LARGE04_TPG:
    DW 4,    49,    46,    0

    PUBLIC _CITY_LARGE05
_CITY_LARGE05:
    DD _CITY_LARGE05_TPG-_city_anims
    DW 34, 30, 13, 16
    DD   _MEDIUM_p
_CITY_LARGE05_TPG:
    DW 4,   217,   168,    0

    PUBLIC _CITY_LARGE06
_CITY_LARGE06:
    DD _CITY_LARGE06_TPG-_city_anims
    DW 26, 29, 9, 16
    DD   _MEDIUM_p
_CITY_LARGE06_TPG:
    DW 2,   101,   225,    0

    PUBLIC _CITY_LARGE07
_CITY_LARGE07:
    DD _CITY_LARGE07_TPG-_city_anims
    DW 38, 29, 16, 16
    DD   _MEDIUM_p
_CITY_LARGE07_TPG:
    DW 4,   177,    89,    0

    PUBLIC _CITY_LARGE08
_CITY_LARGE08:
    DD _CITY_LARGE08_TPG-_city_anims
    DW 45, 29, 22, 16
    DD   _MEDIUM_p
_CITY_LARGE08_TPG:
    DW 3,    49,   147,    0

    PUBLIC _CITY_LARGE09
_CITY_LARGE09:
    DD _CITY_LARGE09_TPG-_city_anims
    DW 42, 29, 22, 16
    DD   _MEDIUM_p
_CITY_LARGE09_TPG:
    DW 4,     1,   145,    0

    PUBLIC _CITY_LARGE10
_CITY_LARGE10:
    DD _CITY_LARGE10_TPG-_city_anims
    DW 40, 29, 23, 16
    DD   _MEDIUM_p
_CITY_LARGE10_TPG:
    DW 4,    81,   185,    0

    PUBLIC _CITY_LARGE11
_CITY_LARGE11:
    DD _CITY_LARGE11_TPG-_city_anims
    DW 38, 30, 25, 17
    DD   _MEDIUM_p
_CITY_LARGE11_TPG:
    DW 4,   133,   219,    0

    PUBLIC _CITY_LARGE12
_CITY_LARGE12:
    DD _CITY_LARGE12_TPG-_city_anims
    DW 30, 30, 22, 17
    DD   _MEDIUM_p
_CITY_LARGE12_TPG:
    DW 4,    41,   204,    0

    PUBLIC _CITY_XPLODE01
_CITY_XPLODE01:
    DD _CITY_XPLODE01_TPG-_city_anims
    DW 7, 10, 3, 9
    DD   _SMALL_p
_CITY_XPLODE01_TPG:
    DW 0,   245,     1,     0

    PUBLIC _CITY_XPLODE02
_CITY_XPLODE02:
    DD _CITY_XPLODE02_TPG-_city_anims
    DW 9, 9, 4, 10
    DD   _SMALL_p
_CITY_XPLODE02_TPG:
    DW 0,   241,   121,    0

    PUBLIC _CITY_XPLODE03
_CITY_XPLODE03:
    DD _CITY_XPLODE03_TPG-_city_anims
    DW 14, 10, 6, 12
    DD   _SMALL_p
_CITY_XPLODE03_TPG:
    DW 1,   137,   243,    0

    PUBLIC _CITY_XPLODE04
_CITY_XPLODE04:
    DD _CITY_XPLODE04_TPG-_city_anims
    DW 20, 11, 9, 12
    DD   _SMALL_p
_CITY_XPLODE04_TPG:
    DW 2,    81,   241,    0

    PUBLIC _CITY_XPLODE05
_CITY_XPLODE05:
    DD _CITY_XPLODE05_TPG-_city_anims
    DW 26, 10, 11, 9
    DD   _SMALL_p
_CITY_XPLODE05_TPG:
    DW 2,   101,   215,    0

    PUBLIC _CITY_XPLODE06
_CITY_XPLODE06:
    DD _CITY_XPLODE06_TPG-_city_anims
    DW 31, 9, 14, 7
    DD   _SMALL_p
_CITY_XPLODE06_TPG:
    DW 2,   165,   238,    0

    PUBLIC _CITY_XPLODE07
_CITY_XPLODE07:
    DD _CITY_XPLODE07_TPG-_city_anims
    DW 35, 8, 15, 5
    DD   _SMALL_p
_CITY_XPLODE07_TPG:
    DW 2,   129,   245,    0

    PUBLIC _CITY_XPLODE08
_CITY_XPLODE08:
    DD _CITY_XPLODE08_TPG-_city_anims
    DW 38, 8, 16, 5
    DD   _SMALL_p
_CITY_XPLODE08_TPG:
    DW 2,    41,   241,    0

    PUBLIC _CITY_XPLODE09
_CITY_XPLODE09:
    DD _CITY_XPLODE09_TPG-_city_anims
    DW 40, 8, 17, 5
    DD   _SMALL_p
_CITY_XPLODE09_TPG:
    DW 2,     1,   241,    0

    PUBLIC _CITY_XPLODE10
_CITY_XPLODE10:
    DD _CITY_XPLODE10_TPG-_city_anims
    DW 42, 7, 18, 4
    DD   _SMALL_p
_CITY_XPLODE10_TPG:
    DW 0,   169,   237,    0

    PUBLIC _CITY_XPLODE11
_CITY_XPLODE11:
    DD _CITY_XPLODE11_TPG-_city_anims
    DW 43, 3, 18, 1
    DD   _SMALL_p
_CITY_XPLODE11_TPG:
    DW 0,   169,   244,    0

    PUBLIC _CITY_XPLODE12
_CITY_XPLODE12:
    DD _CITY_XPLODE12_TPG-_city_anims
    DW 45, 3, 19, 1
    DD   _SMALL_p
_CITY_XPLODE12_TPG:
    DW 0,   169,   234,    0

    ALIGN 4

    PUBLIC _a_city_small_rock
_a_city_small_rock:
    DD  _CITY_SMALL01-_city_anims
    DD  _CITY_SMALL02-_city_anims
    DD  _CITY_SMALL03-_city_anims
    DD  _CITY_SMALL04-_city_anims
    DD  _CITY_SMALL05-_city_anims
    DD  _CITY_SMALL06-_city_anims
_a_city_small_rock2:
    DD  _CITY_SMALL07-_city_anims
    DD  _CITY_SMALL08-_city_anims
    DD  _CITY_SMALL09-_city_anims
    DD  _CITY_SMALL10-_city_anims
    DD  _CITY_SMALL11-_city_anims
    DD  _CITY_SMALL12-_city_anims
    DD  ani_jump,_a_city_small_rock-_city_anims

    PUBLIC _a_city_med_rock
_a_city_med_rock:
    DD  _CITY_MEDIUM01-_city_anims
    DD  _CITY_MEDIUM02-_city_anims
    DD  _CITY_MEDIUM03-_city_anims
    DD  _CITY_MEDIUM04-_city_anims
    DD  _CITY_MEDIUM05-_city_anims
    DD  _CITY_MEDIUM06-_city_anims
    DD  _CITY_MEDIUM07-_city_anims
    DD  _CITY_MEDIUM08-_city_anims
    DD  _CITY_MEDIUM09-_city_anims
    DD  _CITY_MEDIUM10-_city_anims
    DD  _CITY_MEDIUM11-_city_anims
    DD  _CITY_MEDIUM12-_city_anims
    DD  ani_jump,_a_city_med_rock-_city_anims

    PUBLIC _a_city_large_rock
_a_city_large_rock:
    DD  _CITY_LARGE01-_city_anims
    DD  _CITY_LARGE02-_city_anims
    DD  _CITY_LARGE03-_city_anims
    DD  _CITY_LARGE04-_city_anims
    DD  _CITY_LARGE05-_city_anims
    DD  _CITY_LARGE06-_city_anims
    DD  _CITY_LARGE07-_city_anims
    DD  _CITY_LARGE08-_city_anims
    DD  _CITY_LARGE09-_city_anims
    DD  _CITY_LARGE10-_city_anims
    DD  _CITY_LARGE11-_city_anims
    DD  _CITY_LARGE12-_city_anims
    DD  ani_jump,_a_city_large_rock-_city_anims

    PUBLIC _a_city_crumple
_a_city_crumple:
    DD  _CITY_XPLODE01-_city_anims
    DD  _CITY_XPLODE02-_city_anims
    DD  _CITY_XPLODE03-_city_anims
    DD  _CITY_XPLODE04-_city_anims
    DD  _CITY_XPLODE05-_city_anims
    DD  _CITY_XPLODE06-_city_anims
    DD  _CITY_XPLODE07-_city_anims
    DD  _CITY_XPLODE08-_city_anims
    DD  _CITY_XPLODE09-_city_anims
    DD  _CITY_XPLODE10-_city_anims
    DD  _CITY_XPLODE11-_city_anims
    DD  _CITY_XPLODE12-_city_anims
    DD  0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include bkgd\city\mkcity.mod

    ALIGN 4
    PUBLIC  _roof_module
_roof_module:
    DW  000H                ; autoerase color
    DW  040H                ; initial world y
    DW  0e1H-4              ; ground y offset
    DW  320             ; initial world x
    DW  020H                ; scroll left limit
    DW  630             ; scroll right limit

    DD  _calla_city     ; routine to call
    DD  city_scroll         ; scroll table
    DD  dlists_roof

    DD  _bakmods
    DD  mkcity1BMOD         ; _baklst1 = gargoyles
    DW  000H,029H
    DD  mkcity2BMOD         ; _baklst2 = wall
    DW  000H,0b4H
    DD  mkcity3BMOD         ; _baklst3 = background city
    DW  0ffd8H,08dH

    DD  SKIP_BAKMOD             ; _baklst4 = fire animation

    DD  mkcity4BMOD         ; _baklst5 = background city
    DW  004H,038H
    DD  mkcity5BMOD         ; _baklst6 = background city
    DW  0fffeH,06dH


    DD  CENTER_X
    DD  mkcity1BMOD,_worldtlx1
    DD  mkcity2BMOD,_worldtlx2
    DD  mkcity3BMOD,_worldtlx3
    DD  mkcity4BMOD,_worldtlx4
    DD  mkcity4BMOD,_worldtlx5
    DD  mkcity5BMOD,_worldtlx6
    DD  mkcity5BMOD,_worldtlx7
    DD  END_LIST

    DD  FL_CITY             ; sag
    DD  _CITYFLR_P              ; palette for floor
    DD  43                  ; floor height
    DD  _scrollx2            ; which scroll variable to follow
    DD  _skew_7

city_scroll:
    DD  0       ; 8
    DD  0       ; 7
    DD  0       ; 6
    DD  08000H*SCX/100      ; 5
    DD  08000H*SCX/100          ; 4
    DD  010000H*SCX/100         ; 3
    DD  018000H*SCX/100         ; 2 - gargoyles
    DD  01d000H*SCX/100         ; 1 - back wall
    DD  020000H*SCX/100         ; player list

dlists_roof:
    DD  _baklst7,_worldtlx5+16/8
    DD  _baklst6,_worldtlx6+16/8
    DD  _baklst5,_worldtlx4+16/8
    DD  _baklst4,_worldtlx4+16/8
    DD  _baklst3,_worldtlx3+16/8
    DD  _baklst2,_worldtlx2+16/8
    DD  -1,_floor_code
    DD  _baklst1,_worldtlx1+16/8
    DD  -1,_shadow_p1p2
    DD  _objlst,_worldtlx+16/8
    DD  _objlst2,_worldtlx+16/8
    DD  0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include bkgd\bank\mkbank80.mod

    ALIGN 4
    PUBLIC _bank_module
_bank_module:
    DW  0
    DW  040H                ; initial world y
    DW  0f7H-23             ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  960-320         ; scroll right limit

    DD  _calla_bank
    DD  bank_scroll         ; scroll table
    DD  dlists_bank

    DD  _bakmods
    DD  BANK1BMOD           ; _baklst1 = wall / windows
    DW  012H,0ffffH
    DD  BANK2BMOD           ; _baklst2 = sky line (tower)
    DW  00H,057H

    DD  CENTER_X
    DD  BANK1BMOD,_worldtlx1
    DD  BANK2BMOD,_worldtlx2
    DD  0

    DD  FL_BANK     ; sag
    DD  _CITYFLR_P      ; palette for floor
    DD  43
    DD  _scrollx1
    DD  _skew_7

bank_scroll:
    DD  0*SCX/100       ; 8
    DD  0*SCX/100       ; 7
    DD  0*SCX/100       ; 6
    DD  0*SCX/100       ; 5
    DD  0*SCX/100       ; 4
    DD  0*SCX/100       ; 3
    DD  0*SCX/100       ; 2 - sky line
    DD  018000H*SCX/100     ; 1 - marble pillars / such
    DD  020000H*SCX/100     ; 0 - players

dlists_bank:
    DD  _baklst2,_worldtlx2+16/8
    DD  -1,_floor_code
    DD  _baklst1,_worldtlx1+16/8
    DD  -1,_shadow_p1p2
    DD  -1,_use_next_y,_worldtly
    DD  _objlst,_worldtlx+16/8
    DD  _objlst2,_worldtlx+16/8
    DD  0

    PUBLIC _dlists_bank_to_roof
_dlists_bank_to_roof:
    DD  -1,_useworldtly_t
    DD  _baklst2_t,_worldtlx2_t+16/8
    DD  _baklst1_t,_worldtlx1_t+16/8
    DD  _objlst_t,_worldtlx_t+16/8
    DD  -1,_check_only_t
    DD  -1,_useworldtly

    DD  _baklst7,_worldtlx5+16/8
    DD  _baklst6,_worldtlx6+16/8
    DD  _baklst5,_worldtlx4+16/8
    DD  _baklst4,_worldtlx4+16/8
    DD  _baklst3,_worldtlx3+16/8
    DD  _baklst2,_worldtlx2+16/8
    DD  -1,_floor_code
    DD  _baklst1,_worldtlx1+16/8
;   dw  -1,shadow_code
    DD  _objlst,_worldtlx+16/8
    DD  _objlst2,_worldtlx+16/8
    DD  0


;*********************************
;**         FLOOR DATA          **
;*********************************
    ALIGN 4
FL_CITY:
FL_BANK:
    include bkgd\floors\city\ruuf.asm

    END_DATA
    end

