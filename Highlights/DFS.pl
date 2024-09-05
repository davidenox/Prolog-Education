% Definire gli archi tra i nodi.

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).
edge(b, e).

% Predicato per trovare i percorsi, priorità al più veloce.

path(X,Y,[X,Y]):-
    edge(X,Y).
path(X,Y,[X|PXY]):-
    edge(X,Z),
    path(Z,Y,PXY).
