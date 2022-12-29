;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III title Module
;******************************************************************************/

     

;l16: group
    ;section    .bkgddata_l16

    include win95.i  ;: mktitle.s
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

	BEGIN_DATA

    ALIGN 4
    include palsrc\titlepal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA  MK3 LOGO          **
;*********************************
    ALIGN 4
    include attract\title\titlepg.mod

    ALIGN 4
    PUBLIC _title_module

_title_module:
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
    DD  titlemodBMOD
    DW  16,16
    DD  FORCE_EXIT
    DD  0

;*********************************
;**      MODULE DATA  RAID MESSAGE          **
;*********************************
    ALIGN 4
    include attract\title\raidfly.mod

    ALIGN 4
    PUBLIC _raidfly_module

_raidfly_module:
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
    DD  raid2modBMOD
    DW   - 16,8
    DD  FORCE_EXIT
    DD  0


;*********************************
;**      MODULE DATA  LEGALS        **
;*********************************
    ALIGN 4
    include attract\title\legal.mod

    ALIGN 4
    PUBLIC _legal_module

_legal_module:
    DW  0   ;NULL_IRQSKYE       ; autoerase color
    DW  0               ; initial world y
    DW  0               ; ground y
    DW  0               ; initial worldx
    DW  0               ; scroll left limit
    DW  0               ; scroll right limit
    DD  _calla_return
    DD  _no_scroll           ; scroll table
    DD  _dlists_buyin
    DD  _bakmods
    DD  legalmodBMOD
    DW   - 16,0
    DD  FORCE_EXIT
    DD  0




    END_DATA
    end
