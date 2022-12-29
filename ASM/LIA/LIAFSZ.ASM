

	include overlay.i
	include mkchar.i

	BEGIN_OVERLAY
base_anims:
	;CNOP 0,4
	include ..\chars\lia\mkliaf.psx
	;CNOP 0,4
	include ..\chars\lia\mkliaf.psi
	;CNOP 0,4
	include ..\common\common\fatal.psx
	;CNOP 0,4
	include ..\common\common\fatal.psi
	;CNOP 0,4
	include ..\common\rip\oripsz.psx
	;CNOP 0,4
	include ..\common\rip\oripsz.psi
	;CNOP 0,4
	include ..\common\rip\oripskel.psi


	END_OVERLAY
	end

