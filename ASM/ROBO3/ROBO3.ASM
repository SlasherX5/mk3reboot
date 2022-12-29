

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo3\mkrobo3.psx
	;CNOP 0,4
	include ..\chars\robo3\mkrobo3.psi
	;CNOP 0,4
	include ..\chars\robo2\mkgdexp.psi
	;CNOP 0,4
	include ..\chars\robo3\rbb.psi


	END_OVERLAY
	end

