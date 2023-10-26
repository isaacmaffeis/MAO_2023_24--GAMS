$Title Localizzazione di impianti - Modello

$Ontext
Soluzione dell'esercizio 5 (Modelli 2)
$Offtext

$Include "Ex 2.5 - Dati.gms" ;
Display CF ;

Parameters
 f(i) Frazione giornaliera dei costi fissi
 ct(i,j) Costo unitario (in f.o.)
;
f(i) = CF(i)/(4*365+1) ;
ct(i,j) = 2*dist(i,j)*c ;

Variables
 x(i,j) Trasporto da i a j
 s(i)   Stoccaggio in i
 y(i)   Binaria: 1 se i è attivato - 0 altrimenti
 z      Variabile obiettivo (costi totali)
;

Positive Variables x,s ;
Binary Variables y ;

Equations
 obiettivo     Funzione obiettivo
 domanda(j)    Vincolo di domanda
 stoccaggio(i) Vincolo di stoccaggio
 coerenza(i)   Vincolo sulla capacità di stoccaggio (coerenza)
;

obiettivo.. z =e= sum(i,f(i)*y(i))
               +  sum(i,cs(i)*s(i))
               +  sum((i,j),ct(i,j)*x(i,j)) ;

domanda(j)..    sum(i,x(i,j)) =e= D(j) ;
stoccaggio(i).. s(i) =e= sum(j,x(i,j)) ;
coerenza(i)..   s(i) =l= Q(i)*y(i) ;

Model Location /all/ ;
Location.optca = 0 ;
Location.optcr = 0 ;
Solve Location using MIP minimizing z ;

Scalar Ytot numero di sili attivati ;
Ytot = sum(i,y.l(i)) ;
Display x.l,s.l,y.l,z.l,Ytot ;

***Punto B
Equation Nsili vincolo sul numero minimo di sili attivati ;
Nsili.. sum(i,y(i)) =g= 4 ;
Model Location_b /Location + Nsili/ ;
Location_b.optca = 0 ;
Location_b.optcr = 0 ;
Solve Location_b using MIP minimizing z ;
Ytot = sum(i,y.l(i)) ;
Display x.l,s.l,y.l,z.l,Ytot ;

***Punto C
Equation min_fornitura(i) Minimo tecnico sullo stoccaggio ;
min_fornitura(i).. s(i) =g= 0.5*Q(i)*y(i) ;
Model Location_c /Location_b+min_fornitura/ ;
Location_c.optca = 0 ;
Location_c.optcr = 0 ;
Solve Location_c using MIP minimizing z ;
Display x.l,s.l,y.l,z.l ;

***Punto D
Equations
 v312   Condizione logica tra 3-1-2
 v64    Condizione logica tra 6 e 4
 v65    Condizione logica tra 6 e 5
;
v312..  y('s3') =l= y('s1')+y('s2') ;
v64..   y('s6') =l= y('s4') ;
v65..   y('s6') =l= y('s5') ;
Model Location_d /all/ ;
Location_d.optca = 0 ;
Location_d.optcr = 0 ;
Solve Location_d using MIP minimizing z ;
Display x.l,s.l,y.l,z.l ;




