:- dynamic visited/1.
visited([]).

check(X,Y):-
	visited(List),
	member([X,Y],List).

set(X,Y):- 
      \+check(X,Y),
      append([[X,Y]],List,R),
      retract(visited(List)),
      asserta(visited(R)).
