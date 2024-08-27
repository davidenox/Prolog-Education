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


/* 1. Un elemento X è all'interno di una lista se è la sua Head,
 * 2. Un elemento X è all'interno di una lista se fa parte della sua Tail
 * 
 * Ciò vuol dire che la member verifica inizialmente che X = H. Se è così, l'output è Yes.
 * Se non è così, effettua lo stesso identico controllo escludendo però la Head, in modo
 * che il primo elemento della Tail diventi una nuova Head, e se il controllo non va a
 * buon fine, continuerà ricorsivamente a rimpiazzare la vecchia Head con una nuova scorrendo
 * nella lista, fino a terminarne gli elementi se necessario. Se l'elemento si trova da 
 * qualche parte nella tail, quando arriverà il controllo giusto, darà output Yes. Se si 
 * arriva al termine della Tail, formando una lista vuota, senza un responso positivo, 
 * l'elemento non sarà nella lista e l'output sarà No.*/

/*Ricorsioni di liste dal basso*/

a2b([a|Ta],[b|Tb]):-a2b(Ta,Tb).

/*Goal: a2b è l'unione delle code di due liste che hanno come Head rispettivamente a e b*/

