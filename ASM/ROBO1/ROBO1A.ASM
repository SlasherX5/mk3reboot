

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo1\mkrobo1a.psx
	;CNOP 0,4
	include ..\chars\robo1\mkrobo1a.psi
	;CNOP 0,4
	include ..\common\common\animal.psx
	;CNOP 0,4
	include ..\common\common\animal.psi
	;CNOP 0,4
	include ..\common\cutup\ocutup.psx
	;CNOP 0,4
	include ..\common\cutup\ocutup.psi



	END_OVERLAY
	end

