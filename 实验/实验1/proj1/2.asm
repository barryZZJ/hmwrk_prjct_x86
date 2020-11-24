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
    vara WORD 3450h
    varb WORD 76h
    varc WORD 1234h
    vard WORD 2345h
    res WORD ?
.code
main PROC
    mov ax, vara
    add ax, varb
    mul varc
    div vard
    mov res, ax
    INVOKE ExitProcess, 0
main ENDP
    END main