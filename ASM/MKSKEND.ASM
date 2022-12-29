;******************************************************************************
;
; By: David Schwartz
;
; Date: Feb 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III shao kahn ending
;******************************************************************************/

    include win95.i  ;: mkstry2.s
    include mkchar.i
    include mkbkgd.i


;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _dlists_buyin : DWORD
    EXTERN  _no_scroll : DWORD
    EXTERN  _skdie_calla : DWORD

    BEGIN_DATA

;*********************************
;**         PALETTES
;*********************************

   ALIGN 4
   include palsrc\skend.mas

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _sk_anims
_sk_anims:
    PUBLIC _a_sknado
_a_sknado:
    DD _SKNADO1 - _sk_anims
    DD _SKNADO2 - _sk_anims
    DD _SKNADO3 - _sk_anims
    DD _SKNADO4 - _sk_anims
    DD _SKNADO5 - _sk_anims
    DD _SKNADO6 - _sk_anims
    DD _SKNADO7 - _sk_anims
    DD _SKNADO8 - _sk_anims
    DD 0

    PUBLIC _SKNADO1
_SKNADO1:
    DD _SKNADO1_TPG - _sk_anims
    DW 25, 61, 12, 60
    DD  SKNADO_P
_SKNADO1_TPG:
    DW  3,    97,   113,    0

    PUBLIC _SKNADO2
_SKNADO2:
    DD _SKNADO2_TPG - _sk_anims
    DW 25, 60, 12, 59
_SKNADO2_TPG:
    DW  3,   201,   167,    0

    PUBLIC _SKNADO3
_SKNADO3:
    DD _SKNADO3_TPG - _sk_anims
    DW 25, 60, 12, 59
_SKNADO3_TPG:
    DW  4,    49,     1,    0

    PUBLIC _SKNADO4
_SKNADO4:
    DD _SKNADO4_TPG - _sk_anims
    DW 25, 60, 12, 59
_SKNADO4_TPG:
    DW  4,   105,     1,    0

    PUBLIC _SKNADO5
_SKNADO5:
    DD _SKNADO5_TPG - _sk_anims
    DW 25, 60, 12, 58
_SKNADO5_TPG:
    DW  3,    97,   174,    0

    PUBLIC _SKNADO6
_SKNADO6:
    DD _SKNADO6_TPG - _sk_anims
    DW 25, 60, 12, 59
_SKNADO6_TPG:
    DW  3,   173,   167,    0

    PUBLIC _SKNADO7
_SKNADO7:
    DD _SKNADO7_TPG - _sk_anims
    DW 25, 60, 12, 59
_SKNADO7_TPG:
    DW  4,    77,     1,    0

    PUBLIC _SKNADO8
_SKNADO8:
    DD _SKNADO8_TPG - _sk_anims
    DW 25, 60, 12, 59
_SKNADO8_TPG:
    DW  4,   133,     1,    0

    PUBLIC _a_storm_shao
_a_storm_shao:
    DD _SSTORM01 - _sk_anims
    DD _SSTORM03 - _sk_anims
    DD _SSTORM05 - _sk_anims
    DD _SSTORM07 - _sk_anims
    DD _SSTORM09 - _sk_anims
    DD _SSTORM11 - _sk_anims
    DD ani_jump
    DD _a_storm_shao - _sk_anims

    PUBLIC _SSTORM01
_SSTORM01:
    DD _SSTORM01_TPG - _sk_anims
    DW 165, 52,  - 15,  - 9
    DD   NUSTORM_P
_SSTORM01_TPG:
    DW  1,     1,   164,   0

    PUBLIC _SSTORM03
_SSTORM03:
    DD _SSTORM03_TPG - _sk_anims
    DW 151, 61,  - 15,  - 4
_SSTORM03_TPG:
    DW  3,     1,     1,   0

    PUBLIC _SSTORM05
_SSTORM05:
    DD _SSTORM05_TPG - _sk_anims
    DW 173, 54,  - 9,  - 9
_SSTORM05_TPG:
    DW  0,     1,   127,   0

    PUBLIC _SSTORM07
_SSTORM07:
    DD _SSTORM07_TPG - _sk_anims
    DW 162, 51,  - 6,  - 8
_SSTORM07_TPG:
    DW  2,     1,     1,   0

    PUBLIC _SSTORM09
_SSTORM09:
    DD _SSTORM09_TPG - _sk_anims
    DW 155, 65,  - 20, 0
_SSTORM09_TPG:
    DW  2,     1,    52,   0

    PUBLIC _SSTORM11
_SSTORM11:
    DD _SSTORM11_TPG - _sk_anims
    DW 177, 55,  - 14,  - 5
_SSTORM11_TPG:
    DW  0,     1,    72,   0

;*********************************
;**      MODULE SK END1
;*********************************
    ALIGN 4
    include .\bkgd\shao\mkshao1.mod

    ALIGN 4
    PUBLIC _skdie1_module
_skdie1_module:
    DW  0           ; autoerase color
    DW  000H            ; initial world y
    DW  0d8H            ; ground y offset
    DW  320         ; initial world x
    DW  0           ; scroll left limit
    DW  640         ; scroll right limit

    DD  _skdie_calla ; routine: make lightning proc
    DD  portal_scroll   ; scroll table
    DD  dlists_roof

    DD  _bakmods
    DD  citymodBMOD     ; _baklst1
    DW  0fff5H,055H
    DD  towermodBMOD    ; _baklst2
    DW  0fff5H,068H
    DD  bgcityBMOD  ; _baklst3
    DW  0fff5H,07aH

    DD  CENTER_X
    DD  bgcityBMOD,_worldtlx1
    DD  citymodBMOD,_worldtlx2
    DD  towermodBMOD,_worldtlx3
    DD  bgcityBMOD,_worldtlx4
    DD  bgcityBMOD,_worldtlx5
    DD  bgcityBMOD,_worldtlx6
    DD  bgcityBMOD,_worldtlx7

    DD  0,0

;*********************************
;**      MODULE DATA SK END2
;*********************************
    ALIGN 4
;   include .\bkgd\shao\mkshao2.mod

    ALIGN 4
    PUBLIC _skdie2_module
_skdie2_module:
    DW  0           ; autoerase color
    DW  000H            ; initial world y
    DW  0d8H            ; ground y offset
    DW  320         ; initial world x
    DW  0           ; scroll left limit
    DW  640             ; scroll right limit
    DD  _calla_return            ; routine: make lightning proc
    DD  portal_scroll   ; scroll table
    DD  dlists_roof

    DD  _bakmods
    DD  citymodBMOD     ; _baklst1
    DW  0fff5H,055H
    DD  bgcityBMOD  ; _baklst3
    DW  0fff5H,07aH

    DD  CENTER_X
    DD  bgcityBMOD,_worldtlx1
    DD  citymodBMOD,_worldtlx2
    DD  bgcityBMOD,_worldtlx4
    DD  bgcityBMOD,_worldtlx5
    DD  bgcityBMOD,_worldtlx6
    DD  bgcityBMOD,_worldtlx7

    DD  0,0

dlists_roof:
    DD  _baklst7,_worldtlx + 16/8
    DD  _baklst6,_worldtlx6 + 16/8
    DD  _baklst5,_worldtlx5 + 16/8
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

portal_scroll:
    DD  0       ; 8
    DD  0       ; 7
    DD  0       ; 6
    DD  0       ; 5
    DD  0       ; 4
    DD  0       ; 3
    DD  020000H*SCX/100     ; 2
    DD  0       ; 1
    DD  020000H*SCX/100         ; player list

;WIN95: FIX_REMOVED_EXECESS_HEAPS
;    ALIGN 4
;    PUBLIC _mock_heap
;_mock_heap:
;	db 80*1024 DUP(0)

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\bkgd\shao\shaodie.mod

    ALIGN 4
    PUBLIC _skdiepit_module
_skdiepit_module:
    DW  0               ; autoerase color
    DW  000H            ; initial world y
    DW  0d4H                ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  640             ; scroll right limit

    DD  _calla_return                ; routine to call
    DD  pit_scroll          ; scroll table
    DD  dlists_pit

    DD  _bakmods
    DD  MKPIT1BMOD          ; _baklst1 = floor
    DW  018H,0ffe2H
    DD  MKPIT2BMOD          ; _baklst2 = side nose
    DW  000H,004H
    DD  MKPIT3BMOD          ; _baklst3 = lights
    DW  0fff8H,066H
    DD  MKPIT4BMOD          ; _baklst4 = backplane
    DW  0fff0H,01eH + 10

    DD  CENTER_X
    DD  MKPIT1BMOD,_worldtlx1
    DD  MKPIT2BMOD,_worldtlx2
    DD  MKPIT3BMOD,_worldtlx3
    DD  MKPIT4BMOD,_worldtlx4
    DD  0,0

pit_scroll:
    DD  0*SCX/100               ; 8
    DD  0*SCX/100               ; 7
    DD  000H*SCX/100                ; 6
    DD  000H*SCX/100                ; 5
    DD  0*SCX/100           ; 4
    DD  08000H*SCX/100          ; 3
    DD  0c000H*SCX/100          ; 2
    DD  020000H*SCX/100         ; 1
    DD  020000H*SCX/100         ; player list

dlists_pit:
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
;   dw   - 1,_floor_code
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

    END_DATA
    end
