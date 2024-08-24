/*Primi esempi di ricorsione, esempio della digestione*/

is_digesting(X,Y):-
    just_ate(X,Y).
is_digesting(X,Y):-
    just_ate(X,Z),
    is_digesting(Z,Y).

% X sta digerendo Y se e solo se X ha mangiato Y oppure X ha mangiato Z e Z sta digerendo
% Y, quindi precedentemente lo ha mangiato.

just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).
