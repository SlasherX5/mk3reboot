
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\common\finish\animal.psx
	;CNOP 0,4
	include ..\common\finish\animal.psi

	END_OVERLAY
	end

