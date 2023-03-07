.text
.globl syracuse_s_rec
.globl afficher
syracuse_s_rec:
pushl  %ebp
movl   %esp, %ebp
pushl %ebx
# DEBUT COMPLETION

movl 8(%ebp), %eax             # un = entré
movl 12(%ebp), %ebx            # i  = entré

movl $0, %ecx                  # mettre tous les autres registres à 0
movl $0, %edx

afficher_ligne:                # print Syracuse(i) = un
pushl %eax
pushl %ebx
call afficher
popl %ebx 
popl %eax

boucle:
cmp $1, %eax                  # si la valeur de un est = à 1, on termine le programme
je retour 
addl $1, %ebx                 # i += 1
push %eax
movl $2, %ecx                 # vefifier si le nombre est pair (divisible par 2)
movl $0, %edx
divl %ecx
cmpl $0, %edx
jz cas_paire
jmp cas_impair

cas_paire:                    # un = un/2
popl %eax
divl %ecx
jmp appel_fonction

cas_impair:                   # un = un*3 + 1
popl %eax
movl $3, %ecx
mull %ecx
addl $1, %eax
jmp appel_fonction

appel_fonction:              # syracuse_s_rec(%eax, %ebx); 
pushl %ebx            
pushl %eax
call syracuse_s_rec
popl %eax
popl %ebx


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE

retour:   
popl %ebx
leave
ret
