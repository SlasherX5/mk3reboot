

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	include ..\chars\lkang\mklks.psx
	;CNOP 0,4
	include ..\chars\lkang\mklks.psi
	;CNOP 0,4
	include ..\common\common\friend.psx
	;CNOP 0,4
	include ..\common\common\friend.psi


	END_OVERLAY
	end

