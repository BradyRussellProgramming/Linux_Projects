section .bss

section .data

global _start

_start:

	jmp end

end:
	; Exit the program
	mov eax, 1
	xor ebx, ebx
	int 0x80
