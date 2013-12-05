shapesolver
===========

A quick little Prolog AI that finds any possible paths through a set of connections (given in info.pl) that goes through every required point.

For example, the following prolog session demonstrates a sample use:

    ?- [info].
        => Success, compiled info.pl in 0 seconds.
    ?- [maze].
        => Success, compiled maze.pl in 0 seconds.
    ?- path([1,3,7,8], [1,2,out,16,3,7,6,out,10,8]).
        => true.
