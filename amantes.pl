% Hechos que indican quién ama a quién
ama(juan,ana).
ama(ana,miguel).
ama(luis,isabel).
ama(miguel,ana).
ama(laura,juan).
ama(isabel,luis).

% Regla para describir a los "amantes"
amantes(X, Y) :- ama(X, Y), ama(Y, X), X \= Y.

% Regla para identificar a quien ama a alguien
ama_a_alguien(X) :-
    ama(X, _).

% Regla para identificar a quien es amado por alguien
es_amado_por_alguien(Y) :-
    ama(_, Y).

% Regla para identificar a quienes se aman sin ser correspondidos
ama_sin_corresponder(X) :-
    ama(X, Y),
    \+ ama(Y, X).  % X ama a Y pero Y no ama a X