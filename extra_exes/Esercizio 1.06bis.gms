sets i insieme dei nodi /1*9/
o(i) nodi origine /1/
d(i) destinazione /7*9/;
alias (i,j)  ;

Table c(i,j) costi da i a j
        1       2       3       4       5       6       7       8       9
1       0       20      18      19      0       0       0       0       0
2       0       0       12      0       19      21      26      0       0
3       16      14      0       13      17      0       0       0       0
4       0       0       13      0       0       17      23      0       0
5       0       0       0       0       0       17      0       14      0
6       0       0       0       0       0       0       19      10      12
7       0       0       0       0       0       18      0       0       9
8       0       0       0       0       0       11      0       0       7
9       0       0       0       0       0       0       8       0       0 ;

parameter b(i);
b(o) =-3;
b(d) = 1;


variables
x(i,j)  1 se l'arco è percorso 0 altrimenti
z;
Positive variables x;

equations
obiettivo
bilancio(i)
;

obiettivo.. z=e= sum((i,j),x(i,j)*c(i,j));
bilancio(i).. sum(j, x(j,i))-sum(j,x(i,j)) =e= b(i);


x.fx(i,j)$(c(i,j)=0)=0;


model es6 /all/;
solve es6 using lp minimizing z;
display z.l, x.l;

