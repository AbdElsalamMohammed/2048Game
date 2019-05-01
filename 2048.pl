move([0,0,0,R],[R,0,0,0],_).
move([0,0,R,0],[R,0,0,0],_).
move([0,R,0,0],[R,0,0,0],_).
move([R,0,0,0],[R,0,0,0],_).

move([R,R,0,0],[N,0,0,0],_):- N is R + R.
move([0,R,R,0],[N,0,0,0],_):- N is R + R.
move([0,0,R,R],[N,0,0,0],_):- N is R + R.
move([R,0,R,0],[N,0,0,0],_):- N is R + R.
move([0,R,0,R],[N,0,0,0],_):- N is R + R.
move([R,0,0,R],[N,0,0,0],_):- N is R + R.

move([R,R,0,X],[N,X,0,0],l):- N is R + R.
move([R,R,X,0],[N,X,0,0],l):- N is R + R.
move([R,0,R,X],[N,X,0,0],l):- N is R + R.
move([0,R,R,X],[N,X,0,0],l):- N is R + R.
move([X,R,R,0],[X,N,0,0],l):- N is R + R.
move([X,R,0,R],[X,N,0,0],l):- N is R + R.
move([X,0,R,R],[X,N,0,0],l):- N is R + R.
move([0,X,R,R],[X,N,0,0],l):- N is R + R.
move([0,X,R,R],[N,X,0,0],r):- N is R + R.
move([X,0,R,R],[N,X,0,0],r):- N is R + R.
move([X,R,0,R],[N,X,0,0],r):- N is R + R.
move([X,R,R,0],[N,X,0,0],r):- N is R + R.
move([0,R,R,X],[X,N,0,0],r):- N is R + R.
move([R,0,R,X],[X,N,0,0],r):- N is R + R.
move([R,R,0,X],[X,N,0,0],r):- N is R + R.
move([R,R,X,0],[X,N,0,0],r):- N is R + R.

move([0,0,X,R],[X,R,0,0],l).
move([0,X,R,0],[X,R,0,0],l).
move([X,R,0,0],[X,R,0,0],l).
move([0,X,0,R],[X,R,0,0],l).
move([X,0,R,0],[X,R,0,0],l).
move([X,0,0,R],[X,R,0,0],l).
move([0,0,X,R],[R,X,0,0],r).
move([0,X,R,0],[R,X,0,0],r).
move([X,R,0,0],[R,X,0,0],r).
move([0,X,0,R],[R,X,0,0],r).
move([X,0,R,0],[R,X,0,0],r).
move([X,0,0,R],[R,X,0,0],r).

move([0,X,Y,R],[X,Y,R,0],l).
move([X,0,Y,R],[X,Y,R,0],l).
move([X,Y,0,R],[X,Y,R,0],l).
move([X,Y,R,0],[R,Y,X,0],r).
move([X,Y,0,R],[R,Y,X,0],r).
move([X,0,Y,R],[R,Y,X,0],r).

move([R,R,T,T],[N,W,0,0],l):- N is R+R, W is T+T.
move([R,R,X,Y],[N,X,Y,0],l):- N is R+R.	
move([X,R,R,Y],[X,N,Y,0],l):- N is R+R.
move([X,Y,R,R],[X,Y,N,0],l):- N is R+R.

move([R,R,T,T],[W,N,0,0],r):- N is R+R, W is T+T.
move([X,Y,R,R],[N,Y,X,0],r):- N is R+R.
move([X,R,R,Y],[Y,N,X,0],r):- N is R+R.
move([R,R,X,Y],[Y,X,N,0],r):- N is R+R.	

move([W,X,Y,Z],[W,X,Y,Z],l).
move([W,X,Y,Z],[Z,Y,X,W],r).

%R1   R2   R3   R4
%R5   R6   R7   R8
%R9   R10  R11  R12
%R13  R14  R15  R16
moveLeft([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
		 [N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R1,R2,R3,R4],[N1,N2,N3,N4],l),
    move([R5,R6,R7,R8],[N5,N6,N7,N8],l),
	move([R9,R10,R11,R12],[N9,N10,N11,N12],l),
	move([R13,R14,R15,R16],[N13,N14,N15,N16],l),!.
	
moveRight([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
		  [N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R1,R2,R3,R4],[N4,N3,N2,N1],r),
    move([R5,R6,R7,R8],[N8,N7,N6,N5],r),
	move([R9,R10,R11,R12],[N12,N11,N10,N9],r),
	move([R13,R14,R15,R16],[N16,N15,N14,N13],r),!.

%R13  R9   R5  R1
%R14  R10  R6  R2
%R15  R11  R7  R3
%R16  R12  R8  R4
moveDown([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
		 [N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R13,R9,R5,R1],[N13,N9,N5,N1],l),
    move([R14,R10,R6,R2],[N14,N10,N6,N2],l),
	move([R15,R11,R7,R3],[N15,N11,N7,N3],l),
	move([R16,R12,R8,R4],[N16,N12,N8,N4],l), !.

moveUp([R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16],
	   [N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16]):-
    move([R13,R9,R5,R1],[N1,N5,N9,N13],r),
    move([R14,R10,R6,R2],[N2,N6,N10,N14],r),
	move([R15,R11,R7,R3],[N3,N7,N11,N15],r),
	move([R16,R12,R8,R4],[N4,N8,N12,N16],r), !.