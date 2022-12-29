;******************************************************************************
; File: mkkanoa.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III kano Animality Animation Tables
;******************************************************************************/

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\kano\mkkanoa.psx
	include ..\chars\kano\mkkanoa.psi
	include ..\common\common\bloodxp.psx
	include ..\common\common\bloodxp.psi
	include ..\common\common\animal.psx
	include ..\common\common\animal.psi

	END_OVERLAY
	end

