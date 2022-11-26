; func
disk_load:
	push dx       ; The amount of sectors to be read

	mov ah, 0x02  ; BIOS read sector
	mov al, dh    ; Sector count
	mov ch, 0x00  ; Cylinder 0
	mov dh, 0x00  ; Head 0
	mov cl, 0x02  ; Sector 2 (after the boot sector)

	int 0x13

	jc disk_error1 ; If carry flag is set, then signal error

	pop dx        ; Restore the amount of sectors to be read

	cmp dh, al    ; al = sectors read, dh = sectors expected (if diffs)
	jne disk_error2 ; then signal error
	ret


disk_error1:
	mov bx, DISK_ERROR_BYTES
	call print
	jmp $
disk_error2:
	mov bx, DISK_ERROR_READ
	call print
	jmp $
	
DISK_ERROR_BYTES: db "Could not read the expected amount of bytes in disk", 0
DISK_ERROR_READ:  db "Could not read the expected location in disk", 0
