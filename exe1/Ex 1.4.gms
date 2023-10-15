$Title Miscelazione 2

$Ontext
Soluzione dell'esercizio 4 (Modelli 1)
$Offtext

Sets
 J insieme dei rottami /1*5/
 I insieme dei componenti /Stagno,Zinco,Piombo/
;

Scalars
 P produzione richiesta /300/
 Q disponibilità di ciasun rottame /150/
;

Parameters
 L(i) percentuale nella lega di elemento i
/
Stagno 40
Zinco  35
Piombo 25
/

 C(j) costo di utilizzo del rottame j
/
1 22
2 20
3 25
4 24
5 27
/
;

Table f(i,j) Frazione di i in j
          1   2   3   4   5
Stagno   60  25  45  20  50
Zinco    10  15  45  50  40
Piombo   30  60  10  30  10
;

Variables
 x(j)  Quantità utilizzata di j
 z     Variabile obiettivo (Costi totali)
;

Positive Variables x ;

Equations
 obiettivo      Funzione obiettivo
 produzione     Vincolo di produzione della lega
 percentage(i)  Percentaule di ciascun elemento
;
x.up(j)=Q ;

obiettivo.. z =e= sum(j,C(j)*x(j)) ;
produzione.. sum(j,x(j)) =e= 300 ;
percentage(i).. sum(j,f(i,j)*x(j)) =e= L(i)*sum(j,x(j)) ;

Model Ex /all/ ;
Solve Ex using LP minimizing z ;


