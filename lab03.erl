% Caleb Krauter
% Terence Fornelosa Trajano
% Jonathan Kim

-module(lab03).
%-export([]).
-compile(export_all).

-import(lists, [filter/2]).



% Problem 4
mapReduce(F, G, Acc, List) -> lists:foldl(G, Acc, lists:map(F, List)).

flip(N) -> -1 * N.

% Problem 5


% Problem 6
myPartition(Pred, L) -> myPartition(Pred, L, []).
myPartition(Pred, L, Accum) ->  
    TrueFilter = lists:filter(Pred, L),
    FalseFilter = lists:filter(fun (ElementOfL) -> [] == lists:filter(fun (ElementOfTrueList) -> ElementOfL == ElementOfTrueList end, TrueFilter) end, L),
    {TrueFilter, FalseFilter}.


% Problem 7


% Problem 8


% Problem 9


% Problem 10


% Problem 11
