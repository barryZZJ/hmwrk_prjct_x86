.386
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO, dwExitCode:DWORD
.data
    fib DWORD 8 DUP(?)
.code
main PROC
    MOV fib[1*4], 1
    MOV fib[2*4], 1
    MOV ecx, 3
loopstart:
    CMP ecx, 7
    JNLE loopend
    MOV eax, fib[ecx*4-4]
    ADD eax, fib[ecx*4-2*4]
    MOV fib[ecx*4], eax
    INC ecx
    JMP loopstart
loopend:
    INVOKE ExitProcess, 0
main ENDP
END main

;int fib[8];
;fib[1] = 1;
;fib[2] = 1;
;for (int i = 3; i <= 7; i++){
;    fib[i] = fib[i-1] + fib[i-2];
;}