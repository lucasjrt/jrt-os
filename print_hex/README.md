# Doumentation

## print_hex
Arguments:
- dx: the hex value to be printed with a null byte at the end

return:
- nothing

### Example
```
mov bx, 0x1fb6             ; load hex value to dx
call print_hex             ; call to function

```
