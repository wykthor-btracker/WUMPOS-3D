:- dynamic visited/1.
visited([]).

check(Agent):- posicao(Agent,X,Y),
	visited(List),
	member([X,Y],List).

set(Agent):- posicao(Agent,X,Y),
      \+check,
      append([[X,Y]],List,R),
      retract(visited(List)),
      asserta(visited(R)).
