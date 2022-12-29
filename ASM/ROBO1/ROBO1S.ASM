

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo1\mkrobo1s.psx
	;CNOP 0,4
	include ..\chars\robo1\mkrobo1s.psi
	;CNOP 0,4
	include ..\common\common\friend.psx
	;CNOP 0,4
	include ..\common\common\friend.psi



	END_OVERLAY
	end

