; gcd(a, b) = gcd (b, a mod b)
.386
.model flat, stdcall
option casemap :none

include kernel32.inc
include user32.inc
include masm32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib

gcd PROTO,
    a: DWORD, b: DWORD

.code
main PROC
    invoke gcd, 5, 20
    invoke gcd, 432, 226
    invoke ExitProcess, 0
main ENDP
gcd PROC USES edx,
    a: DWORD, b: DWORD
    cmp b, 0
    jnz next
    mov eax, a
    ret
next:
    mov eax, a
    mov edx, 0
    div b
    invoke gcd, b, edx
    ret
gcd ENDP
END main