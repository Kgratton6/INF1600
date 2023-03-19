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
exposant:
movl %ecx, %eax                 
idivl %esi             
addl $1, %eax
subl $1, %edx
imul %ebx,%eax               
loop exposant
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
popl %ebx
leave
ret
