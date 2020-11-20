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
    libName  db "tstdll.dll",0
    FuncName db "TestProc",0
    hLib dd 0
    szText db "HelloWorld",0
    szTitle db "title",0
    NULL = 0
    MB_OK = 0
.code
main PROC
    ; 装载动态链接库
    invoke LoadLibrary, ADDR libName
    mov hLib, eax
    
    ; 获取函数VA
    invoke GetProcAddress, hLib, ADDR FuncName
    call eax

    ; 释放动态链接库
    invoke FreeLibrary, hLib

    ; 静态调用MessageBox函数
    invoke MessageBox, NULL, ADDR szText, NULL, MB_OK

    invoke ExitProcess, 0
main ENDP
END main