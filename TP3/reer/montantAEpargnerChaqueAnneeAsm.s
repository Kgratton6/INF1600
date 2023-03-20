.data
.text
.globl _ZN4Reer30montantAEpargnerChaqueAnneeAsmEv

_ZN4Reer30montantAEpargnerChaqueAnneeAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
pushl %eax
movl 12(%ebp), %edx     # edx = annees avant retraite
movl 24(%ebp), %eax     # eax = interets
movl $100, %ebx 
idivl %ebx              # eax = pourcentage interets

power:
movl %eax, %ecx         # ecx = pourcentage interets
incl %ecx           # ecx = pourcentage interets + 1
decl %edx           # edx = annees avant retraite - 1
imul %ecx, %edx         
loop power
idivl %edx
movl %eax, %ecx         # ecx = interieur de la parenthese
call _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv
imul %ecx, %eax         # eax = montant apargne  
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
