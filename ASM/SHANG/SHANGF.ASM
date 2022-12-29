

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\shang\mkstf.psx
	;CNOP 0,4
	include ..\chars\shang\mkstf.psi
	;CNOP 0,4
	include ..\common\common\bloodxp.psx
	;CNOP 0,4
	include ..\common\common\bloodxp.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi


	END_OVERLAY
	end

