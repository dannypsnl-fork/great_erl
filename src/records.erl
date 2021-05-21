-module(records).
-compile(export_all).
-author("dannypsnl").

-record(robot, {
    name,
    type = industrial,
    hobbies,
    details = []
}).

first_bot() ->
    #robot{
        name = "Mechatron",
        type = handmade,
        details = ["Moved by a small man inside"]
    }.
