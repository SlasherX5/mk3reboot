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
	include ..\chars\jax\mkjaxs.psx
	include ..\chars\jax\mkjaxs.psi
	include ..\common\common\friend.psx
	include ..\common\common\friend.psi


	END_OVERLAY
	end
