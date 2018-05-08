divisible(X,Y) :- 0 is X mod Y, !.

divisible(X,Y) :- X > Y+1, divisible(X, Y+1).

isPrime(2) :- true,!.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).

harmonic(N,1,_,_,Ne,De):-harmonic(N,2,1,1,Ne,De),!.
harmonic(N,Aux, Denominator, Numerator,De,Ne):- Aux<N,!,
    lcm(Denominator, Aux, LCM),!,
    Numerator1 is Numerator*(LCM/Denominator)+(LCM/Aux),
    Denominator1 is LCM,
    Aux1 is Aux+1,
    harmonic(N,Aux1, Denominator1, Numerator1,De,Ne).
harmonic(N,N,Denominator,Numerator,Denominator, Numerator):-!.


gcd(X, Y, G) :- X = Y, G = X.
gcd(X, Y, G) :-
  X < Y,
  Y1 is Y-X,
  gcd(X, Y1, G).

gcd(X, Y, G) :- X > Y, gcd(Y, X, G).

lcm(X,Y,LCM):-gcd(X,Y,GCD), LCM is X*Y/GCD.

wolstenholme([],[]).
wolstenholme([H|T],[H|R]):-isPrime(H),
    !,
    Z is H*H*H,
    harmonic(H,1,1,1,_,Numerator),
    0 is Numerator mod Z,!,
    wolstenholme(T,R).
wolstenholme([_|T],R):-wolstenholme(T,R).











