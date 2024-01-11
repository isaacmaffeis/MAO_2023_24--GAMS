sets
I insieme dei comuni /Campobasso, Termoli, Bojano, CAmpomarino, Larino/;
alias(i,j);

Parameters N(i) numero di richieste di intervento di i
/
Campobasso 50
Termoli 32
Bojano 8
Campomarino 7
Larino 7
/
;

 scalar
 C costo di affitto per ogni ambulanza /1000/
 Cv costo del carburante /1/
 Km chilometri /10/;

table dist(i,j) distanza dal comune i al comune j
             Campobasso  termoli bojano  campomarino  larino
Campobasso        0        70      25          65       55
Termoli          70         0      85          10       25
Bojano           25        25       0          80       75
Campomarino      65        10      80           0       55
Larino           55        25      75          25        0
;

Scalar M;
M = sum(i, N(i));

variables
x(i) numero di ambulanze localizzate nel comune i
y(i,j) numero di volte che viene percorsa la tratta i j da un'ambulanza i
z
;

integer variables x,y;

x.up(i) = M;
y.up(i,j) = M;


equations
obiettivo minimimizzazione costi
domanda(i) vincolo di domanda
coerenza(j) vincolo di coerenza
;

obiettivo.. z=e= sum((i,j), y(i,j)*dist(i,j)*cv/km) + sum(i, x(i))*c;
domanda(j).. sum(i, y(i,j)) =e= N(j);
coerenza(i).. sum(j, y(i,j)) =l= M*x(i);

model esercizio8 /all/;
esercizio8.optca=0;
esercizio8.optcr=0;
solve esercizio8 using mip minimizing z;
display x.l, y.l;



