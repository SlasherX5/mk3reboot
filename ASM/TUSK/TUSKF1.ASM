

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\tusk\mktuskf1.psx
	;CNOP 0,4
	include ..\chars\tusk\mktuskf1.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi


	END_OVERLAY
	end

