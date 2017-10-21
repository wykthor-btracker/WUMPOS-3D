:- include('matriz.pl').
:- include('visao.pl').
:- include('visited.pl').
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).
validMove(c).
validMove(j).
opposites(left,right).
opposites(front,back).
opposites(X,Y):- opposites(Y,X).

turnAround(Agent):-
	heading(Heading),
	opposites(Heading,Newheading),
	retract(heading(Agent,Heading)),
	asserta(heading(Agent,Newheading)),!.

goFront(Agent):-    
	     posicao(Agent,PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewY is PosY+1,
	     pegar(PosX,NewY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     tile(Agent,Tile),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     update(Agent,PosX,NewY,Newtile,EndMaze).

goRight(Agent):-    
	     posicao(Agent,PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewX is PosX+1,
	     pegar(NewX,PosY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     tile(Agent,Tile),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     update(Agent,NewX,PosY,Newtile,EndMaze).


goBack(Agent):-    
	     posicao(Agent,PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewY is PosY-1,
	     pegar(PosX,NewY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     tile(Agent,Tile),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     update(Agent,PosX,NewY,Newtile,EndMaze).

goLeft(Agent):-    
	     posicao(Agent,PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewX is PosX-1,
	     pegar(NewX,PosY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     tile(Agent,Tile),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     update(Agent,NewX,PosY,Newtile,EndMaze).

update(Agente,NewX,NewY,Newtile,NewMaze):-
	retract(posicao(Agente,_,_)),
	asserta(posicao(Agente,NewX,NewY)),
	retract(tile(Agente,_)),
	asserta(tile(Agente,Newtile)),
	retract(matriz(_)),
	asserta(matriz(NewMaze)),!.

direction(back,2).
direction(right,1).
direction(front,0).
direction(left,3).

go(Dir,Agent):-
	direction(Dir,Steps),
	heading(Agent,Heading),
	direction(Heading,Spin),
	Perspective is mod(Spin+Steps,4),
	direction(NewHeading,Perspective),
	move(Perspective,Agent),
	retract(heading(Agent,Heading)),
	asserta(heading(Agent,NewHeading)),!.

move(2,Agent):- goBack(Agent).
move(1,Agent):- goLeft(Agent).
move(0,Agent):- goFront(Agent).
move(3,Agent):- goRight(Agent).
	

