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
    string BYTE "asdterDXRT345*!@as4", 0
    nums BYTE 4 DUP(?)
    ; chara = 61h
    ; charz = 7Ah
    ; charA = 41h
    ; charZ = 5Ah
    ; char0 = 30h
    ; char9 = 39h
    caseOffset = 20
    numOffset = 30
.code
main PROC
    lea esi, string
    lea edi, nums
    mov ecx, LENGTHOF string
loop_char:
    mov al, [esi]
    ; 'a' <= al <= 'z'
    cmp al, 'a'
    jnae skip1
    cmp al, 'z'
    jnbe skip1
    ; 小写转大写
    sub al, caseOffset
skip1:
    ; 'A' <= al <= 'Z'
    cmp al, 'A'
    jnae skip2
    cmp al, 'Z'
    jnbe skip2
    ; 大写转小写
    add al, caseOffset
skip2:
    ; '0' <= al <= '9'
    cmp al, '0'
    jnae skip3
    cmp al, '9'
    jnbe skip3
    ; 存数字
    sub al, numOffset
    mov [edi], al
    add edi, TYPE nums
skip3:
    add esi, TYPE string
    loop loop_char

    INVOKE ExitProcess, 0
main ENDP
    END main