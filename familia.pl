%2.1. Escribe un fichero denominado “familia.pl” que contenga los siguientes hechos:
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

%2.2. Define hechos en los que se afirmen los siguientes enunciados:
% Hechos que describen matrimonios
matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).
% Hechos que describen relaciones de parentesco (hijos)
hijo(juan, antonio).
hijo(juan, ana).
hijo(rodrigo, antonio).
hijo(rodrigo, ana).
hijo(marta, antonio).
hijo(marta, ana).
hija(carmen, luis).
hija(carmen, isabel).
hijo(ricardo, juan).
hijo(ricardo, carmen).
hija(alicia, rodrigo).
hija(alicia, isabel).

%2.3. Define una regla que indique que “matrimonio” es reflexivo, es decir, si X e Y forma un matrimonio entonces Y y X también lo forman.
% Regla que indica que el matrimonio es reflexivo
matrimonio_reflexivo(X, Y) :-
    matrimonio(X, Y).  
    matrimonio(Y, X).

%2.4. Define reglas para obtener:
% Regla para obtener los nietos de una persona
nieto(Nieto, Abuelo) :-
    hijo(Nieto, Padre),
    hijo(Padre, Abuelo).

% Regla para obtener los abuelos de una persona
abuelo(Abuelo, Nieto) :-
    nieto(Nieto, Abuelo).

% Regla para obtener los hermanos de una persona
hermano(Hermano, Persona) :-
    hijo(Hermano, Padre),
    hijo(Persona, Padre),
    Hermano \= Persona.

% Regla para obtener los tíos de una persona
tio(Tio, Sobrino) :-
    hermano(Tio, Padre),
    hijo(Sobrino, Padre).

% Regla para obtener las tías de una persona
tia(Tia, Sobrina) :-
    hermana(Tia, Padre),
    hijo(Sobrina, Padre).

% Definición adicional para hermana
hermana(Hermana, Persona) :-
    mujer(Hermana),
    hermano(Hermana, Persona).

% Regla para obtener los primos de una persona
primo(Primo1, Primo2) :-
    abuelo(X, Primo1),
    abuelo(X, Primo2),
    hermano(PadrePrimo1, X),
    hermano(PadrePrimo2, X),
    PadrePrimo1 \= PadrePrimo2.

% Regla para obtener las primas de una persona
prima(Prima, Persona) :-
    hija(Persona, Padre),
    hermano(Tio, Padre),
    hijo(Prima, Tio),
    Prima \= Persona.

% Regla para obtener los suegros de una persona
suegro(Suegro, Persona) :-
    matrimonio(Suegro, Hijo),
    hijo(Persona, Hijo).


