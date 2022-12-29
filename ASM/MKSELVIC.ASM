
;******************************************************************************
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Select Screen Stances & Victories Animation Tables
;******************************************************************************/

 	include win95.i
	include mkchar.i

	PUBLIC _kano_panitab1
	PUBLIC _sonya_panitab1
	PUBLIC _jax_panitab1
	PUBLIC _jax2_panitab1
	PUBLIC _ind_panitab1
	PUBLIC _sz_panitab1
	PUBLIC _swat_panitab1
	PUBLIC _lia_panitab1
	PUBLIC _robo1_panitab1
	PUBLIC _robo2_panitab1
	PUBLIC _lao_panitab1
	PUBLIC _tusk_panitab1
	PUBLIC _sg_panitab1
	PUBLIC _st_panitab1
	PUBLIC _lk_panitab1

	EXTERN	_GLOW_P : DWORD
	EXTERN	_GRNFLM_P : DWORD
	EXTERN	_GFIRE_P : DWORD

	BEGIN_DATA
	
	ALIGN 4
	include chars\sonya\pselect\mksonyap.psx
	include chars\sonya\pselect\mksonyap.psi

	ALIGN 4
	include chars\kano\pselect\mkkanop.psx
	include chars\kano\pselect\mkkanop.psi

	ALIGN 4
	include chars\jax\pselect\mkjaxp.psx
	include chars\jax\pselect\mkjaxp.psi

	ALIGN 4
	include chars\jax2\pselect\mkjax2p.psx
	include chars\jax2\pselect\mkjax2p.psi

	ALIGN 4
	include chars\lia\pselect\mkliap.psx
	include chars\lia\pselect\mkliap.psi

	ALIGN 4
	include chars\lkang\pselect\mklkp.psx
	include chars\lkang\pselect\mklkp.psi

	ALIGN 4
	include chars\shang\pselect\mkstp.psx
	include chars\shang\pselect\mkstp.psi

	ALIGN 4
	include chars\indian\pselect\mkindp.psx
	include chars\indian\pselect\mkindp.psi

	ALIGN 4
	include chars\femgoro\pselect\mksgp.psx
	include chars\femgoro\pselect\mksgp.psi

	ALIGN 4
	include chars\robo1\pselect\mkrobo1p.psx
	include chars\robo1\pselect\mkrobo1p.psi

	ALIGN 4
	include chars\robo2\pselect\mkrobo2p.psx
	include chars\robo2\pselect\mkrobo2p.psi

	ALIGN 4
	include chars\lao\pselect\mklaop.psx
	include chars\lao\pselect\mklaop.psi

	ALIGN 4
	include chars\subzero\pselect\mkszp.psx
	include chars\subzero\pselect\mkszp.psi

	ALIGN 4
	include chars\swat\pselect\mkswatp.psx
	include chars\swat\pselect\mkswatp.psi

	ALIGN 4
	include chars\tusk\pselect\mktuskp.psx
	include chars\tusk\pselect\mktuskp.psi


	END_DATA
	end

