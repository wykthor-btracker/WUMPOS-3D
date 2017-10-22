:- use_module(library(readln)).
:- include('move.pl').
%:- include('inputUserHandler.pl').    <- still in beta
:- include('colorLife.pl').


wumpos :- 
	    load,
	    title,
	    tutorial,
	    ask.

ask :- 
    write('Type command: '),
    nl,
    read(X),
    start(X).

start('quit') :- 
               write('Bye Bye'),
               nl,
               !.

start('start') :-
               write('which way do you wanna go ?'),
               nl,
			   read(Y),
			   process(Y).
start(_) :-
		 nl,
		 write('Huh?'),
		 nl,
		 start('start').

process('quit') :-
				start('quit'),
				!.
process(Y) :-
		   checkInput(Y),
	       go(Y, jogador),
    	   current(jogador),
    	   %set(jogador),            <- waiting visited rooms files 
	       start('start').

checkInput('left').
checkInput('right').
checkInput('front').
checkInput('back').
checkInput(_) :-
 		 write('Huh?... are you mentally challenged?'),
		 nl,
		 start('start').

load :-
      cls,
	  fRead('./sprite/load1'),
	  cls,
	  sleep(1),
	  fRead('./sprite/load2'),
	  cls,
	  sleep(1),
	  fRead('./sprite/load3'),
	  cls,
	  sleep(1).

title :-
	   cls,
	   fRead(title).

tutorial :-
		  A = 'Wumpos is a very challenging game and require loads of dedication from the player, do you want to see the tutorial ?',
		  B = 'Type yes or no: ',
		  fancyWrite(red, A),
		  nl,
		  fancyWrite(green, B),
		  read(Z),
		  choice(Z).

choice('yes') :-
			  A = 'All right chap, listen to me, this game is simple... why are you here? dont worry about that',
			  B = ' RIGHT NOW. ',
			  C = 'Listen, listen the commands are simple... just type the direction you wanna go to, you have four options:',
			  D = ' left, right, front, back ',
			  E = 'oh and i almost forgotten, beware, you are not',
			  F = ' ALONE ',
			  G = 'in this maze',
			  H = ' as soon as you are ready type start, and the game shall begin',
			  I = ' if you feel like giving up like the little bitch you are just type quit, and thats it for the tutorial', 
			  J = ' (as soon as the misterious man finishes talking he disapears in the air) ',
			  fancyWrite(red, A),
			  fancyWrite(black, B),
			  fancyWrite(red, C),
			  fancyWrite(green, D),
			  fancyWrite(red, E),
			  fancyWrite(black, F),
			  fancyWrite(red, G),
			  fancyWrite(red, H),
			  fancyWrite(red, I),
			  fancyWrite(green,J),
			  nl.


choice('no'). 

choice('quit') :-
				false.
choice(_) :-
		   write('Huh ?, cant you even answer such a simple question ?'),
		   nl,
		   tutorial. 

%start :- get(name_asker('Register'), prompt, Name), write(Name), nl.  
