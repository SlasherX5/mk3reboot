	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\indian\mkinda.psx
	;CNOP 0,4
	include ..\chars\indian\mkinda.psi
	;CNOP 0,4
	include ..\common\common\bloodxp.psx
	;CNOP 0,4
	include ..\common\common\bloodxp.psi
	;CNOP 0,4
	include ..\common\common\animal.psx
	;CNOP 0,4
	include ..\common\common\animal.psi
	END_OVERLAY
	end
