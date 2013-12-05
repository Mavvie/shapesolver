directly_connected(1, out).
directly_connected(2, out).
directly_connected(4, out).
directly_connected(5, out).
directly_connected(6, out).
directly_connected(7, out).
directly_connected(1,2).
directly_connected(1,3).
directly_connected(1,4).
directly_connected(2,3).
directly_connected(2,4).
directly_connected(3,4).
directly_connected(3,7).
directly_connected(3,6).
directly_connected(3,5).
directly_connected(5,6).
directly_connected(5,7).
directly_connected(6,7).  

connected(A, B, [Next]) :-
  directly_connected(A,B),
  Next = B.
connected(A, B, [Next]) :-
  directly_connected(B,A),
  Next = B.

connected(A, B, [Next|Tail]) :-
  directly_connected(A, C),
  Next = C,
  connected(C, B, Tail).
connected(A, B, [Next|Tail]) :-
  directly_connected(C, A),
  Next = C,
  connected(C, B, Tail).

list_contains([], _) :-
  1 = 2.
list_contains([A], B) :-
  A = B.
list_contains([Ah|_], B) :-
  Ah = B.
list_contains([_|At], B) :-
  list_contains(At, B).

list_lacks([], _).
list_lacks([A], B) :-
  A \= B.
list_lacks([Ah|At], B) :-
  Ah \= B,
  list_lacks(At, B).

left_has_right(_, []).
left_has_right(L, [R]) :-
  list_contains(L, R).
left_has_right(L, R) :-
  R = [Rh|Rt],
  list_contains(L, Rh),
  left_has_right(L, Rt).

lists_equal([], []).
lists_equal(A, B) :-
  left_has_right(A,B),
  left_has_right(B,A).

no_duplicates([]).
no_duplicates([_]).
no_duplicates([out|T]) :-
  no_duplicates(T).
no_duplicates(L) :-
  L = [Lh|Lt],
  list_lacks(Lt, Lh),
  no_duplicates(Lt).

path(Required, Path) :-
  Start = Required,
  path(Required, Start, Path).

path(Required, Start, Path) :-
  Path = [_|Pt],
  Start = [St|_],
  connected(St, _, Pt),
  no_duplicates(Path),
  left_has_right(Path, Required).

path(Required, [_|Start], Path) :-
  path(Required, Start, Path).