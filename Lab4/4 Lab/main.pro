% Copyright

implement main
    open core

domains
імя = string.
місто = string.

class predicates
відпочиває : (імя, місто) nondeterm anyflow.
франція : (місто) nondeterm anyflow.
україна : (місто) nondeterm anyflow.
прибалтика : (місто) nondeterm anyflow.
відпочинок_Україна : (імя) nondeterm anyflow.

clauses
відпочиває ("sasha", "antalia").
відпочиває ("anna", "paris").
відпочиває ("oleg", "lviv").
відпочиває ("dima", "urmala").
відпочиває ("orest", "kiev").
франція("paris").
україна ("kiev").
україна ("lviv").
прибалтика ("urmala").
відпочинок_Україна (X):-відпочиває (X, Y), /*франція*/україна (Y).

clauses
    run() :-
    console::init(),
    stdIO::writef("\nЗаймається музікою\n"),
    відпочинок_Україна (X), stdIO::writef(X),stdio::nl,
    fail.

   run() :-
       stdIO::writef("").

end implement main

goal
    console::runUtf8(main::run).