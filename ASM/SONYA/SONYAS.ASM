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
	include chars/sonya/mksonyas.psx
	ALIGN 4
	include chars/sonya/mksonyas.psi
	ALIGN 4
	include common/common/friend.psx
	ALIGN 4
	include common/common/friend.psi

	END_OVERLAY
	end

