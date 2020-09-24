.386
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO, dwExitCode:DWORD
.data
    val1 DWORD ?
    val2 DWORD 25
    val3 DWORD 4
    val4 DWORD 5
.code
main PROC
    MOV eax, val2
    MUL val3
    MOV ebx, val4
    SUB ebx, 3
    DIV ebx
    MOV val1, eax
    INVOKE ExitProcess, 0
main ENDP
END main