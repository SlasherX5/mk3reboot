	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
	;CNOP 0,4
base_anims:
	include ..\chars\swat\mkswatb.psx
	;CNOP 0,4
	include ..\common\baby\babyswat.psx
	;CNOP 0,4
	include ..\common\baby\babyswat.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi
	END_OVERLAY
	end
