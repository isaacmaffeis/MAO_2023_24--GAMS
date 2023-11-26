$Title Trasporto con depositi - Modello

$Ontext
Soluzione dell'esercizio 4 (Modelli 3)
$Offtext

$Include "Ex 3.4 - Dati.gms" ;
Display ct1 ;

Variables
 x(i,j) Trasporto i-j
 y(i,c) Trasporto i-c
 k(j,c) Trasporto j-c
 z      Variabile obiettivo (Costi totali)
;

Positive Variables x,y,k ;

Equations
 obiettivo    Funzione obiettivo
 cap_prod(i)  Capacità produttiva
 cap_stoc(j)  Capacità di stoccaggio
 domanda(c)   Vincolo di domanda
 bilancio(j)  Bilancio ai depositi
;
x.fx(i,j)$(ct1(i,j)=0) = 0 ;
y.fx(i,c)$(ct2(i,c)=0) = 0 ;
k.fx(j,c)$(ct3(j,c)=0) = 0 ;

obiettivo.. z =e= sum((i,j),ct1(i,j)*x(i,j))
               +  sum((i,c),ct2(i,c)*y(i,c))
               +  sum((j,c),ct3(j,c)*k(j,c)) ;
cap_prod(i).. sum(j,x(i,j)) + sum(c,y(i,c)) =l= CP(i) ;
cap_stoc(j).. sum(i,x(i,j)) =l= CS(j) ;
domanda(c)..  sum(i,y(i,c)) + sum(j,k(j,c)) =e= D(c) ;
bilancio(j).. sum(i,x(i,j)) =e= sum(c,k(j,c)) ;

Model Transport /all/ ;
Solve Transport using LP minimizing z ;
Display x.l,y.l,k.l,z.l ;

$Ontext
ct1('Milano','Bergamo') = ct1('Milano','Bergamo') - x.m('Milano','Bergamo') - 0.00001 ;
Solve Transport using LP minimizing z ; ù
Scalar of valore della funzione obiettivo ;
of = z.l ;
CS('Pavia')=CS('Pavia')+1 ;
Solve Transport using LP minimizing z ;
Scalar Delta Variazione dei costi ;
Delta = z.l - of ;
Display Delta, z.l, of ;
$Offtext

***Punto B)
Parameter R(j) Risparmio mensile
/
Bergamo    7000
Pavia     10000
Piacenza   6000
Mantova    5000
/
;

Binary Variables teta(j) 1 se il deposito j è chiuso - 0 altrimenti ;

Equations
 obiettivo_b   Nuova funzione obiettivo
 cap_stoc_b(j) Nuovo vincolo di stoccaggio (coerenza)
;

obiettivo_b.. z =e= sum((i,j),ct1(i,j)*x(i,j))
                 +  sum((i,c),ct2(i,c)*y(i,c))
                 +  sum((j,c),ct3(j,c)*k(j,c))
                 -  sum(j,R(j)*teta(j)) ;

cap_stoc_b(j).. sum(i,x(i,j)) =l= CS(j)*(1-teta(j)) ;

Model Transport_b /obiettivo_b,cap_stoc_b,cap_prod,domanda,bilancio/ ;
Transport_b.optca = 0 ;
Transport_b.optcr = 0 ;
Solve Transport_b using MIP minimizing z ;
Display x.l,y.l,k.l,teta.l,z.l ;



