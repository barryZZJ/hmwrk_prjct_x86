pushad
mov ecx, 1000h
mov ebx, 1000h
mov edx, 400000h
add ebx, edx
add ecx, ebx
xor byte ptr ds:[ebx], 15h
inc ebx
cmp ebx, ecx
jl 404014
popad
jmp 40100Ch
