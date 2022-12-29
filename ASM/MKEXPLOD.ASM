
;******************************************************************************
; File: mkexplode.s
;
; By: David Schwartz
;
; Date: Mar 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III explode Animation Tables & Textures
;******************************************************************************/


	include win95.i
	include mkchar.i

	EXTERN _PUFF_P : DWORD
	EXTERN _XPLODZ_P : DWORD

	PUBLIC _a_puff
	PUBLIC _a_dave_explode
	PUBLIC _PUFF1
;	global a_ground_explode
;	global a_small_explode

    BEGIN_DATA

	ALIGN 4

	PUBLIC _explode_fx_anims
_explode_fx_anims:
	include chars\explode\mkexp.psx
	include chars\explode\mkexp.psi

	END_DATA
	end

