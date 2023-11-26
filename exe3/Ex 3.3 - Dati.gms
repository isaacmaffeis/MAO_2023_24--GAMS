$Title Pianificazione Produzione - Dati

$Ontext
Dati dell'esercizio 3 (Modelli 3)
$Offtext

Sets
 I reparti /smerigliatura,
            foratura_verticale,
            foratura_orizzontale,
            alesatura,
            piallatura/
 J prodotti /P1*P7/
 T mesi /Gen,Feb,Mar,Apr,Mag,Giu/
;

Parameters
 Ntot(i) numero di macchinari nel reparto i
/
smerigliatura        4
foratura_verticale   2
foratura_orizzontale 3
alesatura            1
piallatura           1
/

 P(j) profitto unitario del prodotto j
/
P1 10
P2  6
P3  8
P4  4
P5 11
P6  9
P7  3
/
;

Table D(t,j) domanda di j al mese t
      P1   P2   P3   P4   P5   P6   P7
Gen  500  1000 300  300  800  200  100
Feb  600  500  200    0  400  300  150
Mar  300  600    0    0  500  400  100
Apr  200  300  400  500  200    0  100
Mag    0  100  500  100  1000 300    0
Giu  500  500  100  300  1100 500   60
;

Table tl(i,j) tempo unitario di lavorazione di j in i
                       P1   P2   P3   P4   P5   P6   P7
Smerigliatura         0.5  0.7    0    0  0.3  0.2  0.5
Foratura_verticale    0.1  0.2    0  0.3    0  0.6    0
Foratura_orizzontale  0.2    0  0.8    0    0    0  0.6
Alesatura            0.05 0.03    0 0.07  0.1    0 0.08
Piallatura              0    0 0.01    0 0.05    0 0.05
;

Table Nman(i,t) numero di macchinari in i in manutenzione nel mese t
                     Gen Feb Mar Apr Mag Giu
Smerigliatura          1   0   0   0   1   0
Foratura_verticale     0   0   0   1   1   0
Foratura_orizzontale   0   2   0   0   0   1
Alesatura              0   0   1   0   0   0
Piallatura             0   0   0   0   0   1
;

Scalars
 S_max livello massimo del magazzino / 100 /
 S0    livello iniziale del magazzino / 50 /
 cs    costo di stoccaggio / 0.5 /
 G     giorni lavorativi / 24 /
 h     durata dei turni / 8 /
 TU    turni giornalieri / 2 /
;
