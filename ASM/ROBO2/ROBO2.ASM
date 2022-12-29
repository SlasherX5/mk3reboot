

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo2\mkrobo2.psx
	;CNOP 0,4
	include ..\chars\robo2\mkrobo2.psi
	;CNOP 0,4
;	include ..\chars\robo2\mkgdexp.psi
	;CNOP 0,4
	include ..\chars\robo2\rbb.psi


	END_OVERLAY
	end

