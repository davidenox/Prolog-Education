num_elementi(_, [], 0).
num_elementi(X, [X|T], N):-
    !,
    num_elementi(X, T, N1),
    N is N1 + 1.
num_elementi(X, [_|T], N):-
    num_elementi(X, T, N).

#  ?- num_elementi(a,[a,b,a,k],N). # N = 2