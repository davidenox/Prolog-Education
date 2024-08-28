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


