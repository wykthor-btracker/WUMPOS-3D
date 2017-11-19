:- use_module(library(readln)).
:- include('colorLife.pl').
:- include('move.pl').
:- include('sound.pl').
%:- include('inputUserHandler.pl').    <- still in beta

wumpos :- 
        load(1),
        title,
        tutorial,
        ask,
        playSound('sound.wav').

ask :- 
    write('Type command: '),
    nl,
    read(X),
    start(X).

start('quit') :- 
               write('Bye Bye'),
               nl,
               abort.

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
                start('quit').

process('look') :-
                current(jogador),
                start('start').

process('trace') :-
                 trace,
                 read(Y),
                 process(Y).

process('end_of_file') :- abort.

process(Y) :-
           checkInput(Y),
           go(Y, jogador),
           current(jogador),
           moveMonster,(
           \+check(jogador),
           set(jogador),
           start('start')
           ;           
           start('start')).

checkMonster(Agent):-
  monsterAround(Agent),
  Text = 'Você sente um odor pútrido vindo das redondezas',
  fancyWrite(yellow,Text),nl.
checkMonster(Agent):-
  monsterHere(Agent),
  Text = 'VOCE PERDEU',
  fancyWrite(red, Text),nl,
  abort.
checkMonster(_).

checkInput('left').
checkInput('right').
checkInput('front').
checkInput('back').
checkInput(_) :-
         nl,
         start('start').
load(0).
load(X):-
      X1 is X - 1,
      cls,
      fRead('./sprite/load1'),
      cls,
      sleep(0.2),
      fRead('./sprite/load2'),
      cls,
      sleep(0.2),
      fRead('./sprite/load3'),
      cls,
      sleep(0.2),
      cls,
      fRead('./sprite/load3'),
      cls,
      sleep(0.2),
      fRead('./sprite/load2'),
      cls,
      sleep(0.2),
      fRead('./sprite/load1'),
      cls,
      sleep(0.2),
      load(X1).
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
              I = ' if you feel like giving up just type quit, and thats it for the tutorial', 
              J = ' (as soon as the misterious voice finishes talking it fades into silence) ',
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
                abort.
choice(_) :-
           write('Huh ?, can\'t you even answer such a simple question ?'),
           nl,
           tutorial. 

%start :- get(name_asker('Register'), prompt, Name), write(Name), nl.  
