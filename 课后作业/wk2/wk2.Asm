.386
.model flat, stdcall
option casemap :none

include kernel32.inc
include user32.inc
include masm32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib
.data
    res DWORD 5
.code
main PROC
    mov eax, res
    push eax
    call fact
    add esp, 4
    mov res, eax
    invoke ExitProcess, 0
main ENDP

fact PROC
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, [ebp+8]
    cmp ebx, 0
    je r1
    cmp ebx, 1
    jne next
r1:
    mov eax, 1
    pop ebx
    pop ebp
    ret
next:
    dec ebx
    push ebx
    call fact
    add esp, 4
    inc ebx
    mul ebx
    pop ebx
    pop ebp
    ret
fact ENDP

END main