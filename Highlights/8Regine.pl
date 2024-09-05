/*  Data una scacchiera 8x8, posizionare 8 regine in modo tale che nessuna delle regine possa mangiare le altre tramite una sola mossa. */

regine(N,Soluzione):-
    genera(N, Soluzione),               % Genera la soluzione
    safe(Soluzione).                    % Controlla che la soluzione sia valida

genera(N,Regine):-                      % Genera la soluzione
    length(Regine, N),                  % Lunghezza della lista delle regine
    genera_valori(N, RegineGenerate),   % Genera i valori per le regine
    sposta_regine(Regine, RegineGenerate). % Sposta le regine

genera_valori(0,[]).                    % Caso base

genera_valori(N,[N|R]):-                % Caso ricorsivo
    N>0, 
    M is N-1,
    genera_valori(M,R).

sposta_regine([],ListaRegine).          % Caso base

sposta_regine([R1|RestoReg],ListaRegine):- % Caso ricorsivo
    member(R1, ListaRegine),            % Per inserire la regina nella lista delle regine
    sposta_regine(RestoReg,ListaRegine).% Richiama la funzione

safe([]).                               % Caso base

safe([R1|RestoReg]):-                   % Caso ricorsivo
    safe(RestoReg),                     % Richiama la funzione
    no_atk(R1,RestoReg).                % Controlla che non ci siano attacchi

no_atk(R1, RestoReg):-                  % Controlla che non ci siano attacchi
    nessun_attacco(R1, 1, RestoReg).    % Richiama la funzione

nessun_attacco(X,_,[]).                 % Caso base

nessun_attacco(X,Offset,[R2|T]):-       % Caso ricorsivo
    X =\= R2+Offset,                    % Controllo diagonale maggiore
    X =\= R2,                           % Controllo verticale
    X =\= R2-Offset,                    % Controllo diagonale minore
  	OffsetMag is Offset + 1,            % Incremento offset
    nessun_attacco(X,OffsetMag,T).      % Richiama la funzione

    