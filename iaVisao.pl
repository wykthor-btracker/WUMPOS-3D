:- include('inputFileHandler.pl').
pegar(PosX,PosY,Size,R):-
	R is PosX + (PosY * Size),
	PosX < Size,
	PosY < Size,
	PosX >= 0,
	PosY >= 0.
pegar(_,_,_,-1).

pegarBack(PosX,PosY,Size,R):- PosY1 is PosY-1, pegar(PosX,PosY1,Size,R).
pegarFront(PosX,PosY,Size,R):- PosY1 is PosY+1, pegar(PosX,PosY1,Size,R).
pegarLeft(PosX,PosY,Size,R):- PosX1 is PosX-1, pegar(PosX1,PosY,Size,R).
pegarRight(PosX,PosY,Size,R):- PosX1 is PosX+1, pegar(PosX1,PosY,Size,R).

info(-1,_,p).
info(0,[],0).
info(0,[Head],Head).
info(0,[Head|_],Head).
info(Counter,[_|Tail],Rest):- NewCounter is Counter-1,info(NewCounter,Tail,Rest).

steps(front,0).  
steps(left,3).  
steps(back,2).                   
steps(right,1). 			    

adjacente(PosX,PosY,Size,R):-
	    pegarBack(PosX,PosY,Size,Back),
	    pegarFront(PosX,PosY,Size,Front),
	    pegarLeft(PosX,PosY,Size,Left),
	    pegarRight(PosX,PosY,Size,Right),
	    R = [Back,Right,Front,Left],!.

infoAdjacente([Back,Right,Front,Left],R):-
	matriz(Maze),
	info(Back,Maze,BackInfo),
	info(Right,Maze,RightInfo),
	info(Front,Maze,FrontInfo),
	info(Left,Maze,LeftInfo),
	R = [BackInfo,RightInfo,FrontInfo,LeftInfo],!.

grabTail([H|T],H,T).
fix(Heading,[H|T],Answer):-
	steps(Heading,Steps),
	NewSteps is Steps+1,
	rotate(NewSteps,[H|T],_,Answer).

rotate(0,[H|T],[H|T],[H|T]).
rotate(Counter,[H|T],Ans,Curr):- append(T,[H],Ans), Next is Counter-1,rotate(Next,Ans,_,Curr).
rotate(_,_,_,_).

monsterHere(PosX,PosY):-
	posicao(monstro,PosX,PosY).

current(PosX,PosY,Heading,Perspective):-
	   size(Size),
	   adjacente(PosX,PosY,Size,IndAdjacentes),
	   infoAdjacente(IndAdjacentes,Adjacentes),
	   fix(Heading,Adjacentes,Perspective),
	   !.