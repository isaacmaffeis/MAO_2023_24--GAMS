$Title  Transporter

Set
j indice delle  richieste /1*12/
;

Parameters
vol(j) volume occupato da richiesta j
/
1  0.57
2  0.45
3  0.37
4  0.4
5  0.27
6  0.7
7  0.6
8  0.52
9  0.33
10 0.49
11 0.82
12 0.5
/

PR(j) profitto della richiesta j
/
1  25
2  25
3  40
4  5
5  5
6  15
7  25
8  40
9  50
10 10
11 30
12 50
/
;

Scalars
V_min primo livello di volume /2/
V_med secondo livello di volume /4/
V_max terzo livello di volume /5/
k valore massimo della penale /100/
;

Variables
y(j)  variabile binaria : 1 se richiesta j è contenuta nel container 0 altrimenti
z     variabile obiettivo
v     variabile volume trasportato
*Per linearizzare la relazione che descrive la penale è necessario introdurre una variabile continua
*ed una binaria in ciascuno dei tre intervalli a cui sono associate penali diverse in f.o.
*In particolare, le binarie descriveranno se il volume totale ricade nel primo, nel secondo o nel terzo intervallo
v1    variabile ausiliaria che descrive il volume totale (se il volume trasportato è nell'intervallo [0-V_min])
v2    variabile ausiliaria che descrive il volume totale (se il volume trasportato è nell'intervallo [V_min-V_med])
v3    variabile ausiliaria che descrive il volume totale (se il volume trasportato è nell'intervallo [V_med-V_max])
alfa1 variabile ausiliaria binaria (1 se il volume trasportato è nell'intervallo [0-V_min])
alfa2 variabile ausiliaria binaria (1 se il volume trasportato è nell'intervallo [V_min-V_med])
alfa3 variabile ausiliaria binaria (1 se il volume trasportato è nell'intervallo [V_med-V_max])
;

Positive variables v,v1,v2,v3;
Binary variables y,alfa1,alfa2,alfa3;

Equations
eq_var         definizione del volume totale
scomposizione  scompongo il volume nella somma delle tre variabili v1 v2 e v3. Solo una di queste variabili assumerà valore positivo
mutualita      Una sola delle variabili binarie deve essere attiva: il volume può ricadere in uno solo dei tre intervalli
coer1_ub       Se siamo nel primo intervallo (alfa1=1) il volume v1 deve essere compreso in [0-Vmin] - Controllo l'upper bound
coer2_ub       Se siamo nel secondo intervallo (alfa2=1) il volume v2 deve essere compreso in [Vmin-Vmed] - Controllo l'upper bound
coer2_lb       Se siamo nel secondo intervallo (alfa2=1) il volume v2 deve essere compreso in [Vmin-Vmed] - Controllo il lower bound
coer3_ub       Se siamo nel terzo intervallo (alfa3=1) il volume v3 deve essere compreso in [Vmed-Vmax] - Controllo l'upper bound
coer3_lb       Se siamo nel terzo intervallo (alfa3=1) il volume v3 deve essere compreso in [Vmed-Vmax] - Controllo il lower bound
obiettivo      funzione obiettivo
;

eq_var..    v =e= sum(j,y(j)*vol(j)) ;

scomposizione.. v =e= v1 + v2 + v3 ;

mutualita.. alfa1 + alfa2 + alfa3 =e= 1 ;

coer1_ub.. v1 =l= V_min*alfa1 ;

coer2_ub.. v2 =l= V_med*alfa2 ;

coer2_lb.. v2 =g= V_min*alfa2 ;

coer3_ub.. v3 =l= V_max*alfa3 ;

coer3_lb.. v3 =g= V_med*alfa3 ;

obiettivo.. z =e= sum(j,y(j)*PR(j)) - k*(0*v1 + (v2-V_min*alfa2)/(V_med-V_min) + 1*v3);
*La funzione obiettivo è data dalla differenza tra profitti e penali.
*Se il volume totale è inferiore rispetto a V_min, le variabili attive sono v1 e alfa1 ---> Le penali sono nulle
*Se il volume totale è nell'intervallo [V_min;V_med], le variabili attive sono v2 e alfa2 ---> Le penali sono pari a k*(v2-V_min)/(V_med-V_min)
*Se il volume totale è nell'intervallo [V_med;V_max], le variabili attive sono v3 e alfa3 ---> Le penali sono pari a k


Model riempimento /all/;
riempimento.optca=0;
riempimento.optcr=0;
Solve riempimento using mip maximizing z;

Display y.l,z.l,v.l,v1.l,v2.l,v3.l,alfa1.l,alfa2.l,alfa3.l;