$Title  esercizio 11 - Setelam

Set t mesi / 1, 2, 3 /
;

Parameter domanda(t) quantità richiesta nel mese t
/
1    270
2    290
3    250
/;

Parameter max_prod(t) capacità produttiva del mese t
/
1    250
2    220
3    280
/;

Parameter costo_prod(t) costo unitario di produzione nel mese t [€]
/
1    12
2    14
3    16
/;

Parameter costo_stoc(t) costo unitario di stoccaggio nel mese t [€]
/
1    1.2
2    1.1
3    0.9
/;

Scalar I_0 contenuto iniziale del magazzino / 100 / ;

Variables
    x(t)  numero di lamiere di zinco prodotte nel mese t
    I(t)  livello della scorta alla fine del mese t
    z     costo totale [euro]
;

Positive Variable x, I ;


Equation      ub_prod(t) upper bound sulla quantità prodotta nel mese t ;

ub_prod(t)..  x(t) =l= max_prod(t) ;


Equation      bilancio(t) bilancio del magazzino nel mese t ;

bilancio(t).. x(t) + I(t-1) + I_0$(ord(t)=1) =e= I(t) + domanda(t) ;


Equation   costo_tot costo totale [€] ;
costo_tot.. z =e= sum(t, costo_prod(t)*x(t)+costo_stoc(t)*I(t)) ;


Model Setelam /all/ ;

Solve Setelam using lp minimizing z ;

$ontext
$offtext