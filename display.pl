draw(' ') :- format('|    ').
draw(X) :- member(X,[2,4,8]), format('|  ~d ', X).
draw(X) :- member(X,[16,32,64]), format('| ~d ', X).
draw(X) :- member(X,[128,256,512]), format('| ~d', X).
draw(X) :- member(X,[1024,2048]), format('|~d', X).

display([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]) :-
format('~n ------------------- ~n'),
draw(A1),
draw(A2),
draw(A3),
draw(A4),
format('|~n|-------------------|~n'),
draw(B1),
draw(B2),
draw(B3),
draw(B4),
format('|~n|-------------------|~n'),
draw(C1),
draw(C2),
draw(C3),
draw(C4),
format('|~n|-------------------|~n'),
draw(D1),
draw(D2),
draw(D3),
draw(D4),
format('|~n ------------------- ~n').