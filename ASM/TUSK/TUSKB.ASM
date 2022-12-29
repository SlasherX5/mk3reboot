

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\tusk\mktuskb.psx
	;CNOP 0,4
	include ..\common\baby\babytusk.psx
	;CNOP 0,4
	include ..\common\baby\babytusk.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi


	END_OVERLAY
	end

