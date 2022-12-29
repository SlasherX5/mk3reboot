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

	PUBLIC _jax_jax_bin
	PUBLIC _jax_jax2_bin

	EXTERN _JAXPRP_P : DWORD
	EXTERN _JAX2PRP_P : DWORD
	EXTERN _JXPROJT_P : DWORD
	EXTERN _JXPREXP_P : DWORD
	EXTERN _JQAK_P : DWORD
	EXTERN _JX2HED_P : DWORD
		
	BEGIN_DATA
	ALIGN 4	
_jax_jax_bin:	
	DD -1,_enddata1-_jax_anitab1
	include chars\jax\mkjax.psx
	include chars\jax\mkjax.psn
	include chars\jax\mkjax.psi
_enddata1:
	ALIGN 4	
_jax_jax2_bin:	
	DD -1,_enddata2-_jax2_anitab1
	include chars\jax2\mkjax2.psx
	include chars\jax2\mkjax2.psn
_enddata2:
	END_DATA

	end
