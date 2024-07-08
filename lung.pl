lung([], 0).
lung([_|T], N) :- 
    lung(T, M), 
    N is M + 1.

# lung([1,2,3], N). # true
# lung([1,2,3,4,5], X). # X = 5
# lung(X, 2). # X = [_, _]