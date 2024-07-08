fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(2, 1).
fibonacci(N, M):-
    N > 1,
    N1 is N - 1,
    fibonacci(N1, M1),
    N2 is N - 2,
    fibonacci(N2, M2),
    M is M1 + M2.