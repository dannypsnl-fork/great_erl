-module(calc_test).
-author("dannypsnl").

-include_lib("eunit/include/eunit.hrl").
-import(calc, [rpn/1]).

simple_test() ->
    5 = rpn("2 3 +"),
    87 = rpn("90 3 -"),
    84 = rpn("7 12 *"),
    (7/13) = rpn("7 13 /"),
    8.0 = rpn("2 3 ^"),
    ?assert(math:log(5) == rpn("5 ln")),
    ?assert(math:log10(34) == rpn("34 log10")),
    (-40) = rpn("2 3 + 9 - 10 *"),
    ?assert(true).
