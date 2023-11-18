$Title Estrazione Mineraria - Dati

$OnText
Dati dell'esercizio 2 (Modelli 3)
$OffText

Sets
 I insieme delle miniere /1*4/
 T insieme degli anni /1*5/
;

Parameters
 R(i) royalties associate alla miniera i [M$]
/
1 5
2 4
3 4
4 5
/

 cu(i) costo unitario di estrazione per la miniera i
/
1 1.3
2 1.5
3   1
4 1.2
/

 C(i) capacità della miniera i [Mton]
/
1   2
2 2.5
3 1.3
4   3
/

 q(i) qualità del minerale estratto dalla miniera i
/
1 1
2 0.7
3 1.5
4 0.5
/

 qf(t) requisito sulla qualità del prodotto finito all'anno t
/
1 0.9
2 0.8
3 1.2
4 0.6
5 1.0
/
;

Scalars
 N  numero massimo di miniere utilizzabili /3/
 p  prezzo del prodotto finito [$-ton] /10/
 S  soglia di cambio dei costi unitari [Mton] /1/
;

Parameters
 cu1(i)  Costi entro la soglia (punti b. e c.)
 cu2(i)  Costi oltre la soglia (punti b. e c.)
;
