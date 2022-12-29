;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Portal Module
;******************************************************************************/

     

 	include win95.i  ;: mkportal.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _mk3_calla : DWORD

;*********************************
;**         PALETTES
;*********************************



    ;ALIGN 4
;   include palsrc\portpal.mas
    EXTERN _MKHIDDEN_CLT : DWORD
    EXTERN _WARP_P : DWORD

;*********************************
;**         ANIMATIONS          **
;*********************************
	BEGIN_DATA
    ALIGN 4
    PUBLIC _portal_anims
_portal_anims:
    PUBLIC _a_portal_zap
_a_portal_zap:
    DD _PORTAL01 - _portal_anims
    DD _PORTAL02 - _portal_anims
    DD _PORTAL03 - _portal_anims
    DD _PORTAL04 - _portal_anims
    DD _PORTAL05 - _portal_anims
    DD _PORTAL06 - _portal_anims
    DD _PORTAL07 - _portal_anims
    DD _PORTAL08 - _portal_anims
    DD _PORTAL09 - _portal_anims
    DD _PORTAL11 - _portal_anims
    DD _PORTAL12 - _portal_anims
    DD _PORTAL13 - _portal_anims
    DD _PORTAL14 - _portal_anims
    DD _PORTAL17 - _portal_anims
    DD 0

    ALIGN 4
    PUBLIC _PORTAL01
_PORTAL01:
    DD _PORTAL01_TPG - _portal_anims
    DW 18, 8, 0, 0
    DD   _WARP_P
_PORTAL01_TPG:
    DW  0,   165,   108,    0

    ALIGN 4
    PUBLIC _PORTAL02
_PORTAL02:
    DD _PORTAL02_TPG - _portal_anims
    DW 31, 26, 0, 0
_PORTAL02_TPG:
    DW  1,   157,   192,    0

    ALIGN 4
    PUBLIC _PORTAL03
_PORTAL03:
    DD _PORTAL03_TPG - _portal_anims
    DW 30, 26, 0, 0
_PORTAL03_TPG:
    DW  1,   189,   192,    0

    ALIGN 4
    PUBLIC _PORTAL04
_PORTAL04:
    DD _PORTAL04_TPG - _portal_anims
    DW 31, 24, 0,  - 1
_PORTAL04_TPG:
    DW  1,   221,   192,    0

    ALIGN 4
    PUBLIC _PORTAL05
_PORTAL05:
    DD _PORTAL05_TPG - _portal_anims
    DW 30, 21, 0,  - 2
_PORTAL05_TPG:
    DW  1,   157,   218,    0

    ALIGN 4
    PUBLIC _PORTAL06
_PORTAL06:
    DD _PORTAL06_TPG - _portal_anims
    DW 25, 17,  - 1,  - 5
_PORTAL06_TPG:
    DW  1,   189,   218,    0

    ALIGN 4
    PUBLIC _PORTAL07
_PORTAL07:
    DD _PORTAL07_TPG - _portal_anims
    DW 21, 14,  - 2,  - 8
_PORTAL07_TPG:
    DW  1,   145,   239,    0

    ALIGN 4
    PUBLIC _PORTAL08
_PORTAL08:
    DD _PORTAL08_TPG - _portal_anims
    DW 12, 7,  - 8,  - 12
_PORTAL08_TPG:
    DW  0,   165,   175,    0

    ALIGN 4
    PUBLIC _PORTAL09
_PORTAL09:
    DD _PORTAL09_TPG - _portal_anims
    DW 9, 9,  - 10,  - 9
_PORTAL09_TPG:
    DW  0,   165,   182,    0

    ALIGN 4
    PUBLIC _PORTAL11
_PORTAL11:
    DD _PORTAL11_TPG - _portal_anims
    DW 14, 9,  - 10,  - 4
_PORTAL11_TPG:
    DW  0,   165,   145,    0

    ALIGN 4
    PUBLIC _PORTAL12
_PORTAL12:
    DD _PORTAL12_TPG - _portal_anims
    DW 22, 17,  - 4,  - 3
_PORTAL12_TPG:
    DW  1,   217,   218,    0

    ALIGN 4
    PUBLIC _PORTAL13
_PORTAL13:
    DD _PORTAL13_TPG - _portal_anims
    DW 18, 15,  - 5,  - 5
_PORTAL13_TPG:
    DW  0,   165,   116,    0

    ALIGN 4
    PUBLIC _PORTAL14
_PORTAL14:
    DD _PORTAL14_TPG - _portal_anims
    DW 15, 14,  - 7,  - 6
_PORTAL14_TPG:
    DW  0,   165,   131,    0

    ALIGN 4
    PUBLIC _PORTAL17
_PORTAL17:
    DD _PORTAL17_TPG - _portal_anims
    DW 9, 9,  - 9,  - 8
_PORTAL17_TPG:
    DW  0,   165,   191,    0

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\bkgd\hidden\mkhidden.mod

    ALIGN 4
    PUBLIC _portal_module
_portal_module:
    DW  0               ; autoerase color
    DW  000H                ; initial world y
    DW  0d0H                ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  640         ; scroll right limit

    DD  _mk3_calla           ; routine: make lightning proc
    DD  portal_scroll           ; scroll table
    DD  dlists_portal

    DD  _bakmods
    DD  SKIP_BAKMOD             ; _baklst1 = skip (lightning)
    DD  HIDDEN1BMOD         ; _baklst2 = floor
    DW  000H,0b0H
    DD  HIDDEN2BMOD         ; _baklst3 = portal sky
    DW  000H,0FFF0H

    DD  CENTER_X
    DD  HIDDEN2BMOD,_worldtlx1
    DD  HIDDEN1BMOD,_worldtlx2
    DD  HIDDEN2BMOD,_worldtlx3
    DD  0,0

portal_scroll:
    DD  0       ; 8
    DD  0       ; 7
    DD  0       ; 6
    DD  0       ; 5
    DD  0       ; 4
    DD  0       ; 3
    DD  020000H*SCX/100     ; 2
    DD  0       ; 1
    DD  020000H*SCX/100         ; player list

dlists_portal:
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**         FLOOR DATA          **
;*********************************
    ALIGN 4


    END_DATA
    end
