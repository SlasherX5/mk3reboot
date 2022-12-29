	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\chars\subzero\mksz.psx
	;CNOP 0,4
	include ..\chars\subzero\mksz.psi
	;CNOP 0,4
	include ..\chars\subzero\szb.psi
	END_OVERLAY
	end
