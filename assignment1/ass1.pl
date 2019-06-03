% Zihan Lai, z5189667, COMP9414 Assignment1
%Question 1
%Pick up the first node in the list and recursive untill the list is empty.
even(A):-
    A mod 2 =:= 0.

odd(A):-
    A mod 2 =:= 1.

sumsq_even([],0).
sumsq_even([H|T],Sum):-
    sumsq_even(T,SumT),
    even(H),
    Sum is H**2 + SumT.
sumsq_even([H|T],Sum):-
    sumsq_even(T,SumT),
    odd(H),
    Sum is SumT.
    
%Question 2 
%IF two person have same family name, they have same male ancestor or one person is the other's male ancestor or they are same person.

father(P1,P2):-
    male(P1),parent(P1,P2).

male_ancstor(P1,P2):-
    P1 = P2.
male_ancstor(P1,P2):-
    father(P3,P2),
    male_ancstor(P1,P3).
    
same_name(P1,P2):-
	male(P),
    male_ancstor(P,P1),
	male_ancstor(P,P2).

%Question 3
%Pick up the first node in the list and recursive untill the list is empty.
%Result can be seperated to list.
sqrt_list([],[]).
sqrt_list([H|T],[[H,X]|Newlist]):-
    X is sqrt(H),
    sqrt_list(T,Newlist).

%Question 4
%Put first node in a new list, if second node has same sign, add to a list, else put it into a new list. Then recursive untill the last node.



sign(A,B):-
	A >= 0,
	B >= 0.
sign(A,B):-
	A < 0,
	B < 0.	

sign_runs([],[]).
	
sign_runs([H|T],Result):-
	sign_runs(T,[[H]],Result).

sign_runs([],[HAcc|TAcc],Result):-
    reverse(HAcc,NHAcc),
	reverse([NHAcc|TAcc],Result).

sign_runs([H|T],[HAcc|TAcc],Result):-
	HAcc = [HHAcc|_],
	sign(H,HHAcc),
	sign_runs(T,[[H|HAcc]|TAcc],Result).
sign_runs([H|T],[HAcc|TAcc],Result):-
	HAcc = [HHAcc|_],
	\+sign(H,HHAcc),
	reverse(HAcc,NHAcc),
	sign_runs(T,[[H],NHAcc|TAcc],Result).



%Question 5
%Besides basic situation, considering these situations: Left and Right are both empty or Left is empty, Right is a tree or Right is empty , Left is a tree or Left and Right are both trees.

is_heap(empty).

is_heap(tree(empty,_,empty)).

is_heap(tree(L,Num,empty)):-
    L = tree(_,NumL,_),
    Num =< NumL,
    is_heap(L).

is_heap(tree(empty,Num,R)):-
    R = tree(_,NumR,_),
    Num =< NumR,
    is_heap(R).

is_heap(tree(L,Num,R)):-
    L = tree(_,NumL,_),
    Num =< NumL,
    R = tree(_,NumR,_),
    Num =< NumR,
    is_heap(L),
    is_heap(R).















