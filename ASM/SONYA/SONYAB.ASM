;******************************************************************************
; File: mksonya.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Sonya Babality Animation Tables
;******************************************************************************/



	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:

	include chars/sonya/mksonyab.psx
	ALIGN 4
;	include:w ../../chars/sonya/mksonyas.psi
;	CNOP 0,4
	include common/baby/babyson.psx
	ALIGN 4
	include common/baby/babyson.psi
	ALIGN 4
	include common/baby/babyxpld.psi

	END_OVERLAY
	end

