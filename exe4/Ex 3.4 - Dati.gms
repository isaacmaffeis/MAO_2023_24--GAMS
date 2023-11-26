$Title Trasporto con depositi - Dati

$Ontext
Dati dell'esercizio 4 (Modelli 3)
$Offtext

Sets
 I insieme degli stabilimenti  / Milano,Cremona /
 J insieme dei depositi / Bergamo,Pavia,Piacenza,Mantova /
 C insieme dei clienti / C1*C6 /
;

Parameters
 CP(i)  Produzione massima dello stabilimento i
 /
Milano  150000
Cremona 200000
 /

 CS(j)  Capacità del deposito j
 /
Bergamo   70000
Pavia     50000
Piacenza 100000
Mantova   40000
 /

 D(c)   Domanda del cliente c
 /
C1  50000
C2  10000
C3  40000
C4  35000
C5  60000
C6  20000
 /
;

Table ct1(i,j)  costi di trasporto da i a j
         Bergamo Pavia Piacenza Mantova
Milano      0.5   0.5     1.0     0.2
Cremona       0   0.3     0.5     0.3
;

Table ct2(i,c)  costi di trasporto da i a c
         C1  C2  C3  C4  C5  C6
Milano  1.0   0 1.5 2.0   0 1.0
Cremona 2.0   0   0   0   0   0
;

Table ct3(j,c)  costi di trasporto da j a c
          C1  C2  C3  C4  C5  C6
Bergamo    0 1.5 0.5 1.5   0 1.0
Pavia    1.0 0.5 0.5 1.0 0.5   0
Piacenza   0 1.5 2.0   0 0.5 1.5
Mantova    0   0 0.2 1.5 0.5 1.5
;
