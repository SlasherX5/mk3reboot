	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\subzero\mkszb.psx
	;CNOP 0,4
	include ..\common\baby\babysz.psx
	;CNOP 0,4
	include ..\common\baby\babysz.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi
	END_OVERLAY
	end
