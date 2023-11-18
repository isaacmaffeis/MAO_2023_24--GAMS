$Title Reti Interne

$OnText
Soluzione dell'esercizio 1 (Modelli 3)
$Offtext

$Include "Ex 3.1 - Dati.gms" ;
Display C ;

Parameter Inv(s,t) Costo di investimento per il server s al mese t ;
Inv(s,t)=C(s) ;
Inv(s,t)$(ord(t)<=2 and ord(s)=3) = C(s)*(1-sc1) ;
Inv(s,t)$(ord(t)<=2 and ord(s)=4) = C(s)*(1-sc2) ;
Display Inv ;

Variables
 x(s,t)  Numero di server s installati al mese t
 y(s,t)  Numero di server s disponibili al mese t
 z       Variabile obiettivo (Costi totali di investimento)
;

Integer Variables x,y ;
alias(t,tau) ;

Equations
 obiettivo    Funzione obiettivo
 legame(s,t)  Creazione del legame tra x e y
 copertura(t) Copertura delle utenze
 budget       Vincolo di budget per i primi due mesi
 prod_3       Server disponibili per la produzione al mese 3
;
obiettivo..   z =e= sum((s,t),Inv(s,t)*x(s,t)) ;
legame(s,t).. y(s,t) =e= sum(tau$(ord(tau)>=1 and ord(tau)<=ord(t)),x(s,tau)) ;
copertura(t).. sum(s,N(s)*y(s,t)) =g= U(t) ;
budget..      sum((s,t)$(ord(t)>=1 and ord(t)<=2),Inv(s,t)*x(s,t)) =l= B ;
prod_3..  y('SGI','3') + y('SUN','3') =g= 1 ;

Model Server /all/ ;
Server.optca = 0 ;
Server.optcr = 0 ;
Solve Server using MIP minimizing z ;
Display copertura.l,x.l,y.l,z.l ;


