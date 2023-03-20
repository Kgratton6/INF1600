.data
.text
.globl _ZN4Reer29montantAInvestirMaintenantAsmEv

_ZN4Reer29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
pushl %eax
movl 24(%ebp), %eax     # eax = interets 
movl 12(%ebp), %edx     # edx = annees avant retraite
movl $100, %ebx 
idivl %ebx              # eax = interets / 100

negl %edx               # edx = -(annees avant retraite)
incl %eax               # eax = %interets + 1
power:           
imull %eax, %edx        
loop power
call _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv     # eax = montant accumule
imul %edx, %eax         # eax = montant investi
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
