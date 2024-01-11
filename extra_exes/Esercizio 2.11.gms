$title  Composizione progetti

Sets
j indice dei progetti /p1*p7/
i indice degli ingegneri /i1*i10/
;

Parameters
R(j) ricavo dal progetto j-esimo
/
p1  120
p2  20
p3  150
p4  45
p5  75
p6  80
p7  130
/
;

Table p(i,j) potenziale presenza dell'ingegnere i nel progetto j
    p1  p2  p3  p4  p5  p6  p7
i1  0   0   1   0   1   0   0
i2  1   0   0   0   1   0   0
i3  1   0   0   1   0   0   1
i4  0   1   1   0   0   0   0
i5  1   0   0   1   0   1   0
i6  0   0   0   0   0   1   0
i7  1   1   1   1   0   0   1
i8  0   0   0   1   0   0   0
i9  0   1   1   0   1   1   1
i10 0   1   0   0   1   0   1
;

Variables
y(j) variabile binaria : 1 se progetto j scelto 0 altrimenti
z    variabile obiettivo
;

Binary variables y;

Equations
obiettivo funzione obiettivo
assegnamento(i) vincolo presenza dell'ingegnere in un singolo progetto
;

obiettivo.. z =e= sum(j,y(j)*R(j));
assegnamento(i).. sum(j,p(i,j)*y(j)) =l= 1;


Model Civilsud /all/;
Civilsud.optca=0 ;
Civilsud.optcr=0 ;
Solve Civilsud using mip maximizing z;

Display y.l,z.l;



