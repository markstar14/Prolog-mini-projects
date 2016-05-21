occurs_free_in(X, v(X)).
occurs_free_in(X, l(Y,T)) :-
		X \== Y,
		occurs_free_in(X, T).
occurs_free_in(X, a(T1,T2)) :-
		occurs_free_in(X, T1)  ;
		occurs_free_in(X, T2).

beta(a(l(_, _), _)).

eta(l(X, a(T, v(X)))):- \+ occurs_free_in(X, T).


beta_check(a(l(_, _), _)).
beta_check(a(T1, T2)):- 
		beta(T1) ; 
		beta(T2).
beta_check(l(_,T)):- beta(T).


eta_check(l(X, a(T, v(X)))):- \+ occurs_free_in(X, T). 
eta_check(l(T1,T2)):- eta(T1) ;
		eta(T2).
eta_check(a(T1,T2)):- 
		eta(T1) ;
		eta(T2).


normal(T):- 
	 \+ beta_check(T),
	 \+ eta_check(T).
