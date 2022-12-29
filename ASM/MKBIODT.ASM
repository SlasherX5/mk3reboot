;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Bio Module
;******************************************************************************/

     
 	include win95.i  ;: mkbiodt.s
	include compress.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _dlists_buyin : DWORD
    EXTERN  _no_scroll : DWORD

	BEGIN_DATA 

    ALIGN 4
	include palsrc\mkbiopal.nts


;subzerobio_ovl: group
;    section ..biodata_l1d




;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
;    include palsrc\biosz.mas
;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\subzero\subbio.mod

    ALIGN 4
    PUBLIC _subbio_module
_subbio_module:
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
    DD  submodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _subzerobio_txt
_subzerobio_txt:
    include .\attract\bio\subzero\subbio.TPGSUFF

endif

;******************************************************************************/
;******************************************************************************/
;liabio_ovl: group
    ;section ..biodata_l1f

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biolia.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\lia\sinbio.mod

    ALIGN 4
    PUBLIC _liabio_module
_liabio_module:
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
    DD  sindelmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _liabio_txt
_liabio_txt:
    include .\attract\bio\lia\sinbio.TPGSUFF

endif

;**
;**
;lkangbio_ovl: group
    ;section ..biodata_l26

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biolkang.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\lkang\kangbio.mod

    ALIGN 4
    PUBLIC _lkbio_module
_lkbio_module:
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
    DD  kangmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _lkangbio_txt
_lkangbio_txt:
    include .\attract\bio\lkang\kangbio.TPGSUFF

endif

;**
;**
;shangbio_ovl: group
    ;section ..biodata_l25
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\bioshang.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\shang\shangbio.mod

    ALIGN 4
    PUBLIC _stbio_module
_stbio_module:
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
    DD  shangmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _shangbio_txt
_shangbio_txt:
    include .\attract\bio\shang\shangbio.TPGSUFF

endif

;*
;*
;sheevabio_ovl: group
    ;section ..biodata_l24

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biosg.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\femgoro\shevabio.mod

    ALIGN 4
    PUBLIC _sgbio_module
_sgbio_module:
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
    DD  sheevamodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _sheevabio_txt
_sheevabio_txt:
    include .\attract\bio\femgoro\shevabio.TPGSUFF

endif
;*
;*
;tuskbio_ovl: group
    ;section ..biodata_l23
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biotusk.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\tusk\kabbio.mod

    ALIGN 4
    PUBLIC _tuskbio_module
_tuskbio_module:
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
    DD  kabalmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _tuskbio_txt
_tuskbio_txt:
    include .\attract\bio\tusk\kabbio.TPGSUFF

endif
;*
;*
;robo1bio_ovl: group
    ;section ..biodata_l20
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biorobo1.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\robo1\sekbio.mod

    ALIGN 4
    PUBLIC _robo1bio_module
_robo1bio_module:
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
    DD  sektormodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _robo1bio_txt
_robo1bio_txt:
    include .\attract\bio\robo1\sekbio.TPGSUFF

endif

;*
;*
;swatbio_ovl: group
    ;section ..biodata_l1e
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\bioswat.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\swat\copbio.mod

    ALIGN 4
    PUBLIC _swatbio_module
_swatbio_module:
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
    DD  copmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _swatbio_txt
_swatbio_txt:
    include .\attract\bio\swat\copbio.TPGSUFF

endif

;*
;*
;kanobio_ovl: group
    ;section ..biodata_l19
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biokano.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\kano\kanobio.mod

    ALIGN 4
    PUBLIC _kanobio_module
_kanobio_module:
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
    DD  kanomodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0


if 0
    ALIGN 4
    PUBLIC _kanobio_txt
_kanobio_txt:
    include .\attract\bio\kano\kanobio.TPGSUFF

endif
;*
;*
;sonyabio_ovl: group
    ;section ..biodata_l1a
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biosonya.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\sonya\sonyabio.mod

    ALIGN 4
    PUBLIC _sonyabio_module
_sonyabio_module:
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
    DD  sonyamodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _sonyabio_txt
_sonyabio_txt:
    include .\attract\bio\sonya\sonyabio.TPGSUFF
endif

;*
;*
;indianbio_ovl: group
    ;section ..biodata_l1c
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\bioind.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\indian\indibio.mod

    ALIGN 4
    PUBLIC _indbio_module
_indbio_module:
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
    DD  indymodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _indianbio_txt
_indianbio_txt:
    include .\attract\bio\indian\indibio.TPGSUFF
endif

;*
;*
;robo2bio_ovl: group
    ;section ..biodata_l21
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biorobo2.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\robo2\cyraxbio.mod

    ALIGN 4
    PUBLIC _robo2bio_module
_robo2bio_module:
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
    DD  cyraxmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _robo2bio_txt
_robo2bio_txt:
    include .\attract\bio\robo2\cyraxbio.TPGSUFF
endif

;*
;*
;jaxbio_ovl: group
    ;section ..biodata_l1b
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biojax.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\jax\jaxbio.mod

    ALIGN 4
    PUBLIC _jaxbio_module
_jaxbio_module:
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
    DD  jaxmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _jaxbio_txt
_jaxbio_txt:
    include .\attract\bio\jax\jaxbio.TPGSUFF
endif

;*
;*
;laobio_ovl: group
    ;section ..biodata_l22
;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    ; include palsrc\biolao.mas


;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\bio\lao\kungbio.mod

    ALIGN 4
    PUBLIC _laobio_module
_laobio_module:
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
    DD  kungmodBMOD
    DW  0fff4H,4
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _laobio_txt
_laobio_txt:
    include .\attract\bio\lao\kungbio.TPGSUFF
endif

    END_DATA
    end
