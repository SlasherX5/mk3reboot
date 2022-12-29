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
	include ..\chars\kano\mkkanob.psx
	include ..\common\baby\babykano.psx
	include ..\common\baby\babykano.psi
	include ..\common\baby\babyxpld.psi

	END_OVERLAY
	end

