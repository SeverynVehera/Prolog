% Copyright

implement main
    open core
domains
name = string.

class predicates
родич : (name, name) nondeterm anyflow.
чоловік: (name) nondeterm anyflow.
жінка: (name) nondeterm anyflow.

батько : (name, name) nondeterm anyflow.
мати : (name, name) nondeterm anyflow.
дідусь : (name, name) nondeterm anyflow.
бабуся : (name, name) nondeterm anyflow.
онук :(name,name) nondeterm anyflow.
брат :(name,name) nondeterm anyflow.
сестра :(name,name) nondeterm anyflow.
clauses


родич ("Іван", "Катя").
родич ("Анна", "Олег").
родич ("Олег", "Діма").
родич ("Ігор", "Ольга").
родич ("Олег", "Віктор").
родич ("Ігор", "Іван").

чоловік ("Діма").
чоловік ("Іван").
чоловік ("Ігор").
чоловік ("Олег").
чоловік ("Віктор").

жінка ("Катя").
жінка ("Ольга").
жінка ("Анна").

батько(X,Y) :- родич(X,Y), чоловік(X).
мати(X,Y) :- родич(X,Y), жінка(X).

дідусь(X,Z) :- родич(X,Y), родич(Y,Z).
бабуся(X,Z) :- родич(X,Y), родич(Y,Z).

онук(X,Z) :- родич (Y,X), родич(Z,Y).

брат(X,Y) :- родич(Z,X), родич(Z,Y), чоловік(X).
сестра(X,Y) :- родич(Z,X), родич(Z,Y), жінка(X).

clauses

    run() :-
       console::init,
       дідусь (X,"Катя"), stdIO::writef("Дідусь Каті = %\n ",X),
       fail.
/*
  run() :-
       console::init,
       бабуся (X,"Діма"), stdIO::writef("\nБабуся Діми = %\n ",X),
       fail.
*/
  run() :-
       console::init,
       онук (X,"Анна"),
       stdIO::writef("\nОнук Анни = %\n ",X),
       fail.

   run() :-
       console::init,
       брат (X,Y), Y = "Діма", X<>Y,
       stdIO::writef("\n% брат Діми\n ",X),
       fail.

   run() :-
       console::init,
       сестра (X,Y), Y = "Іван", X<>Y,
       stdIO::writef("\n% сестра Івана\n ",X),
       fail.

   run() :-
       stdIO::writef("").

end implement main

goal
    console::runUtf8(main::run).