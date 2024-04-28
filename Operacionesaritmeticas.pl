%3. Escribe un programa que permita realizar las siguientes operaciones aritméticas:

% Definición del valor de pi
pi_value(3.14159).

% Regla para obtener el mínimo de dos números
minimo(X, Y, Min) :-
    (X < Y -> Min = X ; Min = Y).

% Regla para calcular el área de un círculo
area_circulo(Radio, Area) :- pi_value(PI),
    Area is pi * Radio * Radio.

% Regla para calcular el área de un trapecio
area_trapecio(BaseMayor, BaseMenor, Altura, Area) :-
    Area is ((BaseMayor + BaseMenor) / 2) * Altura.

% Regla para calcular el producto de los números entre dos dados
producto_entre(A, B, Producto) :-
    A =:= B,
    Producto is A.
producto_entre(A, B, Producto) :-
    A < B,
    A1 is A + 1,
    producto_entre(A1, B, ProductoParcial),
    Producto is A * ProductoParcial.
