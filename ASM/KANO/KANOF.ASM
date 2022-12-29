;******************************************************************************
; File: mkkano.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Kano Animation Tables
;******************************************************************************/

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\kano\mkkanof.psx
	;CNOP 0,4
	include ..\chars\kano\mkkanof.psi
	;CNOP 0,4
	include ..\common\common\arm2.psx
	;CNOP 0,4
	include ..\common\common\arm2.psi
	;CNOP 0,4
	include ..\common\common\leg.psx
	;CNOP 0,4
	include ..\common\common\leg.psi
	;CNOP 0,4
	include ..\common\common\bone.psx
	;CNOP 0,4
	include ..\common\common\bone.psi
	;CNOP 0,4
	include ..\common\common\cage.psx
	;CNOP 0,4
	include ..\common\common\cage.psi
	;CNOP 0,4
	include ..\common\common\skull.psx
	;CNOP 0,4
	include ..\common\common\skull.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi

	END_OVERLAY
	end

