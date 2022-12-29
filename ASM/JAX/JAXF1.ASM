;******************************************************************************
; File: mkjax.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Jax Animation Tables
;******************************************************************************/

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\jax\mkjaxf1.psx
	include ..\chars\jax\mkjaxf1.psi
	include ..\common\common\bloodxp.psx
	include ..\common\common\bloodxp.psi
	include ..\common\common\fatal.psx
	include ..\common\common\fatal.psi


	END_OVERLAY
	end
