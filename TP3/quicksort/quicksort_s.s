.text
CUTOFF:                 # verfier si le T_S pris en parametre est plus petit que 2
.int 2
.globl quicksort_s
quicksort_s:
pushl %ebp
movl %esp, %ebp
pushl %ebx
# DEBUT COMPLETION

movl 8(%ebp), %ecx      # T_S = entré
movl 12(%ebp), %edx     # gauche = entré
movl 16(%ebp), %esi     # droit = entré

si_termine:             # si CUTOFF + gauche > droit, on termine
addl CUTOFF, %edx
cmpl %edx, %esi
jbe retour

movl 12(%ebp), %edx     # Etremite gauche -> i = gauche,
movl 16(%ebp), %esi
subl $1, %esi           # nouvelle Etremite droit -> k = droit -1

trouver_pivot:          # pivot = medianOfThree(T_, gauche, droit) -> pivot = %eax = T_[droit-1]
pushl 16(%ebp)
pushl %edx
pushl %ecx
call medianOfThree 
popl %ecx
popl %edx
popl 16(%ebp)

while_i:               # while (T_[++i] < pivot)
addl $1, %edx
cmpl %eax, %ecx
jb while_i

while_k:               # while (T_[--k] > pivot) 
subl $2, %esi                 
cmpl %eax, %ecx 
jb while_k

if:                    # if (i < k) {swapRefs(T_, i, k); mais il faut sauvegarder %eax
cmpl %esi, %edx
jae changer_place
pushl %eax 
pushl %esi 
pushl %edx 
pushl %ecx
call swapRefs 
popl %ecx
popl %edx
popl %esi
popl %eax
jmp while_i

changer_place:          # Permuter T[i] et pivot -> swapRefs (T_, i, droit - 1); 
movl 16(%ebp), %esi    
sub $1, %esi            # droite - 1
pushl %esi        
pushl %edx
pushl %eax  
push %ecx  
call swapRefs 
popl %ecx
popl %eax
popl %edx
popl %esi

appel_fonction_gauche:  # Trier les elements sous le pivot -> quicksort_s(T_, gauche, i-1);
subl $1, %eax           # i - 1
pushl %eax   
pushl %edx
pushl %esi
pushl %ecx
call quicksort 
popl %ecx
popl %esi
popl %edx
popl %eax

appel_fonction_droite:  # Trier les elements en haut du pivot -> quicksort_s(T_, i+1, droite);
movl 16(%ebp), %esi     # droite
addl $1, %eax           # i + 1
pushl %esi           
pushl %eax
pushl %ecx
call quicksort    
popl %ecx
popl %eax
popl %esi

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
