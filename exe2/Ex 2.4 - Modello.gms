$Title Minimi Tecnici - Modello

$Ontext
Soluzione dell'esercizio 4 (Modelli 2)
$Offtext

$Inlcude "Ex 2.4 - Dati.gms" ;

Variables
 x(j) Produzione di j
 y(j) Binaria: 1 se la produzione è attivata - 0 altrimenti
 z    Variabile obiettivo (profitti totali)
;

Positive Variables x ;
Binary Variables y ;

Equations
 objective   Objective function
 capacity    Capacity constraint
 min_prod(j) Minimum production
 max_prod(j) Maximum production
 min_number  Minimum number of lines activated
;

objective..   z =e= sum(j,(p(j)-c(j))*x(j)) ;
capacity..    sum(j,pt(j)*x(j)) =l= H ;
min_prod(j).. x(j) =g= q(j)*y(j) ;
max_prod(j).. x(j) =l= H/pt(j)*y(j) ;
min_number..  sum(j,y(j)) =g= Nmin ;

Model Lines /all/ ;
Lines.optca = 0 ;
Lines.optcr = 0 ;
Solve Lines using MIP maximizing z ;
Display x.l,y.l,z.l ;

