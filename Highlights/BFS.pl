% Definizione degli archi del grafo
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(c,d).

% BFS principale
bfs(Start, Obiettivo, Percorso) :-
    bfs_ricerca([[Start]], Obiettivo, RevPercorso),
    reverse(RevPercorso, Percorso).

% Caso di successo: il percorso inizia con il nodo obiettivo
bfs_ricerca([[Obiettivo | Percorso] | _], Obiettivo, [Obiettivo | Percorso]).

% Caso di esplorazione: esplora nuovi nodi
bfs_ricerca([FrontieraAttuale |Coda], Obiettivo, Percorso) :-
    extend(FrontieraAttuale, NuoveFrontiere),
    append(Coda, NuoveFrontiere, NuovaCoda),
    bfs_ricerca(NuovaCoda, Obiettivo, Percorso).

% Estendi il percorso attuale con i vicini non visitati
extend([Nodo | Percorso], NuoveFrontiere) :-
    findall([NuovoNodo, Nodo | Percorso],
            (edge(Nodo, NuovoNodo),
                \+ member(NuovoNodo, [Nodo | Percorso])),NuoveFrontiere).
