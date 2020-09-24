.386
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO, dwExitCode:DWORD
.data
    arr DWORD 0, 2, 5, 9, 10
    arrSize = ($-arr)/4
    sum DWORD ?
.code
main PROC
    MOV eax, 0
    MOV ecx, arrSize-1
loopstart:
    MOV ebx, arr[ecx*4]
    SUB ebx, arr[ecx*4-4]
    ADD eax, ebx
    LOOP loopstart
    MOV sum, eax
    INVOKE ExitProcess, 0
main ENDP
END main

;int arr[] = {0, 2, 5, 9, 10};
;int arrSize = sizeof(arr)/sizeof(arr[0]);
;int sum = 0;
;for(int i = arrSize-1; i>0; i--){
;    sum += arr[i] - arr[i-1];
;}
;cout << sum;