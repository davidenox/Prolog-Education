appartiene(X, [X|_]).
appartiene(X, [_|T]) :- 
    appartiene(X, T).