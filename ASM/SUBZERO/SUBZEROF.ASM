	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\subzero\mkszf.psx
	;CNOP 0,4
	include ..\chars\subzero\mkszf.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	END_OVERLAY
	end
