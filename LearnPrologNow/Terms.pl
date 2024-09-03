/* Comparazione di termini */

/* Prolog contiene un predicato importante per la comparazione di termini, ovvero il 
 * predicato ==, il quale controlla se due termini sono identici. Esso non istanzia
 * variabili, non è come l'unificazione.
 * 
 * Esempio:
 * 
 * ?- a == a.
 * true
 * 
 * ?- a == b.
 * false
 * 
 * ?- a == 'a'.
 * true
 * 
 * Attenzione all'ultimo esempio: Prolog dice che a e 'a' sono identici. Però,
 * 
 * ?- X == Y.
 * false
 * 
 * ?-X=Y.
 * yes
 * 
 * In questa query, X e Y sono due variabili non istanziate. X e Y non sono la stessa 
 * variabile, quindi == viene false, ma dato che X e Y possono essere unificati.
 * 
 * Un altro predicato da conoscere è /==, che dà true quando == dà false.
 * 
 * ?- a /== a.
 * false
 * 
 * ?- a /== b.
 * true 
 * */

/* Termini aritmetici */

/* ?- 2+3 == +(2,3). 
 * true
 * 
 * ?- 2-3 == -(2,3).
 * true
 * 
 * 2*3 == *(2,3).
 * true
 * 
 * 2*(7+2) == *(2,+(7,2)).
 * true
 * 
 * La sintassi è equivalente con <,>,=<,=>.
 * 
 * */

/* Liste come termini */

/* 
?- [a,b,c,d] == [a|[b,c,d]].
yes

?- [a,b,c,d] == [a,b|[c,d]].
yes

?- [a,b,c,d] == [a,b,c|[d]].
yes

?- [a,b,c,d] == [a,b,c,d|[]].
yes
 * Ma come fa Prolog a visualizzare internamente gli elenchi? In effetti, vede gli 
 * elenchi come termini costituiti da due termini speciali, vale a dire [] , che 
 * rappresenta l'elenco vuoto, e “ . ” (il punto), un funtore di arità 2 che viene 
 * utilizzato per costruire elenchi non vuoti. I termini [] e . sono chiamati 
 * costruttori di liste.
 * Questo è il modo in cui questi costruttori vengono utilizzati per creare elenchi. 
 * Inutile dire che la definizione è ricorsiva:
 * - L'elenco vuoto è il termine [ ]. Ha lunghezza 0.
 * - Un elenco non vuoto è qualsiasi termine nella forma . (term, list), dove term è 
 *   qualsiasi termine del Prolog e list è qualsiasi elenco. Se la lista ha lunghezza 
 *   n , allora . (termine, lista) ha lunghezza n+1.
 * 
 * Esempi:
 * 
 * ?- .(a,[]) == [a].
 * true
 * 
 * ?- .(f(d,e),[]) == [f(d,e)].
 * yes
 * 
 * ?- .(a,.(b,[])) == [a,b].
 * yes
 * */

/* Tipi di termini */

/* È possibile vedere se un argomento è un atomo:
 * 
 * ?- atom(a).
 * true
 * 
 * ?- atom(7).
 * false
 * 
 * ?- atom(loves(vincent,mia)).
 * false
 * 
 * ?- atom(X).
 * false
 * 
 * ?- X = a, atom(X).
 * true
 * 
 * ?- atom(X), X = a.
 * false
 * 
 * 			Esiste poi il predicato atomic():
 * 
 * ?- atomic(mia).
 * true 
 * 
 * ?- atomic(7).
 * true
 * 
 * ?- atomic(3.25).
 * true
 * 
 * ?- atomic(loves(vincent,mia)).
 * false
 * 
 * ?- atomic(X).
 * false
 * 
 * 			Esistono i predicati var() e nonvar():
 * 
 * ?- var(X).
 * true
 * 
 * ?- var(mia).
 * false
 * 
 * ?- var(8).
 * false
 * 
 * ?- var(3.25).
 * false
 * 
 * ?- var(loves(vincent,mia)).
 * false  
 *
 * ?- nonvar(X).
 * false
 * 
 * ?- nonvar(mia).
 * true
 * 
 * ?- nonvar(8).
 * true
 * 
 * ?- nonvar(3.25).
 * true
 * 
 * ?- nonvar(loves(vincent,mia)).
 * true
 * */

/* Struttura dei termini */

