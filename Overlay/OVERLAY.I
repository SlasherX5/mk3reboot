
	include win95.i
	include ovlextrn.i

OVERLAY_SYMBOLS equ 1

; this file defines indices for all external symbols used inside the 
; overlays for mortal kombat.  This is for the fixup entries which are 
; handled by a modified ".rex" file loader which will load files generated 
; by the watcom linker


include compress.i


BEGIN_OVERLAY macro

BEGIN_DATA

public _start_
_start_:

endm


END_OVERLAY macro

END_DATA

_stack	segment byte stack use32 'stack'
;define a minimal stack to keep linker from complaining
	dd	0
_stack	ends

endm

