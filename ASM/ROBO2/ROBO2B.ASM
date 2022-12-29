

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\robo2\mkrobo2b.psx
	;CNOP 0,4
	include ..\common\baby\babyr2.psx
	;CNOP 0,4
	include ..\common\baby\babyr2.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi


	END_OVERLAY
	end

