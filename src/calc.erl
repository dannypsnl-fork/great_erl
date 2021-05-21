-module(calc).
-author("dannypsnl").

%% API
-export([rpn/1]).

rpn(L) when is_list(L) ->
    [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
    Res.

rpn("+", [X, Y | Stack]) -> [Y + X | Stack];
rpn("-", [X, Y | Stack]) -> [Y - X | Stack];
rpn("*", [X, Y | Stack]) -> [Y * X | Stack];
rpn("/", [X, Y | Stack]) -> [Y / X | Stack];
rpn("^", [X, Y | Stack]) -> [math:pow(Y, X) | Stack];
rpn("ln", [N | Stack]) -> [math:log(N) | Stack];
rpn("log10", [N | Stack]) -> [math:log10(N) | Stack];
rpn(X, Stack) -> [read(X) | Stack].

read(N) ->
    case string:to_float(N) of
        {error, no_float} -> list_to_integer(N);
        {F, _} -> F
    end.
