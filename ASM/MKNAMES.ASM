
;******************************************************************************
; File: mknames.s
;
; By: David Schwartz
;
; Date: August 1994
;
; (C) Williams Entertainment
;
; Mortal Kombat III Names For Powerbards
;******************************************************************************/


	include win95.i
	include mkchar.i

	EXTERN _WHITE_p : DWORD
	EXTERN _LOADING_P : DWORD

	BEGIN_DATA


	ALIGN 4
	PUBLIC _combo_heap
_combo_heap:

	PUBLIC _DANGER
_DANGER:
	DD _DANGER_TPG-_combo_heap
	DW 43,9,0,0
	DD _WHITE_p
_DANGER_TPG:
	DW 0,139,41,0

	PUBLIC _TOASTY
_TOASTY:
	DD _TOASTY_TPG-_combo_heap
	DW 78,70,0,0
	DD _LOADING_P
_TOASTY_TPG:
	DW 0,0,170,0

	PUBLIC _damage_s
_damage_s:
	DD _damage_s_TPG-_combo_heap
	DW 65,10,0,0
	DD _WHITE_p
_damage_s_TPG:
	DW 0,0,0,0

	PUBLIC _hit_s
_hit_s:
	DD _hit_s_TPG-_combo_heap
	DW 26,10,0,0
	DD _WHITE_p
_hit_s_TPG:
	DW 0,65,0,0

	ALIGN 4
 	PUBLIC _name_anim_imgs
_name_anim_imgs:
	DD N_KANO_IMG
	DD N_SONYA_IMG
	DD N_JAX_IMG
	DD N_NIGHTWOLF_IMG
	DD N_SUBZERO_IMG
	DD N_STRYKER_IMG
	DD N_SINDEL_IMG
	DD N_SEKTOR_IMG
	DD N_CYRAX_IMG
	DD N_KUNGLAO_IMG
	DD N_KABAL_IMG
	DD N_SHEEVA_IMG
	DD N_SHANGTSUNG_IMG
	DD N_LIUKANG_IMG
	DD N_SMOKE_IMG
	DD N_MOTARO_IMG
	DD N_SHAOKAHN_IMG
	DD N_NOOBSAIBOT_IMG

	include attract\misc\mkbgname.psi

	END_DATA
	end
