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
	include chars\sonya\mksonyaf.psx
	ALIGN 4
	include chars\sonya\mksonyaf.psi
	ALIGN 4
	include common\common\skelfire.psx
	ALIGN 4
	include common\common\skelfire.psi
	ALIGN 4
	include common\common\fatal.psx
	ALIGN 4
	include common\common\fatal.psi

 	END_OVERLAY
	end

