:- include('iaMove.pl').
dfs(PosX,PosY,_,_):- final(PosX,PosY).
dfs(PosX,PosY,Heading,R):- 
	
