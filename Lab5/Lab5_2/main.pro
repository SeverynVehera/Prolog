% Copyright

implement main
    open core

    domains
name = string.

class predicates
father : (name, name) nondeterm anyflow.
clauses

father ("Paul", "Peter").
father ("Rulya", "Paul").
father ("Rulya", "Sevas").

clauses
    run() :-
    console::init(),
    stdIO::writef("\n\n"),
    father(X,Z),  stdIO::writef("% is father of %\n ",X,Z),
    fail.

   run() :-
       stdIO::writef("").

end implement main

goal
    console::runUtf8(main::run).