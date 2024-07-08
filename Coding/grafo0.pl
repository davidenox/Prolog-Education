edge(a, b).
edge(b, c).
edge(c, d).
edge(a, d).
edge(c, o).
edge(o, p).


path(X, Y) :- edge(X, Y).
path(X, Y) :- edge(X, Z), path(Z, Y),!.

# path(X, p). ## X = a ; X = b ; X = c ; X = d ; X = o ; X = p ; false