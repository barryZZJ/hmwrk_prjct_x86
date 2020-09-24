.386
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO, dwExitCode:DWORD
.data
	arr DWORD 10h, 20h, 30h, 40h
	arrSize = ($-arr)/4
.code
main PROC
	MOV eax, arr[(arrSize-1)*4]
	MOV ecx, arrSize-1
loopstart:
	MOV ebx, arr[ecx*4-4]
	MOV arr[ecx*4], ebx
	LOOP loopstart
	MOV arr[0], eax
	INVOKE ExitProcess, 0
main ENDP
END main