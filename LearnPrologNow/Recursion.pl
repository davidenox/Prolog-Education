/*Primi esempi di ricorsione, esempio della digestione*/

is_digesting(X,Y):-
    just_ate(X,Y).
is_digesting(X,Y):-
    just_ate(X,Z),
    is_digesting(Z,Y).

/* X sta digerendo Y se e solo se X ha mangiato Y oppure X ha mangiato Z e Z sta digerendo
 Y, quindi precedentemente lo ha mangiato.*/

just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).

/* Discendenti */

child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y):-
    child(X,Y).
descend(X,Y):-
    child(X,Z),
    descend(Z,Y).

/* Se Y è figlio di X, allora Y è un discendente di X, e se Z è figlio di X, ed Y è
 discendente di Z, allora Y è anch'esso discendente di X */