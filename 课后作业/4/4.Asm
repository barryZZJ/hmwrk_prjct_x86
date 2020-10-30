.386
.model flat, stdcall
option casemap :none

include C:\Irvine\Irvine32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib
includelib C:\Irvine\Irvine32.lib

.data
    arr WORD 524 DUP(0)
    lpText BYTE "I'm a msg box.", 0 ; The message to be displayed.
.code
main PROC
    ; 赋随机值
    lea esi, OFFSET arr
    mov ecx, LENGTHOF arr
loop_rand:
    invoke Random32
    mov WORD PTR [esi], ax
    add esi, TYPE arr
    loop loop_rand

    ; 求最小值
    lea esi, OFFSET arr
    mov ecx, LENGTHOF arr
    mov ax, WORD PTR [esi]
loop_min:
    cmp ax, WORD PTR [esi]
    jle next
    mov ax, WORD PTR [esi]
next:
    add esi, TYPE arr
    loop loop_min

    invoke MessageBox, NULL, OFFSET lpText, NULL, MB_OK
    invoke ExitProcess, 0
main ENDP
END main