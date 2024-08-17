; define thee system calls to the linux kernel

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1


section .data       

    welcomeMsg db 'Welcome User, Test if a number is Even or Odd',  0xA
    len equ $ - welcomeMsg
    
    inputMsg db 'Enter your Number: ' 
    len1 equ $ - inputMsg
    
    displayMsgOdd db 'The number is an odd Number', 0xA 
    len2 equ $ - displayMsgOdd
    
    displayMsgEven db 'The Number is a even Number', 0xA
    len3 equ $ - displayMsgEven


section .bss        
    num resb 4


section	.text           
   global _start         ;must be declared for using gcc
_start:	                 ;tell linker entry point
    
    
    ; print out the welcome message 
    mov eax, 4
    mov ebx, 1  
    mov ecx, welcomeMsg
    mov edx, len
    int 0x80
    
main_loop: 
        
    ; print out input message 
    mov edx, len1
    mov ecx, inputMsg
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80
    
    ; read input message and store in num 
    mov edx, 4
    mov ecx, num 
    mov ebx, STDIN
    mov eax, SYS_READ
    int 0x80 
    
    
    
      ; Convert ASCII string to integer
    movzx eax, byte [num]   ; Load the first byte into EAX and zero-extend
    sub eax, '0'            ; Convert ASCII to integer
    
    mov bx, 2         
    
    xor dx, dx        ; Clear DX before division (DX:AX forms the dividend)
    div bx            ; Divide DX:AX by BX (AX = quotient, DX = remainder)
    
    
    ; if ( dx = 0 ) jump to is_even
    cmp dx, 0         
    je is_even      

    ; Else
    jmp is_odd       
    

is_even: 

    ; print output message if even 
    mov edx, len2
    mov ecx, displayMsgEven
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80
    
    jmp main_loop

is_odd: 
    
    ; print output message if odd 
    mov edx, len3
    mov ecx, displayMsgOdd
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 0x80
    
    jmp main_loop 
    
end_if: 

    mov eax, SYS_EXIT 
    xor ebx, ebx            ; Exit code 0
    int 0x80

