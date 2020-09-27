.386
.model flat, stdcall
option casemap :none

include kernel32.inc
include user32.inc
include masm32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib

.code
main PROC
    mov ax, 7FF0h
    ; CF=0, SF=0, ZF=1, OF=0
    add al, 10h
    ; ax == 7F00
    ; al == 00
    ; CF=1, SF=0, ZF=1, OF=0
    add ah, 1
    ; ax == 8000
    ; ah: 7F(0111_1111) -> 80(1000_0000), 
    ; CF=0, SF=1, ZF=0, OF=1
    add ax, 2
    ; ax == 8002
    ; CF=0, SF=1, ZF=0, OF=0
    INVOKE ExitProcess, 0
main ENDP
    END main