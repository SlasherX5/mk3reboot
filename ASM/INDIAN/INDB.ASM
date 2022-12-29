	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\indian\mkindb.psx
	;CNOP 0,4
	include ..\common\baby\babyind.psx
	;CNOP 0,4
	include ..\common\baby\babyind.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi
	END_OVERLAY
	end
