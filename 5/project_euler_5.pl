gcd(X, X, X).

gcd(X, Y, Z):- X > Y, X1 is X - Y, gcd(X1, Y, Z).

gcd(X, Y, Z):- Y > X, Y1 is Y - X, gcd(X, Y1, Z).


lcm(X, Y, Z):- Z is abs(X * Y) / gcd(X, Y).


answer(X, Y, A):- X1 is X + 1, lcm(X, X1, C),  answer(Y, X1, C, A).

answer(Y, Y, C, A):- lcm(Y, C, A).
answer(Y, X1, C, A):- X2 is X1 + 1, lcm(X1, C, Z),  answer(Y, X2, Z, A).
