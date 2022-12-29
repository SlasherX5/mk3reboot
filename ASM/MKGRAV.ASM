;******************************************************************************
 include win95.i  ;: mkgrav.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Grave Yard Module
;******************************************************************************/

     

    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _grave_calla : DWORD

;*********************************
;**         PALETTES
;*********************************
; 	ALIGN 4
;   include palsrc\gravpal.mas
    EXTERN _MKGRAVE_CLT : DWORD
    EXTERN _MOONANI_P : DWORD
    EXTERN _GRAVES_P : DWORD
    EXTERN _CEMFLR_P : DWORD

	BEGIN_DATA


;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _grave_anims
_grave_anims:

    PUBLIC _a_moon
_a_moon:
    DD _MOONA28 - _grave_anims
    DD _MOONA2 - _grave_anims
    DD _MOONA4 - _grave_anims
    DD _MOONA6 - _grave_anims
    DD _MOONA8 - _grave_anims
    DD _MOONA10 - _grave_anims
    DD _MOONA12 - _grave_anims
    DD _MOONA14 - _grave_anims
    DD _MOONA16 - _grave_anims
    DD _MOONA18 - _grave_anims
    DD _MOONA20 - _grave_anims
    DD _MOONA22 - _grave_anims
    DD _MOONA24 - _grave_anims
    DD _MOONA26 - _grave_anims
    DD _MOONA28 - _grave_anims
    DD 0

    PUBLIC _VOGEL
_VOGEL:
    DD _VOGEL_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_VOGEL_TPG:
    DW  3,     1,   147,    0

    PUBLIC _BERAN
_BERAN:
    DD _BERAN_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_BERAN_TPG:
    DW  3,   121,    69,    0

    PUBLIC _GOSKIE
_GOSKIE:
    DD _GOSKIE_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_GOSKIE_TPG:
    DW  3,   197,    95,    0

    PUBLIC _MICHIC
_MICHIC:
    DD _MICHIC_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_MICHIC_TPG:
    DW  3,    37,   194,    0

    PUBLIC _BOON
_BOON:
    DD _BOON_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_BOON_TPG:
    DW  3,   121,   112,    0

    PUBLIC _TOBIAS
_TOBIAS:
    DD _TOBIAS_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_TOBIAS_TPG:
    DW  3,   193,   138,    0

    PUBLIC _LYDY
_LYDY:
    DD _LYDY_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_LYDY_TPG:
    DW  2,    89,   211,    0

    PUBLIC _MAY
_MAY:
    DD _MAY_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_MAY_TPG:
    DW  3,    37,   151,    0

    PUBLIC _MILLER
_MILLER:
    DD _MILLER_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_MILLER_TPG:
    DW  3,   157,   102,    0

    PUBLIC _SCHWARTZ
_SCHWARTZ:
    DD _SCHWARTZ_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_SCHWARTZ_TPG:
    DW  3,     1,   190,    0

    PUBLIC _GUIDO
_GUIDO:
    DD _GUIDO_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_GUIDO_TPG:
    DW  3,   157,   145,    0

    PUBLIC _ABBOT
_ABBOT:
    DD _ABBOT_TPG - _grave_anims
    DW 34, 43, 0, 0
    DD   _GRAVES_P
_ABBOT_TPG:
    DW  3,   121,   155,    0

    PUBLIC _MOONA2
_MOONA2:
    DD _MOONA2_TPG - _grave_anims
    DW 75, 65,  - 13, 0
    DD _MOONANI_P
_MOONA2_TPG:
    DW  2,    77,    66,    0

    PUBLIC _MOONA4
_MOONA4:
    DD _MOONA4_TPG - _grave_anims
    DW 76, 65,  - 12, 0
_MOONA4_TPG:
    DW  2,   165,    31,    0

    PUBLIC _MOONA6
_MOONA6:
    DD _MOONA6_TPG - _grave_anims
    DW 74, 65,  - 13, 0
_MOONA6_TPG:
    DW  2,     1,    89,    0

    PUBLIC _MOONA8
_MOONA8:
    DD _MOONA8_TPG - _grave_anims
    DW 89, 65, 0, 0
_MOONA8_TPG:
    DW  1,    97,     1,    0

    PUBLIC _MOONA10
_MOONA10:
    DD _MOONA10_TPG - _grave_anims
    DW 82, 65,  - 6, 0
_MOONA10_TPG:
    DW  1,     1,   145,    0

    PUBLIC _MOONA12
_MOONA12:
    DD _MOONA12_TPG - _grave_anims
    DW 93, 65, 0, 0
_MOONA12_TPG:
    DW  1,     1,     1,    0

    PUBLIC _MOONA14
_MOONA14:
    DD _MOONA14_TPG - _grave_anims
    DW 98, 65,  - 6, 0
_MOONA14_TPG:
    DW  0,   145,   126,   0

    PUBLIC _MOONA16
_MOONA16:
    DD _MOONA16_TPG - _grave_anims
    DW 96, 65,  - 11, 0
_MOONA16_TPG:
    DW  0,     1,   187,    0

    PUBLIC _MOONA18
_MOONA18:
    DD _MOONA18_TPG - _grave_anims
    DW 89, 65,  - 16, 0
_MOONA18_TPG:
    DW  1,     1,    66,    0

    PUBLIC _MOONA20
_MOONA20:
    DD _MOONA20_TPG - _grave_anims
    DW 79, 65,  - 16, 0
_MOONA20_TPG:
    DW  2,    85,     1,    0

    PUBLIC _MOONA22
_MOONA22:
    DD _MOONA22_TPG - _grave_anims
    DW 86, 65,  - 16, 0
_MOONA22_TPG:
    DW  1,    93,    66,    0

    PUBLIC _MOONA24
_MOONA24:
    DD _MOONA24_TPG - _grave_anims
    DW 83, 65,  - 16, 0
_MOONA24_TPG:
    DW  2,     1,     1,    0

    PUBLIC _MOONA26
_MOONA26:
    DD _MOONA26_TPG - _grave_anims
    DW 83, 65,  - 16, 0
_MOONA26_TPG:
    DW  1,    85,   131,    0

    PUBLIC _MOONA28
_MOONA28:
    DD _MOONA28_TPG - _grave_anims
    DW 72, 65,  - 16, 0
    DD _MOONANI_P
_MOONA28_TPG:
    DW  1,   181,   139,    0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include bkgd\grave\mkgrave.mod
;   include bkgd\grave\u64\u64grave.mod

    ALIGN 4
    PUBLIC _grave_module
_grave_module:
    DW  (32*32*4) + (32*0) + 0      ; autoerase color
    DW  000H                    ; initial world y
    DW  0e0H                ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  580             ; scroll right limit

    DD  _grave_calla         ; routine to call
    DD  grave_scroll            ; scroll table
    DD  dlists_grave

    DD  _bakmods
    DD  GRAVE1BMOD          ; _baklst1 = front grass
    DW  000H,009H
    DD  GRAVE2BMOD          ; _baklst2 = shovel
    DW  0fff8H,0ffe0H
    DD  GRAVE3BMOD          ; _baklst3 = tomb stones (cross)
    DW  008H,043H
    DD  GRAVE4BMOD          ; _baklst4 = big house
    DW  000H,04bH
    DD  GRAVE5BMOD          ; _baklst5 = small tree
    DW  0140H,02aH
    DD  GRAVE6BMOD          ; _baklst6 = death w/scyth
    DW  0ffe0H,068H
    DD  GRAVE7BMOD          ; _baklst7 = mountains
    DW  000H,039H

    DD  CENTER_X
    DD  GRAVE1BMOD,_worldtlx1
    DD  GRAVE2BMOD,_worldtlx2
    DD  GRAVE3BMOD,_worldtlx3
    DD  GRAVE4BMOD,_worldtlx4
    DD  GRAVE6BMOD,_worldtlx6
    DD  GRAVE7BMOD,_worldtlx7
    DD  0

    DD  FL_GRAVE            ; sag
    DD  _CEMFLR_P            ; palette for floor
    DD  36              ; floor height
    DD  _scrollx1            ; which scroll variable to follow
    DD  _skew_7

grave_scroll:
    DD  0*SCX/100           ; 8
    DD  00000H*SCX/100          ; 7
    DD  08000H*SCX/100          ; 6
    DD  0c000H*SCX/100              ; 5
    DD  010000H*SCX/100             ; 4
    DD  014000H*SCX/100             ; 3
    DD  018000H*SCX/100             ; 2
    DD  01c000H*SCX/100             ; 1
    DD  020000H*SCX/100             ; player list

dlists_grave:
    DD  _baklst8,_worldtlx8 + 16/8
    DD  _baklst7,_worldtlx7 + 16/8
    DD  _baklst6,_worldtlx6 + 16/8
    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _baklst9,_worldtlx1 + 16/8
    DD   - 1,_floor_code
    DD   - 1,_shadow_p1p2
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**         FLOOR DATA          **
;*********************************
    ALIGN 4
FL_GRAVE:
    include bkgd\floors\grave\cemflr.asm



    END_DATA
    end
