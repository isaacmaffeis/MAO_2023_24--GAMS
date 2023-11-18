$Title Estrazione Mineraria - Modello

$OnText
Soluzione dell'esercizio 2 (Modelli 3)
$OffText

$Include "Ex 3.2 - Dati.gms"

Variables
 x(i,t)     Quantità [Mton] estratta dalla miniera i all'anno t
 y(t)       Quantità [Mton] di prodotto finito venduta all'anno t
 delta(i,t) Binaria: 1 se la miniera i è utilizzata all'anno t - 0 altrimenti
 z          Variabile obiettivo : Profitti totali [M$]
;

Positive Variables x,y ;
Binary Variables delta ;

Equations
 obiettivo       Definizione della funzione obiettivo
 prod_fin(t)     Definizione della quantità di prodotto finito
 capacita(i,t)   Collegamento tra variabili continue e binarie
 nmax(t)         Numero massimo di miniere utilizzabili
 qualita(t)      Requisiti di qualità del prodotto finito
 log1(t)         Se 1 è utilizzata anche 3 è utilizzata
 log2(t)         Se 2 è utilizzata anche 3 è utilizzata
;

obiettivo..       z =e= p*sum(t,y(t))
                     -  sum((i,t),cu(i)*x(i,t))
                     -  sum((i,t),R(i)*delta(i,t)) ;

prod_fin(t)..     y(t) =e= sum(i,x(i,t)) ;
capacita(i,t)..   x(i,t) =l= C(i)*delta(i,t) ;
nmax(t)..         sum(i,delta(i,t)) =l= N ;
qualita(t)..      sum(i,q(i)*x(i,t)) =e= qf(t)*y(t) ;
log1(t)..         delta('3',t)  =g= delta('1',t) ;
log2(t)..         delta('3',t)  =g= delta('2',t) ;

Model Estrazione /all/ ;
Estrazione.optca=0;
Estrazione.optcr=0;
Solve Estrazione using MIP maximizing z ;

Display z.l,x.l,y.l,delta.l ;


***Punto b)
cu1(i)=cu(i) ;
cu2(i)=1.5*cu(i) ;

Positive Variables
 x1(i,t)
 x2(i,t)
;
x1.up(i,t)=S ;

Equations
 scomp(i,t)  Scomposizione delle quantità nei due sottointervalli
 obj_b       Nuova funzione obiettivo
;

scomp(i,t).. x(i,t) =e= x1(i,t) + x2(i,t) ;
obj_b..   z =e= p*sum(t,y(t))
             -  sum((i,t),cu1(i)*x1(i,t) + cu2(i)*x2(i,t))
             -  sum((i,t),R(i)*delta(i,t)) ;

Model Estrazione_b /prod_fin,capacita,nmax,qualita,
                    log1,log2,scomp,obj_b/ ;
Estrazione_b.optca=0;
Estrazione_b.optcr=0;
Solve Estrazione_b using MIP maximizing z ;

Display z.l,x1.l,x2.l,x.l,y.l,delta.l ;


***Punto c)
cu1(i)=cu(i) ;
cu2(i)=0.5*cu(i) ;

Binary Variables
 delta1(i,t)  Attivazione primo sottointervallo (estrazione sotto la soglia)
 delta2(i,t)  Attivazione secondo sottointervallo (estrazione sopra la soglia)
;

Equations
 coer1(i,t) Vincolo di coerenza nel primo sottointervallo
 coer2(i,t) Vincolo di coerenza nel secondo sottointervallo
 prec(i,t)  Vincolo di precedenza (il primo sottointervallo deve essere saturato prima di poter assegnare valori positivi al secondo)
 obj_c      Nuova funzione obiettivo
;

coer1(i,t).. x1(i,t) =l= S*delta1(i,t) ;
coer2(i,t).. x2(i,t) =l= C(i)*delta2(i,t) ;
prec(i,t)..  delta2(i,t) =l= x1(i,t)/S ;
obj_c..   z =e= p*sum(t,y(t))
             -  sum((i,t),cu1(i)*x1(i,t) + cu2(i)*x2(i,t))
             -  sum((i,t),R(i)*delta1(i,t)) ;

Model Estrazione_c /Estrazione_b - obj_b + coer1 + coer2 + prec + obj_c/ ;
Estrazione_c.optca=0;
Estrazione_c.optcr=0;
Solve Estrazione_c using MIP maximizing z ;

Display z.l,x1.l,x2.l,x.l,y.l,delta.l,delta1.l,delta2.l ;
