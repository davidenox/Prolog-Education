numero_di_el([], _, 0).
numero_di_el([El|T], El, N):-
    numero_di_el(T, El, M),
    N is M + 1.
numero_di_el([X|T], El, M):-
    X \= El, #diverso
    numero_di_el(T, El, M).

# numero_di_el([1,1,1,2,2,3,4,5], 1, N). # N = 3