# Doumentation

## print
Arguments:
- bx: the string to be printed with a null byte at the end

return:
- nothing

### Example
```
mov bx, my_string         ; load string to bx
call print                ; call to function

my_string:
    db 'Hello, World!', 0 ; string with a null byte at the end
```
