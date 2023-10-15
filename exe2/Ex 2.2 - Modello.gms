$Title Costi Fissi - Modello

$Ontext
Soluzione dell'esercizio 2 (Modelli 2)
$Offtext

$Include "Ex 2.2 - Dati.gms" ;
Display J,F,c ;

Variables
 x(j) Utilizzo (minuti) di j
 y(j) Binaria: 1 se j è utilizzato - 0 altrimenti
 z    Variabile obiettivo (Costi totali)
;

Positive Variables x ;
Binary Variables y ;

Equations
 obiettivo Funzione obiettivo
 utilizzo  Vincolo di domanda
 coer(j)   Vincolo di coerenza tra x e y
;

obiettivo..  z =e= sum(j, F(j)*y(j) + c(j)*x(j) ) ;
utilizzo..   sum(j,x(j)) =e= D ;
coer(j)..    x(j) =l= D*y(j) ;

Model Phone /all/ ;
Phone.optca = 0 ;
Phone.optcr = 0 ;
Solve Phone using MIP minimizing z ;

Display x.l,y.l,z.l ;