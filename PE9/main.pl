:- module(main, [salad_type/2, person_can_eat/3, possible_order_options/3, count_per_type/2]).
:- [kb].

% DO NOT CHANGE THE UPPER CONTENT, WRITE YOUR CODE AFTER THIS LINE

salad_type([], Type).

salad_type([FirstItem|Rest], Type):-
    not(not_vegan(FirstItem)),
    salad_type(Rest, Type),
    Type = vegan.

salad_type([FirstItem|Rest], Type):-
    not(not_vegetarian(FirstItem)),
    salad_type(Rest, Type),
    Type = vegetarian.
    
salad_type([FirstItem|Rest], Type):-
    Type = omnivorous.
    
person_can_eat(Person, [], Salad):- false.

person_can_eat(Person, [FirstSalad|Rest], Salad):-
    vegan(Person),
    salad_type(FirstSalad, vegan),
    Salad = FirstSalad.
    
person_can_eat(Person, [FirstSalad|Rest], Salad):-
    vegetarian(Person),
    salad_type(FirstSalad, vegetarian),
    Salad = FirstSalad.
    
person_can_eat(Person, [FirstSalad|Rest], Salad):-
    omnivorous(Person),
    Salad = FirstSalad.
    
person_can_eat(Person, [FirstSalad|Rest], Salad):-
    person_can_eat(Person, Rest, Salad).



possible_order_options(Person, [], []).

possible_order_options(Person, OrderString, ItemList).
    



















count_per_type([], []).
count_per_type(SaladList, TypeList).

