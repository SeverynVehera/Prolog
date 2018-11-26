% Copyright

implement main
    open core
domains
number = integer.
city = string.
time = string.
class predicates
train : (number, city, time) nondeterm anyflow.

clauses
train(233,"Kyiv","12-30").
train(257,"Lviv","09-20").
train(267,"Dnipro","20-40").
train(358,"Rava","02-30").
train(413,"Kharkiv","11-10").
train(283,"Lviv","14-50").
train(256,"Zashkiv","21-30").

clauses

 run() :-
    console::init(),
    stdIO::writef("\nTrain schedule\n"),
    stdIO::writef("\nNumber\tCity\tTime\n"),
    train(X,Y,Z),  stdIO::writef("%\t%\t%\n ",X,Y,Z),
    fail.


 run() :-
    console::init(),
    train(X,"Lviv",Z),
    stdIO::writef("\nDestination Lviv"),
    stdIO::writef("\nNumber %\tTime %\n",X,Z),
    fail.

   run() :-
       stdIO::writef("").

end implement main

goal
    console::runUtf8(main::run).