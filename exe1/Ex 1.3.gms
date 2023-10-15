$Title Miscelazione 1

$Ontext
Soluzione dell'esercizio 3 (Modelli 1)
$Offtext

Sets
 I insieme dei prodotti base /1*4/
 J insieme ddei composti /A*C/
;

Parameters
 d(i) Disponibilità del prodotto i
/
1 3000
2 2000
3 4000
4 1000
/

 c(i) Costo del prodotto i
/
1 3
2 6
3 4
4 5
/

 r(j) Ricavo del composto j
/
A 5.5
B 4.5
C 3.5
/
;

Table LO(j,i) Quantità minima di prodotto i nel composto j
    1    2    3    4
A   0   0.4   0    0
B   0   0.1   0    0
C  0.7   0    0    0
;

Table UP(j,i) Quantità massima di prodotto i nel composto j
    1    2    3    4
A  0.3   1   0.5   1
B  0.5   1    1    1
C   1    1    1    1
;

Variables
 x(i,j) Quantità di prodotto i nel composto j
 y(j)   Quantità di composto j prodotta
 z      Variabile obiettivo: Profitti totali
;

Positive Variables x,y ;

Equations
 obiettivo    Funzione obiettivo
 disp(i)      Disponibilità del prodotto i
 prod_tot(j)  Produzione totale della benzina j
 lb_mix(i,j)  Lower bound sulla miscela
 ub_mix(i,j)  Ipper bound sulla miscela
;

obiettivo.. z =e= sum(j,r(j)*y(j)) - sum((i,j),c(i)*x(i,j)) ;
disp(i)..   sum(j,x(i,j)) =l= d(i) ;
prod_tot(j).. y(j) =e= sum(i,x(i,j)) ;
lb_mix(i,j).. x(i,j) =g= LO(j,i)*y(j) ;
ub_mix(i,j).. x(i,j) =l= UP(j,i)*y(j) ;

Model Miscelazione /all/ ;
Solve Miscelazione using LP maximizing z ;

Display x.l,y.l,z.l ;
