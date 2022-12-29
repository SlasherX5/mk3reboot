
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	;CNOP 0,4
	include ..\chars\femgoro\mksgb.psx
	;CNOP 0,4
	include ..\common\baby\babysg.psx
	;CNOP 0,4
	include ..\common\baby\babysg.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi

	END_OVERLAY
	end

