.data
.text
.globl e_euler_entiere

e_euler_entiere:

movl 4(%esp),%esi   # esi --> iteration = 10 
movl $0x01, %edi    # edi -> i = 1   on commence les iterations à 1 car 1/0 ne peut pas etre calcule
  
push %ebp           # prologue
mov %esp,%ebp
push %ebx

movl $1, %ebx       # ebx = total
movl $1, %ecx       # ecx = denominateur

boucle:
cmp $1, %esi        # si nous somme rendu a la derniere iteration
je bye

movl $0, %edx       # restant est 0 à chaque iteration

movl %ecx, %eax     # calcul du nouveau denominateur
imul %edi
movl %eax, %ecx

movl $1, %eax       # numerateur est 1 à chaque iteration

idiv %ecx           # division, ici vu que apres 3 iterations ca deviens de nombres 
                    # a vergule, on ne peut pas les ajouter au total

addl %eax, %ebx     # ajouter le resultat a ebx
addl $1, %edi       # mettre a jour iteration et i
subl $1, %esi
jmp boucle


bye:
movl %ebx, %eax     # mettre le total dans eax

pop %ebx            # epilogue
pop %ebp
ret


