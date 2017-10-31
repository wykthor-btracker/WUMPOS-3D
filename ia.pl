:- include('iaMove.pl').
dfs(PosX,PosY,_,_,R,R):- saida(PosX,PosY).

dfs(PosX,PosY,Heading,Visited,Current,End):- 
	go(left,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[left],Next),
	write(Next),nl,
	%sleep(0.3),
	set(NewX,NewY,Visited,NewVisited),
	dfs(NewX,NewY,NewHeading,NewVisited,Next,End).

dfs(PosX,PosY,Heading,Visited,Current,End):- 
	go(front,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[front],Next),
	write(Next),nl,
	%sleep(0.3),
	set(NewX,NewY,Visited,NewVisited),
	dfs(NewX,NewY,NewHeading,NewVisited,Next,End).

dfs(PosX,PosY,Heading,Visited,Current,End):- 
	go(right,Heading,PosX,PosY,NewHeading,NewX,NewY),
	append(Current,[right],Next),
	write(Next),nl,
	%sleep(0.3),
	set(NewX,NewY,Visited,NewVisited),!,
	dfs(NewX,NewY,NewHeading,NewVisited,Next,End).
