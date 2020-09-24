.386
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO, dwExitCode:DWORD
.data
    wordArray WORD 810Dh, 0C064h, 93ABh ; 021Bh, 80C9h, 2756h
.code
main PROC
    MOV bx, wordArray[0] ; bx = 810D
    MOV cx, wordArray[1*2]
    SHL ecx, 16
    MOV cx, wordArray[2*2] ; ecx = C064 : 93AB
    SHL bx, 1
    SHL ecx, 1
    LAHF
    AND ah, 1h ; 取进位标志（ecx左移出去的那一位）
    OR  bl, ah ; bx最低位补进位标志
    MOV wordArray[2*2], cx
    SHR ecx, 16
    MOV wordArray[1*2], cx
    MOV wordArray[0], bx
    INVOKE ExitProcess, 0
main ENDP
END main