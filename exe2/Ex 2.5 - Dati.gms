$Title Localizzazione di Impianti - Dati

$Ontext
Dati dell'esercizio 4 (Modelli 2)
$Offtext

Sets
 I insieme dei sili  / s1*s6 /
 J insieme delle fattorie / f1*f7 /
;

Parameters
 D(j) fornitura media richiesta dalla fattoria j [q\giorno]
/
f1    36
f2    42
f3    34
f4    50
f5    27
f6    30
f7    43
/

 Q(i) massima quantità di foraggio nel silo potenziale i [q\giorno]
/
s1     80
s2     90
s3    110
s4    120
s5    100
s6    120
/

 CF(i) costi fissi per 4 anni del silo potenziale i [€]
/
s1    321420
s2    350640
s3    379860
s4    401775
s5    350640
s6    336030
/

 cs(i)  costo di stoccaggio del silo potenziale i [€\q)]
/
s1    0.15
s2    0.18
s3    0.20
s4    0.18
s5    0.15
s6    0.17
/
;

Table dist(i,j) distanza tra silo potenziale i e fattoria j [km]
      f1  f2  f3  f4  f5  f6  f7
s1    18  23  19  21  24  17   9
s2    21  18  17  23  11  18  20
s3    27  18  17  20  23   9  18
s4    16  23   9  31  21  23  10
s5    31  20  18  19  10  17  18
s6    18  17  29  21  22  18   8
;

Scalar c costo di trasporto [€\(Km*quintale)] / 0.06 / ;




