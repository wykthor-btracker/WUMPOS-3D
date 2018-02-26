# Prologject
Projeto de prolog

## Code style contract :


* Spaces 
  * Use an indent size of 4 spaces
 
* Lines
  * Max 55 characters per line
  * Max 24 lines per function

* Commas
  * Commas meaning and-then: follow it by one or more spaces, an optional comment and a newline.
  * Comma separating arguments of a goal: follow it by one or more spaces.
  * Comma separating elements of a data structure: do not follow it by spaces.

* Miscellaneous
  * Begin each clause on a new line and indent all but the first line of each clause.
  
  	Ex: 
    ```
  	sameLength([], []).
    sameLength([_|L1], [_|L2]) :-
        sameLength(L1, L2).
    ```
   * Put each subgoal on a separate line. 
   
   		Ex:
        ```
        ordUnionAll(N, Sets0, Union, Sets) :-
		    A is N / 2,
		    Z is N - A,
		    ordUnionAll(A, Sets0, X, Sets1),
		    ordUnionAll(Z, Sets1, Y, Sets),
		    ordUnion(X, Y, Union).
        ```    
  ## TODO:
     * Create a texture's folder and move all texture files into it, make the necessary changes in the code 
        
