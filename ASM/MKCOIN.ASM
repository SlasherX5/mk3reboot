
;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III coin Module
;******************************************************************************/

     

;l14: group
    ;section    .bkgddata_l14

    include win95.i  ;: mkcoin.s
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
    include palsrc\coinpal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\coin\mk3coin.mod

    ALIGN 4
    PUBLIC _coin_module
_coin_module:
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
    DD  coinmodBMOD
    DW  0ffbeH,0ff98H
    DD  FORCE_EXIT
    DD  0



    END_DATA
    end
