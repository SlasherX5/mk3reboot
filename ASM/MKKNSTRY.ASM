;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Story Kano Module
;******************************************************************************/

     

;l19: group
    ;section .bkgddata_l19

 	include win95.i  ;: mkknstry.s
    include mkchar.i
    include mkbkgd.i


;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _dlists_buyin : DWORD
    EXTERN  _no_scroll : DWORD

	BEGIN_DATA

;*********************************
;**         PALETTES
;*********************************
    ALIGN 4
    include palsrc\strykpal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA  STORY Kano
;*********************************
    ALIGN 4
    include .\attract\story\kanostor\escape.mod

    ALIGN 4
    PUBLIC _storykn_module

_storykn_module:
    DW  NULL_IRQSKYE        ; autoerase color
    DW  0               ; initial world y
    DW  0               ; ground y
    DW  0               ; initial worldx
    DW  0               ; scroll left limit
    DW  0               ; scroll right limit
    DD  _calla_return
    DD  _no_scroll           ; scroll table
    DD  _dlists_buyin
    DD  _bakmods
    DD  escapemodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0



    END_DATA
    end
