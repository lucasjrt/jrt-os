[org 0x7c00]

mov [BOOT_DRIVE], dl ; Saving current boot drive in DL, as BIOS saves it on dl register

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000       ; We are reading from es to bx, es starting from 0x0000 as not explicitly defined
mov dh, 5            ; How many sectores are being read from disk to memory on the above addresses

mov dl, [BOOT_DRIVE] ; Recovering boot drive number saved previously
call disk_load

mov dx, [0x9000]     ; Expected to have the post padding bytes here (0x1010) as it is the first sector after our code
cal print_hex

mov dx, [0x9000 + 512] ; Next loaded sector (0xface)
call print_hex

jmp $

%include "../lib/print.asm"
%include "../lib/print_hex.asm"
%include "disk_io.asm"

BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0x1010
times 256 dw 0xface
