
	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY

base_anims:
	include ..\chars\lao\mklaof1.psx
	;CNOP 0,4
	include ..\chars\lao\mklaof1.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	;CNOP 0,4
	include ..\common\cutup\ocutup.psx
	;CNOP 0,4
	include ..\common\cutup\ocutup.psi

	END_OVERLAY
	end

