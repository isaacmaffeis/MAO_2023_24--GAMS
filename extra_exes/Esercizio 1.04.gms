sets
J insieme dei concimi /A,B/
I insieme dei componenti /ferro, azoto/
C insieme dei composti /1,2/
;

Parameters
Q(c) quantità di composti c
/
1 30000
2 25000
/

P(c) prezzo [€:kg] dei composti c
/
1 3
2 4
/

D(j) domanda di concime j
/
A 40000
B 30000
/
;

table Perc(i,c) percentuale di componente i nel composto c
            1       2
ferro       0.4     0.06
azoto       0.5     0.7
;

scalars
QazotoA percentuale minima di azoto che deve essere contenuta nel concime A /0.25/
QferroA percentuale minima di ferro che deve essere contenuta nel concime A /0.1/
QazotoB percentuale esatta di azoto che deve essere contenuta nel concime B /0.2/
QferroB percentuale minima di ferro che deve essere contenuta nel concime B /0.16/
;

variables
x(c,j) quantità del composto c acquistato per produrre j
z;

positive variables x;


equations
obiettivo funzione obiettivo
perazA vincolo di percentuale di azoto nel concime A
perferA vincolo di percentuale di ferro nel concime A
percAzB vincolo di percentuale di azoto nel concime B
percfeB vincolo di percentuale di ferro nel concime N
limite(c) vincolo di utilizzo composti
;

obiettivo.. z=e= sum((c,j), P(c)*x(c,j));
perazA..  sum(c, perc('azoto', c)*x(c, 'A')) =g= QazotoA*D('A');
perferA.. sum(c, perc('ferro', c)*x(c, 'A')) =g= QferroA*D('A');
percAzB.. sum(c, perc('azoto', c)*x(c, 'B')) =e= QazotoB*D('B');
percfeB.. sum(c, perc('ferro', c)*x(c, 'B')) =g= QferroB*D('B');
limite(c).. sum(j, x(c,j)) =l= Q(c);

model baraldi /all/;
solve baraldi using lp minimizing z;
display z.l, x.l;






