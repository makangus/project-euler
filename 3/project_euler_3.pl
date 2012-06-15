%-------------------- check prime number, use the Primality by Trial Division ---------------------------
% if we are at Y is a factor of X if X mod Y = 0
factor(X, Y):- X mod Y =:= 0.

% check all odd numbers till the sqrt of N
factor(X, Y):- Y * Y < X, Y2 is Y + 2, factor(X, Y2).


prime(2).
prime(3).
% N is a prime number if N > 3, N is an odd number and N is not divisible by any number in range(3, sqrt(N))
prime(N):- F is 3, N > 3 , N mod 2 =\= 0, \+factor(N, F).



%-------------------- largest prime factor -------------------
% largest prime factor is N if N is a prime number
answer(N, N):- prime(N).

% start with sqrt of N, check if the sqrt N is the largest prime factor of N
answer(N, A):-  N1 is round(sqrt(N)), answer(N, N1, A).

% answer is the sqrt of N if  F is a prime number and N is divisible by F
% ! is the cut, it stops backtracking once we found the prime, like using break; in a loop
answer(N, F, F):-  prime(F), N mod F =:= 0, !.

% the if statement makes sure we ignore even numbers, even numbers greater than 2 are never prime numbers
answer(N, F, A):- (F mod 2 =:= 0 -> F1 is F - 1 ; F1 is F - 2), answer(N, F1, A).


% ask Prolog the question
answer(600851475143, A).
