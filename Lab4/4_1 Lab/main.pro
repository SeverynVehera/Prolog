% Copyright

implement main
    open core

domains
імя = string.
захоплення = string.

class predicates
захоплюється : (імя, захоплення) nondeterm anyflow.
спорт : (захоплення) nondeterm anyflow.
муз_інстр : (захоплення) nondeterm anyflow.
спортсмен : (імя) nondeterm anyflow.
музикант : (імя) nondeterm anyflow.

clauses
захоплюється ("Коля", "гітара").
захоплюється ("Оля", "скрипка").
захоплюється ("Діма", "плавання").
захоплюється ("Таня", "теніс").
спорт ("плавання").
спорт ("теніс").
муз_інстр ("скрипка").
муз_інстр ("гітара").

спортсмен (X):-захоплюється (X, Y), спорт(Y).
музикант (X):-захоплюється (X, Y), муз_інстр(Y).

clauses
run() :-
    console::init(),
    stdIO::writef("Займаються спортом:\n"),
    спортсмен(X), stdIO::writef(X),stdio::nl,
    fail.

run() :-
    console::init(),
    stdIO::writef("\nЗаймаються музикою:\n"),
    музикант(Y), stdIO::writef(Y),stdio::nl,
    fail.
   run() :-
       stdIO::writef("").

end implement main

goal
    console::runUtf8(main::run).