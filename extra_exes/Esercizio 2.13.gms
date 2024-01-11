sets
I insieme dei siti /s1*s4/
J insieme delle zone /z1*z5/
;

Table s(i,j) segnale del sito i nella zona j
        z1      z2          z3      z4      z5
s1      25      17          28      4       12
s2      10      20          21      9       8
s3      8       2           4       23      25
s4      13      13          4       12      15
;

Parameter C(i,j) 1 se zona j è coperta dall'antenna i - 0 altrimenti ;
C(i,j)$(s(i,j) ge 15)=1 ;
Display C;


variables
y(i) binaria 1 se attivo antenna nel sito i - 0 altrimenti
x(j) binaria 1 se zona j è coperta
z
;

binary variables x,y;



equations
obiettivo    Numero di zone coperte
zona(j)      Non più di un segnale può essere sopra la soglia
copertura(j) Determinazione della copertura della zona j
legame34     Se non installo antenna in s3 non posso averla in s4
;

obiettivo.. z =e= sum(j, x(j)) ;
zona(j)..   sum(i, C(i,j)*y(i)) =l= 1 ;
copertura(j).. x(j) =l= sum(i, C(i,j)*y(i)) ;
legame34.. y('s4') =l= y('s3') ;


model esercizio13 /all/;
esercizio13.optca=0;
esercizio13.optcr=0;
solve esercizio13 using mip maximizing z;






