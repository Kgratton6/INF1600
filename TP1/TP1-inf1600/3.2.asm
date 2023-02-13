.text
boucle:
ld a
sub weight
st a
ld suivant 
st temp
add actuel
add actuel
st suivant
ld actuel
st precedent
ld temp
st actuel
ld a
brz fin
br boucle
fin:
stop
.data
weight: 1
a: 21
temp: 0
precedent: 0
actuel: 1
suivant: 1