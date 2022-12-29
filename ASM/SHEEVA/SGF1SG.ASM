
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
	include ..\common\reach\orsg.psx
	;CNOP 0,4
	include ..\common\reach\orsg.psi
	;CNOP 0,4
	include ..\common\rip\oripsg.psx
	;CNOP 0,4
	include ..\common\rip\oripsg.psi
	;CNOP 0,4
	include ..\common\rip\oripskel.psi

	END_OVERLAY
	end

