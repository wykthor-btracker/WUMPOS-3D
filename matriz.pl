:- dynamic matriz/1.
matriz(
        [p,c,p,c,p,c,p,p,c,c,p,c,p,c,p,p,
         p,c,p,c,p,c,c,c,p,c,p,c,c,c,c,c,
         p,c,p,c,p,c,p,p,c,c,p,c,p,c,p,p,
         p,c,c,c,p,c,c,c,p,c,c,c,p,c,c,c,
         p,c,p,c,p,p,c,p,p,p,p,c,p,p,p,p,
         p,c,p,c,c,p,c,c,p,c,c,c,c,c,c,c,
         p,c,p,p,c,p,c,p,p,c,p,p,p,p,p,p,
         p,c,p,c,c,c,c,c,c,c,c,c,c,c,c,c,
	 p,c,p,c,p,c,p,p,p,c,p,p,p,c,p,p,
         p,c,p,c,c,c,c,c,c,c,c,c,c,c,c,c,
         p,p,p,c,p,c,p,p,p,c,p,c,p,c,p,p,
         p,c,c,c,p,c,c,c,c,c,c,c,p,c,c,c,
         p,p,p,c,p,p,c,p,p,p,p,c,p,p,c,p,
         c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,
         p,c,p,p,c,p,c,p,p,c,p,p,c,p,c,p,
         p,c,p,p,c,p,c,c,p,c,c,c,c,p,c,c]).

size(16).
:- dynamic posicao/3,heading/2.
posicao(jogador,1,3).
posicao(monstro,1,3).
heading(jogador,front).
heading(monstro,back).
:- dynamic tile/2.
tile(jogador,c).
tile(monstro,c).
saida(15,1).
