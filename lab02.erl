% Jonathan Kim
% Caleb Krauter
% Terence Fornelosa Trajano

-module(lab02).

-export([isGreater/2, intersection/2, intersections/2, intersectionPartition/2, modEach/2, removeMods/2, modEachAndRemoveMods/2, calculateCost/1, calculateTotalCost/1, myMinMax/1, getLastIndex/2, labTwo/0]).

% Problem 1
isGreater({O1, T1, H1}, {O2, T2, H2}) ->
    {H1 * 100, T1 * 10, O1} > {H2 * 100, T2 * 10, O2}.


% Problem 2
intersection({X, Y, Width, Height}, {PX, PY}) ->
    (Width / 2 > abs(PX - X)) and (Height / 2 > abs(PY - Y)).


% Problem 3
intersections(Rect, [H | T]) ->  intersections(Rect, [H | T], intersection(Rect, H)).

intersections(_, [], _) -> [];
intersections(Rect, [H | T], true) when (T =/= []) ->
    [H2 | _] = T,
    [{inside, H} | intersections(Rect, T, intersection(Rect, H2))];
intersections(Rect, [H | T], _) when (T =/= []) ->
    [H2 | _] = T,
    [{outside, H} | intersections(Rect, T, intersection(Rect, H2))];
intersections(Rect, L, true) ->
    [H | _] = L,
    [{inside, H} | intersections(Rect, [], false)];
intersections(Rect, L, _) ->
    [H | _] = L,
    [{outside, H} | intersections(Rect, [], false)].


% Problem 4
intersectionPartition(Rect, List) ->  intersectionPartition(intersections(Rect, List), [], []).

intersectionPartition([], OutsideList, InsideList) -> {InsideList, OutsideList};
intersectionPartition([{inside, Point} | T], OutsideList, InsideList) -> intersectionPartition(T, OutsideList, [Point | InsideList]);
intersectionPartition([{outside, Point} | T], OutsideList, InsideList) -> intersectionPartition(T, [Point | OutsideList], InsideList).


% Problem 5
modEach([], _) ->
    [];
modEach([H | T], Number) ->
    [H rem Number | modEach(T, Number)].


% Problem 6
removeMods([], _) ->
    [];
removeMods([H | T], Number) when H rem Number =:= 0 ->
    removeMods(T, Number);
removeMods([H | T], Number) ->
    [H | removeMods(T, Number)].


% Problem 7
modEachAndRemoveMods(List, Number) ->
    removeMods(modEach(List, Number), Number).


% Problem 8
calculateCost([]) -> [];
calculateCost([{Name, Price, Quantity, Tax_rate} | T]) -> 
    [{Name, Quantity, Price * Quantity + (Price * Quantity * Tax_rate)} | calculateCost(T)].


% Problem 9
calculateTotalCost(L) -> calculateTotalCost(L, 0, 0).

calculateTotalCost([], TtlQ, TtlC) ->{TtlQ, TtlC};
calculateTotalCost([{_, Quantity, Cost} | T], TtlQ, TtlC) -> calculateTotalCost(T, TtlQ + Quantity, TtlC + Cost).

% Problem 11
myMinMax([]) -> empty_list;
myMinMax([H | T]) -> myMinMax([H|T], H, H).
myMinMax([], Min, Max) -> {Min, Max};

myMinMax([H | T], Min, Max) when (H < Min) -> myMinMax(T, H, Max);
myMinMax([H | T], Min, Max) when (H > Max) -> myMinMax(T, Min, H);
myMinMax([_ | T], Min, Max) -> myMinMax(T, Min, Max).


% Problem 12
getLastIndex(List, Value) -> getLastIndex(List, Value, {0, no_such_element}).

getLastIndex([], _, {_, LastIndex}) -> LastIndex;
getLastIndex([H | T], Value, {CurIndex, _}) when (Value =:= H) -> getLastIndex(T, Value, {CurIndex + 1, CurIndex});
getLastIndex([_ | T], Value, {CurIndex, LastIndex}) -> getLastIndex(T, Value, {CurIndex + 1, LastIndex}).


% Problem 13
labStatistics({leader, Name, Contribution}) -> io:format("LEADER: ~s's contribution was ~p%~n", [Name, Contribution * 100]);
labStatistics({student, Name, Contribution}) -> io:format("~s's contribution was ~p%~n", [Name, Contribution * 100]);
labStatistics({_, _, _}) -> dont_do_that.

labTwo() -> 
    labStatistics({leader, 'Jonathan', 0.34}),
    labStatistics({student, 'Caleb', 0.33}),
    labStatistics({student, 'Terence', 0.33}),
    done.
