.386
.model flat, stdcall
option casemap :none

include kernel32.inc
include user32.inc
include masm32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib

; 声明cpyArr子过程
cpyArr PROTO,
    arrp: DWORD, len: DWORD

.data
    arr WORD 10 DUP(5)
    hWnd DWORD 0h ; A handle to the owner window of the message box to be created.
    lpText BYTE "I'm a msg box.", 0 ; The message to be displayed.
    lpCapt BYTE "This is title", 0 ; The dialog box title.
    uType DWORD 0h ; The contents and behavior of the dialog box. MB_OK
    
.code
main PROC
    invoke MessageBox, hWnd, OFFSET lpText, NULL, uType
    invoke cpyArr, OFFSET arr, LENGTHOF arr
    invoke ExitProcess, 0
main ENDP

cpyArr PROC USES esi edi ecx eax,
    arrp: DWORD, len: DWORD
    LOCAL tmparr[10]: WORD
    mov esi, arrp
    lea edi, tmparr
    mov ecx, len
loop_cpy:
    mov ax, WORD PTR ds:[esi]
    mov WORD PTR ss:[edi], ax
    add esi, TYPE WORD
    add edi, TYPE WORD
    loop loop_cpy
    ret
cpyArr ENDP
END main