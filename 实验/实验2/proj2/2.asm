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
    arr DWORD 1h, 2h, 3h
    resSum DWORD ?
    resAvg DWORD ?
.code
main PROC
    ; 1. 求和
    push TYPE arr
    push LENGTHOF arr
    push OFFSET arr
    call sum
    add esp, 12
    mov resSum, eax

    ; 2.求平均值
    push TYPE arr
    push LENGTHOF arr
    push OFFSET arr
    call avg
    add esp, 12
    mov resAvg, eax

    invoke ExitProcess, 0
main ENDP

; 数组求和，参数1：数组的起始地址，参数2：数组元素个数，参数3：元素所占字节数 (从右往左push)
sum PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]
    mov ecx, [ebp+12]
    mov eax, 0
sumLoop:
    add eax, [esi]
    add esi, [ebp+16]
    loop sumLoop
    pop ebp
    ret
sum ENDP

; 数组求平均值，参数1：数组的起始地址，参数2：数组元素个数，参数3：元素所占字节数 (从右往左push)
avg PROC
    push ebp
    mov ebp, esp
    push [ebp+16]
    push [ebp+12]
    push [ebp+8]
    call sum
    add esp, 12
    mov edx, 0
    mov ecx, [ebp+12]
    div ecx
    pop ebp
    ret
avg ENDP
END main