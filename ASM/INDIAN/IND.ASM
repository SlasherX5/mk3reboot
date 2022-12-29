	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\indian\mkind.psx
	;CNOP 0,4
	include ..\chars\indian\mkind.psi
	;CNOP 0,4
	include ..\chars\indian\indb.psi
	END_OVERLAY
	end
