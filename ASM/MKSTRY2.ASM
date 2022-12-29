;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Story 2 Module
;******************************************************************************/

     

;l17: group
    ;section    .bkgddata_l17

    include win95.i  ;: mkstry2.s
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
    include palsrc\stry2pal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA  STORY 2A
;*********************************
    ALIGN 4
    include .\attract\story\story2\grnkahn.mod

    ALIGN 4
    PUBLIC _story2a_module

_story2a_module:
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
    DD  kahnmodBMOD
    DW  0ffe0H,0ffd8H
    DD  FORCE_EXIT
    DD  0

;*********************************
;**      MODULE DATA  STORY 2B
;*********************************
    ALIGN 4
    include .\attract\story\story2\lia.mod

    ALIGN 4
    PUBLIC _story2b_module

_story2b_module:
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
    DD  liamodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0

;*********************************
;**      MODULE DATA  STORY 2C
;*********************************
    ALIGN 4
    include .\attract\story\story2\earth.mod

    ALIGN 4
    PUBLIC _story2c_module

_story2c_module:
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
    DD  earthmodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0



    END_DATA
    end