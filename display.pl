:- use_module(moves).
:- use_module(all).

bestAction(L, NextL, BestAction):-
	minimax(L, BestAction, _,15),
	takeAction(BestAction,L, NextL).
	
startPosition:-
	  write('Enter start position list:'), nl,
	  read(L), nl,
	  display(L), nl,
	  start(L, action).
	  
draw(0) :- format('|    ').
draw(X) :- member(X,[2,4,8]), format('|  ~d ', X).
draw(X) :- member(X,[16,32,64]), format('| ~d ', X).
draw(X) :- member(X,[128,256,512]), format('| ~d', X).
draw(X) :- member(X,[1024,2048]), format('|~d', X).

display([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]) :-
	format('~n ------------------- ~n'),
	draw(A1),	draw(A2),	draw(A3),	draw(A4),
	format('|~n|-------------------|~n'),
	draw(B1),	draw(B2),	draw(B3),	draw(B4),
	format('|~n|-------------------|~n'),
	draw(C1),	draw(C2),	draw(C3),	draw(C4),
	format('|~n|-------------------|~n'),
	draw(D1),	draw(D2),	draw(D3),	draw(D4),
	format('|~n ------------------- ~n').

start(L, action) :-
	bestAction(L,NextL,BestAction),
	format('The best Action is ~w ', BestAction),
	display(NextL),
	utility(NextL, Score,Val),
	(
        Val = win, !,
        nl, write('You win.'), nl
        ;
		Val = draw, !,nl,
		format('Your score is ~w .', Score),
        nl, write('End of game.')
        ;
        start(L, random)
    ).
	
start(L, random) :-
	play(L, NextL),
	nl, display(NextL),
	utility(NextL, Score,Val),
	(
		Val = draw, !,nl,
		format('Your score is ~w .', Score),
        nl, write('End of game.')
        ;
        start(L, action)
    ).