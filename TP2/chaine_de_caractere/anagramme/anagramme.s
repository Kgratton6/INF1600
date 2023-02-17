.data 
string1:
.asciz  "chien" 
lenght1:
.int 5
string2:
.asciz  "niche"
lenght2:
.int 5
.text
.globl anagramme

main:
anagramme: ##VOTRE CODE ICI

not_same_lenght:
movl lenght1, %eax
movl lenght2, %ecx
cmp %ecx, %eax             
jne end1

mask:            
xor %eax, %eax  
xor %ebx, %ebx 
xor %ecx, %ecx  

setup_string1:
movl $string1, %esi  

n_c:
lodsb                  

d:              
cmp $0, %al
je setup_string2          
jbe a                    

a:       
addl %eax, %ecx
jmp n_c

setup_string2:
movl $string2, %esi  

n_c2:
lodsb

d2:
cmp $0,%al
jbe r                 

a_2:
addl %eax, %ebx
jmp n_c2

r:
movl %ecx, %eax            ## total 1 in eax, total 2 in ebx

cmp %eax, %ebx             ## pas besoin de diviser par le longeur, car ca donne la meme chose des deux coté
je end2
jmp end3

end1:
movl $1, %eax  ## pas la meme longeur   
jmp bye   

end2:
movl $0, %eax ## est un anagramme
jmp bye

end3:
movl $255, %eax ## nest pas un anagramme

bye:
ret           
push %eax
