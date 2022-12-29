;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Gradient Modules
;******************************************************************************/

    include win95.i  ;: mkgrad.s
    include mkchar.i
    include mkbkgd.i
	include compress.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _calla_return : DWORD
    EXTERN  _no_scroll : DWORD
    EXTERN  _dlists_buyin : DWORD

;*********************************
;**         PALETTES
;*********************************
;    ALIGN 4
    ;include palsrc\gradient.mas
    EXTERN _gradientb_CLT : DWORD
    EXTERN _gradientr_CLT : DWORD
    EXTERN _gradientg_CLT : DWORD

	BEGIN_DATA

;*********************************
;**         ANIMATIONS          **
;*********************************

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\attract\gradient\gradient.mod

    ALIGN 4
    PUBLIC _redgrad_module
_redgrad_module:
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
    DD  redmodBMOD
    DW  0fff2H,0fff8H
    DD  FORCE_EXIT
    DD  0

    ALIGN 4
    PUBLIC _greengrad_module
_greengrad_module:
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
    DD  greenmodBMOD
    DW  0fff2H,0fff8H
    DD  FORCE_EXIT
    DD  0

    ALIGN 4
    PUBLIC _bluegrad_module
_bluegrad_module:
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
    DD  blumodBMOD
    DW  0fff2H,0fff8H
    DD  FORCE_EXIT
    DD  0

    ALIGN 4
    PUBLIC _gradient_txt
_gradient_txt:
    include .\attract\gradient\gradient.tpg

; smoke symbol stuff
    ;CNOP 0, 4
EIDRAG_P:
    DD 59
    DW 00000H, 003BFH, 00B7DH, 0033DH, 0171AH, 006FEH, 006FAH, 006BEH, 0061DH, 005FBH
    DW 011FAH, 005DBH, 01638H, 00618H, 0055CH, 011B9H, 0051DH, 01233H, 00234H, 0051CH
    DW 004FCH, 00559H, 0051AH, 004FAH, 00518H, 004D8H, 008D7H, 008F6H, 00934H, 008F4H
    DW 00931H, 004B4H, 004B3H, 00D4BH, 00491H, 00890H, 0048DH, 0044EH, 004CBH, 0046DH
    DW 0048CH, 014C9H, 0046BH, 004C7H, 0044AH, 00469H, 00468H, 00447H, 01083H, 00465H
    DW 00025H, 00843H, 00004H, 00441H, 00820H, 00421H, 00002H, 00420H, 08000H

    ;CNOP 0, 4
EIGORO_P:
    DD 57
    DW 00000H, 014A5H, 0190AH, 01D0AH, 0212BH, 0210AH, 0250AH, 0292BH, 0412CH, 02D2BH
    DW 02D0AH, 05D0CH, 0610CH, 06D4EH, 0716FH, 06D6FH, 07190H, 0510BH, 0552CH, 0796FH
    DW 0756FH, 07990H, 0550BH, 05D0BH, 0610BH, 0652CH, 0612CH, 0592CH, 06D4DH, 0694DH
    DW 0716EH, 0696EH, 0718FH, 071B0H, 07DD1H, 079D1H, 075D1H, 0450AH, 0452BH, 0412BH
    DW 0756EH, 04D4CH, 0798FH, 07DB0H, 04D0AH, 0510AH, 0512BH, 0614CH, 0554CH, 0656DH
    DW 0712BH, 03509H, 03909H, 04109H, 01D2AH, 0150AH, 0192BH

    ;CNOP 0, 4
EIKAHN_P:
    DD 60
    DW 00000H, 08000H, 01492H, 01071H, 01894H, 01471H, 01068H, 01065H, 04630H, 07FFEH
    DW 06759H, 04672H, 01DADH, 01D4AH, 0216BH, 010A5H, 03610H, 0298CH, 014C6H, 04A94H
    DW 052D6H, 077FFH, 04231H, 06339H, 06F9CH, 073BDH, 029CFH, 06BBEH, 00CC8H, 04ED8H
    DW 010A6H, 00CADH, 010A9H, 00427H, 0108CH, 00844H, 014A6H, 018C7H, 05295H, 00421H
    DW 00C63H, 01084H, 014A5H, 018C6H, 01CE7H, 02108H, 0294AH, 02D6BH, 035ADH, 039CEH
    DW 03DEFH, 04A52H, 04E73H, 05294H, 05AD6H, 06B5AH, 06F7BH, 0739CH, 07BDEH, 07FFFH

    ;CNOP 0, 4
EILIGHT_P:
    DD 64
    DW 00000H, 01067H, 01487H, 01467H, 01887H, 01C87H, 01C86H, 02086H, 0314BH, 02486H
    DW 02886H, 02C86H, 02C85H, 03485H, 03085H, 03C85H, 03885H, 04C84H, 04884H, 04484H
    DW 04084H, 03CC6H, 06083H, 05C83H, 05883H, 05483H, 060A4H, 06461H, 06061H, 07082H
    DW 06C82H, 06882H, 05083H, 05528H, 07481H, 07881H, 07C81H, 05C61H, 05461H, 05861H
    DW 04C61H, 06482H, 06082H, 05CE5H, 07081H, 06481H, 06881H, 06C81H, 06081H, 04861H
    DW 06CC3H, 05CE4H, 04DACH, 045ACH, 02652H, 02A73H, 01AF8H, 003BFH, 0077DH, 00B7DH
    DW 02695H, 00A54H, 01D8EH, 00C67H

    ;CNOP 0, 4
EIMK_P:
    DD 64
    DW 00000H, 016FFH, 01A9FH, 016BEH, 012BEH, 052B7H, 0169DH, 04E96H, 0125DH, 0125BH
    DW 01659H, 00DDCH, 04A53H, 01E38H, 011FAH, 00DBBH, 00D7BH, 01DF7H, 0091BH, 0091AH
    DW 015D5H, 00D58H, 00D96H, 008DAH, 02594H, 035B0H, 008D8H, 01535H, 01973H, 00879H
    DW 008F6H, 014F5H, 039ABH, 0198FH, 00896H, 0296EH, 018F2H, 00D50H, 02D6BH, 0154FH
    DW 00893H, 00D2EH, 00491H, 0212AH, 00890H, 02109H, 00C8DH, 010CBH, 01CE8H, 014CAH
    DW 00CCAH, 00C89H, 018C5H, 00CA8H, 00869H, 018A3H, 014A4H, 00867H, 00C85H, 00846H
    DW 00824H, 00C42H, 00821H, 08000H

    ;CNOP 0, 4
EIQ_P:
    DD 63
    DW 00000H, 08000H, 05A96H, 04DAFH, 0312AH, 041AEH, 045CFH, 05653H, 04CEAH, 0494CH
    DW 06E75H, 0596DH, 03509H, 04C03H, 04086H, 06DF1H, 04023H, 06466H, 0696DH, 04402H
    DW 05044H, 05865H, 05465H, 05C86H, 060E9H, 06D0AH, 0716DH, 02C01H, 064A7H, 03801H
    DW 02400H, 00062H, 00149H, 000E7H, 0018CH, 001EFH, 00652H, 00610H, 0056BH, 00ED6H
    DW 01FDEH, 01A31H, 02B9CH, 04F39H, 0139DH, 00AF8H, 0173AH, 016F8H, 01695H, 0275BH
    DW 022F8H, 03719H, 03F5BH, 011CFH, 02A95H, 032D7H, 03EB6H, 03611H, 04AB6H, 03E75H
    DW 04633H, 04A54H, 05AD7H

    ;CNOP 0, 4
EIRAID_P:
    DD 64
    DW 00000H, 08000H, 00822H, 0292AH, 03DCFH, 01CA6H, 045CFH, 0352AH, 06295H, 066B6H
    DW 030C7H, 02022H, 02443H, 02863H, 02884H, 01C84H, 055CEH, 03529H, 05A52H, 05652H
    DW 01820H, 0398AH, 041E2H, 039A2H, 06F9BH, 00863H, 01D4AH, 05BFFH, 073FFH, 053DFH
    DW 04BBFH, 03B5FH, 00043H, 01A9BH, 02678H, 02EFDH, 0435FH, 036DBH, 04B3DH, 0571AH
    DW 042DAH, 01192H, 05B7FH, 036BCH, 00C85H, 00022H, 009B8H, 025B1H, 042FEH, 010EAH
    DW 0367AH, 03637H, 01D2CH, 031F3H, 01950H, 029F7H, 025B4H, 0214EH, 031D2H, 00C87H
    DW 02595H, 00001H, 0294DH, 07FFFH

    ;CNOP 0, 4
EISKULL_P:
    DD 57
    DW 00000H, 08000H, 00001H, 00022H, 00C42H, 00443H, 00843H, 00C64H, 014A4H, 010A7H
    DW 014C7H, 010C8H, 010C9H, 018E9H, 01D09H, 02529H, 014EAH, 01D0AH, 014EBH, 0212CH
    DW 0214DH, 0256DH, 0318DH, 0318EH, 02DAEH, 0256FH, 02990H, 035B0H, 03E10H, 031D1H
    DW 03A12H, 03E34H, 04A74H, 03E35H, 04635H, 04255H, 05295H, 04677H, 04A97H, 05AD7H
    DW 04E98H, 052B8H, 052D9H, 056FAH, 05F1AH, 0633AH, 03E9BH, 056FBH, 05F3BH, 06B5BH
    DW 05B1CH, 0635DH, 06F9DH, 06F9EH, 073DFH, 07BDFH, 07FFFH

    ;CNOP 0, 4
EITHREE_P:
    DD 59
    DW 00000H, 08000H, 00400H, 00820H, 00C60H, 00C62H, 01CE6H, 010A4H, 016DFH, 01A9CH
    DW 014E8H, 0129EH, 0165BH, 01639H, 019D4H, 011F8H, 01A7EH, 01A18H, 01193H, 00022H
    DW 014C7H, 00E1FH, 00DB9H, 0163FH, 01993H, 02E38H, 00DBBH, 008EEH, 00CCBH, 00D11H
    DW 03A7CH, 00D57H, 00D12H, 031AFH, 00467H, 0150FH, 00865H, 00D3BH, 02992H, 052B8H
    DW 052B9H, 01D35H, 0044BH, 01D3AH, 00CBBH, 00C90H, 014D8H, 00037H, 0045BH, 00878H
    DW 018FFH, 00C76H, 0084DH, 01089H, 0210BH, 039D3H, 05298H, 04211H, 02D6BH

    ;CNOP 0, 4
EIYIN_P:
    DD 62
    DW 00000H, 003BFH, 0039FH, 0035FH, 0031FH, 0031EH, 002DFH, 002FCH, 0029FH, 0027FH
    DW 0029EH, 0023FH, 0025EH, 0029BH, 0025DH, 001FFH, 0023DH, 0019FH, 001BDH, 0015FH
    DW 0017EH, 0021AH, 0011FH, 00238H, 000FFH, 001BAH, 00216H, 00199H, 0013BH, 001B8H
    DW 000DDH, 001D7H, 0013AH, 0011AH, 000DAH, 001D4H, 00176H, 00137H, 00194H, 00192H
    DW 00114H, 00191H, 00152H, 00151H, 000B4H, 000F1H, 00093H, 000B1H, 0012EH, 0008FH
    DW 000CDH, 000EBH, 0006DH, 000AAH, 0004CH, 0004BH, 00066H, 00027H, 00004H, 00003H
    DW 00002H, 08000H

    ALIGN 4
    PUBLIC _ultimate_anims
_ultimate_anims:
    PUBLIC _smoke_symbol_table
_smoke_symbol_table:
    DD I_DRAGON - _ultimate_anims
    DD I_MK - _ultimate_anims
    DD I_YINYANG - _ultimate_anims
    DD I_THREE - _ultimate_anims
    DD I_QUESTION - _ultimate_anims
    DD I_LIGHTNING - _ultimate_anims
    DD I_GORO - _ultimate_anims
    DD I_RAIDEN - _ultimate_anims
    DD I_SHOKAHN - _ultimate_anims
    DD I_SKULL - _ultimate_anims
    DD 0

I_DRAGON:
    DD I_DRAGON_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIDRAG_P
I_MK:
    DD I_MK_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIMK_P
I_YINYANG:
    DD I_YINYANG_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIYIN_P
I_THREE:
    DD I_THREE_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EITHREE_P
I_QUESTION:
    DD I_QUESTION_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIQ_P
I_LIGHTNING:
    DD I_LIGHTNING_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EILIGHT_P
I_GORO:
    DD I_GORO_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIGORO_P
I_RAIDEN:
    DD I_RAIDEN_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIRAID_P
I_SHOKAHN:
    DD I_SHOKAHN_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EIKAHN_P
I_SKULL:
    DD I_SKULL_IMG - _ultimate_anims
    DW 17, 14, 0, 0
    DD EISKULL_P

    ALIGN 4
    include .\attract\end\mksymbol.psi























    END_DATA
    end
