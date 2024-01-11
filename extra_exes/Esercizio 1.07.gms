sets
i insieme dei nodi /s,1, 2, 3, 4, p/;

alias (i,j);

table q(i,j) quantita massima trasportabile da i a j
       s   1     2    3   4   p
s      0   150  270   0   0   0
1      0   0     0   160 160  0
2      0   190   0   160 160  0
3      0   0     0    0  160 180
4      0   0     0    0   0  250
p      0   0     0    0   0   0;

variables
x(i,j)quantita trasportata da i a j
y quantita trasportata da s a p
z variabile obietivo
;
positive variable x,y;
equations
obiettivo
bilancios(i)
bilanciod(i)
bilanciot(i);


obiettivo.. z=e= y;
bilancios(i)$(ord(i) lt 2).. sum(j,x(j,i))-sum(j,x(i,j)) =e= -y;
bilanciod(i)$(ord(i) gt 5).. sum(j,x(j,i))-sum(j,x(i,j)) =e= y;
bilanciot(i)$(ord(i) gt 1 and ord(i)lt 6).. sum(j,x(j,i)) =e= sum(j, x(i,j));
x.up(i,j)= q(i,j);


model es7 /all/;
solve es7 using lp maximizing z;