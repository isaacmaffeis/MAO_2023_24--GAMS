$Title Investimenti multi periodali - Dati

$Ontext
Dati dell'esercizio 1 (Modelli 3)
$Offtext

Sets
 S insieme dei server / SIP,EIP,SGI,SUN /
 T insieme dei mesi / 1*5 /
;

Parameters
 N(s) Numero massimo di utenze coperte dal server s
/
SIP   30
EIP   80
SGI  200
SUN 2000
/

 C(s)  Costo di acquisto del server s
/
SIP   2500
EIP   5000
SGI  10000
SUN  25000
/

 U(t) numero di utenze da coprire al mese t
/
1   0
2  60
3 260
4 290
5 365
/
;

Scalars
 sc1 Sconto sui server SGI / 0.1 /
 sc2 Sconto sui server SUN / 0.25 /
   B Budget [€] nei primi due mesi / 9500 /
;
