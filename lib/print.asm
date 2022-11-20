%ifndef PRINT_ASM
%define PRINT_ASM
; func
print:              ; # print function
	pusha           ; stack all registers
	mov ah, 0x0e    ; tty mode
start_print:        ; print loop
	mov al, [bx]    ; load char to al
	cmp al, 0       ; check if is null byte
	je end_print    ; skip if null byte
	int 0x10        ; else print to screen
	add bx, 1       ; move index by 1
	jmp start_print ; go back to loop
end_print:          ; end loop
	popa            ; restore registers from stack
	ret             ; jump to caller


; func
println:
	pusha

	call print

	mov ah, 0x0e

	mov al, 0x0a
	int 0x10

	mov al, 0x0d
	int 0x10

	popa
	ret
%endif
