

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo3\mkrobo3f.psx
	;CNOP 0,4
	include ..\chars\robo3\mkrobo3f.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi


	END_OVERLAY
	end

