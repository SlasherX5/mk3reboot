	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\indian\mkinds.psx
	;CNOP 0,4
	include ..\chars\indian\mkinds.psi
	;CNOP 0,4
	include ..\common\common\friend.psx
	;CNOP 0,4
	include ..\common\common\friend.psi
	END_OVERLAY
	end
