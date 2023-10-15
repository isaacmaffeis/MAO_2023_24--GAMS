$Title Assegnamento - Modello

$Ontext
Soluzione dell'esercizio 1 (Modelli 2)
$Offtext

$Include "Ex 2.1 - Dati.gms" ;
Display p,C ;

Variables
 x(i,j)  Binaria: 1 se i è assegnato a j - 0 altrimenti
 y(j)    Binaria: 1 se j è utilizzato
 z       Variabile obiettivo (Numero di stive utilizzate)
;

Binary Variables x,y ;

Equations
 obiettivo  Funzione obiettivo
 asseg(i)   Bancale i è assegnato ad una stiva
 numero(j)  Numero di bancali massimi per stiva j
 peso(j)    Vincolo di capacità della stiva j
;

obiettivo.. z =e= sum(j,y(j)) ;
asseg(i)..  sum(j,x(i,j)) =e= 1 ;
numero(j).. sum(i,x(i,j)) =l= N*y(j) ;
peso(j)..   sum(i,p(i)*x(i,j)) =l= C(j) ;

Model Load /all/ ;
Load.optca = 0 ;
Load.optcr = 0 ;
Solve Load using MIP minimizing z ;

Parameter peso_tot(j) Peso totale imbarcato sulla stiva j ;
*peso_tot(j) = sum(i,p(i)*x.l(i,j)) ;
peso_tot(j) = peso.l(j) ;

Display peso_tot,x.l,y.l,z.l ;

