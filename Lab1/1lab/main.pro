% Copyright
implement main
    open core
domains
name = string.

class predicates
батько : (name, name) nondeterm anyflow.
мама : (name, name) nondeterm anyflow.
clauses

батько ("Ілля", "Марина").
батько ("Сергій", "Іван").
батько ("Микола", "Іра").

мама ("Марина", "Іра").
мама ("Олена", "Іван").
мама ("Ольга", "Олексій").
мама ("Марина", "Олександр").


clauses
%1
    run() :-
        console::init(),
        stdio::write(""), stdio::nl,
        stdio::write("Чи вірно, що Марина є мамою Іри?"), stdio::nl,

        if (мама ("Марина", "Іра")) then
            stdio::write("Так"), stdio::nl
        else
            stdio::write("НІ") , stdio::nl
        end if,
        fail.

%1.1
     run() :-
        console::init(),
        stdio::write(""), stdio::nl,
        stdio::writef("Хто є мамою Іри?"), stdio::nl,
        мама (X,"Іра"), stdIO::writef("Мама Iри %\n",X),
        fail.

%2
    run() :-
        console::init(),
        stdio::write(""), stdio::nl,
        stdio::write("Чи вірно, що Олексій є дитиною Ольги"), stdio::nl,
        if (мама ("Ольга", "Олексій")) then
            stdio::write("Так"), stdio::nl
        else
            stdio::write("НІ") , stdio::nl
        end if,
        fail.

%3
    run() :-
        console::init(),
        stdio::write(""), stdio::nl,
        stdio::write("Хто є дитиною Миколи?"), stdio::nl,
        батько ("Микола",X), stdIO::writef("Дитиною Миколи є %\n",X),
        fail.
%4
    run() :-
        console::init(),
        stdio::write(""), stdio::nl,
        stdio::write("Батьками Івана є:"), stdio::nl,
        батько (X,"Іван"), stdIO::writef("Батько %\n",X),
        мама (Y,"Іван"), stdIO::writef("Мама %\n",Y),
        fail.
%5
    run() :-
        console::init(),
        stdio::write("\nВсі батьки та їхні діти\n"), stdio::nl,
        мама(X,Z),  stdIO::writef("Мама= %  Дитина=%\n ",X,Z),
        fail.
    run() :-
        console::init(),
        батько(Y,Z),  stdIO::writef("Батько= % Дитина=%\n ",Y,Z),
        fail.

   run() :-
        console::init(),
        stdIO::writef("").


end implement main

goal
    console::runUtf8(main::run).






