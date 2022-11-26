; GDT
gdt_start:

gdt_null:         ; mandatory null descriptor to signal we remembered setting GDT
	dd 0x0        ; defines 4 bytes
	dd 0x0


gdt_code:         ; code segment descriptor
	; limit=0xfffff (maximum limit (notice this continues on other bits))
	; base=0x00, (from lowest address (notice this continues on other bits))
	; 1st flags: (present (valid sector)) 1, (privilege (ring:0[highest]-3[lowest])) 00, (descriptor type (1=code/data, 0=system)) 1 -> 1001b
	; access type flags: (code/executable) 1, (conforming (can be accessed by lower privilege?)) 0, (readable) 1, (accessed) 0 -> 1010b
	; 2nd flags: (granularity (limit*4K) 1, (32-bit default (1=32-bits, 0=16-bits)) 1, (64-bit seg) 0, (AVL (debug purpose)) 0 -> 1100b
	dw 0xffff     ; segment limit
	dw 0x0        ; first base...
	db 0x0        ; ...4 bytes
	db 10011010b  ; 1st flags + access type flags
	db 11001111b  ; 2nd flags + limit higher bytes
	db 0x0        ; higher part of base

gdt_data:         ; code segment descriptor
	; almost the same as code segment, but not executable
	; access type flags: (code/executable) 0, (conforming (can be accessed by lower privilege?)) 0, (readable) 1, (accessed) 0 -> 0010b
	dw 0xffff     ; segment limit
	dw 0x0        ; first base...
	db 0x0        ; ...4 bytes
	db 10010010b  ; 1st flags + access type flags
	db 11001111b  ; 2nd flags + limit higher bytes
	db 0x0        ; higher part of base

gdt_end:          ; used by the assembler to calculate GDT size for GDT descriptor


gdt_descriptor:
	dw gdt_end - gdt_start - 1 ; size of GDT - 1 (for some reason)
	dd gdt_start               ; start of GDT


; Constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
