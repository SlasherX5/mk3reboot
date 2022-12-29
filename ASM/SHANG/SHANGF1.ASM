

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\shang\mkstf1.psx
	;CNOP 0,4
	include ..\chars\shang\mkstf1.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	;CNOP 0,4
	include ..\common\float\ofloat.psx
	;CNOP 0,4
	include ..\common\float\ofloat.psi


	END_OVERLAY
	end

