genitore(mario, dario).
genitore(mario, gino).
genitore(gino, pino).
genitore(gino, sandro).
genitore(sandro, luca).
genitore(luca, mario).

fratello(X, Y) :- genitore(Z, X), genitore(Z, Y).
nonno(X, Y) :- genitore(X, Z), genitore(Z, Y).
avo(X, Y) :- genitore(X, Y).
avo(X, Y) :- genitore(X, Z), avo(Z, Y).

# ?-genitore(X, gino). ## X = mario
# ?-avo(X, mario). ## X = gino ; X = sandro ; X = luca ; X = mario ; false


