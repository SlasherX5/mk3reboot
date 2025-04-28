

	include win95.i
	include mkchar.i

	PUBLIC _lkang_lkang_bin

	EXTERN _LKRED_P : DWORD
	EXTERN _DRAGFIR_P : DWORD
	

	BEGIN_DATA
	ALIGN 4
_lkang_lkang_bin:
	DD -1,_enddata1-lk_anitab1
	include chars\lkang\mklk.psx
	include chars\lkang\mklk.psn
	include chars\lkang\mklk.psi
	include chars\lkang\lub.psi
_enddata1:
	END_DATA

	end

