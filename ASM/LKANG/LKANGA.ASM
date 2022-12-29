

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	include ..\chars\lkang\mklka.psx
	;CNOP 0,4
	include ..\chars\lkang\mklka.psi
	;CNOP 0,4
	include ..\common\half\ohalf.psx
	;CNOP 0,4
	include ..\common\half\ohalf.psi
	;CNOP 0,4
	include ..\common\common\animal.psx
	;CNOP 0,4
	include ..\common\common\animal.psi


	END_OVERLAY
	end

