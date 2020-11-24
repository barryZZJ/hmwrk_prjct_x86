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
    arrA WORD 567Fh, 78FFh, 4C6Ah, 90A4h, 6ABCh, 0F56Ah
    arrB WORD 6 DUP(?)
.code
main PROC
    ; 1. 数组A复制到数组B
    lea esi, arrA ; esi = &arrA
    lea edi, arrB ; edi = &arrB
    mov ecx, LENGTHOF arrA ; 循环 arrA.size次
loop_copy:
    mov ax, [esi]
    mov [edi], ax ; *edi = *esi
    add esi, TYPE arrA ; esi++
    add edi, TYPE arrB ; edi++
    loop loop_copy

    ; 2. 数组A中每个数据算术左移2位
    lea esi, arrA
    mov ecx, LENGTHOF arrA
loop_salA:
    mov ax, [esi]
    sal ax, 2
    mov [esi], ax
    add esi, TYPE arrA
    loop loop_salA

    ; 数组B中每个数据循环右移两位
    lea esi, arrB
    mov ecx, LENGTHOF arrB
loop_rorB:
    mov ax, [esi]
    ror ax, 2
    mov [esi], ax
    add esi, TYPE arrB
    loop loop_rorB

    ; 3. 将两个数组对应数据进行异或运算，结果保存到A数组中
    lea esi, arrA
    lea edi, arrB
    mov ecx, LENGTHOF arrA
loop_xor:
    mov ax, [esi]
    xor ax, [edi]
    mov [esi], ax
    add esi, TYPE arrA
    add edi, TYPE arrB
    loop loop_xor

    INVOKE ExitProcess, 0
main ENDP
    END main