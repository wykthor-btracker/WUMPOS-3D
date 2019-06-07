fancyWrite(Color, Text) :- 
                        ansi_format([bold,fg(Color)], Text, [world]).
