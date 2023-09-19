$Title Pianificazione della produzione

$Ontext
Soluzione dell'esercizio 1 (Modelli 1)
$Offtext

Sets
 J insieme dei prodotti /P1*P4/
 I insieme dei reparti /A*D/
;

Parameters
 D(j) domanda del prodotto j
/
P1 800
P2 750
P3 600
P4 500
/

 Pr(j) profitto unitario di j
/
P1 30
P2 40
P3 20
P4 10
/

 Pen(j) penalità unitaria di j
/
P1 15
P2 20
P3 10
P4  8
/
;

Scalar C capacità [h] dei reparti /1000/ ;

Table tl(i,j) tempo di lavorazione di j in i
    P1   P2   P3   P4
A  0.3  0.3 0.25 0.15
B 0.25 0.35  0.3  0.1
C 0.45  0.5  0.4 0.22
D 0.15 0.15  0.1 0.05
;
$Ontext
Table è per matrici con dati
Parameter è per matrici che rielaborano i dati
$Offtext
Parameter tl_min(i,j) tempo lav. in minuti ;
tl_min(i,j) = tl(i,j)*60 ;

Variables
 x(j) Quantità di j prodotta
 s(j) Domanda di j non soddisfatta
 z    Variabile obiettivo (Profitti totali)
;

Positive Variables x,s ;

Equations
 obiettivo  Funzione obiettivo
 cap(i)     Vincolo di capacità nel reparto i
 dom(j)     Vincolo di domanda per il prodotto j
;

obiettivo.. z =e= sum(j,Pr(j)*x(j)) - sum(j,Pen(j)*s(j)) ;
cap(i)..  sum(j,tl(i,j)*x(j)) =l= C ;
dom(j)..  x(j) + s(j) =e= D(j) ;

$Ontext
Vincolo  "=" ---> "=e="
Vincolo "<=" ---> "=l="
Vincolo ">=" ---> "=g="

Vincolo "<" ---> Non modellabile (Non lineare)
$Offtext

Model Production /all/ ;
Solve Production using LP maximizing z ;

Scalar Xtot Produzione totale ;
Xtot = sum(j,x.l(j)) ;

Parameter Sat(i) Saturazione nel reparto i ;
Sat(i) = sum(j,tl(i,j)*x.l(j)) / C ;

*x.l ---> Accedere al "Level" della variabile x (i.e., livello ottimo)

Display Xtot,Sat,x.l,s.l,z.l ;


***Punto b)
Positive Variables y(i,j) Produzione di j nel reparto i ;

Equations
 obiettivo_b  Funzione obiettivo al punto b
 cap_b(i)     Vincolo di capacità nel reparto i al punto b
 dom_b(j)     Vincolo di domanda per il prodotto j al punto b
;

obiettivo_b.. z =e= sum(j,Pr(j)*sum(i,y(i,j))) - sum(j,Pen(j)*s(j)) ;
cap_b(i)..  sum(j,tl(i,j)*y(i,j)) =l= C ;
dom_b(j)..  sum(i,y(i,j)) + s(j) =e= D(j) ;

Model Production_b /obiettivo_b,cap_b,dom_b/ ;
Solve Production_b using LP maximizing z ;

Scalar Ytot Produzione totale ;
Ytot = sum(j,sum(i,y.l(i,j))) ;

Parameter Sat2(i) Saturazione nel reparto i ;
Sat2(i) = sum(j,tl(i,j)*y.l(i,j)) / C ;

Display Ytot,Sat2,x.l,s.l,z.l ;





