.386
.model flat, stdcall
option casemap :none

include C:\Irvine\Irvine32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib
includelib C:\Irvine\Irvine32.lib

.data
    lpText BYTE "Hello World!", 0 ; The message to be displayed.

.code
main PROC
    invoke MessageBox, NULL, OFFSET lpText, NULL, MB_OK
    invoke ExitProcess, 0
main ENDP
END main
    