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

     

;l18: group
    ;section    .bkgddata_l18

    include win95.i  ;: mkstry3.s
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
    include palsrc\stry3pal.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4

;*********************************
;**      MODULE DATA  STORY 3A
;*********************************
    ALIGN 4
    include .\attract\story\story3\city.mod

    ALIGN 4
    PUBLIC _story3a_module

_story3a_module:
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
    DD  citymodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0

;*********************************
;**      MODULE DATA  STORY 3B
;*********************************
    ALIGN 4
    include .\attract\story\story3\souls.mod

    ALIGN 4
    PUBLIC _story3b_module

_story3b_module:
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
    DD  soulmodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0

;*********************************
;**      MODULE DATA  STORY 3C
;*********************************
    ALIGN 4
    include .\attract\story\story3\heroes.mod

    ALIGN 4
    PUBLIC _story3c_module

_story3c_module:
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
    DD  heromodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0

;*********************************
;**      MODULE DATA  STORY 3D
;*********************************
    ALIGN 4
    include .\attract\story\story3\centaurs.mod

    ALIGN 4
    PUBLIC _story3d_module

_story3d_module:
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
    DD  centmodBMOD
    DW  0ffe6H,0ffd8H
    DD  FORCE_EXIT
    DD  0



    END_DATA
    end