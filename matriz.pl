:- dynamic matriz/1.
matriz(
        [p,j,p,c,p,c,p,p,
         p,c,c,c,c,c,c,c,
         p,c,p,c,p,c,p,p,
         p,c,c,c,p,c,c,c,
         p,p,p,c,p,p,c,p,
         p,c,c,c,c,c,c,c,
         p,c,p,p,c,p,c,p,
         p,c,c,c,c,c,c,f]).

size(8).
:- dynamic posicaoJogador/2.
posicaoJogador(0,1).
:- dynamic tile/1.
tile(c).
