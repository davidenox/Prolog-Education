/*
Arithmetic examples 	Prolog Notation
6 + 2 = 8 	8  is  6+2.
6 ∗ 2 = 12 	12  is  6*2.
6 − 2 = 4 	4  is  6-2.
6 − 8 = − 2 	-2  is  6-8.
6 ÷ 2 = 3 	3  is  6/2.
7 ÷ 2 = 3 	3  is  7/2.
1 is the remainder when 7 is divided by 2 	1  is  mod(7,2).
2 is the square root of 4 	2  is  sqrt(4).
*/

add_3_and_double(X,Y) :- Y is (X+3)*2.
/* Goal: Prende in input X, aggiunge 3 e raddoppia */

/* Aritmetica e liste */
    /*Lunghezza della lista:*/

len([],0).
len([_|T],N) :- 
    len(T,X),
    N is X+1.

/* 1. La lista vuota ha lunghezza 0
 * 2. La lista non vuota ha lunghezza 1+T, dove T è la tail
 * 
 * Quindi il codice fa da sommatore in N per ogni argomento di T
 */

/* Lunghezza tramite accumulatore */

accLen([_|T],A,L):-
    Anew is A+1,
    accLen(T,Anew,L).
accLen([],A,A).

/* Diamo ad A un valore iniziale di 0. Successivamente scorriamo la lista, aggiungendo +1 per
 * ogni elemento che troviamo nella Head, finché non raggiungiamo la lista vuota. Quando 
 * arriviamo alla fine della lista, A ne conterrà la lunghezza.
 */

/*Possiamo ottimizzarlo:*/

leng(List, Length) :- accLen(List,0,Length).

/*Esempio:
 * ?- leng([a,b,c,d,e,[a,b],g],X).
 * 
 * Output: X = 7
 */


/* Comparatore di numeri Interi :
 * 
Arithmetic examples 	Prolog Notation
x < y 	X  <  Y.
x ≤ y 	X  =<  Y.
x = y 	X  =:=  Y.
x ⁄ = y 	X  =\=  Y.
x ≥ y 	X  >=  Y
x > y 	X  >  Y 

 * Ora definiremo un predicato che prenderà in input una lista non vuota di numeri interi
 * non negativi come primo valore, e che ritornerà nell'ultimo valore l'intero maggiore della
 * lista:  
*/

accMax([H|T],A,Max):-
    H > A,
    accMax(T,H,Max).
accMax([H|T],A,Max):-
    H =< A,
    accMax(T,A,Max).
accMax([],A,A).

/* La prima clausola verifica se l'inizio dell'elenco è maggiore del valore più grande trovato
 * finora. Se lo è, impostiamo l'accumulatore su questo nuovo valore e poi lavoriamo ricorsivamente 
 * sulla coda dell'elenco. La seconda clausola si applica quando la prevalenza è inferiore o uguale 
 * all'accumulatore; in questo caso lavoriamo ricorsivamente sulla coda della lista utilizzando il 
 * vecchio valore dell'accumulatore. Infine, la clausola base unifica il secondo e il terzo 
 * argomento; fornisce il valore più alto che abbiamo trovato scorrendo l'elenco fino all'ultimo 
 * argomento.
 */

/* Esempio:
 * 
 * ?- accMax([1,0,5,4],0,Max).
 * 
 * Output: 5.
 * */

/* Possiamo ottimizzarlo: */

max(List,Max):-
    List = [H|_],
    accMax(List,H,Max).