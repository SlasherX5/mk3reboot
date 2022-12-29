	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\swat\mkswatf1.psx
	;CNOP 0,4
	include ..\chars\swat\mkswatf1.psi
	;CNOP 0,4
	include ..\common\common\arm2.psx
	;CNOP 0,4
	include ..\common\common\arm2.psi
	;CNOP 0,4
	include ..\common\common\leg.psx
	;CNOP 0,4
	include ..\common\common\leg.psi
	;CNOP 0,4
	include ..\common\common\bone.psx
	;CNOP 0,4
	include ..\common\common\bone.psi
	;CNOP 0,4
	include ..\common\common\cage.psx
	;CNOP 0,4
	include ..\common\common\cage.psi
	;CNOP 0,4
	include ..\common\common\skull.psx
	;CNOP 0,4
	include ..\common\common\skull.psi
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
