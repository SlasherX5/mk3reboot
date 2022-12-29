include win95.i



CONTEXT_ip          equ     0
CONTEXT_esp         equ     4
CONTEXT_ebp         equ     8
CONTEXT_ebx         equ     12      
CONTEXT_ecx         equ     16  
CONTEXT_esi         equ     20  
CONTEXT_edi         equ     24  


    BEGIN_CODE
_start_::
EXTERN _main_context : DWORD

    public _context_init_main
_context_init_main proc near
; void context_init_main(CONTEXT *main_context)
    mov     eax,dword ptr 4[esp]            ; eax = save_context
    mov     dword ptr CONTEXT_esp[eax],esp  ; save esp
    mov     dword ptr CONTEXT_ebp[eax],ebp  ; save ebp 
    mov     dword ptr CONTEXT_ebx[eax],ebx  ; save ebx
    mov     dword ptr CONTEXT_ecx[eax],ecx  ; save ecx
    mov     dword ptr CONTEXT_esi[eax],esi  ; save esi
    mov     dword ptr CONTEXT_edi[eax],edi  ; save edi
    ret
_context_init_main endp


    public _context_kill_switch
_context_kill_switch proc near
; void context_kill_switch(Context *restore_context)
    ; put in new context and jump to new ip

    mov     eax,4[esp]                      ; move context to eax
    jmp     go_context

    public _context_switch 
_context_switch proc near
; int context_switch(Process *to,Process *from);

; EAX is scratch    
; return address is in [ESP]
; args in stack before return address 
;
; save current context with the return address as the new ip of the saved
; context, then load a new context and jump to it's new ip. 


    mov     eax,dword ptr 8[esp]            ; eax = save_context
    pop     dword ptr CONTEXT_ip[eax]       ; pop return address into ip 
    mov     dword ptr CONTEXT_esp[eax],esp  ; save esp
    mov     dword ptr CONTEXT_ebp[eax],ebp  ; save ebp 
    mov     dword ptr CONTEXT_ebx[eax],ebx  ; save ebx
    mov     dword ptr CONTEXT_ecx[eax],ecx  ; save ecx
    mov     dword ptr CONTEXT_esi[eax],esi  ; save esi
    mov     dword ptr CONTEXT_edi[eax],edi  ; save edi
    mov     eax,[esp]                       ; move goto context to eax

go_context::     ; put in new context and jump to new ip

    mov     esp, dword ptr CONTEXT_esp[eax] ; now on new stack
    mov     ebp,dword ptr CONTEXT_ebp[eax]  ; restore ebp 
    mov     ebx,dword ptr CONTEXT_ebx[eax]  ; restore ebx
    mov     ecx,dword ptr CONTEXT_ecx[eax]  ; restore ecx
    mov     esi,dword ptr CONTEXT_esi[eax]  ; restore esi
    mov     edi,dword ptr CONTEXT_edi[eax]  ; restore edi

    jmp     dword ptr CONTEXT_ip[eax]       ; launch new context 

_context_switch endp
_context_kill_switch endp

    public _context_jump 
_context_jump proc near

; int local_context_jump(Context *to);
;
; jump to a new entry point within the same context setting new 
; stack and frame to the input 
;
    mov     eax,dword ptr 4[esp]            ; eax = save_context
    mov     esp, dword ptr CONTEXT_esp[eax] ; now on new stack
    mov     ebp,dword ptr CONTEXT_ebp[eax]  ; restore ebp 
    jmp     dword ptr CONTEXT_ip[eax]       ; jump to new entry point 
_context_jump endp


    END_CODE
    end
