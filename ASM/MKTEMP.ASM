;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Temple Module
;******************************************************************************/

 	include win95.i  ;: mktemp.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _temple_calla : DWORD

    EXTERN _MKTEMP2x_CLT : DWORD
    EXTERN _WIKS_P : DWORD
    EXTERN _SKFIRE_P : DWORD
    EXTERN _RCANDLE_P : DWORD
    EXTERN _templfl_p : DWORD

	BEGIN_DATA

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _temple_anims
_temple_anims:

    PUBLIC _a_tflame
_a_tflame:
    DD _SKTORCH1 - _temple_anims
    DD _SKTORCH2 - _temple_anims
    DD _SKTORCH3 - _temple_anims
    DD _SKTORCH4 - _temple_anims
    DD _SKTORCH5 - _temple_anims
    DD _SKTORCH6 - _temple_anims
    DD ani_jump
    DD _a_tflame - _temple_anims

    PUBLIC _a_candle_flame
_a_candle_flame:
    DD _wik1 - _temple_anims
    DD _wik2 - _temple_anims
    DD _wik3 - _temple_anims
    DD _wik4 - _temple_anims
    DD ani_jump
    DD _a_candle_flame - _temple_anims

    PUBLIC _SKTORCH1
_SKTORCH1:
    DD _SKTORCH1_TPG - _temple_anims
    DW 21, 42, 6, 42
    DD   _SKFIRE_P
_SKTORCH1_TPG:
    DW 0,    45,   182,    0

    PUBLIC _SKTORCH2
_SKTORCH2:
    DD _SKTORCH2_TPG - _temple_anims
    DW 22, 43, 7, 43
_SKTORCH2_TPG:
    DW 1,    69,    43,    0

    PUBLIC _SKTORCH3
_SKTORCH3:
    DD _SKTORCH3_TPG - _temple_anims
    DW 21, 45, 6, 45
_SKTORCH3_TPG:
    DW 1,    93,    69,    0

    PUBLIC _SKTORCH4
_SKTORCH4:
    DD _SKTORCH4_TPG - _temple_anims
    DW 22, 41, 7, 41
_SKTORCH4_TPG:
    DW 1,   133,    42,    0

    PUBLIC _SKTORCH5
_SKTORCH5:
    DD _SKTORCH5_TPG - _temple_anims
    DW 22, 37, 7, 37
_SKTORCH5_TPG:
    DW 1,   165,   123,    0

    PUBLIC _SKTORCH6
_SKTORCH6:
    DD _SKTORCH6_TPG - _temple_anims
    DW 21, 37, 6, 37
_SKTORCH6_TPG:
    DW 1,   193,    95,    0

    PUBLIC _wik1
_wik1:
    DD _wik1_TPG - _temple_anims
    DW 6, 14, 2, 14
    DD   _WIKS_P
_wik1_TPG:
    DW 0,    61,    23,     0

    PUBLIC _wik2
_wik2:
    DD _wik2_TPG - _temple_anims
    DW 6, 18, 2, 18
_wik2_TPG:
    DW 0,   245,    48,     0

    PUBLIC _wik3
_wik3:
    DD _wik3_TPG - _temple_anims
    DW 6, 18, 2, 17
_wik3_TPG:
    DW 0,   245,    66,     0

    PUBLIC _wik4
_wik4:
    DD _wik4_TPG - _temple_anims
    DW 7, 15, 2, 15
_wik4_TPG:
    DW 0,   245,    84,     0

    PUBLIC _KANDLE1
_KANDLE1:
    DD _KANDLE1_TPG - _temple_anims
    DW 17, 25, 7, 4
    DD   _RCANDLE_P
_KANDLE1_TPG:
    DW 0,    49,    37,    0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\bkgd\temple\mktemple.mod

    ALIGN 4
    PUBLIC _temple_module
_temple_module:
    DW  000H                    ; background color
    DW  000H                    ; initial world y
    DW  0d9H                ; ground y offset
    DW  320                 ; initial world x
    DW  32                  ; scroll left limit
    DW  600                 ; scroll right limit

    DD  _temple_calla
    DD  temple_scroll       ; scroll table
    DD  dlists_temple

;   dw  mktemple_TXT

    DD  _bakmods
    DD  temple1BMOD     ; _baklst1 = railing
    DW  014H,05fH + 08H
    DD  temple2BMOD     ; _baklst2 = poles table
    DW  0c6H,041H + 08H
    DD  temple3BMOD     ; _baklst3 = arc
    DW  00000H,0ffc2H + 08H
    DD  temple4BMOD     ; _baklst4 = stainglass
    DW  0aH,02H + 08H
    DD  temple0BMOD     ; _baklst5 = candles
    DW  000H,0c8H

    DD  CENTER_X
    DD  temple1BMOD,_worldtlx1
    DD  temple3BMOD,_worldtlx3
    DD  temple4BMOD,_worldtlx4
    DD  temple0BMOD,_worldtlx5
    DD  temple2BMOD,_worldtlx7
    DD  0

temple_floor_info:
    DD  FL_TEMP         ; sag
    DD  _templfl_p       ; palette for floor
    DD  51  ; + 10                ; skew height
    DD  _scrollx1        ; which scroll variable to follow
    DD  _skew_7

temple_scroll:
    DD  0*SCX/100           ; 8
    DD  0*SCX/100           ; 7  -  tony flame
    DD  0*SCX/100           ; 6  -  vogel flame
    DD  028000H*SCX/100         ; 5  -  candle
    DD  0a000H*SCX/100          ; 4
    DD  010000H*SCX/100         ; 3
    DD  014000H*SCX/100         ; 2
    DD  016000H*SCX/100         ; 1  -  this matches the floor
    DD  020000H*SCX/100     ; 0  -  player object list

dlists_temple:
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst7,_worldtlx2 + 16/8      ; tony flames
    DD  _baklst2,_worldtlx2 + 16/8
    DD   - 1,_floor_code
    DD   - 1,_shadow_p1p2
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _objlst,_worldtlx + 16/8
    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst6,_worldtlx5 + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**         FLOOR DATA          **
;*********************************
    ALIGN 4
FL_TEMP:
    include .\bkgd\floors\temple\tempfl.asm


    END_DATA
    end
