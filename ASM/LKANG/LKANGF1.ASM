

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	include ..\chars\lkang\mklkf1.psx
	;CNOP 0,4
	include ..\chars\lkang\mklkf1.psi
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

