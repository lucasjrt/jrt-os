[bits 16]
switch_protected_mode:
	cli                     ; turn off interrupts to avoid unexpected behaviors
	lgdt [gdt_descriptor]   ; load GDT
	mov eax, cr0            ; take current value of cr0
	or eax, 0x1             ; turn on last bit
	mov cr0, eax            ; write back its new value

	jmp CODE_SEG:init_protected_mode

[bits 32]
init_protected_mode:
	; set all segment registers to segment data
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ebp, 0x90000
	mov esp, ebp
	call BEGIN_PM
