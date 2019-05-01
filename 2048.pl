move([0,0,0,R],[R,0,0,0]).
move([0,0,R,0],[R,0,0,0]).
move([0,R,0,0],[R,0,0,0]).
move([R,0,0,0],[R,0,0,0]).

move([0,R,0,R],[N,0,0,0]):-
    N is R + R.
move([R,0,R,0],[N,0,0,0]):-
    N is R + R.
move([R,0,0,R],[N,0,0,0]):-
    N is R + R.
move([0,0,R,R],[N,0,0,0]):-
    N is R + R.
move([0,R,R,0],[N,0,0,0]):-
    N is R + R.
move([R,R,0,0],[N,0,0,0]):-
    N is R + R.

move([0,X,R,R],[X,N,0,0]):-
     N is R + R.
move([X,R,R,0],[X,N,0,0]):-
     N is R + R.
move([X,0,R,R],[X,N,0,0]):-
     N is R + R.
move([0,R,R,X],[N,X,0,0]):-
     N is R + R.
move([R,R,X,0],[N,X,0,0]):-
     N is R + R.
move([R,R,0,X],[N,X,0,0]):-
     N is R + R.
move([X,R,0,0],[X,R,0,0]).
move([0,0,X,R],[X,R,0,0]).
move([0,X,0,R],[X,R,0,0]).
move([0,X,R,0],[X,R,0,0]).
move([X,0,0,R],[X,R,0,0]).
move([X,0,R,0],[X,R,0,0]).

move([0,X,Y,R],[X,Y,R,0]).

move([R,R,T,T],[N,W,0,0]):-
    N is R + R,
	W is T+T.
move([R1,R,R,R2],[R1,N,R2,0]):-
    N is R+R.
move([R1,R2,R,R],[R1,R2,N,0]):-
    N is R+R.
move([R,R,R3,R4],[N,R3,R4,0]):-
    N is R+R.	

move([R1,R2,R3,R4],[R1,R2,R3,R4]).

moveLeft([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
[N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R1,R2,R3,R4],[N1,N2,N3,N4]),
    move([R5,R6,R7,R8],[N5,N6,N7,N8]),
	move([R9,R10,R11,R12],[N9,N10,N11,N12]),
	move([R13,R14,R15,R16],[N13,N14,N15,N16]),
	!.

moveDown([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
[N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R13,R9,R5,R1],[N13,N9,N5,N1]),
    move([R14,R10,R6,R2],[N14,N10,N6,N2]),
	move([R15,R11,R7,R3],[N15,N11,N7,N3]),
	move([R16,R12,R8,R4],[N16,N12,N8,N4]),
    !.

moveRight([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
[N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R4,R3,R2,R1],[N4,N3,N2,N1]),
    move([R8,R7,R6,R5],[N8,N7,N6,N5]),
	move([R12,R11,R10,R9],[N12,N11,N10,N9]),
	move([R16,R15,R14,R13],[N16,N15,N14,N13]),
	!.
moveUp([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
[N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R1,R5,R9,R13],[N1,N5,N9,N13]),
    move([R2,R6,R10,R14],[N2,N6,N10,N14]),
	move([R3,R7,R11,R15],[N3,N7,N11,N15]),
	move([R4,R8,R12,R16],[N4,N8,N12,N16]),
    !.
