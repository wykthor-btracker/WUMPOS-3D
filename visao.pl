:- include('inputFileHandler.pl').
pegar(PosX,PosY,Size,R):-
	R is PosX + (PosY * Size),
	PosX < Size,
	PosY < Size,
	PosX >= 0,
	PosY >= 0.
pegar(_,_,_,-1).

pegarUp(PosX,PosY,Size,R):- PosY1 is PosY-1, pegar(PosX,PosY1,Size,R).
pegarDown(PosX,PosY,Size,R):- PosY1 is PosY+1, pegar(PosX,PosY1,Size,R).
pegarLeft(PosX,PosY,Size,R):- PosX1 is PosX-1, pegar(PosX1,PosY,Size,R).
pegarRight(PosX,PosY,Size,R):- PosX1 is PosX+1, pegar(PosX1,PosY,Size,R).

info(-1,_,-1).
info(0,[],0).
info(0,[Head],Head).
info(0,[Head|_],Head).
info(Counter,[_|Tail],Rest):- NewCounter is Counter-1,info(NewCounter,Tail,Rest).

steps(up,2).
steps(right,3).
steps(down,0).
steps(left,1).
			    
adjacente(PosX,PosY,Size,R):-
			    matriz(Maze),
			    pegarUp(PosX,PosY,Size,Up),
			    info(Up,Maze,UpInfo),
			    pegarDown(PosX,PosY,Size,Down),
			    info(Down,Maze,DownInfo),
			    pegarLeft(PosX,PosY,Size,Left),
			    info(Left,Maze,LeftInfo),
			    pegarRight(PosX,PosY,Size,Right),
			    info(Right,Maze,RightInfo),
			    R = [UpInfo,RightInfo,DownInfo,LeftInfo],!.
grabTail([H|T],H,T).
fix([H|T],Answer):-
	headingJogador(Heading),
	steps(Heading,Steps),
	rotate(Steps,[H|T],_,R),
	grabTail(R,_,Answer).

rotate(0,[H|T],[H|T],[H|T]).
rotate(Counter,[H|T],Ans,Curr):- append(T,[H],Ans), Next is Counter-1,rotate(Next,Ans,_,Curr).
look(PosX,PosY,Size,R):-
	adjacente(PosX,PosY,Size,Adjacentes),
	fix(Adjacentes,R).
current:-  posicaoJogador(PosX,PosY),
	   size(Size),
	   adjacente(PosX,PosY,Size,Adjacentes),
	   fix(Adjacentes,Perspective),atomic_list_concat(Perspective, '', Atom), 
	   atom_string(Atom, String),
	   cls, onlyRead(String).
