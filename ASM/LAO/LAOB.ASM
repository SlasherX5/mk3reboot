
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\lao\mklaob.psx
	;CNOP 0,4
	include ..\common\baby\babylao.psx
	;CNOP 0,4
	include ..\common\baby\babylao.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi

	END_OVERLAY
	end

