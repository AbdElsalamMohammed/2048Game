% [R1,R2,
%   R3,R4]
% R3 R1
% R4 R2

move([R,R],[N,0], _):-
    N is R + R.
move([0,R],[R,0], _).
move([R1,R2],[R1,R2], l).
move([R1,R2],[R2,R1], r).
	

moveLeft([R1,R2,R3,R4],[N1,N2,N3,N4]):-
	move([R1,R2],[N1,N2],l),
	move([R3,R4],[N3,N4],l),!.
	
moveRight([R1,R2,R3,R4],[N1,N2,N3,N4]):-
	move([R1,R2],[N2,N1],r),
	moveR([R3,R4],[N4,N3],r),!.

moveDown([R1,R2,R3,R4],[N1,N2,N3,N4]):-
	move([R3,R1],[N3,N1],l),
	move([R4,R2],[N4,N2],l),!.

moveUp([R1,R2,R3,R4],[N1,N2,N3,N4]):-
	moveR([R3,R1],[N3,N1],r),
	moveR([R4,R2],[N4,N2],r),!.