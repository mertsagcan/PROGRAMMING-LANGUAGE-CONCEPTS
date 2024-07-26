:- module(main, [is_movie_directed_by/2, total_awards_nominated/2, all_movies_directed_by/2, total_movies_released_in/3, all_movies_released_between/4]).
:- [kb].

% DO NOT CHANGE THE UPPER CONTENT, WRITE YOUR CODE AFTER THIS LINE

is_movie_directed_by(Title, Director) :- movie(Title, Director, _, _, _, _).

total_awards_nominated(Title, Nominations) :- movie(Title, _, _, Nom1, Nom2, Nom3), Nominations is Nom1 + Nom2 + Nom3.

all_movies_directed_by(Director, Movies) :- findall(Title, movie(Title, Director, _, _, _, _), Movies).

list_length([],0).
list_length([_|TAIL],N) :- list_length(TAIL,N1), N is N1 + 1.

total_movies_released_in(Movies, Year, Count) :- findall(Title, movie(Title, _, Year, _, _, _), NewMovies), list_length(NewMovies, Count).
%total_movies_released_in([Head|Tail], Year, Count) :- total_movies_released_in(Tail, Year, Count1), Count is Count1 + 1, movie(Head, _, Year, _,_,_).

all_movies_released_between(Movies, MinYear, MaxYear, MoviesBetweenGivenYears).