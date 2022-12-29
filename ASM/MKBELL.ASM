;******************************************************************************
; File: mkbell.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Bell Module
;*******************************************************************************/

    include win95.i
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _calla_bell : DWORD

;*********************************
;**         PALETTES **
;*********************************
    EXTERN _MKBELL_CLT : DWORD
    EXTERN _MKBELL2_CLT : DWORD
    EXTERN _BELFLR_P : DWORD
    EXTERN _BELHOLE_P : DWORD
    EXTERN _SPIKE_P : DWORD

    BEGIN_DATA

;*********************************
;**         ANIMATIONS          **
;*********************************

    PUBLIC _bell_anims
_bell_anims:

    PUBLIC _BELLHOLE2
_BELLHOLE2:
    DD _BELLHOLE2_TPG - _bell_anims
    DW 75, 47, 0, 0
    DD _BELHOLE_P
_BELLHOLE2_TPG:
    DW  1,    77,    44,    0

    PUBLIC _BELLHOLE1A
_BELLHOLE1A:
    DD _BELLHOLE1A_TPG - _bell_anims
    DW 86, 68, 0, 0
    DD _BELHOLE_P
_BELLHOLE1A_TPG:
    DW  0,   165,    26,    0

    PUBLIC _BELLHOLE1B
_BELLHOLE1B:
    DD _BELLHOLE1B_TPG - _bell_anims
    DW 83, 68, 0, 0
    DD _BELHOLE_P
_BELLHOLE1B_TPG:
    DW  0,   161,   142,    0

    PUBLIC _EJBSPIKE
_EJBSPIKE:
    DD _EJBSPIKE_TPG - _bell_anims
    DW 14, 118, 0, 0
    DD _SPIKE_P
_EJBSPIKE_TPG:
    DW  4,    69,     1,    0


;*********************************
;**      MODULE DATA            **
;*********************************
    ;CNOP 0,4
    include bkgd\BELL\mkBELL.mod
    include bkgd\BELL\mkBELL2.mod

    ;CNOP 0,4
    PUBLIC _bell_module
_bell_module:
    DW  (32*32*4) + (32*0) + 0  ; autoerase color
    DW  000H                    ; initial world y
    DW  220                 ; ground y
    DW  0 ; - 320/2               ; initial world x
    DW  0fef0H              ; scroll left limit
    DW  120 + 160                 ; scroll right limit
    DD  _calla_bell          ; routine to call
    DD  bell_scroll         ; scroll table
    DD  dlists_bell
    DD  _bakmods
    DD  MKBELL1BMOD         ; _baklst1 = fore rope
    DW  000H,0ffb0H
    DD  MKBELL2BMOD         ; _baklst2 = fore wall
    DW  000H,0ffd0H
    DD  MKBELL3BMOD         ; _baklst3 = mid ropes
    DW  000H,0ffd4H
    DD  MKBELL4BMOD         ; _baklst4 = mid wall
    DW  0ffecH,0ffd0H
    DD  MKBELL5BMOD         ; _baklst5 = mid bell
    DW  000H,0ffa0H
    DD  MKBELL6BMOD         ; _baklst6 = back wall
    DW  000H,0ffdaH
    DD  MKBELL7BMOD         ; _baklst7 = moon
    DW  020H,023H

    DD  CENTER_X
    DD  MKBELL1BMOD,_worldtlx1
    DD  MKBELL2BMOD,_worldtlx2
    DD  MKBELL3BMOD,_worldtlx3
    DD  MKBELL4BMOD,_worldtlx4
    DD  MKBELL5BMOD,_worldtlx5
    DD  MKBELL6BMOD,_worldtlx6
    DD  MKBELL7BMOD,_worldtlx7
    DD  END_LIST

    DD  FL_BELL             ; sag
    DD  _BELFLR_P            ; palette for floor
    DD  65                  ; floor height
    DD  _scrollx2            ; which scroll variable to follow
    DD  _skew_7

;**************************************************************************
;*                                               *
;*  module: Bell 2                                      *
;*                                               *
;**************************************************************************
    ;CNOP 0,4
    PUBLIC _bell2_module
_bell2_module:
    DW  (32*32*4) + (32*0) + 0      ; autoerase color
    DW  000H                ; initial world y
    DW  0e7H                ; ground y
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  640             ; scroll right limit
    DD  _calla_bell          ; routine to call
    DD  bell_scroll         ; scroll table
    DD  dlists_bell

    DD  _bakmods
    DD  SKIP_BAKMOD             ; _baklst1 =
    DD  SKIP_BAKMOD             ; _baklst2 =
    DD  SKIP_BAKMOD             ; _baklst3 =
    DD  SKIP_BAKMOD             ; _baklst4 =
    DD  SKIP_BAKMOD             ; _baklst5 =
    DD  SKIP_BAKMOD             ; _baklst6 =
    DD  SKIP_BAKMOD             ; _baklst7 =
    DD  MKTOWERBMOD         ; _baklst8 = the only plane
    DW  000H, - 070H

    DD  CENTER_X
    DD  MKTOWERBMOD,_worldtlx8
    DD  0,0

bell_scroll:
    DD  0*SCX/100       ; 8
    DD  04000H*SCX/100          ; 7
    DD  08000H*SCX/100          ; 6
    DD  0d000H*SCX/100          ; 5
    DD  010000H*SCX/100         ; 4
    DD  014000H*SCX/100         ; 3  -  back fence
    DD  018000H*SCX/100         ; 2  -  front fence
    DD  028000H*SCX/100         ; 1  -  bells
    DD  020000H*SCX/100         ; player list

dlists_bell:
    DD  _baklst8,_worldtlx8 + 16/8
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

;*********************************
;**         FLOOR DATA          **
;*********************************
    ;CNOP 0,4
FL_BELL:
    include bkgd\floors\bell\bellflor.asm

    END_DATA
    end