%ifndef PRINT_HEX_ASM
%define PRINT_HEX_ASM
%include "print.asm"
; func
print_hex:
	pusha                ; stack registers
	mov bx, hex_template ; set template once
	add bx, 5            ; go to last position of template
	; index variable
	mov al, 0            ; "a" register can be used as no interrupt is being called
shifting_start:
	add al, 1            ; index increase
	mov cx, dx           ; using cx to not overwrite dx
	and cx, 0x0f         ; zero all other digits but the least significant one
	cmp cx, 10           ; if greater than 10 must move on ascii characters
	jl non_letter        ; if is digit, just sum the number
	add cx, 0x27           ; if is letter, sum the difference from ascii
non_letter:
	add [bx], cx         ; add to ascii character on template
	sub bx, 1            ; move left on template character
	shr dx, 4            ; shift right on dx to move on next digit of hex number
	cmp al, 4
	je shifting_end      ; only fits 4 digits
	cmp dx, 0            ; if 0, number is over
	jne shifting_start   ; if not 0, keep working on it
shifting_end:
	sub bx, 1
	call print           ; bx has the correct template, now print it and quit
	popa                 ; restore registers
	ret
hex_template: db "0x0000", 0 ; template to be modified
%endif
