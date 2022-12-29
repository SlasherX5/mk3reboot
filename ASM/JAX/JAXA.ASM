;******************************************************************************
; File: mkjaxa.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Jax Animality Animation Tables
;******************************************************************************/

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\jax\mkjaxa.psx
	include ..\chars\jax\mkjaxa.psi
	include ..\common\common\bloodxp.psx
	include ..\common\common\bloodxp.psi
	include ..\common\common\animal.psx
	include ..\common\common\animal.psi


	END_OVERLAY
	end
