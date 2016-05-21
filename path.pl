edge(nyc, chicago).
edge(nyc,dallas).
edge(chicago, la).
edge(dallas, la).
edge(la, sfo).
edge(sfo,la).    
edge(la, dallas).
edge(dallas, nyc).

in_list(X, [H|T]):- X==H ; in_list(X, T).

path(Start, End):- edge(Start, End).
path(Start, End):- edge(Start, Z), path(Z, End).

path2(Start, End, Path):- Start == End, path3(Start, End, [], Path). 
path2(Start, End, Path):- path4(Start, End, [Start], Path).

path3(Start, End, Visited, [Start, End]):- edge(Start, End), \+ in_list(End, Visited).
path3(Start, End, Visited, [Start|Tail]):- edge(Start, Z), \+ in_list(Z, Visited),  path3(Z, End,[Z|Visited], Tail).

path4(Start, End, Visited, [Start, End]):- edge(Start, End), \+ in_list(End, Visited).
path4(Start, End, Visited, [Start|Tail]):- edge(Start, Z), \+ in_list(Z, Visited),  path4(Z, End,[Start|Visited], Tail).


