.data
iteration:
.int 3   
i:
.float 1
factorial:
.float 1
e:
.float 1                # commence a la premiere iteration
one:
.float 1
.text
.globl e_euler_flottante

e_euler_flottante:

push %ebp               # prologue    
mov %esp,%ebp
push %ebx

leal iteration,%ecx     # ecx = iteration
movl (%ecx),%ecx

cmp $1, %ecx            # si le nombre diterations est 1, on ne change rien a e, et on va a la fin
je end

loop:            
 
flds factorial          # st[0] = factorial
flds i                  # st[0] = i                            st[1] = factorial
fmulp                   # st[0] = factorial * i                st[1] = libre
flds one                # st[0] = 1                            st[1] = old_factoral * i
fdivp                   # st[0] = 1 / ( old_factoral * 1 )     st[1] = libre    (somme partielle) = 1 / ( old_factoral * 1 )
flds e                  # st[0] = e                            st[1] = (somme partielle)
faddp                   # st[0] = e + (somme partielle)        st[1] = libre
fstps e                 # e reviens en memoire  st[0] = libre, st[1] = libre

flds factorial          # st[0] = factorial               # changer la valeur de factorial pour le prochain
flds i                  # st[0] = i                            st[1] = factorial
fmulp                   # st[0] = factorial * i                st[1] = libre
fstps factorial         # factorial reviens     st[0] = libre  st[1] = libre

flds i                  # st[0] = i
flds one                # st[0] = 1                            st[1] = i
faddp                   # st[0] = i + 1                        st[1]= libre
fstps i                 # nouveau i reviens     st[0] = libre, st[1] = libre

dec %ecx                # on reviens dans la boucle si nous avons pas fini
cmp $1, %ecx            # il faut arreter 1 iteration plus tot, car nous commencons avec e = 1
jne loop

end:                 
flds e                  # st[0] = e pour le retour de la fonction

pop %ebx                # epilogue
pop %ebp
ret
