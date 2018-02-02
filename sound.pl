

playSound(Sound):-
		Player = 'aplay ',
		string_concat(Player,Sound,Command),
%		write(Command),
		shell(Command).
