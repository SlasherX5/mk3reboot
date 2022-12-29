;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III All ending Modules
;******************************************************************************/

     

    include win95.i  ;: mkenddt.s
    include mkbkgd.i
	include compress.i


;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _dlists_buyin : DWORD
    EXTERN  _no_scroll : DWORD

    BEGIN_DATA

;********************************************************************************************************
;;kanoend_ovl: group
    ;;section   .enddata_l19

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endkano.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\kano\kanoend.mod

    ALIGN 4
    PUBLIC _kanoend_module
_kanoend_module:
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
    DW  0ffd8H,0ffd0H
    DD  text1BMOD
    DW  8 - 16,088H
    DD  text2BMOD
    DW  8 - 24,088H - 4
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _kanoend_txt
_kanoend_txt:
    include  attract\end\kano\kanoend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;;sonyaend_ovl: group
    ;;section   .enddata_l1a

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endsonya.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\sonya\sonyaend.mod

    ALIGN 4
    PUBLIC _sonyaend_module
_sonyaend_module:
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
    DW  0ffd8H,0ffd0H
    DD  sontext1BMOD
    DW  8,088H
    DD  sontext2BMOD
    DW  8 - 24 + 8,088H - 2
    DD  FORCE_EXIT
    DD  0

if 0
    ALIGN 4
    PUBLIC _sonyaend_txt
_sonyaend_txt:
    include  attract\end\sonya\sonyaend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;;jaxend_ovl: group
    ;;section   .enddata_l1b

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endjax.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\jax\jaxend.mod

    ALIGN 4
    PUBLIC _jaxend_module
_jaxend_module:
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
    DW  0ffd8H,0ffd0H
    DD  jaxtext1BMOD
    DW  8 - 12 + 2,088H + 4
    DD  jaxtext2BMOD
    DW  0fff5H,088H + 4 - 2
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _jaxend_txt
_jaxend_txt:
    include  attract\end\jax\jaxend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;indianend_ovl: group
    ;section    .enddata_l1c

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endindy.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\indian\indyend.mod

    ALIGN 4
    PUBLIC _indianend_module
_indianend_module:
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
    DW  0ffd8H,0ffd0H
    DD  wolftext1BMOD
    DW  8 - 12,088H
    DD  wolftext2BMOD
    DW  0fffcH,088H + 4 - 2
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _indianend_txt
_indianend_txt:
    include  attract\end\indian\indyend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;subzeroend_ovl: group
    ;section    .enddata_l1d

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endszero.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\subzero\subend.mod

    ALIGN 4
    PUBLIC _subzeroend_module
_subzeroend_module:
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
    DW  0ffd8H,0ffd0H
    DD  subtext1BMOD
    DW  0fff8H,088H
    DD  subtext2BMOD
    DW  0fff8H,088H
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _subzeroend_txt
_subzeroend_txt:
    include  attract\end\subzero\subend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;swatend_ovl: group
    ;section    .enddata_l1e

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endswat.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\stryker\copend.mod

    ALIGN 4
    PUBLIC _swatend_module
_swatend_module:
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
    DW  0ffd8H,0ffd0H
    DD  coptext1BMOD
    DW  8,088H
    DD  coptext2BMOD
    DW  8 - 12,088H
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _swatend_txt
_swatend_txt:
    include  attract\end\stryker\copend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;liaend_ovl: group
    ;section    .enddata_l1f

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endlia.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\sindel\sinend.mod

    ALIGN 4
    PUBLIC _liaend_module
_liaend_module:
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
    DD  sinmodBMOD
    DW  0ffd8H,0ffd0H
    DD  sintext1BMOD
    DW  4,088H + 2
    DD  sintext2BMOD
    DW  0,088H
    DD  FORCE_EXIT
    DD  0


if 0

    ALIGN 4
    PUBLIC _liaend_txt
_liaend_txt:
    include  attract\end\sindel\sinend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;robo1end_ovl: group
    ;section    .enddata_l20

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endrobo1.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\sektor\sekend.mod

    ALIGN 4
    PUBLIC _robo1end_module
_robo1end_module:
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
    DD  sekmodBMOD
    DW  0ffd8H,0ffd0H
    DD  sektext1BMOD
    DW  8 + 12 - 6,088H + 4 - 2
    DD  sektext2BMOD
    DW  8 - 8,088H
    DD  FORCE_EXIT
    DD  0


if 0

    ALIGN 4
    PUBLIC _robo1end_txt
_robo1end_txt:
    include  attract\end\sektor\sekend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;robo2end_ovl: group
    ;section    .enddata_l21

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endrobo2.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\cyrax\cyraxend.mod

    ALIGN 4
    PUBLIC _robo2end_module
_robo2end_module:
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
    DW  0ffd8H,0ffd0H
    DD  cyrtext1BMOD
    DW  8,088H + 2
    DD  cyrtext2BMOD
    DW  0fffcH,088H
    DD  FORCE_EXIT
    DD  0


if 0

    ALIGN 4
    PUBLIC _robo2end_txt
_robo2end_txt:
    include  attract\end\cyrax\cyraxend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************

;laoend_ovl: group
    ;section    .enddata_l22

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endlao.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\kung\kungend.mod

    ALIGN 4
    PUBLIC _laoend_module
_laoend_module:
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
    DW  0ffd8H,0ffd0H
    DD  kungtxt1BMOD
    DW  8 - 12 + 6,088H + 4
    DD  kungtxt2BMOD
    DW  0fff4H,088H + 2
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _laoend_txt
_laoend_txt:
    include  attract\end\kung\kungend.TPGSUFF

endif




;tuskend_ovl: group
    ;section    .enddata_l23

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endtusk.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\kabal\kabalend.mod

    ALIGN 4
    PUBLIC _tuskend_module
_tuskend_module:
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
    DW  0ffd8H,0ffd0H
    DD  kabaltextBMOD
    DW  0fffcH,088H
    DD  kabaltxt2BMOD
    DW  8 - 18 + 8,088H + 2
    DD  FORCE_EXIT
    DD  0


if 0

    ALIGN 4
    PUBLIC _tuskend_txt
_tuskend_txt:
    include  attract\end\kabal\kabalend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;sheevaend_ovl: group
    ;section    .enddata_l24

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endsg.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\sheeva\shevaend.mod

    ALIGN 4
    PUBLIC _sheevaend_module
_sheevaend_module:
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
    DD  shemodBMOD
    DW  0ffd8H,0ffd0H
    DD  shetext1BMOD
    DW  8 - 24 + 16,088H
    DD  shetext2BMOD
    DW  8 - 32 + 16,088H + 2
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _sheevaend_txt
_sheevaend_txt:
    include  attract\end\sheeva\shevaend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;shangend_ovl: group
    ;section    .enddata_l25

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endshang.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\shang\shangend.mod

    ALIGN 4
    PUBLIC _shangend_module
_shangend_module:
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
    DD  shanmodBMOD
    DW  0ffd8H,0ffd0H
    DD  shantxt1BMOD
    DW  0fffcH,088H + 2
    DD  shantxt2BMOD
    DW  0fff8H,088H + 2
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _shangend_txt
_shangend_txt:
    include  attract\end\shang\shangend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;lkangend_ovl: group
    ;section    .enddata_l26

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endlkang.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\kang\kangend.mod

    ALIGN 4
    PUBLIC _lkangend_module
_lkangend_module:
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
    DW  0ffd8H,0ffd0H
    DD  kangtxt1BMOD
    DW  0fffcH,088H + 5
    DD  kangtxt2BMOD
    DW  0fffcH,08aH
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _lkangend_txt
_lkangend_txt:
    include  attract\end\kang\kangend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;smokeend_ovl: group
    ;section    .enddata_l27

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endsmoke.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\end\smoke\smokeend.mod

    ALIGN 4
    PUBLIC _smokeend_module
_smokeend_module:
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
    DD  smokemodBMOD
    DW  0ffd8H,0ffd0H
    DD  smktxt1BMOD
    DW  8 - 12,088H
    DD  smktxt2BMOD
    DW  8 - 24 + 20,089H
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _smokeend_txt
_smokeend_txt:
    include  attract\end\smoke\smokeend.TPGSUFF

endif

;********************************************************************************************************
;********************************************************************************************************
;godsend_ovl: group
    ;section    .enddata_l28

;*********************************
;**      PALETTE DATA           **
;*********************************
    ALIGN 4
    include palsrc\endgods.mas

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include  attract\gods\gods.mod

    ALIGN 4
    PUBLIC _godsend_module
_godsend_module:
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
    DD  godmodBMOD
    DW  0ffe6H,0ffd0H
    DD  FORCE_EXIT
    DD  0

if 0

    ALIGN 4
    PUBLIC _godsend_txt
_godsend_txt:
    include  attract\gods\gods.TPGSUFF

endif

;********************************************************************************************************


    END_DATA
    end
