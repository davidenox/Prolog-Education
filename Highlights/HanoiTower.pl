/* Risolvere il problema delle torre di Hanoi: è un rompicapo matematico composto da tre paletti e un certo numero di dischi di 
grandezza decrescente, che possono essere infilati in uno qualsiasi dei paletti. Lo scopo del gioco è portare tutti i dischi su 
un paletto diverso, potendo spostare solo un disco alla volta e potendo mettere un disco solo su un altro disco più grande, mai 
su uno più piccolo. */

valida(L):-
    ordinata(L).

ordinata([]).
ordinata([_]).

ordinata([X1,X2|T]):-
    X1<X2,
    ordinata([X2|T]).

edge( [[H1|T1], L2, L3] , [T1,[H1|L2],L3] ):-
     valida([H1|L2]).
edge( [[H1|T1],L2,L3] , [T1,L2,[H1|L3]] ):-
     valida([H1|L3]).
edge( [L1,[H2|T2],L3] , [[H2|L1],T2,L3] ):-
    valida([H2|L1]).
edge( [L1,[H2|T2],L3] , [L1,T2,[H2|L3]] ):-
    valida([H2|L3]).
edge( [L1,L2,[H3|T3]] , [[H3|L1],L2,T3] ):-
     valida([H3|L1]).
edge( [L1,L2,[H3|T3]] , [L1,[H3|L2],T3] ):-
     valida([H3|L2]).

path(A,B,[A,B]):-
    edge(A,B).
path(A,B,[A|P1]):-
      path(X,B,P1),
      edge(A,X).
