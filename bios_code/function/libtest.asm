[org 0x7c00]

mov bx, booting_string
call print

booting_string:
	db "Booting JRT OS...", 0


; include files
%include "../lib/print.asm"

jmp $

times 510-($-$$) db 0
dw 0xaa55
