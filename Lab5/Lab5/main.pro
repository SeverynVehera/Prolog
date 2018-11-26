% Copyright

implement main
    open core

    domains
name = string.
number = integer.

class predicates
student : (name, number) nondeterm anyflow.
list : (name, number) nondeterm anyflow.
clauses

student ("Володя", 3).
student ("Олена", 1).
student ("Ірина", 2).
student ("Марина", 1).
student("Дмитро", 1).

list(X,Y):-student(X,Y).

clauses
    run() :-
    console::init(),
    stdIO::writef("\nСписок студентів 1-го курсу\n"),
    student(X,1), stdIO::writef(X),stdio::nl,
    fail.

   run() :-
       stdIO::writef("").

end implement main

goal
    console::runUtf8(main::run).