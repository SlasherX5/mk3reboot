
	include win95.i
	include ovlextrn.i

OVERLAY_SYMBOLS equ 1

; this file defines indices for all external symbols used inside the 
; overlays for mortal kombat.  This is for the fixup entries which are 
; handled by a modified ".rex" file loader which will load files generated 
; by the watcom linker


include compress.i


BEGIN_OVERLAY macro
.MODEL FLAT
.data
public _start_
ASSUME NOTHING
_start_:
endm


END_OVERLAY macro
	dd	0
endm

