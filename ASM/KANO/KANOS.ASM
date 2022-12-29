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
	include ..\chars\kano\mkkanos.psx
	include ..\chars\kano\mkkanos.psi
	include ..\common\common\friend.psx
	include ..\common\common\friend.psi

	END_OVERLAY
	end

