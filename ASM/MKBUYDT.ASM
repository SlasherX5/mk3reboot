;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Mortal Kombat Buyin Screen
;******************************************************************************/

    include win95.i  ;: mkbuybt.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _dlists_buyin : DWORD
    EXTERN  _no_scroll : DWORD

;*********************************
;**         PALETTES
;*********************************
    EXTERN _mkbuyin_CLT : DWORD

	BEGIN_DATA

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include attract\buyin\mkbuyin.mod

    ALIGN 4
;**************************************************************************
;*                                               *
;*  module: buyin
;*                                               *
;**************************************************************************
    ALIGN 4
    PUBLIC _buyin_module
_buyin_module:
    DW  NULL_IRQSKYE            ; autoerase color
    DW  4               ; initial world y
    DW  0e8H                    ; ground y
    DW  6               ; initial worldx
    DW  -050H               ; scroll left limit
    DW  0fffH               ; scroll right limit

    DD  _calla_return
    DD  _no_scroll           ; scroll table
    DD  _dlists_buyin

    DD  _bakmods

    DD  buyintopBMOD
    DW  0fff7H,-24+5
    DD  buyinbotBMOD
    DW  0fff4H,060H+5

    DD  FORCE_EXIT
    DD  0

    END_DATA
    end
