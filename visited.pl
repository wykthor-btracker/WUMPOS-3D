:- dynamic visited/1,holeWithPlank/1.
visited([]).
holeWithPlank([]).

check(Agent):- posicao(Agent,X,Y),  % later change this to checkMartini !!!
    visited(List),
    member([X,Y],List).

set(Agent):- posicao(Agent,X,Y),  % later change this to setMartini !!!
      \+check(jogador),
      append([[X,Y]],List,R),
      retract(visited(List)),
      asserta(visited(R)).

checkPlank(Agent):-
                 posicao(Agent,X,Y),
                 holeWithPlank(List),
                 member([X,Y],List).

setPlank(Agent):-
                posicao(Agent,X,Y),
                \+check(jogador),
                append([[X,Y]],List,R),
                retract(holeWithPlank(List)),
                asserta(holeWithPlank(R)).
