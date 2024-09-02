/*Si parte con le CFG ( Context Free Grammars ), una collezione finita di regole che indicano 
 * alcune frasi come grammaticali ( sintatticalmente corrette ) e com'è la loro struttura grammaticale.
 * Esempio:
s  ->  np  vp
np  ->  det  n
vp  ->  v  np
vp  ->  v
det  -> a
det  -> the
n  -> woman
n  -> man
v  -> shoots 
 * Alcuni caratteri sono simboli non terminali, ad esempio:
 * s -> sentence
 * np -> noun phrase
 * vp -> verb phrase
 * det -> determiner
 * 
 * Infine ci sono i simboli in italics: a, the, woman, man, e shoots. Questi sono simboli terminali, 
 * anche se un informatico potrebbe chiamarli l'alfabeto, e i linguisti potrebbero chiamarli oggetti 
 * lessicali. Di solito li chiameremo solo parole.
 * 
 * Ad esempio: 
 * 
 * s > np vp > det n v np > det n v det n > a woman shoots a man . Ha senso.
 * 
 * In un certo senso le CFG classifica correttamente le stringhe come grammaticalmente corrette o errate,
 * ovviamente in relazione ad una determinata grammatica.
 * */

append([],L,L).
append([H|T],L2,[H|L3]) :- 
    append(T,L2,L3).


s(Z) :- np(X), vp(X), append(X,Y,Z).

np(Z) :- det(X), n(Y), append(X,Y,Z).

vp(Z) :- v(X), np(Y), append(X,Y,Z).

vp(Z) :- v(X).

det([the]).
det([a]).

n([woman]).
n([man]).

v([shoots]).

/* Definite Clause Grammars (DCG)*/

s --> np, vp.

np --> det, n.

vp --> v, np.
vp --> v.

det --> [the].
det --> [a].

n --> [woman].
n --> [man].

v --> [shoots].

/*Si tratta della notazione il più comprensibile possibile da un umano*/

/*Utilizzando 
 * 
 * ?-listing(s) si avrà:
 * 
 * s(A, B) :-
    np(A, C),
    vp(C, B).
 * */

/* Regole ricorsive */

s --> s,conj,s.

conj --> [and].
conj --> [or].
conj --> [but].

/* Ecco cosa succede: 
s(A, B) :-
    np(A, C),
    vp(C, B).
s(A, B) :-
    s(A, C),
    conj(C, D),
    s(D, B).
 * 
 * */

/* È utile riscrivere in maniera più organizzata il codice: */

s --> simple_s.
s --> simple_s,conj,s.
simple_s --> np,vp.
np --> det,n.
vp --> v,np.
vp --> v.
det --> [the].
det --> [a].
n --> [woman].
n --> [man].
v --> [shoots].
conj --> [and].
conj --> [or].
conj --> [but].

/* Tramite tutte queste regole è possibile usare le grammatiche per creare dei linguaggi
 * semplici ma formali, ad esempio: */

t --> [].
t --> l,t,r.

l --> [a].
r --> [b].

/* Extra */

/* Questa è la DCG su cui abbiamo lavorato fino ad ora:*/

s --> np,vp.

np --> det,n.

vp --> v,np.
vp --> v.

det --> [the].
det --> [a].

n --> [woman].
n --> [man].

v --> [shoots].

/* Se volessimo aggiungere frasi come "She shoots him" o "He shoots her", potremmo
 * aggiungere la regola dei pronomi:*/

pro --> [he].
pro --> [she].
pro --> [him].
pro --> [her].

np --> pro.

/* Queste regole non sono complete, poiché la grammatica accetta delle frasi che sono
 * sintatticamente errate. Si può riscrivere in maniera migliore: */

s --> np_subject,vp.

np_subject --> det,n.
np_object  --> det,n.
np_subject --> pro_subject.
np_object  --> pro_object.

vp --> v,np_object.
vp --> v.

det --> [the].
det --> [a].

n --> [woman].
n --> [man].

pro_subject --> [he].
pro_subject --> [she].
pro_object --> [him].
pro_object --> [her].

v --> [shoots].

/* Questa versione non è ancora corretta, potrebbe essere migliorata: */

s --> np(subject),vp.

np(_) --> det,n.
np(X) --> pro(X).

vp --> v,np(object).
vp --> v.

det --> [the].
det --> [a].

n --> [woman].
n --> [man].

pro(subject) --> [he].
pro(subject) --> [she].
pro(object) --> [him].
pro(object) --> [her].

v --> [shoots].

/* Costruire un Parse-Tree */

/* Utilizzando solo gli strumenti standard di Prolog non possiamo effettivamente 
 * disegnare belle immagini di alberi, ma possiamo costruire strutture dati che 
 * descrivono gli alberi in modo chiaro. Ad esempio, corrispondente all'albero 
 * s np det a n woman vp v shoots 
 * possiamo avere la seguente terminologia:
 * ?- s(np(det(a),n(woman)),vp(v(shoots))).
 * Non è di certo bello da vedere, ma l'informazione è racchiusa in questa query
 * 
 * Una DCG deve
 * 
 * */













