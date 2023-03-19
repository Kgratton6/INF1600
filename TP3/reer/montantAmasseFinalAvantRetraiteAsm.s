.data
.text
.globl _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

_ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
movl 24(%ebp), %ebx     # ebx = taux d'interet
movl 28(%ebp), %ecx     # ecx = annee de retraite 
movl 32(%ebp), %edx     # edx = salaire voulu
movl $100, %esi  

exposant1:
movl %ebx, %eax
addl $1, %eax
subl $1, %ecx
imul %ebx,%eax               
loop exposant1






call _ZN4Reer15salaireFinalAsmEv
imul %edx, %eax       
idivl %esi 

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret


