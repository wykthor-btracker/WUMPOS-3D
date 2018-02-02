monsterHere(PosX,PosY):-
	posicao(monstro,PosX,PosY).

current(PosX,PosY,Heading):-
	   size(Size),
	   adjacente(PosX,PosY,Size,IndAdjacentes),
	   infoAdjacente(IndAdjacentes,Adjacentes),
	   fix(Heading,Adjacentes,Perspective),
           (
           (monsterHere(PosX,PosY),append(Perspective,[m],PerspectiveM),atomic_list_concat(PerspectiveM, '', Atom))
           ;
           atomic_list_concat(Perspective, '',Atom)),
           atom_string(Atom, String),
           cls,
           fRead(String),
	   !.
