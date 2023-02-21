.data
strings:
.asciz "Allo hi"
num:
.asciz "Allo"
den:
.asciz "Hi"
.text
.globl main


main : 
push %ebp
mov %esp,%ebp
push %ebx

mask:
xor %eax, %eax          
xor %ecx, %ecx
xor %ebx, %ebx
xor %edx, %edx            ## preparer le registre a la division

setup:
movl $strings, %esi     

n_c:
lodsb                  

d:              
cmp $0x20, %al
je n_c2
cmp $0x41, %al
jb n_c2
cmp $0x5A, %al
jbe a                   ## changer pour reconnaitre le 'Z'
cmp $0x61, %al
jb n_c2
cmp $0x7A, %al 
jbe a

a:       
addl %eax, %ecx
jmp n_c

n_c2:
lodsb

d2:
cmp $0,%al
je r
cmp $0x41, %al
jb r
cmp $0x5A, %al
jbe a_2
cmp $0x61, %al
jb r
cmp $0x7A, %al 
jbe a_2

a_2:
addl %eax, %ebx
jmp n_c2

r:
movl %ecx, %eax

divl %ebx          
cmp $0x00, %eax
je e_d                 ## bons sauts selon le resultat        

e_n:
push $num
call printf
addl $4, %esp
 
jmp bye

e_d:
push $den
call printf
addl $4, %esp



bye:
pop %ebx
mov %ebp, %esp       ## l'epilogue n'est pas complet
pop %ebp
ret



