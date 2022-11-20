[org 0x7c00]

mov ah, 0x0e

mov bx, 0x7c00
add bx, the_secret
mov al, [bx]
int 0x10

the_secret:
	db "X"

times 510-($-$$) db 0

dw 0xaa55
