div(X,Y):- 0 is mod(X,Y).
try(_,[]).
try(X,[H|T]):- \+div(X,H), try(X,T).

cons([],Start,End):- Next is Start+1,cons([Start],Next,End).
cons([Head|Tail],Start, End):-
	Start=<End,
	\+try(Start,[Head|Tail]),
	Next is Start+1,
	cons([Head|Tail],Next,End).

cons([Head|Tail],Start, End):- 
	Start=<End, 
	append([Head|Tail],[Start],New),
	Next is Start+1,
	cons(New,Next,End).
cons(Y,X,X):- write(Y),!.

primesUntil(X):- X1 is X+1, cons([],2,X1).
