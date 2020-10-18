.386
.model flat, stdcall
option casemap :none

include C:\Irvine\Irvine32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib
includelib C:\Irvine\Irvine32.lib

.code
main PROC
    call countPositive
    invoke ExitProcess, 0
main ENDP

countPositive PROC USES ecx
    LOCAL buffer[20]: BYTE
    mov ecx, 5
putint:
    call Random32
    mov DWORD PTR [buffer+ecx*4-4], eax
    loop putint
    mov ecx, 5
    mov eax, 0
count:
    cmp DWORD PTR [buffer+ecx*4-4], 0
    jle next
    inc eax
next:
    loop count
    ret
countPositive ENDP
END main