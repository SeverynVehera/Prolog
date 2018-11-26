% Copyright

implement main
    open core
constants
className = 'main'.
classVersion = 'primtype1'.

class predicates
result : (real, real, real) procedure (i, i,o).
min : (integer, integer, integer) procedure (i, i,o).
evenOrOdd : (integer) procedure (i).

clauses
result(X,Y,Z):-
    stdIO::writef("\nX = %\tY = %", X, Y),
    if (X = Y), !
        then Z = 0,  stdIO::writef("\tZ = NULL :Division by zero\n")
        else  Z = (2 * X + Y) / (X - Y),
        stdIO::writef("\tZ = %\n", Z)
    end if.

min(X,Y,Z):-
    stdIO::writef("\nX = %\tY = %", X, Y),
    if (X <= Y), !
        then  Z = X,
        stdIO::writef("\tZ = %\n", Z)
        else  Z = Y,
        stdIO::writef("\tZ = %\n", Z)
    end if.

evenOrOdd(X):-
    stdIO::writef("\n%", X),
    if (X mod 2 = 0), !
        then
        stdIO::writef(" - is EVEN\n")
        else
        stdIO::writef(" - is ODD\n")
    end if.
clauses

 run() :-
    console::init(),
    stdIO::writef("\n1. Обчислити значення виразу Z = (2 * X + Y) / (X-Y) для введених X і Y.\n"),
   result(4, 4, Z1),
   result(5, 2, Z2),
   result(4, 1, Z3),
    fail.

    run() :-
    console::init(),
    stdIO::writef("\n2. Знайти мінімальне з двох введених А і Б\n"),
   min(5, 17, Z1),
   min(35, 18, Z2),
   min(8, 18, Z3),
    fail.

    run() :-
    console::init(),
    stdIO::writef("\n3. Визначити, чи є парним або непарним випадковим чином вибране число від 0 до 100\n"),
   evenOrOdd(5),
   evenOrOdd(35),
   evenOrOdd(8),
    succeed.

end implement main

goal
    console::runUtf8(main::run).