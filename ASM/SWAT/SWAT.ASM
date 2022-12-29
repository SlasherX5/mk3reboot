	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
	include ..\chars\swat\mkswat.psx
	;CNOP 0,4
	include ..\chars\swat\mkswat.psi
	;CNOP 0,4
	include ..\chars\swat\swb.psi
	END_OVERLAY
	end
