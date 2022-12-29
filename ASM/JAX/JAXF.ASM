;******************************************************************************
; File: mkjax.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Jax Animation Tables
;******************************************************************************/

	include win95.i
	include mkchar.i

	PUBLIC _jaxf_jax2_bin

	EXTERN _BLDXPD_P : DWORD
	EXTERN _JX2HED_P : DWORD
		
	BEGIN_DATA
	ALIGN 4	
_jaxf_jax2_bin:
	DD -1,_enddataf1-jaxf_anitab1
base_anims:
	include chars\jax2\mkjaxf.psx
	include chars\jax2\mkjaxf.psi
	include common\common\bloodxp.psx
	include common\common\bloodxp.psi
	include common\common\fatal.psx
	include common\common\fatal.psi
	include common\headoff\headoff.psx
	include common\headoff\headoff.psi
_enddataf1:
	END_DATA

	end
