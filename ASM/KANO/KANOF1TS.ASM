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

	;CNOP 0,4
base_anims:
	include ..\chars\kano\mkkanof1.psx
	;CNOP 0,4
	include ..\chars\kano\mkkanof1.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	;CNOP 0,4
	include ..\common\reach\ortusk.psx
	;CNOP 0,4
	include ..\common\reach\ortusk.psi
	END_OVERLAY
	end
