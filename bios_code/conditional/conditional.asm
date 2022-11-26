mov bx, 41              ; loads value to bx

cmp bx, 4               ; compare bx to value 4
jle if                  ; if bx <= 4 then execute if

cmp bx, 40              ; compare bx to value 40
jl elif                 ; if bx < 40 then execute if

jmp else                ; if none of above conditions are met, execute else 


if:
	mov al, 'A'         ; set al to 'A'
	jmp endif           ; quit conditions
elif:
	mov al, 'B'         ; set al to 'B'
	jmp endif           ; quit conditions
else:
	mov al, 'C'         ; set al to 'C'
endif:
mov ah, 0x0e            ; set tty
int 0x10                ; print al

jmp $                   ; infinite loop

times 510-($-$$) db 0   ; 0 padding
dw 0xaa55               ; magic number
