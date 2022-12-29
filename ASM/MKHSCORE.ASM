;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Mortal Kombat High Score Module
;******************************************************************************/

     

; l25: group
    ; section   .bkgddata_l25

    include win95.i  ;: mkhscore.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN _no_scroll : DWORD
    EXTERN _dlists_bogus : DWORD
	EXTERN STEELMODBMOD : DWORD

	BEGIN_DATA

;*********************************
;**         PALETTES                                **
;*********************************
    ALIGN 4
;    include palsrc\mkvspal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
; include .\attract\vs\steelvs.mod ; note this is in mkverse.asm linked in...

    ALIGN 4
    PUBLIC _hscore_module
_hscore_module:
    DW  0               ; autoerase color
    DW  000H                ; initial world y
    DW  000H                    ; ground y
    DW  000H                ; initial worldx
    DW   - 0500H              ; scroll left limit
    DW  0500H               ; scroll right limit

    DD  _calla_return
    DD  _no_scroll           ; scroll table
    DD  _dlists_bogus
    DD  _bakmods

    DD  STEELMODBMOD
    DW  0fffeH,007H
    DD  0ffffffffH
    DD  0               ; no floor here !!


    END_DATA
    end
