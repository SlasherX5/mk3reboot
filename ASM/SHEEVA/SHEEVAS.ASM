
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\chars\femgoro\mksgs.psx
	;CNOP 0,4
	include ..\chars\femgoro\mksgs.psi
	;CNOP 0,4
	include ..\common\common\friend.psx
	;CNOP 0,4
	include ..\common\common\friend.psi

	END_OVERLAY
	end

