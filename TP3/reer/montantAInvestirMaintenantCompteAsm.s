.data
.text
ENCAISSE: 
.int 123570
COMPTE:
.double 1.0550000000000000044
.globl _ZN6Compte29montantAInvestirMaintenantAsmEv

_ZN6Compte29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
pushl %eax
movl 12(%ebp), %ebx                 # ebx = anneeAvantRetraite
negl %ebx                           # ebx = -anneeAvantRetraite
addl ENCAISSE, %ecx                 # ecx = encaisse
addl COMPTE, %edx

power:
imul %edx, %ebx
loop power
call _ZN4Reer15salaireFinalAsmEv    # eax = salaireFinal
imul %ebx, %eax                     # eax = salaireFinal * pow(1.05, -anneeAvantRetraite)
subl %eax, %ecx                     # ecx = montantAInvestirMaintenant
movl %ecx, %eax                     # eax = montantAInvestirMaintenant
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret


_encaisse - salaireFinal() * pow(1.05, -_anneeAvantRetraite);

