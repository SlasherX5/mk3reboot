

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\lia\mkliab.psx
	;CNOP 0,4
	include ..\common\baby\babylia.psx
	;CNOP 0,4
	include ..\common\baby\babylia.psi
	;CNOP 0,4
	include ..\common\baby\babyxpld.psi


	END_OVERLAY
	end

