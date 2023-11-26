$Title Pianificazione Produzione - Modello

$Ontext
Soluzione dell'esercizio 3 (Modelli 3)
$Offtext

$Include "Ex 3.3 - dati.gms" ;
Display Nman ;

Scalar hAP numero di ore di apertura ;
hAP = G*h*TU ;

Variables
 x(j,t) Produzione
 v(j,t) Vendita
 s(j,t) Stoccaggio
 z      Variabile obiettivo (profitti totali)
;

Positive Variables x,v,s ;

Equations
 obiettivo        Funzione obiettivo
 bilancio(j,t)    Vincolo di bilancio
 lavorazioni(i,t) Vincolo sui tempi di lavorazione
;

v.up(j,t) = D(t,j) ;
s.up(j,t) = S_max ;
s.fx(j,'Giu') = S0 ;

obiettivo..   z =e= sum((j,t),P(j)*v(j,t)) - cs*sum((j,t),s(j,t)) ;
bilancio(j,t).. x(j,t) + s(j,t-1)$(ord(t)>1) + S0$(ord(t)=1) =e= v(j,t) + s(j,t) ;
lavorazioni(i,t).. sum(j,tl(i,j)*x(j,t)) =l= hAP*(Ntot(i)-Nman(i,t)) ;

Model Production /all/ ;
Solve Production using LP maximizing z ;
Display x.l,v.l,s.l,z.l ;


***Punto B
Integer Variables Nm(i,t) numero di macchinari di i in manutenzione al mese t ;
Nm.up(i,t) = Ntot(i) ;

Equations
 lavorazioni_b(i,t) Vincolo sulle lavorazione al punto b
 Nmax(t)            Massimo numero di manutanzioni
 manutenzioni(i)    Macchinari in manutenzione nel reparto i (diverso dalla smerigliatura)
 manutenzioni_1     Macchinari in manutenzione nel reparto di smerigliatura
;

lavorazioni_b(i,t).. sum(j,tl(i,j)*x(j,t))
                  =l=
                     hAP*(Ntot(i)-Nm(i,t)) ;
Nmax(t)..  sum(i,Nm(i,t)) =l= 3 ;
manutenzioni(i)$(ord(i)>1).. sum(t,Nm(i,t)) =e= Ntot(i) ;
manutenzioni_1.. sum(t,Nm('smerigliatura',t)) =e= 2 ;

Model Production_b /obiettivo,bilancio,lavorazioni_b,Nmax,manutenzioni,manutenzioni_1/ ;
Production_b.optca = 0 ;
Production_b.optcr = 0 ;
Solve Production_b using MIP maximizing z ;
Display x.l,v.l,s.l,Nm.l,z.l ;


