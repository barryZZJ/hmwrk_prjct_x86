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
    s BYTE "asdterDXRT345*!@as4", 0
    nums BYTE 4 DUP(?)
    caseOffset = 20h
    numOffset = 30h
.code
main PROC
    push TYPE nums
    push LENGTHOF s
    push OFFSET nums
    push OFFSET s
    call func
    add esp, 16
    invoke ExitProcess, 0
main ENDP

; 参数1：字符串起始地址，参数2：数组起始地址，参数3：字符串长度，参数4：数组元素的大小 (从右往左push)
func PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]
    mov edi, [ebp+12]
    mov ecx, [ebp+16]
loop_char:
    mov al, [esi]
    ; 'a' <= al <= 'z'
    cmp al, 'a'
    jnae skip1
    cmp al, 'z'
    jnbe skip1
    ; 小写转大写
    sub al, caseOffset
    mov [esi], al
    jmp skip3
skip1:
    ; 'A' <= al <= 'Z'
    cmp al, 'A'
    jnae skip2
    cmp al, 'Z'
    jnbe skip2
    ; 大写转小写
    add al, caseOffset
    mov [esi], al
    jmp skip3
skip2:
    ; '0' <= al <= '9'
    cmp al, '0'
    jnae skip3
    cmp al, '9'
    jnbe skip3
    ; 存数字
    sub al, numOffset
    mov [edi], al
    add edi, [ebp+20]
skip3:
    add esi, 1
    loop loop_char

    pop ebp
    ret
func ENDP
END main