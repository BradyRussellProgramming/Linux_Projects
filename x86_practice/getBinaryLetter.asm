section .bss
	byte_mask resb 1

section .data
	my_letter db 'A'
	char_1 db '1'
	char_0 db '0'
	char_newline db 10

global _start

_start:
	mov byte [byte_mask], 10000000b
	jmp while_1

while_1:
	; Loop logic
	cmp byte [byte_mask], 00000000b
	je while_1_out
	;-----------

	mov al, byte [my_letter]
	and al, byte [byte_mask]
	cmp al, byte [byte_mask]
	je if_1_then
	jmp if_1_else
	if_1_then:
		mov eax, 4
		mov ebx, 1
		mov ecx, char_1
		mov edx, 1
		int 0x080

		jmp if_1_out

	if_1_else:
		mov eax, 4
		mov ebx, 1
		mov ecx, char_0
		mov edx, 1
		int 0x080

		jmp if_1_out

	if_1_out:

	; Loop logic
	shr byte [byte_mask], 1
	jmp while_1

while_1_out:
	mov eax, 4
	mov ebx, 1
	mov ecx, char_newline
	mov edx, 1
	int 0x80

	jmp end

end:
	; Exit the program
	mov eax, 1
	xor ebx, ebx
	int 0x80
