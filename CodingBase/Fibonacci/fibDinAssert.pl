:- dynamic fibonacci/2.

% Clausole base
fibonacci(0, 0).
fibonacci(1, 1).

% Clausola ricorsiva con memorizzazione (memoization)
fibonacci(N, M) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, M1),
    fibonacci(N2, M2),
    M is M1 + M2,
    asserta(fibonacci(N, M)), % Memorizza il risultato calcolato
    !.

