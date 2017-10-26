:- include('iaMove.pl').
dfs(PosX,PosY,_,R,R):- saida(PosX,PosY).

dfs(PosX,PosY,Heading,Current,End):- 
	go(left,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[left],Next),
	dfs(NewX,NewY,NewHeading,Next,End).

dfs(PosX,PosY,Heading,Current,End):- 
	go(front,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[front],Next),
	dfs(NewX,NewY,NewHeading,Next,End).

dfs(PosX,PosY,Heading,Current,End):- 
	go(right,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[right],Next),
	dfs(NewX,NewY,NewHeading,Next,End).
