/* Il backtracking automatico è una delle caratteristiche più caratteristiche di Prolog. 
 * Ma fare marcia indietro può portare all’inefficienza. A volte Prolog può perdere tempo
 * esplorando possibilità che non portano da nessuna parte. Sarebbe piacevole avere un 
 * certo controllo su questo aspetto del suo comportamento, ma finora abbiamo visto solo 
 * due modi (piuttosto rozzi) per farlo: cambiare l’ordine delle regole e cambiare 
 * l’ordine degli obiettivi. Ma c'è un altro modo. C'è un predicato Prolog integrato! 
 * (il punto esclamativo), chiamato cut, che offre un modo più diretto di esercitare il 
 * controllo sul modo in cui Prolog cerca le soluzioni.
 * 
 * Cosa viene tagliato esattamente e cosa fa? È semplicemente un atomo speciale che 
 * possiamo usare quando scriviamo le clausole. Per esempio:
 * */
/*p(X):-
    b(X),
    c(X),
    !,
    d(X),
    e(X).*/
/* È una regola Prolog perfettamente valida. Per quanto riguarda il taglio, innanzitutto 
 * è un obiettivo che riesce sempre. In secondo luogo, e cosa ancora più importante, ha 
 * un effetto collaterale. Supponiamo che qualche obiettivo faccia uso di questa clausola
 * (chiamiamo questo obiettivo parent-goal). Quindi il taglio impegna Prolog a qualsiasi 
 * scelta fatta da quando l'obiettivo principale è stato unificato con il lato sinistro 
 * della regola (inclusa, soprattutto, la scelta di utilizzare quella particolare 
 * clausola). Diamo un’occhiata a un esempio per vedere cosa significa.
 * Consideriamo innanzitutto il seguente pezzo di codice senza interruzioni:
 * */
p(X):- a(X).

p(X):- 
    b(X), 
    c(X), 
    d(X), 
    e(X).

p(X):- f(X).

a(1).  b(1).   c(1).   d(2).  e(2).  f(3).
       b(2).   c(2).

/* ?- p(X)
 * 
 * X=1
 * X=2
 * X=3
 * false
 * 
 * 
 * L'albero di ricerca che spiega come Proloh trova queste tre soluzioni si trova nella
 * repository (img1.png).
 * 
 * Supponiamo di aggiungere un taglio nella seconda clausola:
 * 
 * p(X):- 
    b(X), 
    c(X),
    !,
    d(X), 
    e(X).
 * 
 * Se chiediamo 
 * ?- p(X) 
 * la risposta sarà 
 * X=1 
 * false
 * 
 * Cosa sta succedendo?
 * */


