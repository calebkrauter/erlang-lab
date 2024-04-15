% Caleb Krauter
% Terence Fornelosa Trajano
% Jonathan Kim

-module(lab03).
-export([mapReduce/4, flip/1, myPartition/2, mergeSort/2, numberAtomComp/1, numberAtomComp2/1, labThree/0]).
-import(lists, [filter/2]).


% Problem 4
mapReduce(F, G, Acc, List) -> lists:foldl(G, Acc, lists:map(F, List)).

flip(N) -> -1 * N.


% Problem 6
myPartition(Pred, L) ->  
    TrueFilter = lists:filter(Pred, L),
    FalseFilter = lists:filter(fun (ElementOfL) -> [] == lists:filter(fun (ElementOfTrueList) -> ElementOfL == ElementOfTrueList end, TrueFilter) end, L),
    {TrueFilter, FalseFilter}.


% Problem 8
mergeSort([], _) -> [];
mergeSort([Element], _) -> [Element];
mergeSort(List, Comp) ->
    Size = lab03:count(List, 0),
    {Left, Right} = lists:split(Size div 2, List),
    ListL = mergeSort(Left, Comp),
    ListR = mergeSort(Right, Comp),
    ListSorted = lab03:merge(ListL, ListR, [], Comp),
    ListSorted.

count([], Accum) -> Accum;
count([_ | T], Accum) -> count(T, Accum + 1).


merge([], [], Accum, _) -> lab03:reverseList(Accum);

% merge([], [Right], Accum, Comp) -> merge([], [], [Right | Accum], Comp);
% merge([Left], [], Accum, Comp) -> merge([], [], [Left | Accum], Comp);

merge([], [H | T], Accum, Comp) -> merge([], T, [H | Accum], Comp);
merge([H | T], [], Accum, Comp) -> merge(T, [], [H | Accum], Comp);


merge(Left = [HL1 | TL1], Right = [HL2 | TL2], Accum, Comp) ->
    case Comp(HL1, HL2) of
        false -> merge(TL1, Right , [HL1 | Accum], Comp);
        true -> merge(Left, TL2, [HL2 | Accum], Comp)
    end.

reverseList(L) -> reverseList(L, []).
reverseList([], Accum) -> Accum;
reverseList([H|T], Accum) -> reverseList(T, [H | Accum]).

% isLess(A, B) -> A =< B.

% Problem 9


% Problem 10
numberAtomComp(List) ->
    ListAtom = lists:foldl(fun (E, Accum) ->
                            IsAtom = is_atom(E), 
                            case IsAtom of 
                                true -> [E | Accum]; 
                                false -> Accum 
                            end end, [], List),
    ListNumber = lists:foldl(fun (E, Accum) -> IsNumber = is_number(E), case IsNumber of true -> [E | Accum]; false -> Accum end end, [], List),
    ListNumberSorted = reverseList(mergeSort(ListNumber, fun (A, B) -> A =< B end)),
    lists:foldl(fun (E, Accum) -> [E | Accum] end, ListNumberSorted, ListAtom).

% Problem 10 if lists library not allowed
numberAtomComp2(List) ->
    {ListAtom, ListNumber} = lab03:splitList(List, [], []),
    SortedList = mergeSort(ListNumber, fun (A, B) -> A > B end),
    lab03:concat(ListAtom, SortedList).

splitList([], Atoms, Nums) -> {Atoms, Nums};
splitList([H | T], Atoms, Nums) -> 
    case is_atom(H) of
        true -> splitList(T, [H | Atoms], Nums);
        false -> splitList(T, Atoms, [H | Nums])
    end.

concat([], List) -> List;
concat([H | T], List) -> concat(T, [H | List]).

% Problem 11

labStatistics({leader, Name, Contribution}) -> io:format("LEADER: ~s's contribution was ~p%~n", [Name, Contribution * 100]);
labStatistics({student, Name, Contribution}) -> io:format("~s's contribution was ~p%~n", [Name, Contribution * 100]);
labStatistics({_, _, _}) -> dont_do_that.

labThree() -> 
    labStatistics({leader, 'Terence', 0.34}),
    labStatistics({student, 'Caleb', 0.33}),
    labStatistics({student, 'Jonathan', 0.33}),
    done.
