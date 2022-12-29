	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\swat\mkswata.psx
	;CNOP 0,4
	include ..\chars\swat\mkswata.psi
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
