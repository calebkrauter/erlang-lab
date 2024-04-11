% Caleb Krauter
% Terence Fornelosa Trajano
% Jonathan Kim

-module(lab03).
%-export([]).
-compile(export_all).

%-import(lists, io,[format/2]).



% Problem 4
mapReduce(F, G, Acc, List) -> lists:foldl(G, Acc, lists:map(F, List)).

flip(N) -> -1 * N.

% Problem 5


% Problem 6


% Problem 7


% Problem 8


% Problem 9


% Problem 10


% Problem 11
