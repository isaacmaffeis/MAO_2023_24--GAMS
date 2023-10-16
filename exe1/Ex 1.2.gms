$Title Pianificazione multiperiodo della produzione

$Ontext
Soluzione dell'esercizio 2 (Modelli 1)
$Offtext

Set T insieme dei mesi /1*6/ ;

Scalars
 cs costo di stoccaggio /8/
 I0 livello iniziale scorte /50/
 IFin livello finale minimo scorte /60/
 IM livello massimo scorte /100/
;

Parameters
 cp(t) costo di produzione al mese t
/
1 50
2 45
3 55
4 48
5 52
6 50
/

 D(t) domanda al mese t
/
1 100
2 250
3 190
4 140
5 220
6 110
/
;

Variables
 x(t) Produzione al mese t
 I(t) Livello scorte alla fine del mese t
 z    Variabile obiettivo (Costi totali)
;

*Positive Variables x,I ;
Integer Variables x,I ;
*Intere non in N, ma in [0,1,...,100]
x.up(t) = 1000 ;

Equations
 obiettivo   Funzione obiettivo
* liv_fin     Vincolo sul livello finale
* liv_max(t)  Vincolo sulla capacità del magazzino
 bilancio(t) Vincolo di bilancio
;
obiettivo.. z =e= sum(t,cp(t)*x(t)) + cs*sum(t,I(t)) ;
*liv_fin..   I('6') =g= IFin ;
I.lo('6') = IFin ;
*liv_max(t).. I(t) =l= IM ;
I.up(t) = IM ;
bilancio(t).. I(t-1)$(ord(t)>1) + I0$(ord(t)=1) + x(t) =e= D(t) + I(t) ;

$Ontext
Estensioni sulle variabili:
.l ---> Livello ottimo
.up ---> Upper bound
.lo ---> Lower bound
.fx ---> Fissare il valore
$Offtext

Model Production /obiettivo,bilancio/ ;
*Solve Production using LP minimizing z ;
Production.optca = 0 ;
Production.optcr = 0 ;
Solve Production using MIP minimizing z ;

Scalars
 Xtot Produzione nei 6 mesi
 Itot Stoccaggio nei 6 mesi
;
Xtot = sum(t,x.l(t)) ;
Itot = sum(t,I.l(t)) ;

Display Xtot,Itot,x.l,I.l,z.l ;





