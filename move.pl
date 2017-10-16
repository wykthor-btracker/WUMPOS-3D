:- include('matriz.pl').
:- include('visao.pl').
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).


goDown:-     posicaoJogador(PosX,PosY),
	     matriz(Maze),
	     size(MazeSize),
	     retract(posicaoJogador(PosX,PosY)),
	     NewY is PosY+1,
	     asserta(posicaoJogador(PosX,NewY)),
	     pegar(PosX,NewY,MazeSize,Rnew),
	     pegar(PosX,PosY,MazeSize,Rold),
	     replace(Maze,Rnew,j,MidMaze),
	     info(Rold,MazeSize,Oldtile),
	     retract(tile(Tile)),
	     asserta(tile(Oldtile)),
	     replace(MidMaze,Rold,Tile,EndMaze),
	     retract(matriz(Maze)),
	     asserta(matriz(EndMaze)).





