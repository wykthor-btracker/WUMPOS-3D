:- include('matriz.pl').
:- include('visao.pl').
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).
validMove(c).
opposites(left,right).
opposites(front,back).
opposites(X,Y):- opposites(Y,X).

turnAround:-
	headingJogador(Heading),
	opposites(Heading,Newheading),
	retract(headingJogador(Heading)),
	asserta(headingJogador(Newheading)).

goFront:-    posicaoJogador(PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewY is PosY+1,
	     pegar(PosX,NewY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     retract(posicaoJogador(PosX,PosY)),
	     asserta(posicaoJogador(PosX,NewY)),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     retract(tile(Tile)),
	     asserta(tile(Newtile)),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     retract(matriz(Maze)),
	     asserta(matriz(EndMaze)),
	     retract(headingJogador(_)),
	     asserta(headingJogador(front)),!.

goRight:-    posicaoJogador(PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewX is PosX-1,
	     pegar(NewX,PosY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     retract(posicaoJogador(PosX,PosY)),
	     asserta(posicaoJogador(NewX,PosY)),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     retract(tile(Tile)),
	     asserta(tile(Newtile)),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     retract(matriz(Maze)),
	     asserta(matriz(EndMaze)),
	     retract(headingJogador(_)),
	     asserta(headingJogador(right)),!.

goBack:-    posicaoJogador(PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewY is PosY-1,
	     pegar(PosX,NewY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     retract(posicaoJogador(PosX,PosY)),
	     asserta(posicaoJogador(PosX,NewY)),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     retract(tile(Tile)),
	     asserta(tile(Newtile)),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     retract(matriz(Maze)),
	     asserta(matriz(EndMaze)),
	     retract(headingJogador(_)),
	     asserta(headingJogador(back)),!.

goLeft:-    posicaoJogador(PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     NewX is PosX+1,
	     pegar(NewX,PosY,MazeSize,Rnew),
	     info(Rnew,Maze,Newtile),
	     validMove(Newtile),
	     retract(posicaoJogador(PosX,PosY)),
	     asserta(posicaoJogador(NewX,PosY)),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     retract(tile(Tile)),
	     asserta(tile(Newtile)),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     retract(matriz(Maze)),
	     asserta(matriz(EndMaze)),
	     retract(headingJogador(_)),
	     asserta(headingJogador(left)),!.

