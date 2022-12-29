;******************************************************************************
; File: mksonya.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Sonya Animation Tables
;******************************************************************************/

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include chars\sonya\mksonyf1.psx
	ALIGN 4
	include chars\sonya\mksonyf1.psi
	ALIGN 4
	include common\common\arm2.psx
	ALIGN 4
	include common\common\arm2.psi
	ALIGN 4
	include common\common\leg.psx
	ALIGN 4
	include common\common\leg.psi
	ALIGN 4
	include common\common\bone.psx
	ALIGN 4
	include common\common\bone.psi
	ALIGN 4
	include common\common\cage.psx
	ALIGN 4
	include common\common\cage.psi
	ALIGN 4
	include common\common\skull.psx
	ALIGN 4
	include common\common\skull.psi
	ALIGN 4
	include common\common\bloodxp.psx
	ALIGN 4
	include common\common\bloodxp.psi
	ALIGN 4
	include common\common\fatal.psx
	ALIGN 4
	include common\common\fatal.psi

	END_OVERLAY
	end

