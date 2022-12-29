
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\chars\femgoro\mksga.psx
	;CNOP 0,4
	include ..\chars\femgoro\mksga.psi
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
	include ..\common\common\animal.psx
	;CNOP 0,4
	include ..\common\common\animal.psi

	END_OVERLAY
	end

