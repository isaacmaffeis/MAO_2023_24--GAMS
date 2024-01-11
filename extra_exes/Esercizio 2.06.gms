set i insieme delle azioni /1*6/;
parameter
c(i) costo per azione
/
1 10
2 12
3 15
4 20
5 14
6 15
/

cf(i) costo fisso
/
1 50
2 40
3 100
4 90
5 70
6 120
/

r(i) ritorno attesso
/
1 4
2 5
3 7
4 8
5 7
6 9
/
;

scalar
ritorno ritorno atteso di almeno /2000/;

variable
y(i)
x(i) quantita del titolo comprato
z;

integer variable x;
binary variable y;
x.up(i)=ritorno;

equations
obiettivo
ritatteso
coerenza(i);
obiettivo.. z=e= sum(i, y(i)*cf(i) + x(i)*c(i));
ritatteso.. sum(i, x(i)*r(i)) =g= ritorno;
coerenza(i).. x(i) =l= ceil(ritorno/r(i))*y(i);

model sei /all/;
sei.optca=0;
sei.optcr=0;
solve sei using mip minimizing z;

