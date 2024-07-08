rivoltata([], []).

rivoltata([H|T], RL):- 
    rivoltata(T, RT),
    append(RT, [H], RL).


