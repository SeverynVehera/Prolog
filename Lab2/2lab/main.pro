% Copyright

implement main
    open core
domains
name = string.

class predicates
родич : (name, name) nondeterm anyflow.

мати : (name, name) nondeterm anyflow.
бабуся : (name, name) nondeterm anyflow.
внучка :(name,name) nondeterm anyflow.
clauses


родич ("Марина", "Ірина").
родич ("Олена", "Анна").
родич ("Ольга", "Марина").
родич ("Ольга", "Тетяна").
родич ("Тетяна", "Катя").
родич ("Анна", "Маша").

мати(X,Y) :- родич(X,Y).
бабуся(X,Z) :- мати(X,Y), мати (Y,Z).
внучка(X,Z) :- мати (Y,X), мати(Z,Y).

clauses

    run() :-
       console::init,
       мати (X,"Маша"), stdIO::writef("Мама Маші = %\n ",X),
       fail.

  run() :-
       console::init,
       бабуся (X,"Маша"), stdIO::writef("\nБабуся Маші = %\n ",X),
       fail.

   /*run() :-
       console::init,
       внучка (X, ""), stdIO::writef("\nОнучка Ольги = % \n",X),
       fail.
*/
   run() :-
       stdIO::writef("\nУ Ольги 2 онучки").

end implement main

goal
    console::runUtf8(main::run).