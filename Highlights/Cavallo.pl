/* Data una scacchiera 8x8, definire una sequenza di mosse valide di un cavallo tale che, partendo da una casella iniziale,
attraversi tutte le caselle della scacchiera una e una sola volta.*/

% Validità di una mossa

controlloCaselle(_,[]).

controlloCaselle(A/B,[_/_|T]):-
    controlloCaselle(A/B,T).
controlloCaselle(A/B,[A/_|T]):-
    controlloCaselle(A/B,T).
controlloCaselle(A/B,[_/A|T]):-
    controlloCaselle(A/B,T).
controlloCaselle(A/B,[B/_|T]):-
    controlloCaselle(A/B,T).
controlloCaselle(A/B,[_/B|T]):-
    controlloCaselle(A/B,T).

% Verifica della unicità di una mossa

controlloUnicità(_,[]).

controlloUnicità(X,[H|T]):-
    controlloCaselle(X,H),
    controlloCaselle(X,T),
    controlloUnicità(H,T).

% Controllo delle mosse

mossaValida(_,[]).

mossaValida(A/B,[C/D|T]):-
    abs(A-C) =:= 1,
    abs(B-D) =:= 2.

mossaValida(A/B,[C/D|T]):-
    abs(A-C) =:= 2,
    abs(B-D) =:= 1.
    
cavallo([H|T]):-
    controlloUnicità(H,T),
    mossaValida(H,T).