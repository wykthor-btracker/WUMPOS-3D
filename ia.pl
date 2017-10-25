:- include('iaMove.pl').
dfs(PosX,PosY,_,R):- saida(PosX,PosY),
		     write(R).
dfs(PosX,PosY,Heading,Current):- 
	go(left,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[left],Next),
	dfs(NewX,NewY,NewHeading,Next).

dfs(PosX,PosY,Heading,Current):- 
	go(front,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[front],Next),
	dfs(NewX,NewY,NewHeading,Next).

dfs(PosX,PosY,Heading,Current):- 
	go(right,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[right],Next),
	dfs(NewX,NewY,NewHeading,Next).
