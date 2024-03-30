% Caleb Krauter
% Terence Fornelosa Trajano
% Jonathan Kim

-module(lab01).
-export([velocity/2, isDifferent/2, parity/1, colorOfTheDay/1, myPerfectSqrt/1, mySum/1, divide1/2, divide2/2]).

% Problem 1.
velocity(D, T) -> D / T.

% Problem 2.
isDifferent(A, B) -> A =/= B.

% Problem 3.
parity(N) when (N rem 2 =:= 0) -> even;
parity(_) -> odd.

% Problem 4
colorOfTheDay(monday) -> red; 
colorOfTheDay(tuesday) -> orange;
colorOfTheDay(wednesday) -> yellow;
colorOfTheDay(thursday) -> green;
colorOfTheDay(friday) -> blue;
colorOfTheDay(saturday) -> indigo;
colorOfTheDay(sunday) -> violet;
colorOfTheDay(_) -> no_match.

% Problem 5
myPerfectSqrt(M) -> myPerfectSqrt(M, 1, 0).

myPerfectSqrt(M, _, A) when (M =:= 0) -> A;
myPerfectSqrt(M, N, A) when (M > 0) -> myPerfectSqrt (M - N, N + 2, 1 + A);
myPerfectSqrt(M, _, _) when (M < 0) -> not_perfect.

% Problem 6
mySum(Boundary) -> mySum(Boundary, 0, 1).

mySum(Boundary, Sum, Count) when (Boundary >= Count)-> mySum(Boundary, Sum + Count, Count + 1);
mySum(_, Sum, _) -> Sum.

divide1(A,B) -> divide1(A,B,0).

divide1(A, B, Quotient) when (A >= 0)-> divide1(A - B, B, Quotient - -1);
divide1(_, _, Quotient) -> Quotient.


fullDivide (A,B) -> fullDivide(A,B,0).

fullDivide(A, B, Quotient) when (A >= 0)-> fullDivide(A - B, B, Quotient - -1);
fullDivide(A, _, Quotient) -> {Quotient, A}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 8 - 1 = 7
% 8 - 1 = 6
% 8 - 6 = 2
% 3 / 2
% 
% 3 - 2 = 1
% 

divide2(A,B) -> divide2(A,B,A).

divide2(A,B, Count) when (B > 0) -> divide2(A, A - B, Count - 1);
divide2(A, _, Count) -> A - Count.

% 4 / 2 = 2
% 
% 4 - 2 = 2
% 
% 6 / 2 = 3
% 
% 6 - 1 - 1 - 1 = 3 
% 
% 8 / 2 = 4
% 
% 2
% 8 - 1 - 1 - 1 - 1
% 
% 10 / 5
% 
% 5
% 10 - 1 - 1 - 1 - 1 - 1
% 
% 8 / 4 = 2
% 
% 8 - 4 - 4
% A, B
% when (B > 0) call(A, A - B, Count - 1)