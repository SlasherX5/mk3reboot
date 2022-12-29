;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Pit Module
;******************************************************************************/

 	include win95.i  ;: mkmock.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************

;*********************************
;**         PALETTES
;*********************************
    ;ALIGN 4
;   include palsrc\pitpal.mas
    EXTERN _mockpit_CLT : DWORD

;*********************************
;**      MODULE DATA            **
;*********************************

	BEGIN_DATA

    ALIGN 4
    include .\bkgd\mockpit\mockpit.mod

    ALIGN 4
    PUBLIC _mockpit_module
_mockpit_module:
    DW  0               ; autoerase color
    DW  000H            ; initial world y
    DW  0d4H                ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  640             ; scroll right limit

    DD  _calla_return                ; routine to call
    DD  pit_scroll          ; scroll table
    DD  dlists_pit

    DD  _bakmods
    DD  MKPIT1BMOD          ; _baklst1 = floor
    DW  018H,0ffe2H
    DD  MKPIT2BMOD          ; _baklst2 = side nose
    DW  000H,004H
    DD  MKPIT3BMOD          ; _baklst3 = lights
    DW  0fff8H,066H
    DD  MKPIT4BMOD          ; _baklst4 = backplane
    DW  0fff0H,01eH + 10

    DD  CENTER_X
    DD  MKPIT1BMOD,_worldtlx1
    DD  MKPIT2BMOD,_worldtlx2
    DD  MKPIT3BMOD,_worldtlx3
    DD  MKPIT4BMOD,_worldtlx4
    DD  0,0

pit_scroll:
    DD  0*SCX/100               ; 8
    DD  0*SCX/100               ; 7
    DD  000H*SCX/100                ; 6
    DD  000H*SCX/100                ; 5
    DD  0*SCX/100           ; 4
    DD  08000H*SCX/100          ; 3
    DD  0c000H*SCX/100          ; 2
    DD  020000H*SCX/100         ; 1
    DD  020000H*SCX/100         ; player list

dlists_pit:
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
;   dw   - 1,_floor_code
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**         FLOOR DATA          **
;*********************************
    ALIGN 4


    END_DATA
    end
