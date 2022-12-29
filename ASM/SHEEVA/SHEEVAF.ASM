
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\chars\femgoro\mksgf.psx
	;CNOP 0,4
	include ..\chars\femgoro\mksgf.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	;CNOP 0,4
	include ..\common\pounded\opound.psx
	;CNOP 0,4
	include ..\common\pounded\opound.psi

	END_OVERLAY
	end

