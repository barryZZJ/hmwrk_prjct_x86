.386
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO, dwExitCode:DWORD
.data
	arr BYTE 10h, 20h, 30h, 40h
	arrSize = ($-arr)
.code
main PROC
	MOV ecx, 0
loopstart:
	CMP ecx, arrSize
	JNL loopend
	MOV al, arr[ecx]
	XCHG al, arr[ecx+1]
	MOV arr[ecx], al
	ADD ecx, 2
	JMP loopstart
loopend:
	INVOKE ExitProcess, 0
main ENDP
END main