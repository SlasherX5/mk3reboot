

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo3\mkrobo3b.psx
	;CNOP 0,4
	include ..\common\baby\babyr3.psx
	;CNOP 0,4
	include ..\common\baby\babyr3.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi


	END_OVERLAY
	end

