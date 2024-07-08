permutazione([],[]).
permutazione([H|T],B) :- 
    permutazione(T,PT1_2), 
    member(H,B),
    subtract(H,B,PT1_2).

subtract(_,[],[]).
subtract(H,[H|R],R).
subtract(H,[A|R1],[A|R2]) :- 
    subtract(H,R1,R2).

# Test:
# ?- permutazione([1,2,3],[3,2,1]).
# true.