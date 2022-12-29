	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\subzero\mksza.psx
	;CNOP 0,4
	include ..\chars\subzero\mksza.psi
	;CNOP 0,4
	include ..\common\common\animal.psx
	;CNOP 0,4
	include ..\common\common\animal.psi
	END_OVERLAY
	end
