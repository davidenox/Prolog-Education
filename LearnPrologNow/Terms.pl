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

/* Dato un termine complesso di una struttura sconosciuta, quale tipo di informazione
 * potremmo voler estrarre? Ovviamente il suo funtore, la sua arietà, e come sono i suoi
 * argomenti. È possibile usare il predicato built-in di Prolog functor/3 :
 * Dato un teremine complesso, functor darà qual è il suo funtore e la sua arietà:
 * 
 * ?- functor(f(a,b),F,A).
 * A = 2
 * F = f
 * true
 * 
 * ?- functor([a,b,c],X,Y).
 * X = '.'
 * Y = 2
 * true
 * 
 * 
 * Nella sezione precedente abbiamo discusso i predicati incorporati che verificavano 
 * se il loro argomento era un atomo, un numero, una costante o una variabile. Ma non 
 * esisteva alcun predicato che verificasse se il suo argomento fosse un termine 
 * complesso. Per completare l'elenco, definiamo tale predicato. È facile farlo usando 
 * functor/3 . Tutto quello che dobbiamo fare è verificare che esista un funtore adatto 
 * e che l'input abbia argomenti (cioè che la sua arità sia maggiore di zero). 
 * Ecco la definizione:
 * */

complexterm(X):-
    nonvar(X),
    functor(X,_,A),
    A>0.

/* Questo per quanto riguarda i funtori: che dire degli argomenti? Oltre al predicato 
 * functor/3 , Prolog ci fornisce il predicato arg/3 che ci parla degli argomenti dei 
 * termini complessi. Prende un numero N e un termine complesso T e restituisce 
 * l'N-esimo argomento di T nel suo terzo argomento. Può essere utilizzato per accedere
 * al valore di un argomento
 * 
 * ?- arg(2,loves(vincent,mia),X).
 * X = mia
 * true
 * 
 * Oppure per istanziare un argomento
 * ?- arg(2,loves(vincent,X),mia).
 * X = mia
 * true
 * 
 * Provare ad accedere ad un argomento che non esiste, ovviamente, fallisce:
 * 
 * ?- arg(2,happy(yolanda),X).
 * false
 * 
 * I predicati funtor/3 e arg/3 ci consentono di accedere a tutte le informazioni di 
 * base che dobbiamo sapere sui termini complessi. Tuttavia Prolog fornisce anche un 
 * terzo predicato integrato per analizzare la struttura dei termini, vale a dire 
 * ’=..’/2 . Questo prende un termine complesso e restituisce una lista che ha il 
 * funtore come testa, e poi tutti gli argomenti, in ordine, come elementi della coda. 
 * Quindi alla query:
 * ?- '=..'(loves(vincent,mia),X).
 * 
 * Prolog risponderà:
 * X = [loves, vincent, mia].
 * 
 * Questo predicato (chiamato univ) può essere utilizzato anche come operatore infisso. 
 * Ecco alcuni esempi che mostrano vari modi di utilizzare questo strumento:
 * 
?- cause(vincent,dead(zed)) =.. X.
X = [cause, vincent, dead(zed)]
yes

?- X =.. [a,b(c),d].
X = a(b(c), d)
yes

?- footmassage(Y,mia) =.. X.
Y = _G303
X = [footmassage, _G303, mia]
yes
 * Univ dà il meglio di sé quando è necessario fare qualcosa per tutti gli argomenti 
 * di un termine complesso. Poiché restituisce gli argomenti come elenco, è possibile 
 * utilizzare le normali strategie di elaborazione dell'elenco per esaminare gli 
 * argomenti.
 * */

/* Stringhe */

/* Le stringhe sono rappresentate in Prolog da una lista di codici ASCII. Provando la 
 * query:
 * 
 * ?- S = "Vicky"
 * 
 * S = [86, 105, 99, 107, 121]
 * true
 * 
 * La variabile S viene identificata con la stringa Vicky, e i membri della lista sono le
 * posizioni delle corrispettive lettere nella lista dei codici ASCII. Quindi le stringhe
 * in Prolog sono delle liste di numeri. Un predicato built-in molto utile è atom_codes/2.
 * Questo predicato converte un atomo in una stringa:
 * 
 * ?- atom_codes(Vicky,X).
 * X = [86, 105, 99, 107, 121]
 * true
 * 
 * ?- atom_codes('Vicky Pollard',X).
 * X = [86, 105, 99, 107, 121, 32, 80, 111, 108, 108, 97, 114, 100]
 * true
 * */

/* Operatori */

/* Proprietà degli operatori:*/

/*
 * Oltre a fornire una notazione operatore intuitiva per determinati funtori, Prolog ti 
 * consente anche di definire i tuoi operatori. Quindi potresti, ad esempio, definire un 
 * operatore suffisso is_dead ; allora Prolog ti permetterebbe di scrivere zed is_dead 
 * come un fatto nel tuo database invece di is_dead(zed).
 * 
 * Le definizioni degli operatori in Prolog assomigliano a queste:
 * 
 * :- op(Precedence,Type,Name).
 * 
 * Come accennato in precedenza, la precedenza è un numero compreso tra 0 e 1200 e 
 * maggiore è il numero, maggiore è la precedenza. Type è un atomo che specifica il tipo 
 * e l'associatività dell'operatore. Nel caso di + questo atomo è yfx , che dice che + è 
 * un operatore infisso; la f rappresenta l'operatore e la x e y gli argomenti. Inoltre, 
 * x sta per un argomento che ha una precedenza inferiore o uguale alla precedenza di + 
 * e y sta per un argomento che ha una precedenza inferiore o uguale alla precedenza di 
 * + . Esistono le seguenti possibilità per tipo:
 * infix xfx, xfy, yfx
 * prefix fx, fy
 * suffix xf, yf
 * 
 * Quindi la definizione dell'operatore per is_dead potrebbe essere la seguente: */

:- op(500,xf,is_dead).


/* Di seguito sono riportate le definizioni per alcuni degli operatori integrati. Puoi 
 * vedere che gli operatori con le stesse proprietà possono essere specificati in 
 * un'istruzione fornendo un elenco dei loro nomi (invece di un singolo nome) come terzo 
 * argomento di op .*/

:-  op(  1200,  xfx,  [  :-,  -->  ]).
:-  op(  1200,    fx,  [  :-,  ?-  ]).
:-  op(  1100,  xfy,  [  ;  ]).
:-  op(  1000,  xfy,  [  ’,’  ]).
:-  op(    700,  xfx,  [  =,  is,  =..,  ==,  \==, =:=,  =\=,  <,  >,  =<,  >=  ]).
:-  op(    500,  yfx,  [  +,  -]).
:-  op(    500,    fx,  [  +,  -  ]).
:-  op(    300,  xfx,  [  mod  ]).
:-  op(    200,  xfy,  [  ^  ]). 

/* Un ultimo punto dovrebbe essere reso esplicito. Le definizioni degli operatori non 
 * specificano il significato degli operatori, descrivono solo come possono essere 
 * utilizzati sintatticamente. Cioè, una definizione di operatore non dice nulla su 
 * quando una query che coinvolge questo operatore verrà valutata come vera, estende 
 * semplicemente la sintassi di Prolog. Quindi, se l'operatore is_dead è definito come 
 * sopra e poni la query zed is_dead , Prolog non si lamenterà della sintassi illegale 
 * (come farebbe senza questa definizione) ma proverà a dimostrare l'obiettivo 
 * is_dead(zed) , che è l'operatore interno di Prolog rappresentazione di zed is_dead .
 * E questo è tutto ciò che fanno le definizioni degli operatori: dicono semplicemente 
 * a Prolog come tradurre una notazione user-friendly in una vera notazione Prolog. 
 * Quindi, quale sarebbe la risposta di Prolog alla domanda zed is_dead? Sarebbe no , 
 * perché Prolog proverebbe a dimostrare is_dead(zed) , ma non troverebbe alcuna clausola
 * corrispondente nel database. Ma supponiamo di estendere il database come segue:
 * 
 * :- op(500, xf, is_dead).
 * 
 * kill(marsellus,zed).
 * is_dead(X) :- 
 * 		kill(_,X).
 * Ora Prolog risponderebbe sì alla domanda.
 */