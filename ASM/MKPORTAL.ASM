;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Portal Module
;******************************************************************************/
   
 	include win95.i
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _mk3_calla : DWORD

;*********************************
;**         PALETTES
;*********************************

    ;ALIGN 4
    EXTERN _WARP_P : DWORD

    BEGIN_DATA    

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include .\bkgd\hidden\mkhidden.mod

    ALIGN 4
    PUBLIC _portal_module
_portal_module:
    DW  0               ; autoerase color
    DW  000H                ; initial world y
    DW  0d0H                ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  640         ; scroll right limit

    DD  _mk3_calla           ; routine: make lightning proc
    DD  portal_scroll           ; scroll table
    DD  dlists_portal

    DD  _bakmods
    DD  SKIP_BAKMOD             ; _baklst1 = skip (lightning)
    DD  HIDDEN1BMOD         ; _baklst2 = floor
    DW  000H,0b0H
    DD  HIDDEN2BMOD         ; _baklst3 = portal sky
    DW  000H,0FFF0H

    DD  CENTER_X
    DD  HIDDEN2BMOD,_worldtlx1
    DD  HIDDEN1BMOD,_worldtlx2
    DD  HIDDEN2BMOD,_worldtlx3
    DD  0,0

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

dlists_portal:
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0


;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat II Modules
;******************************************************************************/


	BEGIN_DATA
    ALIGN 4
    include .\bkgd\hidden\mkdeadpool.mod

    ALIGN 4
    PUBLIC _deadpool_module
_deadpool_module:

    DW  (32*32*3)+(32*5)+1  ; autoerase color
	DW  128                ; initial world y
    DW  221              ; ground y offset
    DW  320             ; initial world x
    DW  32                ; scroll left limit
    DW  620             ; scroll right limit

    DD  _mk3_calla           ; routine: make lightning proc
    DD  dedpool_scroll           ; scroll table
    DD  dlists_dedpool

    DD  _bakmods
    DD  DPUL5_MOD
    DW  000H,058H

    DD	SKIP_BAKMOD			; baklst2 = skip

	DD	DPUL2_MOD
	DW	0,040H				; baklst3 = close up chains

	DD	DPUL3_MOD			; 4 - chains
	DW	0,040H

	DD	DPUL4_MOD			; 5 - chains
	DW	0,040H

	DD	CENTER_X
	DD	DPUL5_MOD,_worldtlx1		; back wall
	DD	DPUL3_MOD,_worldtlx4		; back wall
	DD	DPUL4_MOD,_worldtlx5		; back wall
	DD	DPUL2_MOD,_worldtlx3		; close chains
	DD  0,0

dedpool_scroll:
	DD	0		; 8
	DD	0		; 7
	DD	0		; 6
	DD	024000H*SCX/100		; 5
	DD	028000H*SCX/100		; 4
	DD	030000H*SCX/100		; 3
	DD	0		; 2
	DD	020000H*SCX/100		; 1
	DD	020000H*SCX/100		; 0 players

dlists_dedpool:
	DD	_baklst1,_worldtlx1+16/8		; wall is furthest thing back
	DD	_baklst5,_worldtlx5+16/8
	DD	_baklst4,_worldtlx4+16/8
	DD  -1,_shadow_p1p2
	DD	_objlst,_worldtlx+16/8	
	DD	_objlst2,_worldtlx+16/8
	DD	_baklst3,_worldtlx3+16/8		; close up chains
	DD	0

;******************************************************************************/
    ALIGN 4
    PUBLIC _cave_module
_cave_module:

    DW  0  ; autoerase color
	DW  040H                ; initial world y
    DW  0e1H              ; ground y offset
    DW  320             ; initial world x
    DW  020H                ; scroll left limit
    DW  620             ; scroll right limit

    DD  _mk3_calla           ; routine: make lightning proc
    DD  cave_scroll           ; scroll table
    DD  dlists_cave

    DD  _bakmods
    DD  dun1_MOD
    DW  071H,105H

    DD	dun2_MOD			; 2
	DW  071H,0F5H

	DD	dun3_MOD			; 3
	DW  071H,0E7H

	DD	dun4_MOD		; 4
	DW	0,05dh

	DD	dun5_MOD		; 5
	DW	143,0caH

	DD	dun8_MOD		; 6
	DW	215,-5

	DD	dun9_MOD		; 7
	DW  295,0bah

	DD dun10_MOD		; 8
	DW	385,0b6H

	DD  -1    
    DD 0

cave_scroll:
	DD 010000H*SCX/100	; 8
	DD 012000H*SCX/100	; 7
	DD 014000H*SCX/100	; 6
	DD 018000H*SCX/100	; 5
	DD 01c000H*SCX/100	; 4
	DD 01e000H*SCX/100	; 3
	DD 020000H*SCX/100	; 2
	DD 022000H*SCX/100	; 1
	DD 020000H*SCX/100		; 0 players


dlists_cave:
	DD	_baklst8,_worldtlx8+16/8
	DD	_baklst7,_worldtlx7+16/8
	DD	_baklst6,_worldtlx6+16/8
	DD	_baklst5,_worldtlx5+16/8
	DD	_baklst4,_worldtlx4+16/8
	DD	_baklst3,_worldtlx3+16/8
	DD	_baklst2,_worldtlx2+16/8
	DD	_baklst1,_worldtlx1+16/8
	DD	_objlst ,_worldtlx+16/8
	DD	_objlst2,_worldtlx+16/8
	DD	0

;******************************************************************************/

    ALIGN 4
    PUBLIC _armory_module
_armory_module:

    DW  0  ; autoerase color
	DW  040H                ; initial world y
    DW  0e1H              ; ground y offset
    DW  320             ; initial world x
    DW  020H                ; scroll left limit
    DW  620             ; scroll right limit

    DD  _mk3_calla           ; routine: make lightning proc
    DD  armory_scroll           ; scroll table
    DD  dlists_armory

    DD  _bakmods

	DD	SKIP_BAKMOD			; baklst1 = skip baklst1

	DD	ARM1_MOD			; baklst2 = pillars / weapons rack
	DW	0,016H

	DD	SKIP_BAKMOD			; baklst3 = LAVA ANIMATION

	DD	ARM2_MOD			; baklst4 = steel tub
	DW	0,033H

	DD	ARM3_MOD			; baklst5 = back wall w/ mk symbol
	DW	0,-20

	DD CENTER_X
	DD	ARM1_MOD,_worldtlx2
	DD	ARM2_MOD,_worldtlx3		; lineup lava with steel tub
	DD	ARM2_MOD,_worldtlx4
	DD	ARM3_MOD,_worldtlx5
	DD  0,0

armory_scroll:
	DD	016000H*SCX/100		; 8 - skewing floor follows this scroll 
	DD	0		; 7
	DD	0		; 6
	DD	0c000H*SCX/100		; 5 - back wall
	DD	015000H*SCX/100		; 4 - steel tub
	DD	015000H*SCX/100		; 3 - lava animation
	DD	01c000H*SCX/100		; 2 - pillars
	DD	020000H*SCX/100		; 1 - players
	DD  020000H*SCX/100		; 0 players

dlists_armory:
	DD	_baklst5,_worldtlx5+16/8
	DD	_baklst4,_worldtlx4+16/8
	DD	_baklst3,_worldtlx3+16/8
	DD	_baklst2,_worldtlx2+16/8
	DD  -1,_shadow_p1p2
	DD	_objlst,_worldtlx+16/8
	DD	_objlst2,_worldtlx+16/8
	DD	0

    END_DATA
    end
