
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\chars\femgoro\mksgf1.psx
	;CNOP 0,4
	include ..\chars\femgoro\mksgf1.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	;CNOP 0,4
	include ..\common\reach\orjax.psx
	;CNOP 0,4
	include ..\common\reach\orjax.psi
	;CNOP 0,4
	include ..\common\rip\oripjax.psx
	;CNOP 0,4
	include ..\common\rip\oripjax.psi
	;CNOP 0,4
	include ..\common\rip\oripskel.psi

	END_OVERLAY
	end

