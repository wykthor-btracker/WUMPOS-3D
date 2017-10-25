:- include('matriz.pl').
:- include('iaVisao.pl').
:- include('iaVisited.pl').
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).
validMove(c).
validMove(j).
opposites(left,right).
opposites(front,back).
opposites(X,Y):- opposites(Y,X).

turnAround(Heading,Newheading):- opposites(Heading,Newheading),!.

goFront(PosX,PosY,PosX,NewY):-    
	     matriz(Maze),
	     size(MazeSize),
	     NewY is PosY+1,
	     pegar(PosX,NewY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile).

goRight(PosX,PosY,NewX,PosY):-    
	     matriz(Maze),
	     size(MazeSize),
	     NewX is PosX+1,
	     pegar(NewX,PosY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile).

goBack(PosX,PosY,PosX,NewY):-    
	     matriz(Maze),
	     size(MazeSize),
	     NewY is PosY-1,
	     pegar(PosX,NewY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile).

goLeft(PosX,PosY,NewX,PosY):-    
	     matriz(Maze),
	     size(MazeSize),
	     NewX is PosX-1,
	     pegar(NewX,PosY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile).

direction(back,2).
direction(right,1).
direction(front,0).
direction(left,3).

go(Dir,Heading,PosX,PosY,NewHeading,NewX,NewY):-
	direction(Dir,Steps),
	direction(Heading,Spin),
	Perspective is mod(Spin+Steps,4),
	direction(NewHeading,Perspective),
	move(Perspective,PosX,PosY,NewX,NewY).

move(2,PosX,PosY,PosX,NewY):- goBack(PosX,PosY,PosX,NewY).
move(1,PosX,PosY,NewX,PosY):- goLeft(PosX,PosY,NewX,posY).
move(0,PosX,PosY,PosX,NewY):- goFront(PosX,PosY,PosX,NewY).
move(3,PosX,PosY,NewX,PosY):- goRight(PosX,PosY,NewX,PosY).	

