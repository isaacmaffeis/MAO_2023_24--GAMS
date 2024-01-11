sets
I insieme dei nodi /1*9/
O(i) insieme dei nodi di origine /1/
D(i) insieme dei nodi di destinazione /8/
;

alias(i,j);


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
9       0       0       0       0       0       0       8       0       0
;


variables
y(i,j) Flusso sull'arco i-j
z
;

parameter b(i);
b(o)= -1;
b(d)= 1
Positive variables y;

y.fx(i,j)$(c(i,j)=0)=0;

equations
obiettivo
bilancio(i);

obiettivo.. z=e= sum((i,j), c(i,j)*y(i,j));
bilancio(i).. sum(j, y(j,i)) - sum(j, y(i,j)) =e= b(i);


model esercizio6 /all/;
esercizio6.optca=0;
esercizio6.optcr=0;
solve esercizio6 using mip minimizing z;
display z.l, y.l;





