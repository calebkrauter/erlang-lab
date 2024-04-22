% Caleb Krauter
% Terence Fornelosa Trajano
% Jonathan Kim

-module(lab03test).
-include_lib("eunit/include/eunit.hrl").

% Problem 3

calculateTotals_base_test() ->
    ?assertEqual([{123,189.81}], qa:calculateTotals([{123, 9.99, 10, 0.9}])).

calculateTotals_0_quantity_test() ->
    ?assertEqual([{123,0}], qa:calculateTotals([{123, 9.99, 0, 0.9}])).

calculateTotals_0_cost_test() ->
    ?assertEqual([{123,0}], qa:calculateTotals([{123, 0, 10, 0.9}])).

calculateTotals_0_orderID_test() ->
    ?assertEqual([{0,189.81}], qa:calculateTotals([{0, 9.99, 10, 0.9}])).

calculateTotals_0_tax_test() ->
    ?assertEqual([{123,100}], qa:calculateTotals([{123, 10, 10, 0}])).

calculateTotals_1_tax_test() ->
    ?assertEqual([{123,200}], qa:calculateTotals([{123, 10, 10, 1}])).

calculateTotals_negative_id_test() ->
    ?assertEqual([], qa:calculateTotals([{-123, 9.99, 10, 0.9}])).

calculateTotals_negative_cost_test() ->
    ?assertEqual([], qa:calculateTotals([{123, -9.99, 10, 0.9}])).

calculateTotals_negative_quantity_test() ->
    ?assertEqual([], qa:calculateTotals([{123, 9.99, -10, 0.9}])).

calculateTotals_negative_tax_test() ->
    ?assertEqual([], qa:calculateTotals([{123, 9.99, 10, -0.9}])).

calculateTotals_high_tax_test() ->
    ?assertEqual([], qa:calculateTotals([{123, 9.99, 10, 9000000000000000}])).

calculateTotals_invalid_type_test() ->
    ?assertEqual([], qa:calculateTotals([{anatom, 9.99, 10, 0.9}])).

calculateTotals_invalid_type_list_cost_test() ->
    ?assertEqual([], qa:calculateTotals([{123, [9.99], 10, 0.9}])).

calculateTotals_invalid_type_tuple_cost_test() ->
    ?assertEqual([], qa:calculateTotals([{123, {9.99}, 10, 0.9}])).

calculateTotals_string_cost_test() ->
    ?assertEqual([], qa:calculateTotals([{123, "Str", 10, 0.9}])).

calculateTotals_tuples_test() ->
    ?assertEqual([{123,189.81}, {456, 50}, {1, 2}], qa:calculateTotals([{123, 9.99, 10, 0.9}, {456, 10, 5, 0}, {anatom}, {789, -1, 10, 0.1}, {1, 1, 1, 1}])).

% Problem 5

mapReduce_Negative_test() ->
    ?assertEqual(lab03:mapReduce(fun lab03:flip/1, fun (X, Y) -> X * Y end, 1, [-3,6]), -18).

mapReduce_Negative_Zero_test() ->
    ?assert(lab03:mapReduce(fun lab03:flip/1, fun (X, Y) -> X * Y end, 1, [-0,6]) =:= 0).

mapReduce_test() ->
    ?assertEqual(lab03:mapReduce(fun (N) -> -1 * N end, fun (X, Y) -> X * Y end, 1, [3,6]), 18).

