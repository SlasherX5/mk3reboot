
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\lao\mklaoa.psx
	;CNOP 0,4
	include ..\chars\lao\mklaoa.psi
	;CNOP 0,4
	include ..\common\common\animal.psx
	;CNOP 0,4
	include ..\common\common\animal.psi

	END_OVERLAY
	end

