:- module(all,[takeAction/3,play/2,minimax/3,utility/3]).
%takeAction(Action, L, NewL).
takeAction(move_Left, L, NewL):- moveLeft(L, NewL).
takeAction(move_Right, L, NewL):- moveRight(L, NewL).
takeAction(move_Down, L, NewL):- moveDown(L, NewL).
takeAction(move_Up, L, NewL):- moveUp(L, NewL).

play(L,NextL):-
	randomGenrator(L,NextL).
	
replaceInThePosition([_ |T ],0 ,E ,[E |T ]).
replaceInThePosition([H |T ],P ,E ,[H |R ]) :-
    P > 0, NP is P -1, replaceInThePosition(T ,NP ,E ,R ).
    
randomGenrator(OldList,NewList):-
      bagof(C ,nth0(C, OldList,0), Nlist) ,
      random_member(Index,Nlist),
      %random_member(Value,[2,4]),
      replaceInThePosition(OldList,Index,1024,NewList).
	  
utility(L, 2048, win):-
	member(2048, L),!.

utility(L, MaxValue, draw):-
	moveLeft(L,L),
	moveRight(L,L),
	moveDown(L,L),
	moveUp(L,L),
	findMax(L, MaxValue),!.

findMax([], R, R). %end
findMax([X|Xs], WK, R):- X >  WK, findMax(Xs, X, R). %WK is Carry about
findMax([X|Xs], WK, R):- X =< WK, findMax(Xs, WK, R).
findMax([X|Xs], R):- findMax(Xs, X, R). %start

minimax(L, BestAction, Val) :-                    
    bagof(NextAction, takeAction(NextAction, L, _), NextActionList),
    best(NextActionList, BestAction, Val, L), !.

minimax(L, _, Val) :- 
    utility(L, Val,_).

best([NextAction], NextAction, Val, L) :-
	takeAction(NextAction, L, NextL),
    minimax(NextL, _, Val), !.

best([Action1 | ActionList], BestAction, BestVal, L) :-
	takeAction(Action1, L, NextL),
    minimax(NextL, _, Val1),
    best(ActionList, Action2, Val2, L),
    betterOf(Action1, Val1, Action2, Val2, BestAction, BestVal).

betterOf(Action0, Val0, _, Val1, Action0, Val0) :-   % Action0 better
    Val0 > Val1, !.                           % MAX prefers the greater value

betterOf(_, _, Action1, Val1, Action1, Val1).        % Otherwise Action1 better