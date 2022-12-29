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
	include ..\chars\jax\mkjaxb.psx
	include ..\common\baby\babyjax.psx
	include ..\common\baby\babyjax.psi
	include ..\common\baby\babyxpld.psi

	END_OVERLAY
	end
