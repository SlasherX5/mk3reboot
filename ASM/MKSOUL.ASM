;******************************************************************************
 include win95.i  ;: mksoul.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Soul Module
;******************************************************************************/

     

    include mkchar.i
    include mkbkgd.i


;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN _calla_soul : DWORD
    EXTERN _calla_tower : DWORD
    EXTERN _use_next_y : DWORD

;*********************************
;**         PALETTES
;*********************************

    EXTERN _MK3SOUL_CLT    : DWORD
    EXTERN _SONADO_P       : DWORD
    EXTERN _soflor_PAL     : DWORD
    EXTERN _STBREAK_P      : DWORD
    EXTERN _SMALL_p        : DWORD
    EXTERN _MEDIUM_p       : DWORD
    EXTERN _MKBALC2z_CLT   : DWORD
    EXTERN _BALFIRE_P      : DWORD
    EXTERN _BALCO_P        : DWORD

	BEGIN_DATA
;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _soul_anims
_soul_anims:

    PUBLIC _SOUL_STBREAK1
_SOUL_STBREAK1:
    DD _SOUL_STBREAK1_TPG - _soul_anims
    DW 74,53,0,0
    DD _STBREAK_P
_SOUL_STBREAK1_TPG:
    DW 2,   165,    16,    0

    PUBLIC _SOUL_STBREAK2
_SOUL_STBREAK2:
    DD _SOUL_STBREAK2_TPG - _soul_anims
    DW 90,54, - 73,0
    DD _STBREAK_P
_SOUL_STBREAK2_TPG:
    DW 1,   101,    89,    0

    PUBLIC _SOUL_STBREAK3
_SOUL_STBREAK3:
    DD _SOUL_STBREAK3_TPG - _soul_anims
    DW 71,54,0,0
    DD _STBREAK_P
_SOUL_STBREAK3_TPG:
    DW 2,     1,     1,    0

    ALIGN 4
    PUBLIC _a_soul_na_do
_a_soul_na_do:
    DD  _SONADO1 - _soul_anims
    DD  _SONADO2 - _soul_anims
    DD  _SONADO3 - _soul_anims
    DD  _SONADO4 - _soul_anims
    DD  _SONADO5 - _soul_anims
    DD  _SONADO6 - _soul_anims
    DD  _SONADO7 - _soul_anims
    DD  _SONADO8 - _soul_anims
    DD  _SONADO9 - _soul_anims
    DD  _SONADO10 - _soul_anims
    DD  _SONADO11 - _soul_anims
    DD  _SONADO12 - _soul_anims
    DD  ani_jump,_a_soul_na_do - _soul_anims

    PUBLIC _SONADO1
_SONADO1:
    DD _SONADO1_TPG - _soul_anims
    DW 34, 83, 0, 0
    DD   _SONADO_P
_SONADO1_TPG:
    DW  4,    37,     1,    0

    PUBLIC _SONADO2
_SONADO2:
    DD _SONADO2_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO2_TPG:
    DW  4,   181,     1,    0

    PUBLIC _SONADO3
_SONADO3:
    DD _SONADO3_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO3_TPG:
    DW  4,    73,    84,    0

    PUBLIC _SONADO4
_SONADO4:
    DD _SONADO4_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO4_TPG:
    DW  4,   181,    84,    0

    PUBLIC _SONADO5
_SONADO5:
    DD _SONADO5_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO5_TPG:
    DW  4,    73,     1,    0

    PUBLIC _SONADO6
_SONADO6:
    DD _SONADO6_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO6_TPG:
    DW  4,   217,     1,    0

    PUBLIC _SONADO7
_SONADO7:
    DD _SONADO7_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO7_TPG:
    DW  4,    37,    84,    0

    PUBLIC _SONADO8
_SONADO8:
    DD _SONADO8_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO8_TPG:
    DW  4,   145,    84,    0

    PUBLIC _SONADO9
_SONADO9:
    DD _SONADO9_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO9_TPG:
    DW  4,   109,     1,    0

    PUBLIC _SONADO10
_SONADO10:
    DD _SONADO10_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO10_TPG:
    DW  4,   145,     1,    0

    PUBLIC _SONADO11
_SONADO11:
    DD _SONADO11_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO11_TPG:
    DW  4,     1,    31,    0

    PUBLIC _SONADO12
_SONADO12:
    DD _SONADO12_TPG - _soul_anims
    DW 34, 83, 0, 0
_SONADO12_TPG:
    DW  4,   109,    84,    0

;*********************************
;**         TOWER ANIMATIONS            **
;*********************************
    ALIGN 4
    PUBLIC _tower_anims
_tower_anims:

    PUBLIC _a_torch
_a_torch:
    DD _BALFIRE1 - _tower_anims
    DD _BALFIRE2 - _tower_anims
    DD _BALFIRE3 - _tower_anims
    DD _BALFIRE4 - _tower_anims
    DD _BALFIRE5 - _tower_anims
    DD _BALFIRE6 - _tower_anims
    DD ani_jump
    DD _a_torch - _tower_anims

    PUBLIC _BALFIRE1
_BALFIRE1:
    DD _BALFIRE1_TPG - _tower_anims
    DW 29, 33, 0,  - 3
    DD  _BALFIRE_P
_BALFIRE1_TPG:
    DW  4,   217,    84,    0

    PUBLIC _BALFIRE2
_BALFIRE2:
    DD _BALFIRE2_TPG - _tower_anims
    DW 29, 29, 0,  - 8
_BALFIRE2_TPG:
    DW  4,     1,   114,    0

    PUBLIC _BALFIRE3
_BALFIRE3:
    DD _BALFIRE3_TPG - _tower_anims
    DW 29, 29, 0,  - 8
_BALFIRE3_TPG:
    DW  4,    37,   167,    0

    PUBLIC _BALFIRE4
_BALFIRE4:
    DD _BALFIRE4_TPG - _tower_anims
    DW 29, 34, 0,  - 2
_BALFIRE4_TPG:
    DW  4,    69,   167,    0

    PUBLIC _BALFIRE5
_BALFIRE5:
    DD _BALFIRE5_TPG - _tower_anims
    DW 29, 36, 0,  - 1
_BALFIRE5_TPG:
    DW  4,   101,   167,    0

    PUBLIC _BALFIRE6
_BALFIRE6:
    DD _BALFIRE6_TPG - _tower_anims
    DW 29, 37, 0, 0
_BALFIRE6_TPG:
    DW  4,   133,   167,    0

    ALIGN 4
    PUBLIC _TOWER_SMALL01
_TOWER_SMALL01:
    DD _TOWER_SMALL01_TPG - _tower_anims
    DW 9, 12, 5, 6
    DD   _SMALL_p
_TOWER_SMALL01_TPG:
    DW 2,   133,   159,    0

    PUBLIC _TOWER_SMALL02
_TOWER_SMALL02:
    DD _TOWER_SMALL02_TPG - _tower_anims
    DW 7, 12, 4, 6
    DD _SMALL_p
_TOWER_SMALL02_TPG:
    DW 0,   245,   242,     0

    PUBLIC _TOWER_SMALL03
_TOWER_SMALL03:
    DD _TOWER_SMALL03_TPG - _tower_anims
    DW 8, 12, 4, 6
    DD   _SMALL_p
_TOWER_SMALL03_TPG:
    DW 0,   101,   168,     0

    PUBLIC _TOWER_SMALL04
_TOWER_SMALL04:
    DD _TOWER_SMALL04_TPG - _tower_anims
    DW 10, 11, 5, 6
    DD   _SMALL_p
_TOWER_SMALL04_TPG:
    DW 2,   193,   238,    0

    PUBLIC _TOWER_SMALL05
_TOWER_SMALL05:
    DD _TOWER_SMALL05_TPG - _tower_anims
    DW 10, 12, 5, 6
    DD   _SMALL_p
_TOWER_SMALL05_TPG:
    DW 2,   133,   184,    0

    PUBLIC _TOWER_SMALL06
_TOWER_SMALL06:
    DD _TOWER_SMALL06_TPG - _tower_anims
    DW 10, 11, 5, 5
    DD   _SMALL_p
_TOWER_SMALL06_TPG:
    DW 2,   133,   209,    0

    PUBLIC _TOWER_SMALL07
_TOWER_SMALL07:
    DD _TOWER_SMALL07_TPG - _tower_anims
    DW 11, 10, 6, 5
    DD   _SMALL_p
_TOWER_SMALL07_TPG:
    DW 2,   133,   149,    0

    PUBLIC _TOWER_SMALL08
_TOWER_SMALL08:
    DD _TOWER_SMALL08_TPG - _tower_anims
    DW 12, 13, 6, 7
    DD   _SMALL_p
_TOWER_SMALL08_TPG:
    DW 2,   133,   171,    0

    PUBLIC _TOWER_SMALL09
_TOWER_SMALL09:
    DD _TOWER_SMALL09_TPG - _tower_anims
    DW 11, 12, 6, 6
    DD   _SMALL_p
_TOWER_SMALL09_TPG:
    DW 2,   181,   238,    0

    PUBLIC _TOWER_SMALL10
_TOWER_SMALL10:
    DD _TOWER_SMALL10_TPG - _tower_anims
    DW 10, 13, 6, 6
    DD _SMALL_p
_TOWER_SMALL10_TPG:
    DW 2,   205,   238,    0

    PUBLIC _TOWER_SMALL11
_TOWER_SMALL11:
    DD _TOWER_SMALL11_TPG - _tower_anims
    DW 9, 13, 5, 6
    DD _SMALL_p
_TOWER_SMALL11_TPG:
    DW 2,   133,   196,    0

    PUBLIC _TOWER_SMALL12
_TOWER_SMALL12:
    DD _TOWER_SMALL12_TPG - _tower_anims
    DW 9, 13, 5, 6
    DD _SMALL_p
_TOWER_SMALL12_TPG:
    DW 2,   133,   220,    0

    PUBLIC _TOWER_MEDIUM01
_TOWER_MEDIUM01:
    DD _TOWER_MEDIUM01_TPG - _tower_anims
    DW 16, 17, 8, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM01_TPG:
    DW 2,   237,    88,    0

    PUBLIC _TOWER_MEDIUM02
_TOWER_MEDIUM02:
    DD _TOWER_MEDIUM02_TPG - _tower_anims
    DW 15, 17, 8, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM02_TPG:
    DW 2,   145,   237,    0

    PUBLIC _TOWER_MEDIUM03
_TOWER_MEDIUM03:
    DD _TOWER_MEDIUM03_TPG - _tower_anims
    DW 16, 15, 9, 6
    DD   _MEDIUM_p
_TOWER_MEDIUM03_TPG:
    DW 2,   165,   238,    0

    PUBLIC _TOWER_MEDIUM04
_TOWER_MEDIUM04:
    DD _TOWER_MEDIUM04_TPG - _tower_anims
    DW 17, 17, 9, 7
    DD   _MEDIUM_p
_TOWER_MEDIUM04_TPG:
    DW 2,   145,   173,    0

    PUBLIC _TOWER_MEDIUM05
_TOWER_MEDIUM05:
    DD _TOWER_MEDIUM05_TPG - _tower_anims
    DW 17, 19, 9, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM05_TPG:
    DW 2,   225,   185,    0

    PUBLIC _TOWER_MEDIUM06
_TOWER_MEDIUM06:
    DD _TOWER_MEDIUM06_TPG - _tower_anims
    DW 17, 19, 9, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM06_TPG:
    DW 2,   145,   207,    0

    PUBLIC _TOWER_MEDIUM07
_TOWER_MEDIUM07:
    DD _TOWER_MEDIUM07_TPG - _tower_anims
    DW 17, 18, 10, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM07_TPG:
    DW 0,   109,   233,    0

    PUBLIC _TOWER_MEDIUM08
_TOWER_MEDIUM08:
    DD _TOWER_MEDIUM08_TPG - _tower_anims
    DW 17, 15, 10, 7
    DD   _MEDIUM_p
_TOWER_MEDIUM08_TPG:
    DW 1,   169,   230,    0

    PUBLIC _TOWER_MEDIUM09
_TOWER_MEDIUM09:
    DD _TOWER_MEDIUM09_TPG - _tower_anims
    DW 17, 15, 10, 8
    DD   _MEDIUM_p
_TOWER_MEDIUM09_TPG:
    DW 2,   145,   158,    0

    PUBLIC _TOWER_MEDIUM10
_TOWER_MEDIUM10:
    DD _TOWER_MEDIUM10_TPG - _tower_anims
    DW 17, 17, 9, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM10_TPG:
    DW 2,   145,   190,    0

    PUBLIC _TOWER_MEDIUM11
_TOWER_MEDIUM11:
    DD _TOWER_MEDIUM11_TPG - _tower_anims
    DW 16, 18, 8, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM11_TPG:
    DW 3,   129,   149,    0

    PUBLIC _TOWER_MEDIUM12
_TOWER_MEDIUM12:
    DD _TOWER_MEDIUM12_TPG - _tower_anims
    DW 15, 18, 8, 9
    DD   _MEDIUM_p
_TOWER_MEDIUM12_TPG:
    DW 3,   129,   167,    0

    PUBLIC _TOWER_LARGE01
_TOWER_LARGE01:
    DD _TOWER_LARGE01_TPG - _tower_anims
    DW 42, 31, 24, 17
    DD   _MEDIUM_p
_TOWER_LARGE01_TPG:
    DW 3,   205,    30,    0

    PUBLIC _TOWER_LARGE02
_TOWER_LARGE02:
    DD _TOWER_LARGE02_TPG - _tower_anims
    DW 46, 30, 25, 16
    DD   _MEDIUM_p
_TOWER_LARGE02_TPG:
    DW 3,   105,    58,    0

    PUBLIC _TOWER_LARGE03
_TOWER_LARGE03:
    DD _TOWER_LARGE03_TPG - _tower_anims
    DW 40, 30, 20, 16
    DD   _MEDIUM_p
_TOWER_LARGE03_TPG:
    DW 3,    89,   209,    0

    PUBLIC _TOWER_LARGE04
_TOWER_LARGE04:
    DD _TOWER_LARGE04_TPG - _tower_anims
    DW 41, 30, 18, 16
    DD   _MEDIUM_p
_TOWER_LARGE04_TPG:
    DW 3,    49,   179,    0

    PUBLIC _TOWER_LARGE05
_TOWER_LARGE05:
    DD _TOWER_LARGE05_TPG - _tower_anims
    DW 34, 30, 13, 16
    DD   _MEDIUM_p
_TOWER_LARGE05_TPG:
    DW 4,     1,     1,    0

    PUBLIC _TOWER_LARGE06
_TOWER_LARGE06:
    DD _TOWER_LARGE06_TPG - _tower_anims
    DW 26, 29, 9, 16
    DD   _MEDIUM_p
_TOWER_LARGE06_TPG:
    DW 0,   109,   204,    0

    PUBLIC _TOWER_LARGE07
_TOWER_LARGE07:
    DD _TOWER_LARGE07_TPG - _tower_anims
    DW 38, 29, 16, 16
    DD   _MEDIUM_p
_TOWER_LARGE07_TPG:
    DW 3,    49,   209,    0

    PUBLIC _TOWER_LARGE08
_TOWER_LARGE08:
    DD _TOWER_LARGE08_TPG - _tower_anims
    DW 45, 29, 22, 16
    DD   _MEDIUM_p
_TOWER_LARGE08_TPG:
    DW 3,    53,   150,    0

    PUBLIC _TOWER_LARGE09
_TOWER_LARGE09:
    DD _TOWER_LARGE09_TPG - _tower_anims
    DW 42, 29, 22, 16
    DD   _MEDIUM_p
_TOWER_LARGE09_TPG:
    DW 3,     1,   216,    0

    PUBLIC _TOWER_LARGE10
_TOWER_LARGE10:
    DD _TOWER_LARGE10_TPG - _tower_anims
    DW 40, 29, 23, 16
    DD   _MEDIUM_p
_TOWER_LARGE10_TPG:
    DW 3,   157,   198,    0

    PUBLIC _TOWER_LARGE11
_TOWER_LARGE11:
    DD _TOWER_LARGE11_TPG - _tower_anims
    DW 38, 30, 25, 17
    DD   _MEDIUM_p
_TOWER_LARGE11_TPG:
    DW 3,   205,   109,    0

    PUBLIC _TOWER_LARGE12
_TOWER_LARGE12:
    DD _TOWER_LARGE12_TPG - _tower_anims
    DW 30, 30, 22, 17
    DD   _MEDIUM_p
_TOWER_LARGE12_TPG:
    DW 4,    65,   201,    0

    PUBLIC _TOWER_XPLODE01
_TOWER_XPLODE01:
    DD _TOWER_XPLODE01_TPG - _tower_anims
    DW 7, 10, 3, 9
    DD   _SMALL_p
_TOWER_XPLODE01_TPG:
    DW 0,   245,   232,     0

    PUBLIC _TOWER_XPLODE02
_TOWER_XPLODE02:
    DD _TOWER_XPLODE02_TPG - _tower_anims
    DW 9, 9, 4, 10
    DD   _SMALL_p
_TOWER_XPLODE02_TPG:
    DW 1,   169,   245,    0

    PUBLIC _TOWER_XPLODE03
_TOWER_XPLODE03:
    DD _TOWER_XPLODE03_TPG - _tower_anims
    DW 14, 10, 6, 12
    DD   _SMALL_p
_TOWER_XPLODE03_TPG:
    DW 2,    97,   244,    0

    PUBLIC _TOWER_XPLODE04
_TOWER_XPLODE04:
    DD _TOWER_XPLODE04_TPG - _tower_anims
    DW 20, 11, 9, 12
    DD   _SMALL_p
_TOWER_XPLODE04_TPG:
    DW 2,   145,   226,    0

    PUBLIC _TOWER_XPLODE05
_TOWER_XPLODE05:
    DD _TOWER_XPLODE05_TPG - _tower_anims
    DW 26, 10, 11, 9
    DD   _SMALL_p
_TOWER_XPLODE05_TPG:
    DW 0,   109,   194,    0

    PUBLIC _TOWER_XPLODE06
_TOWER_XPLODE06:
    DD _TOWER_XPLODE06_TPG - _tower_anims
    DW 31, 9, 14, 7
    DD   _SMALL_p
_TOWER_XPLODE06_TPG:
    DW 2,    65,   244,    0

    PUBLIC _TOWER_XPLODE07
_TOWER_XPLODE07:
    DD _TOWER_XPLODE07_TPG - _tower_anims
    DW 35, 8, 15, 5
    DD   _SMALL_p
_TOWER_XPLODE07_TPG:
    DW 0,    41,   246,    0

    PUBLIC _TOWER_XPLODE08
_TOWER_XPLODE08:
    DD _TOWER_XPLODE08_TPG - _tower_anims
    DW 38, 8, 16, 5
    DD   _SMALL_p
_TOWER_XPLODE08_TPG:
    DW 0,     1,   246,    0

    PUBLIC _TOWER_XPLODE09
_TOWER_XPLODE09:
    DD _TOWER_XPLODE09_TPG - _tower_anims
    DW 40, 8, 17, 5
    DD   _SMALL_p
_TOWER_XPLODE09_TPG:
    DW 0,   201,   242,    0

    PUBLIC _TOWER_XPLODE10
_TOWER_XPLODE10:
    DD _TOWER_XPLODE10_TPG - _tower_anims
    DW 42, 7, 18, 4
    DD   _SMALL_p
_TOWER_XPLODE10_TPG:
    DW 0,   201,   232,    0

    PUBLIC _TOWER_XPLODE11
_TOWER_XPLODE11:
    DD _TOWER_XPLODE11_TPG - _tower_anims
    DW 43, 3, 18, 1
    DD   _SMALL_p
_TOWER_XPLODE11_TPG:
    DW 0,   201,   239,    0

    PUBLIC _TOWER_XPLODE12
_TOWER_XPLODE12:
    DD _TOWER_XPLODE12_TPG - _tower_anims
    DW 45, 3, 19, 1
    DD   _SMALL_p
_TOWER_XPLODE12_TPG:
    DW 0,   205,   229,    0

    ALIGN 4

    PUBLIC _a_tower_small_rock
_a_tower_small_rock:
    DD  _TOWER_SMALL01 - _tower_anims
    DD  _TOWER_SMALL02 - _tower_anims
    DD  _TOWER_SMALL03 - _tower_anims
    DD  _TOWER_SMALL04 - _tower_anims
    DD  _TOWER_SMALL05 - _tower_anims
    DD  _TOWER_SMALL06 - _tower_anims
_a_tower_small_rock2:
    DD  _TOWER_SMALL07 - _tower_anims
    DD  _TOWER_SMALL08 - _tower_anims
    DD  _TOWER_SMALL09 - _tower_anims
    DD  _TOWER_SMALL10 - _tower_anims
    DD  _TOWER_SMALL11 - _tower_anims
    DD  _TOWER_SMALL12 - _tower_anims
    DD  ani_jump,_a_tower_small_rock - _tower_anims

    PUBLIC _a_tower_med_rock
_a_tower_med_rock:
    DD  _TOWER_MEDIUM01 - _tower_anims
    DD  _TOWER_MEDIUM02 - _tower_anims
    DD  _TOWER_MEDIUM03 - _tower_anims
    DD  _TOWER_MEDIUM04 - _tower_anims
    DD  _TOWER_MEDIUM05 - _tower_anims
    DD  _TOWER_MEDIUM06 - _tower_anims
    DD  _TOWER_MEDIUM07 - _tower_anims
    DD  _TOWER_MEDIUM08 - _tower_anims
    DD  _TOWER_MEDIUM09 - _tower_anims
    DD  _TOWER_MEDIUM10 - _tower_anims
    DD  _TOWER_MEDIUM11 - _tower_anims
    DD  _TOWER_MEDIUM12 - _tower_anims
    DD  ani_jump,_a_tower_med_rock - _tower_anims

    PUBLIC _a_tower_large_rock
_a_tower_large_rock:
    DD  _TOWER_LARGE01 - _tower_anims
    DD  _TOWER_LARGE02 - _tower_anims
    DD  _TOWER_LARGE03 - _tower_anims
    DD  _TOWER_LARGE04 - _tower_anims
    DD  _TOWER_LARGE05 - _tower_anims
    DD  _TOWER_LARGE06 - _tower_anims
    DD  _TOWER_LARGE07 - _tower_anims
    DD  _TOWER_LARGE08 - _tower_anims
    DD  _TOWER_LARGE09 - _tower_anims
    DD  _TOWER_LARGE10 - _tower_anims
    DD  _TOWER_LARGE11 - _tower_anims
    DD  _TOWER_LARGE12 - _tower_anims
    DD  ani_jump,_a_tower_large_rock - _tower_anims

    PUBLIC _a_tower_crumple
_a_tower_crumple:
    DD  _TOWER_XPLODE01 - _tower_anims
    DD  _TOWER_XPLODE02 - _tower_anims
    DD  _TOWER_XPLODE03 - _tower_anims
    DD  _TOWER_XPLODE04 - _tower_anims
    DD  _TOWER_XPLODE05 - _tower_anims
    DD  _TOWER_XPLODE06 - _tower_anims
    DD  _TOWER_XPLODE07 - _tower_anims
    DD  _TOWER_XPLODE08 - _tower_anims
    DD  _TOWER_XPLODE09 - _tower_anims
    DD  _TOWER_XPLODE10 - _tower_anims
    DD  _TOWER_XPLODE11 - _tower_anims
    DD  _TOWER_XPLODE12 - _tower_anims
    DD  0



;*********************************
;**      MODULE DATA            **
;*********************************
    PUBLIC  _soflor_FLR              ; sag

    ALIGN 4
    include bkgd\soul\mksoul.mod

    ALIGN 4
    PUBLIC _soul_module
_soul_module:
    DW  0                       ; autoerase color
    DW  0                       ; initial world y
    DW  0dcH                    ; ground y
    DW  320                 ; initial world x
    DW  0               ; scroll left limit
    DW  640             ; scroll right limit

    DD  _calla_soul          ; routine to call
    DD  soul_scroll         ; scroll table
    DD  dlists_soul

    DD  _bakmods
    DD  SOUL1BMOD           ; _baklst1 = small lower teeth
    DW  000H,083H
    DD  SOUL2BMOD           ; _baklst2 = soul monsters
    DW  000H,04aH
    DD  SKIP_BAKMOD         ; _baklst3 = skip (soulnado)

    DD  SOUL3BMOD           ; _baklst4 = skull head
    DW  000H,0ffdaH
    DD  SOUL4BMOD           ; _baklst5 = monks
    DW  0ffb0H,06cH
    DD  SOUL5BMOD           ; _baklst6 = back trees
    DW  006H,26

    DD  CENTER_X
    DD  SOUL1BMOD,_worldtlx1
    DD  SOUL2BMOD,_worldtlx2
    DD  SOUL3BMOD,_worldtlx3
    DD  SOUL3BMOD,_worldtlx4
    DD  SOUL4BMOD,_worldtlx5
    DD  SOUL5BMOD,_worldtlx6
    DD  END_LIST                ; endlist

    DD  _soflor_FLR              ; sag
    DD  _soflor_PAL              ; palette for floor
    DD  38              ; floor height
    DD  _scrollx1            ; which scroll variable to follow
    DD  _skew_7

soul_scroll:
    DD  0*SCX/100       ; 8
    DD  0*SCX/100       ; 7
    DD  08000H*SCX/100      ; 6
    DD  0c000H*SCX/100          ; 5
    DD  010000H*SCX/100         ; 4
    DD  010000H*SCX/100         ; 3
    DD  018000H*SCX/100         ; 2
    DD  01c000H*SCX/100         ; 1
    DD  020000H*SCX/100         ; player list

dlists_soul:
    DD  _baklst7,_worldtlx7 + 16/8
    DD  _baklst6,_worldtlx6 + 16/8
    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
    DD   - 1,_floor_code
    DD   - 1,_shadow_p1p2
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

    PUBLIC _dlists_soul_to_tower
_dlists_soul_to_tower:
    DD   - 1,_useworldtly_t
    DD  _baklst7_t,_worldtlx7_t + 16/8
    DD  _baklst6_t,_worldtlx6_t + 16/8
    DD  _baklst5_t,_worldtlx5_t + 16/8
    DD  _baklst4_t,_worldtlx4_t + 16/8
    DD  _baklst3_t,_worldtlx3_t + 16/8
    DD  _baklst2_t,_worldtlx2_t + 16/8
    DD  _baklst1_t,_worldtlx1_t + 16/8
    DD  _objlst_t,_worldtlx_t + 16/8

; tower

    DD   - 1,_check_only_t
    DD   - 1,_useworldtly

    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD   - 1,_floor_code
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _baklst8,_worldtlx1 + 16/8      ; torch
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include bkgd\balcony2\mkbalc2.mod

    ALIGN 4
    PUBLIC _tower_module
_tower_module:
    DW  0               ; autoerase color
    DW  0                   ; initial world y
    DW  0dcH                ; ground y offset
    DW  320             ; initial world x
    DW  010H                ; scroll left limit
    DW  0268H                ; scroll right limit

    DD  _calla_tower
    DD  tower_scroll        ; scroll table
    DD  dlists_tower

    DD  _bakmods
    DD  BALCONY1BMOD        ; _baklst1 = front walls
    DW  0ffd8H,0ffeeH - 44
    DD  BALCONY2BMOD        ; _baklst2 = 2 side walls
    DW  08H,0ffe0H
    DD  BALCONY3BMOD        ; _baklst3 = well
    DW  006H,060H
    DD  BALCONY4BMOD        ; _baklst4 = pillars
    DW  000H,0fff8H
    DD  BALCONY5BMOD        ; _baklst5 = distant candles
    DW  000H,030H

    DD  CENTER_X
    DD  BALCONY1BMOD,_worldtlx1
    DD  BALCONY2BMOD,_worldtlx2
    DD  BALCONY3BMOD,_worldtlx3
    DD  BALCONY4BMOD,_worldtlx4
    DD  BALCONY5BMOD,_worldtlx5
    DD  END_LIST

tower_floor_info:
    DD  FL_TOWER        ; sag
    DD  _BALCO_P         ; palette for floor
    DD  64
    DD  _scrollx1
    DD  _skew_7


tower_scroll:
    DD  00000H*SCX/100  ; 8
    DD  00000H*SCX/100  ; 7
    DD  00000H*SCX/100  ; 6
    DD  04000H*SCX/100  ; 5
    DD  08000H*SCX/100  ; 4
    DD  0c000H*SCX/100  ; 3
    DD  010000H*SCX/100 ; 2
    DD  016000H*SCX/100 ; 1
    DD  020000H*SCX/100 ; 0

dlists_tower:
    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD   - 1,_floor_code
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _baklst8,_worldtlx1 + 16/8      ; torch
    DD   - 1,_shadow_p1p2
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**      HIDDEN NOWALL MODULE DATA          **
;*********************************
    ALIGN 4
    PUBLIC _nowall_module
_nowall_module:
    DW  0               ; autoerase color
    DW  0                   ; initial world y
    DW  0dcH                ; ground y offset
    DW  320             ; initial world x
    DW  010H                ; scroll left limit
    DW  0268H                ; scroll right limit

    DD  _calla_return
    DD  tower_scroll        ; scroll table
    DD  dlists_tower

    DD  _bakmods
;   dw  BALCONY1BMOD        ; _baklst1 = front walls
;   dh  $ffd8,$ffee - 44
    DD  SKIP_BAKMOD         ; _baklst1 = front walls
    DD  BALCONY2BMOD        ; _baklst2 = 2 side walls
    DW  08H,0ffe0H
    DD  BALCONY3BMOD        ; _baklst3 = well
    DW  006H,060H
    DD  BALCONY4BMOD        ; _baklst4 = pillars
    DW  000H,0fff8H
    DD  BALCONY5BMOD        ; _baklst5 = distant candles
    DW  000H,030H

    DD  CENTER_X
    DD  BALCONY1BMOD,_worldtlx1
    DD  BALCONY2BMOD,_worldtlx2
    DD  BALCONY3BMOD,_worldtlx3
    DD  BALCONY4BMOD,_worldtlx4
    DD  BALCONY5BMOD,_worldtlx5
    DD  END_LIST

nowall_floor_info:
    DD  FL_TOWER        ; sag
    DD  _BALCO_P         ; palette for floor
    DD  64
    DD  _scrollx1
    DD  _skew_7

;*********************************
;**         FLOOR DATA          **
;*********************************
    PUBLIC _soflor_addr
_soflor_addr:
    DD  _soflor_FLR

    ALIGN 4
    include bkgd\floors\soul\soflor.asm

    ALIGN 4
FL_TOWER:
    include bkgd\floors\balcony2\balcflr.asm



    END_DATA
    end
