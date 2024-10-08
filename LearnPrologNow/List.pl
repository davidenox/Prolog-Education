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

/* Append */

append([],L,L).
append([H|T],L2,[H|L3]) :- 
    append(T,L2,L3).
/* Quando si concatena una lista non vuota [H|T] con un'altra lista L2, il risultato è
 * formato dalla lista la cui Head è H e la cui Tail è il risultato di concatenazione 
 * tra T e L2
 * 
 * Input: [H|T]+L2
 * 
 * Output: [H|T+L2]
 * 			   |
 * 			   ->L3
 */

/* Esempio di utilizzo:
 * 
 * ?- append([a,b,c],[1,2,3],X) .
 * Output: X = [a, b, c, 1, 2, 3]
 * 
 * ?- append(X,Y,[a,b,c,d]).
 * Output:
 * X				Y	
[]				[a, b, c, d]	
[a]				[b, c, d]	
[a, b]			[c, d]	
[a, b, c]		[d]	
[a, b, c, d]	[]	
 */

/* Prefisso di una lista */

prefix(P,L):- 
    append(P,_,L).

/* Suffisso di una lista */

suffix(S,L) :-
    append(_,S,L).

/* Sottolista */

sublist(SubL,L):-
    suffix(S,L),
    prefix(SubL,S).

/* Input: ?- sublist(X,[1,2,3,4,5]).
 * Output:
 * X	
1	[]	
2	[1]	
3	[1, 2]	
4	[1, 2, 3]	
5	[1, 2, 3, 4]	
6	[1, 2, 3, 4, 5]	
7	[]	
8	[2]	
9	[2, 3]	
10	[2, 3, 4]	
11	[2, 3, 4, 5]	
12	[]	
13	[3]	
14	[3, 4]	
15	[3, 4, 5]	
16	[]	
17	[4]	
18	[4, 5]	
19	[]	
20	[5]	
21	[]
 * 
 * */

/* Reverse della lista */

naiverev([],[]).
naiverev([H|T],R):-
    naiverev(T,RevT),
    append(RevT,[H],R).

/* Molto inefficiente e difficile da comprendere */

/* Reverse con un accumulatore */

accRev([H|T],A,R):-
    accRev(T,[H|A],R).
accRev([],A,A).

/* Prende la Head della prima lista e la mette come Head della seconda, poi riprende la nuova Head
 * della prima lista e la rende nuova Head della seconda lista, spostando la vecchia Head della 
 * seconda lista nella Tail,e così via fino ad arrivare al caso base, in cui restituisce 
 * l'accumulatore, ovvero la lista rivoltata.
 */

/* Può essere ottimizzata */

rev(L,R):-
    accRev(L,[],R).
