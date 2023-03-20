.data
.text
.globl _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

_ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
pushl %esi
movl 24(%ebp), %ebx                 # ebx = taux d'interet
movl 28(%ebp), %ecx                 # ecx = annee de retraite 
movl 32(%ebp), %eax                 # eax = salaire voulu
movl $100, %esi  
idivl %esi
movl %eax, %edx                     # edx = % salaire voulu

salaireRetraite:
call _ZN4Reer15salaireFinalAsmEv
imul %edx, %eax       
idivl %esi 
movl %eax, %edx                     # edx = salaire de retraite

movl %ebx, %eax
idivl %esi                          # eax = taux d'interet en %
addl $1, %eax                       # eax = taux d'interet en % + 1
subl $1, %ecx                       # ecx = annee de retraite - 1
exposant1:
imul %ecx, %eax                      
loop exposant1
movl %eax, %ebx                     # ebx = haut de la fraction
decl %eax                           # eax = -1
movl %eax, %esi                     # esi = tau d'interet en %
incl %eax                           # eax = +1
exposant2:
imul %ecx, %eax                      
loop exposant2
imul %esi, %eax                     # eax = bas de la fraction
movl %ebx, %ecx
movl %eax, %ebx                     # ebx = bas de la fraction
movl %ecx, %eax                     # eax = haut de la fraction
idivl %ebx                          # eax = parentheses
imul %edx, %eax                     # eax = montant accumule
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret


