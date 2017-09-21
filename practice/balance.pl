push(X,[],[X]).
push(X,[H|T],[X,H|T]).

pop([H|T],H,T).


bal([],[]).
bal([a|T1],[]):- push(a,[],X),bal(T1,X).
bal([a|T1],[H2|T2]):- push(a,[H2|T2],X), bal(T1,X).
bal([b|T1],[a|T2]):- pop([a|T2],a,X),bal(T1,X).

isempty([]).
check([H|T]):- bal([H|T],X), isempty(X).
