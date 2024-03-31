% Caleb Krauter
% Terence Fornelosa Trajano
% Jonathan Kim

-module(lab01).
-export([velocity/2, isDifferent/2, parity/1, colorOfTheDay/1, myPerfectSqrt/1, mySum/1, divide/2, fullDivide/2, labStatistics/3, labOne/0]).

-import(io,[format/2]).

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

% Problem 7
divide(A,B) -> divide(A,B,0).

divide(_, 0, _) -> div_by_zero_error;
divide(A, B, Quotient) when (A - B >= 0)-> divide(A - B, B, Quotient - -1);
divide(_, _, Quotient) -> Quotient.


% Problem 8
fullDivide (A,B) -> fullDivide(A,B,0).

fullDivide(A, B, Quotient) when (A - B >= 0) -> fullDivide(A - B, B, Quotient - -1);
fullDivide(A, _, Quotient) -> {Quotient, A}.

% Problem 9
labStatistics(Role, Name, Contribution) when (Role =:= leader) -> labStatistics({Role, Name, Contribution});
labStatistics(Role, Name, Contribution) when (Role =:= student) -> labStatistics({Role, Name, Contribution});
labStatistics(_, _, _) -> dont_do_that.

labStatistics({leader, Name, Contribution}) -> io:format("LEADER: ~s's contribution was ~p%~n", [Name, Contribution * 100]);
labStatistics({student, Name, Contribution}) -> io:format("~s's contribution was ~p%~n", [Name, Contribution * 100]).

% Problem 10
labOne() -> 
    labStatistics({leader, 'Caleb', 0.4}),
    labStatistics({student, 'Jonathan', 0.3}),
    labStatistics({student, 'Terence', 0.3}),
    done.
