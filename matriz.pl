:- dynamic matriz/1.
matriz(
        [p,c,p,c,p,c,p,p,p,c,p,c,p,c,p,p,
         p,c,p,c,c,c,c,c,p,c,p,c,c,c,c,c,
         p,c,p,c,p,c,p,p,p,c,p,c,p,c,p,p,
         p,j,c,c,p,c,c,c,p,c,c,c,p,c,c,c,
         p,c,p,c,p,p,c,p,p,p,p,c,p,p,c,p,
         p,c,c,c,c,c,c,c,p,c,c,c,c,c,c,c,
         p,c,p,p,c,p,c,p,p,c,p,p,c,p,c,p,
         p,c,c,c,c,c,c,c,p,c,c,c,c,c,c,c,
	 p,c,p,c,p,c,p,p,p,c,p,c,p,c,p,p,
         p,c,p,c,c,c,c,c,p,c,c,c,c,c,c,c,
         p,c,p,c,p,c,p,p,p,c,p,c,p,c,p,p,
         p,c,c,c,p,c,c,c,p,c,c,c,p,c,c,c,
         p,p,p,c,p,p,c,p,p,p,p,c,p,p,c,p,
         p,c,c,c,c,c,c,c,p,c,c,c,c,c,c,c,
         p,c,p,p,c,p,c,p,p,c,p,p,c,p,c,p,
         p,c,c,c,c,c,c,c,p,c,c,c,c,c,c,c]).

size(16).
:- dynamic posicaoJogador/2,headingJogador/1.
posicaoJogador(1,3).
headingJogador(front).
:- dynamic tile/1.
tile(c).
