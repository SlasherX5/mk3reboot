	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\swat\mkswatf.psx
	;CNOP 0,4
	include ..\chars\swat\mkswatf.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	END_OVERLAY
	end
