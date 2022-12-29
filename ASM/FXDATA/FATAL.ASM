
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\common\finish\fatal.psx
	;CNOP 0,4
	include ..\common\finish\fatal.psi

	END_OVERLAY
	end

