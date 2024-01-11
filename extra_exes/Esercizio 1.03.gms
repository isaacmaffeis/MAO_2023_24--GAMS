Sets
I insieme dei materiali /Ferro, Nichel, Cromo, Impurita/
J insieme dei rottami /1*6/
;

Scalars
Pc percentuale cromo /0.18/
Pn percentuale nichel /0.1/
Qmin quantit√† minima di acciaio da produrre /100/
Pf percentuale ferro /0.65/
Pimax /0.01/
;

Table Perc(i,j) percentuali di materiali i nel rottame j
                1       2       3       4       5       6
Ferro           0.93    0.76    0.74    0.65    0.72    0.68
Nichel          0.05    0.13    0.11    0.16    0.06    0.23
Cromo           0       0.11    0.12    0.14    0.2     0.08
Impurita        0.02    0       0.03    0.05    0.02    0.01
;

Parameters
P(j) peso dei rottami j
/
1 30
2 90
3 50
4 70
5 60
6 50
/

C(j) costo dei rottami j
/
1 50
2 100
3 80
4 85
5 92
6 115
/
;

Variables
x(j) quantit‡† di rottami acquistati
z;

Positive variables x;
x.up(j)=P(j) ;

Equations
obiettivo
qmina
Cromo
nichel
ferro
impurita
;

obiettivo.. z =e= sum(j, c(j)*x(j));
qmina.. sum(j, x(j)) =g= qmin;
cromo.. sum(j, x(j)*perc('cromo',j)) =e= Pc*sum(j, x(j));
nichel.. sum(j, x(j)*perc('nichel',j)) =e= Pn*sum(j, x(j));
ferro.. sum(j, x(j)*perc('ferro',j)) =g= Pf*sum(j, x(j));
impurita.. sum(j, x(j)*perc('impurita',j)) =l= Pimax*sum(j, x(j));

model esercizio3 /all/;
solve esercizio3 using lp minimizing z;
display z.l, x.l;



