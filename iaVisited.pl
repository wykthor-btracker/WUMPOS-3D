check(X,Y,List):-
	member([X,Y],List).

set(X,Y,List,R):- 
      \+check(X,Y,List),
      append([[X,Y]],List,R).
