$Title  A Transportation Problem (TRNSPORT,SEQ=1)
$Ontext

This problem finds a least cost shipping schedule that meets
requirements at markets and supplies at factories.


Dantzig, G B, Chapter 3.3. In Linear Programming and Extensions.
Princeton University Press, Princeton, New Jersey, 1963.

This formulation is described in detail in:
Rosenthal, R E, Chapter 2: A GAMS Tutorial. In GAMS: A User's Guide.
The Scientific Press, Redwood City, California, 1988.

The line numbers will not match those in the book because of these
comments.

$Offtext


  Sets
       i      / e1, e2, e3, e4, e5 /
       j      / s1, s2, s3, s4, s5 / ;



  Table c(i,j)  distance in thousands of miles
                 s1       s2         s3       s4       s5
       e1        840      720        700      870      750
       e2        770      880        710      720      820
       e3        850      700        750      860      670
       e4        860      660        810      670      770
       e5        760      650        710      780      750 ;


  positive Variables
       x(i,j)  shipment quantities in cases ;

  Variable
       z       total transportation costs in thousands of dollars ;


  Equations
       totale_riga(i)        define objective function
       totale_colonna(j)   observe supply limit at plant i
       costo_tot   satisfy demand at market j ;

  costo_tot ..        z  =e=  sum((i,j), c(i,j)*x(i,j)) ;

  totale_riga(i) ..   sum(j, x(i,j))  =e=  1 ;

  totale_colonna(j) ..   sum(i, x(i,j))  =e=  1 ;

  Model aviojet /all/ ;

  Solve aviojet using lp minimizing z ;

  Display x.l, x.m ;

