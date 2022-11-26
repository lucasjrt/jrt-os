[bits 32]

; Constants (same as C's #define)
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; func
print_pm:
	pusha
	mov edx, VIDEO_MEMORY   ; Start of video mem
	mov ah, WHITE_ON_BLACK  ; set text color/attributes

print_pm_loop:
	mov al, [ebx]           ; loads ebx to al register

	cmp al, 0               ; if byte is 0...
	je print_pm_done        ; ...finish execution

	mov [edx], ax           ; set video mem to char cell

	add ebx, 1              ; move to next char to print
	add edx, 2              ; move to next position on video array

	jmp print_pm_loop       ; loop to next char

print_pm_done:
	popa
	ret
