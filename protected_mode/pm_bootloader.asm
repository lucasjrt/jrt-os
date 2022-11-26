[org 0x7c00]

mov bp, 0x9000
mov sp, bp

mov bx, REAL_MODE_MSG
call print

call switch_protected_mode

jmp $

%include "../bios_code/lib/print.asm"
%include "gdt/gdt.asm"
%include "video/video.asm"
%include "switch_to_pm.asm"

[bits 32]

BEGIN_PM:
mov ebx, PROTECTED_MODE_MSG
call print_pm
jmp $


REAL_MODE_MSG   	db "Started in 16-bit real mode", 0
PROTECTED_MODE_MSG	db "Now running 32-bit protected mode", 0

times 510-($-$$) db 0
dw 0xaa55
