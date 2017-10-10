matriz(
	[p,c,p,p,
	p,c,p,p,
	p,c,c,c,
	p,p,p,c]).

pegar(PosX,PosY,Size,R):-
	R is PosX + (PosY * Size).

pegarUp(PosX,PosY,Size,R):- PosY1 is PosY-1, pegar(PosX,PosY1,Size,R).
pegarDown(PosX,PosY,Size,R):- PosY1 is PosY+1, pegar(PosX,PosY1,Size,R).
pegarLeft(PosX,PosY,Size,R):- PosX1 is PosX-1, pegar(PosX1,PosY,Size,R).
pegarRight(PosX,PosY,Size,R):- PosX1 is PosX+1, pegar(PosX1,PosY,Size,R).

adjacente(PosX,PosY,Size,R):- pegarUp(PosX,PosY,Size,Up),
			    pegarDown(PosX,PosY,Size,Down),
			    pegarLeft(PosX,PosY,Size,Left),
			    pegarRight(PosX,PosY,Size,Right),
			    R = [Up,Down,Left,Right].
info(0,[],0).
info(0,[Head],Head).
info(0,[Head|_],Head).
info(Counter,[_|Tail],Rest):- NewCounter is Counter-1,info(NewCounter,Tail,Rest).

