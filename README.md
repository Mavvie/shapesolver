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

Alternatively, you can pass it a variable and it will (REALLY slowly, I estimate it takes a few million years if you require all points) find a path that goes through all the points. Example:

    ?- path([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16], Path).
        => Path = [...]

Note: I have no idea what the solution to the above example would be - it takes way too long to run. GG.
