% Definizione delle vocali
vocale(a).
vocale(e).
vocale(i).
vocale(o).
vocale(u).

% Predicato per calcolare la lunghezza di una lista
lung([], 0).
lung([_|T], A) :-
    lung(T, B),
    A is B + 1.

% Predicato per contare il numero di vocali in una lista
conta_vocali([], 0).
conta_vocali([El|T], M) :- 
    vocale(El),
    !, 
    conta_vocali(T, N), 
    M is N + 1.
conta_vocali([_|T], M) :-
    conta_vocali(T, M).

% Predicato per contare il numero di consonanti in una lista
conta_consonanti([], 0).
conta_consonanti([El|T], M) :- 
    \+ vocale(El),
    !, 
    conta_consonanti(T, N), 
    M is N + 1.
conta_consonanti([_|T], M) :-
    conta_consonanti(T, M).

% Predicato per calcolare la frequenza media di vocali e consonanti
frequenza_vocali(Testo, FV) :-
    lung(Testo, L),
    conta_vocali(Testo, NV),
    FV is NV / L.

frequenza_consonanti(Testo, FC) :-
    lung(Testo, L),
    conta_consonanti(Testo, NC),
    FC is NC / L.

% Predicato per determinare se la giornata è fortunata
giornata_fortunata(Testo) :-
    frequenza_vocali(Testo, FV),
    frequenza_consonanti(Testo, FC),
    FV =:= FC.

% Esempio di utilizzo
% giornata_fortunata([t,o,r,o]).
