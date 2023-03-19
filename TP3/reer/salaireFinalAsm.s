.data
.text
.globl	_ZN4Reer15salaireFinalAsmEv

_ZN4Reer15salaireFinalAsmEv:
pushl %ebp
movl %esp, %ebp
pushl %ebx
# DEBUT COMPLETION

movl 16(%ebp), %eax     #eax = salaire depart
movl 20(%ebp), %ebx     #ebx = augmentation salariale
movl 32(%ebp), %ecx     #ecx = Anne avant retrait
movl $100, %edx         #edx = 100

subl $1, %ecx




# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
popl %ebx
leave
ret
