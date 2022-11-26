[org 0x7c00]

mov bx, booting_string
call print

booting_string:
	db "Booting JRT OS...", 0


print:
	pusha
	mov ah, 0x0e

start_print:
	mov cx, [bx]
	cmp cl, 0
	je end_print
	mov al, cl
	int 0x10
	add bx, 1
	jmp start_print
end_print:
	popa
	ret

jmp $

times 510-($-$$) db 0
dw 0xaa55
