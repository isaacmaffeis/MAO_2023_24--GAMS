Sets
I insieme dei centri /1*5/
J insieme dei quartieri /q1*q8/;

Table C(i,j) 1 se il quartiere j può essere assegnato al centro i
   q1 q2 q3 q4 q5 q6 q7 q8
1   1  0  0  1  0  0  1  0
2   0  1  0  0  1  0  0  1
3   1  0  1  1  0  0  0  0
4   0  0  1  0  0  1  0  0
5   1  1  1  0  0  1  0  0
;

variables
y(i) binaria 1 se il centro i è attivato
z
;

binary variables y;

equations
obiettivo     numero di centri attivati
copertura(j)  ogni quartiere è servito da un solo centro
;

obiettivo.. z =e= sum(i, y(i)) ;
copertura(j).. sum(i, y(i)*C(i,j)) =e= 1;

model esercizio12 /all/;
esercizio12.optca=0;
esercizio12.optcr=0;
solve esercizio12 using mip minimizing z;




