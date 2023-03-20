.data
.text
.globl	_ZN4Reer15salaireFinalAsmEv

_ZN4Reer15salaireFinalAsmEv:
pushl %ebp
movl %esp, %ebp
pushl %ebx
# DEBUT COMPLETION
pushl %eax
movl 16(%ebp), %ebx     # ebx = salaire depart
movl 20(%ebp), %ecx     # ecx = augmentation salariale
movl 28(%ebp), %edx     # edx = annees avant retraite
movl $100, %esi         # esi = 100
movl %ecx, %eax                     
idivl %esi              # eax = augmentation salariale/100
addl $1, %eax           # eax = augmentation salariale/100 + 1
subl $1, %edx           # edx = annees avant retraite-1
exposant:
imul %edx, %eax         # eax = parentheses exposant annees avant retraite-1      
loop exposant
imul %ebx, %eax         # eax = salaire final
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
popl %ebx
leave
ret
