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
    x DWORD 3
    y DWORD 2
    res DWORD ?
.code
main PROC
    ; 1. 寄存器传参
    mov eax, x
    mov ebx, y
    call add_reg
    mov res, eax

    ; 2. 变量传参
    push x
    push y
    call add_var
    mov res, eax
    
    ; 3. 变量地址传参
    push OFFSET x
    push OFFSET y
    call add_addr
    mov res, eax

    invoke ExitProcess, 0
main ENDP

; 1. 寄存器传参
; 参数1：eax，参数2：ebx
add_reg PROC
    add eax, ebx
    ret
add_reg ENDP

; 2. 变量传参
; 两个参数从栈中取
add_var PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add eax, [ebp+12]
    pop ebp
    ret 8
add_var ENDP

; 3. 变量地址传参
; 两个参数的地址在栈中
add_addr PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+12]
    mov eax, [esi]
    mov esi, [ebp+8]
    add eax, [esi]
    pop ebp
    ret 8
add_addr ENDP

END main