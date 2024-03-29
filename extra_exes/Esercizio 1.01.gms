$Title  es1.01
$Ontext

Dantzig, G B, Chapter 3.3. In Linear Programming and Extensions.
Princeton University Press, Princeton, New Jersey, 1963.

This formulation is described in detail in:
Rosenthal, R E, Chapter 2: A GAMS Tutorial. In GAMS: A User's Guide.
The Scientific Press, Redwood City, California, 1988.

The line numbers will not match those in the book because of these
comments.

$Offtext


  Sets
       i   impianti   / pr, pu, es /
       j   prodotti   / bn, bd / ;

  Parameters

       b(i)  capacit� dello stabilimento i (h\gg)
         /    pr 18
              pu 18
              es 16  /

       p(j)  profitto unitario di j (�\gg)
         /    bn 540
              bd 590  / ;

  Table a(i,j) quantit� di risorsa i per unit� di prodotto j (h\t)
                    bn      bd
      pr            0.72    0.85
      pu            1.68    1.42
      es            1.92    2.12
  ;

  Variables
       x(j)  quntit� da produrre
       z      profitto totale
  ;


  Positive Variable x ;

  Equations
       profit        define objective function
       disp(i)      limiti all'utilizzo della risorsa i
  ;


  profit ..        z  =e=  sum(j , p(j)*x(j)) ;

  disp(i) ..   sum(j, a(i,j)* x(j))  =l=  b(i) ;


  Model allocazione /all/ ;

  Solve allocazione using lp maximizing z ;

  Display x.l, x.m ;

