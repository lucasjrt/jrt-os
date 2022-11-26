; memory reindex
[org 0x7c00]

; code
mov dx, 0xf0da
call print_hex
jmp end
; endcode

%include "print_hex.asm"

end:
; infinite loop and padding
jmp $

times 510-($-$$) db 0
dw 0xaa55
