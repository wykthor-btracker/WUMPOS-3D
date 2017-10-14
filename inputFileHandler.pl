
%% ----------------------- InputFileHandler ---------------------------%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  In this module you will find two usefull functions                  %
%%  made for file manipulation, the 'copy' function takes an            %
%%  input file and a output file as a argument, then what it does       %
%%  is simply taking the contents of InputFile argument and copying     %
%%  it to OutputFile, while printing the contents of InputFile.         %
%%  The onlyRead function takes only one argument and that is           %
%%  an InputFile, printing its contents.                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ------------------ main functions -------------------------------   %%
%%                                                                     %%
%% copy(InputFile, OutputFile) <- takes a file and make a copy of it   %%
%% onlyRead(InputFile) <- print a file content                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ------------------ aux commands ---------------------------------   %%
%%                                                                     %%
%% EX : working_directory(CWD,'/home/user/prologExerc')                %%
%%  - changes working directory                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




is_eof(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        CharCode == -1,
        append(FileAkku, [CurrentLine], FileContent),
        close(FlHndl), !.

is_newline(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        CharCode == 10,
        append(FileAkku, [CurrentLine], NextFileAkku),
        read_loop(FlHndl, '', NextFileAkku, FileContent).

append_char(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        char_code(Char, CharCode),
        atom_concat(CurrentLine, Char, NextCurrentLine),
         read_loop(FlHndl, NextCurrentLine, FileAkku, FileContent).

read_file(FileName, FileContent) :-
        open(FileName, read, FlHndl),
        read_loop(FlHndl, '', [], FileContent), !.

read_loop(FlHndl, CurrentLine, FileAkku, FileContent) :-
        get_code(FlHndl, CharCode),
        ( is_eof(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)
        ; is_newline(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)
        ; append_char(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)).

copy(InputFile, OutputFile) :-
    open(OutputFile, write, OS),
    (   read_file(InputFile,InputLines),
        member(Line, InputLines),
        write(Line), nl,
        write(OS,Line),nl(OS),
        false
        ;
        close(OS)
    ).

onlyRead(InputFile) :-
    read_file(InputFile, InputLines),
    member(Line, InputLines),
    write(Line), nl, false.
