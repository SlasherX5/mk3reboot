
include win95.i

;******************************************************************************
; File: mkbrig.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III City Module
;******************************************************************************/

;l4 group:
;   section .bkgddata_l4

    BEGIN_DATA

include mkchar.i
include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _bridge_calla : DWORD

;*********************************
;**         PALETTES
;*********************************
    ALIGN 4
;   include palsrc\brigpal.mas
    EXTERN _MKBRIDGE_CLT : DWORD
    EXTERN _PAPER_P : DWORD
    EXTERN _BRGRD_P : DWORD

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _bridge_anims
_bridge_anims:

    PUBLIC _a_paper1
_a_paper1:
    DD _PAPER1-_bridge_anims
    DD _PAPER2-_bridge_anims
    DD _PAPER3-_bridge_anims
    DD _PAPER4-_bridge_anims
    DD _PAPER5-_bridge_anims
    DD _PAPER6-_bridge_anims
    DD _PAPER7-_bridge_anims
    DD _PAPER8-_bridge_anims
    DD _PAPER9-_bridge_anims
    DD 0

    PUBLIC _a_big_paper
_a_big_paper:
    DD _LGSHEET1-_bridge_anims
    DD _LGSHEET2-_bridge_anims
    DD _LGSHEET3-_bridge_anims
    DD _LGSHEET4-_bridge_anims
    DD _LGSHEET5-_bridge_anims
    DD _LGSHEET6-_bridge_anims
    DD _LGSHEET7-_bridge_anims
    DD _LGSHEET8-_bridge_anims
    DD _LGSHEET9-_bridge_anims
    DD ani_jump
    DD _a_big_paper-_bridge_anims

    PUBLIC _a_lil_paper
_a_lil_paper:
    DD _SMSHEET1-_bridge_anims
    DD _SMSHEET2-_bridge_anims
    DD _SMSHEET3-_bridge_anims
    DD _SMSHEET4-_bridge_anims
    DD _SMSHEET5-_bridge_anims
    DD _SMSHEET6-_bridge_anims
    DD _SMSHEET7-_bridge_anims
    DD _SMSHEET8-_bridge_anims
    DD _SMSHEET9-_bridge_anims
    DD ani_jump
    DD _a_lil_paper-_bridge_anims

    PUBLIC _a_leaf
_a_leaf:
    DD _LEAF1-_bridge_anims
    DD _LEAF2-_bridge_anims
    DD _LEAF3-_bridge_anims
    DD _LEAF4-_bridge_anims
    DD _LEAF5-_bridge_anims
    DD _LEAF6-_bridge_anims
    DD _LEAF7-_bridge_anims
    DD _LEAF8-_bridge_anims
    DD ani_jump
    DD _a_leaf-_bridge_anims

    ALIGN 4
    PUBLIC _PAPER1
_PAPER1:
    DD PAPER1_TPG-_bridge_anims
    DW 18, 12, 7, 11
    DD   _PAPER_P
PAPER1_TPG:
    DW 0,   129,   225,    0

    ALIGN 4
    PUBLIC _PAPER2
_PAPER2:
    DD PAPER2_TPG-_bridge_anims
    DW 18, 12, 7, 11
PAPER2_TPG:
    DW 0,   169,   225,    0

    ALIGN 4
    PUBLIC _PAPER3
_PAPER3:
    DD PAPER3_TPG-_bridge_anims
    DW 18, 12, 7, 11
PAPER3_TPG:
    DW 0,   213,   234,    0

    ALIGN 4
    PUBLIC _PAPER4
_PAPER4:
    DD PAPER4_TPG-_bridge_anims
    DW 18, 11, 7, 10
PAPER4_TPG:
    DW 0,   129,   237,    0

    ALIGN 4
    PUBLIC _PAPER5
_PAPER5:
    DD PAPER5_TPG-_bridge_anims
    DW 18, 10, 7, 9
PAPER5_TPG:
    DW 0,   169,   237,    0

    ALIGN 4
    PUBLIC _PAPER6
_PAPER6:
    DD PAPER6_TPG-_bridge_anims
    DW 19, 10, 7, 9
PAPER6_TPG:
    DW 0,   149,   225,    0

    ALIGN 4
    PUBLIC _PAPER7
_PAPER7:
    DD PAPER7_TPG-_bridge_anims
    DW 20, 12, 7, 11
PAPER7_TPG:
    DW 0,   189,   225,    0

    ALIGN 4
    PUBLIC _PAPER8
_PAPER8:
    DD PAPER8_TPG-_bridge_anims
    DW 19, 14, 9, 13
PAPER8_TPG:
    DW 0,    81,   175,    0

    ALIGN 4
    PUBLIC _PAPER9
_PAPER9:
    DD PAPER9_TPG-_bridge_anims
    DW 20, 15, 8, 14
PAPER9_TPG:
    DW 0,   149,   235,    0

    ALIGN 4
    PUBLIC _LGSHEET1
_LGSHEET1:
    DD LGSHEET1_TPG-_bridge_anims
    DW 9, 17, 4, 8
    DD   _PAPER_P
LGSHEET1_TPG:
    DW 0,   117,     5,    0

    ALIGN 4
    PUBLIC _LGSHEET2
_LGSHEET2:
    DD LGSHEET2_TPG-_bridge_anims
    DW 12, 12, 3, 4
LGSHEET2_TPG:
    DW 0,   237,    75,    0

    ALIGN 4
    PUBLIC _LGSHEET3
_LGSHEET3:
    DD LGSHEET3_TPG-_bridge_anims
    DW 14, 11, 2, 3
LGSHEET3_TPG:
    DW 0,   237,    96,    0

    ALIGN 4
    PUBLIC _LGSHEET4
_LGSHEET4:
    DD LGSHEET4_TPG-_bridge_anims
    DW 11, 13, 2, 3
LGSHEET4_TPG:
    DW 0,     1,   232,    0

    ALIGN 4
    PUBLIC _LGSHEET5
_LGSHEET5:
    DD LGSHEET5_TPG-_bridge_anims
    DW 5, 14, 0, 4
LGSHEET5_TPG:
    DW 0,    49,   232,     0

    ALIGN 4
    PUBLIC _LGSHEET6
_LGSHEET6:
    DD LGSHEET6_TPG-_bridge_anims
    DW 11, 13, 5, 3
LGSHEET6_TPG:
    DW 0,   237,    62,    0

    ALIGN 4
    PUBLIC _LGSHEET7
_LGSHEET7:
    DD LGSHEET7_TPG-_bridge_anims
    DW 14, 14, 6, 3
LGSHEET7_TPG:
    DW 0,   189,   237,    0

    ALIGN 4
    PUBLIC _LGSHEET8
_LGSHEET8:
    DD LGSHEET8_TPG-_bridge_anims
    DW 11, 14, 3, 4
LGSHEET8_TPG:
    DW 0,   117,    42,    0

    ALIGN 4
    PUBLIC _LGSHEET9
_LGSHEET9:
    DD LGSHEET9_TPG-_bridge_anims
    DW 9, 14, 3, 6
LGSHEET9_TPG:
    DW 0,    13,   232,    0

    ALIGN 4
    PUBLIC _SMSHEET1
_SMSHEET1:
    DD SMSHEET1_TPG-_bridge_anims
    DW 7, 14, 3, 7
    DD   _PAPER_P
SMSHEET1_TPG:
    DW 0,   205,   237,     0

    ALIGN 4
    PUBLIC _SMSHEET2
_SMSHEET2:
    DD SMSHEET2_TPG-_bridge_anims
    DW 8, 9, 2, 4
SMSHEET2_TPG:
    DW 0,    25,   232,     0

    ALIGN 4
    PUBLIC _SMSHEET3
_SMSHEET3:
    DD SMSHEET3_TPG-_bridge_anims
    DW 10, 9, 2, 3
SMSHEET3_TPG:
    DW 0,   237,    87,    0

    ALIGN 4
    PUBLIC _SMSHEET4
_SMSHEET4:
    DD SMSHEET4_TPG-_bridge_anims
    DW 8, 10, 0, 3
SMSHEET4_TPG:
    DW 0,    33,   232,     0

    ALIGN 4
    PUBLIC _SMSHEET5
_SMSHEET5:
    DD SMSHEET5_TPG-_bridge_anims
    DW 3, 11, 0, 4
SMSHEET5_TPG:
    DW 0,   249,    11,     0

    ALIGN 4
    PUBLIC _SMSHEET6
_SMSHEET6:
    DD SMSHEET6_TPG-_bridge_anims
    DW 9, 9, 4, 3
SMSHEET6_TPG:
    DW 0,   117,    22,    0

    ALIGN 4
    PUBLIC _SMSHEET7
_SMSHEET7:
    DD SMSHEET7_TPG-_bridge_anims
    DW 10, 11, 6, 4
SMSHEET7_TPG:
    DW 0,   117,    31,    0

    ALIGN 4
    PUBLIC _SMSHEET8
_SMSHEET8:
    DD SMSHEET8_TPG-_bridge_anims
    DW 9, 11, 4, 5
SMSHEET8_TPG:
    DW 0,   101,   175,    0

    ALIGN 4
    PUBLIC _SMSHEET9
_SMSHEET9:
    DD SMSHEET9_TPG-_bridge_anims
    DW 6, 10, 4, 5
SMSHEET9_TPG:
    DW 0,    41,   232,     0

    ALIGN 4
    PUBLIC _LEAF1
_LEAF1:
    DD LEAF1_TPG-_bridge_anims
    DW 5, 3, 3, 1
    DD   _PAPER_P
LEAF1_TPG:
    DW 0,   213,   246,     0

    ALIGN 4
    PUBLIC _LEAF2
_LEAF2:
    DD LEAF2_TPG-_bridge_anims
    DW 3, 3, 2, 2
LEAF2_TPG:
    DW 0,   249,     5,     0

    ALIGN 4
    PUBLIC _LEAF3
_LEAF3:
    DD LEAF3_TPG-_bridge_anims
    DW 3, 3, 1, 2
LEAF3_TPG:
    DW 0,    81,    71,     0

    ALIGN 4
    PUBLIC _LEAF4
_LEAF4:
    DD LEAF4_TPG-_bridge_anims
    DW 4, 3, 1, 1
LEAF4_TPG:
    DW 0,   209,   225,     0

    ALIGN 4
    PUBLIC _LEAF5
_LEAF5:
    DD LEAF5_TPG-_bridge_anims
    DW 2, 4, 0, 2
LEAF5_TPG:
    DW 0,   249,     1,     0

    ALIGN 4
    PUBLIC _LEAF6
_LEAF6:
    DD LEAF6_TPG-_bridge_anims
    DW 2, 3, 0, 0
LEAF6_TPG:
    DW 0,   249,     8,     0

    ALIGN 4
    PUBLIC _LEAF7
_LEAF7:
    DD LEAF7_TPG-_bridge_anims
    DW 3, 1, 2, -1
LEAF7_TPG:
    DW 0,   113,    97,     0

    ALIGN 4
    PUBLIC _LEAF8
_LEAF8:
    DD LEAF8_TPG-_bridge_anims
    DW 3, 1, 2, 0
LEAF8_TPG:
    DW 0,   233,   234,     0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
include bkgd\bridge\bridge.mod

    ALIGN 4
    PUBLIC _bridge_module
_bridge_module:
    DW (32*32*0)+(32*0)+0   ; autoerase color
    DW 000h             ; initial world y
    DW 0dah         ; ground y offset
    DW 320          ; initial world x
    DW 8            ; scroll left limit
    DW 632          ; scroll right limit

    DD _bridge_calla
    DD bridge_scroll        ; scroll table
    DD dlists_bridge

    DD _bakmods
    DD BRIDGE1BMOD      ; _baklst1 = bridge
    DW 0ffffh,0ffdeh
    DD BRIDGE2BMOD      ; _baklst2 = buildings
    DW 0e4h,0ffe1h
    DD BRIDGE3BMOD      ; _baklst3 = sky
    DW 0140h,0dh

    DD CENTER_X
    DD BRIDGE1BMOD,_worldtlx1
    DD BRIDGE1BMOD,_worldtlx4
    DD 0

bridge_floor_info:
    DD FL_BRIDG         ; sag
    DD _BRGRD_P         ; palette for floor
    DD 43
    DD _scrollx1
    DD _skew_7

bridge_scroll:
    DD 0*SCX/100            ; 8
    DD 0*SCX/100            ; 7
    DD 0*SCX/100            ; 6
    DD 0*SCX/100            ; 5
    DD 0*SCX/100            ; 4 - papers (this should match _baklst1)
    DD 0*SCX/100            ; 3 - far buildings and sky
    DD 08000h*SCX/100       ; 2 - close buildings
    DD 01a000h*SCX/100      ; 1 - bridge wall
    DD 020000h*SCX/100      ; 0 - players

dlists_bridge:
    DD _baklst3,_worldtlx3+16/8
    DD _baklst2,_worldtlx2+16/8
    DD _baklst1,_worldtlx1+16/8
    DD -1,_floor_code
    DD -1,_shadow_p1p2
    DD _baklst4,_worldtlx1+16/8       ; draw papers 1st
    DD _objlst,_worldtlx+16/8
    DD _objlst2,_worldtlx+16/8
    DD 0

;*********************************
;**         FLOOR DATA          **
;*********************************

    ALIGN 4
FL_BRIDG:
    include bkgd\floors\bridge\brgroad.asm
    END_DATA
    end
