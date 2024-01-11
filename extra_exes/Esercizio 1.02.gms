  Sets
       i   reparti   / r1, r2, r3 /
       j   malta     / a, b, c / ;

  Parameters

       b(i)  capacità settimanle del reparto i
         /    r1     90
              r2     85
              r3     80  /

       c(i)  costo del reparto i
         /    r1     3.52
              r2     4.18
              r3     3.98 /

        p(j) profitto della malta j
         /
               a    18
               b    21
               c    24            / ;

  Table a(i,j)  ore di lavorazione al quintale
                   a       b       c
      r1           0.18   0.21   0.24
      r2           0.2    0.18   0.21
      r3           0.12   0.22   0.23  ;



  Variables
       x(i,j)  shipment quantities in cases
       z       funzione obiettivo ;

  Positive Variable x ;

  Equations
       profitto        define objective function
       capacita(i)   observe supply limit at plant i
       limite_inferiore  vincolo sul limite inferiore di malta a
       limite_superiore   vincolo sul limite superiore di malta a     ;

  profitto ..        z  =e=  sum(j,p(j)*sum(i,x(i,j))) - sum(i,c(i)*sum(j,a(i,j)*x(i,j))) ;

  capacita(i) ..   sum(j, a(i,j)*x(i,j))  =l=  b(i) ;

  limite_inferiore ..   sum(i, x(i,'a'))  =g=  0.5*sum((i,j), x(i,j)) ;

  limite_superiore ..   sum(i, x(i,'a'))  =l=  0.7*sum((i,j), x(i,j)) ;

  Model malta /all/ ;

  Solve malta using lp maximizing z ;

  Display x.l, x.m ;

