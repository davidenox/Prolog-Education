/*L'operatore | all'interno di una lista ha lo scopo di differenziare il primo elemento 
 * della lista, la Head, con tutti gli altri elementi, la Tail, nello specifico:
 * [Head|Tail]
 *   1  |1..n
 * 
 * Esempio:
 * ?- [Head|Tail] = [mia, vincent, jules, yolanda].
 * 
 * Output:
 * Head = mia,
 * Tail = [vincent, jules, yolanda]
 * 
 * Posso anche specificare più elementi per la Head:
 * ?- [X,Y | W] = [[], dead(z), [2, [b, c]], [], Z].
 * 
 * Output:
 * X = []
 * Y = dead(z)
 * W = [[2,[b,c]],[],_8327]
 * Z = _8327
 * yes
 * 
 * Oppure, posso anche saltare degli elementi nella Head tramite l'operatore _ :
 * 
 * ?- [_,X,_,Y|_] = [[], dead(z), [2, [b, c]], [], Z].
 * 
 * Output:
 * X = dead(z)
 * Y = []
 * Z = _9593
 * yes
 * 
 * L'operatore _ è la variabile anonima. Si utilizza quando si ha interesse nell'usare una
 * variabile ma non si vuole istanziarla.
 * */

/*Member*/

member(X,[X,T]).
member(X,[H,T]) :- member(X,T).

