:- dynamic visited/1.
visited([]).

check:- posicaoJogador(X,Y),
	visited(List),
	member([X,Y],List).

set:- posicaoJogador(X,Y),
      \+check,
      append([[X,Y]],List,R),
      retract(visited(List)),
      asserta(visited(R)).
