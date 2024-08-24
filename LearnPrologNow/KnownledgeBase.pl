% KB1

% semplice collezione di fatti
woman(mia).
woman(jody).
woman(yolanda).
playsAirGuitar(jody).
party.

% KB2

happy(yolanda).
listens2Music(mia).
listens2Music(yolanda):- happy(yolanda). % se yolanda è felice allora ascolta musica
playsAirGuitar(mia):- listens2Music(mia).
playsAirGuitar(yolanda):- listens2Music(yolanda).
% il simbolo :- è un operatore logico da leggere come "se" oppure "deriva da", ed è una regola di inferenza

% KB3

happy(vincent).
listens2Music(butch).
playsAirGuitar(vincent):-
    listens2Music(vincent),
    happy(vincent).
% rappresento una AND mettendo i due goal nella stessa regola
playsAirGuitar(butch):-
    happy(butch).
playsAirGuitar(butch):-
    listens2Music(butch).
% rappresento una OR scrivendoli separatamente, dichiarando che butch suona se è felice oppure se sente musica

% KB4

woman(mia).
woman(jody).
woman(yolanda).

loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

%come se indicasse la relazione vincent-loves-mia
%se chiedo ?-loves(X,mia). avrò come risultato vincent e marsellus
%identifico X come l''incognita da trovare come richiesta

% KB5

jealous(X,Y):- loves(X,Z), loves(Y,Z).

% questa regola dice che X sarà geloso di Y se esiste uno Z che X ama, ed Y ama lo stesso Z

