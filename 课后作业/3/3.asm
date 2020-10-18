.386
.model flat, stdcall
option casemap :none

include kernel32.inc
include user32.inc
include masm32.inc

includelib kernel32.lib
includelib user32.lib
includelib masm32.lib

FindLargest PROTO,
    arrp: DWORD, len: DWORD ; 声明函数，用于invoke

.data
    arr1 DWORD 3, -2, 5
    arr2 DWORD 5, 19, 23, -65, 78, 22
    arr3 DWORD -10, -15, -2, -9, -86
.code
main PROC
    invoke FindLargest, OFFSET arr1, LENGTHOF arr1
    invoke FindLargest, OFFSET arr2, LENGTHOF arr2
    invoke FindLargest, OFFSET arr3, LENGTHOF arr3
    invoke ExitProcess, 0
main ENDP
FindLargest PROC USES esi ecx,
    arrp: DWORD, len: DWORD
    mov esi, arrp ; 取数组起始地址
    mov ecx, len ; 循环次数与数组长度相同
    mov eax, DWORD PTR [esi+ecx*4-4] ; 取最后一个数
loop1:
    cmp eax, DWORD PTR [esi+ecx*4-4] ; 和arr[ecx-1]比较，留较大者为eax
    jnl next
    mov eax, DWORD PTR [esi+ecx*4-4]
next:
    loop loop1
FindLargest ENDP
END main