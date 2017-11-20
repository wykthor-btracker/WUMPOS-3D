:- use_module(library(pce)).
:- include('wumpos.pl').



%%%%%%%%%%%%%%%%%%% PROTOTYPE DONT TOUCH %%%%%%%%%%%%%%%%%%
:- pce_begin_class(name_asker, dialog,
                   "Modal prompter for a name").

initialise(W, Label:[name]) :->
        "Initialise the window and fill it"::
        send_super(W, initialise(Label)),
        %send(W, append(text_item(name))),
        %send(W, append(button(ok))),
        send(W, append(button(start))),
        send(W, append(button(look))),
        send(W, append(button(left))),
        send(W, append(button(right))),
        send(W, append(button(front))),
        send(W, append(button(back))),
        send(W, append(button(quit))),
        load(1),
        title.
        %send(W, default_button(ok)).
        
ok(W) :->
        "User pressed the OK button"::
        get(W, member(name), NameItem),
        get(NameItem, selection, Typed),
        send(W, return, Typed).

start(_) :->
         "User pressed start button"::
         title,
         current(jogador).


quit(W) :->
        "User pressed the quit button"::
        send(W, return(@nil)).

look(_) :->
        "Testing implementing a new button"::
        current(jogador).
        % send(W, return('noice')).

left(_) :->
        "Go left button"::
        go(left, jogador),
        cur.
        % send(W, return('You take a turn to the left')).

right(_) :->
         "Go right button"::
         go(right, jogador),
         cur.

front(_) :->
      "Go up button"::
      go(front, jogador),
      cur.

back(_) :->
        "Go back button"::
        go(back, jogador),
        cur.

cur :-
    current(jogador),
    moveMonster,
    set(jogador).


prompt(W, Value:name) :<-
        "Open it, destroy it and return the result"::
        get(W, confirm, Value),
        free(W).

:- pce_end_class.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%% fill pattern function implementation %%%%%%%%%%

fill_pattern(@white_image).
fill_pattern(@grey12_image).
fill_pattern(@grey25_image).
fill_pattern(@grey50_image).
fill_pattern(@grey75_image).
fill_pattern(@black_image).

make_fill_pattern_menu(M) :-
        new(M, menu(fill_pattern, marked)),
        send(M, layout, horizontal),
        forall(fill_pattern(P),
               send(M, append, menu_item(P, @default, P))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- pce_begin_class(fill5, frame).

initialise(F) :->
        send(F, send_super, initialise, 'Fill 5'),
        send(F, append, new(D, dialog)),
        make_fill_pattern_menu(M),
        send(D, append, M),
        send(new(picture), below, D).

current_fill_pattern(F, P:image) :<-
        get(F, member, dialog, D),
        get(D, member, fill_pattern, M),
        get(M, selection, P).

draw_box(F) :->
        get(F, member, picture, P),
        send(P, display, fillbox(100,100), point(20,20)).

:- pce_end_class.

:- pce_begin_class(fillbox, box).

:- pce_global(@fillbox_recogniser, make_fillbox_recogniser).
make_fillbox_recogniser(G) :-
        Gr = @arg1,
        new(G, popup_gesture(new(P, popup))),
        send(P, append,
             menu_item(fill,
                       message(Gr, fill_pattern,
                               Gr?frame?current_fill_pattern))).

event(B, Ev:event) :->
        (   send(B, send_super, event, Ev)
        ;   send(@fillbox_recogniser, event, Ev)
        ).
:- pce_end_class.

startt :- get(name_asker('WUMPOS 1.0'), prompt, Name).


 


