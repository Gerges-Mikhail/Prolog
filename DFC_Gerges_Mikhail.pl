root(a).
has_child(a,[r,c]).
has_child(r,[d,f]).
has_child(c,[f,g]).
has_child(d,[h,i]).
has_child(f,[i,j,k]).

deed_ended(h).
deed_ended(i).
deed_ended(j).
deed_ended(k).
deed_ended(h).

empty_stack([]).
stack(Top,Res,[Top|Res]).
rev_stack_print([]).
rev_stack_print([H|T]):- rev_stack_print(T),write(H),write('==').

member1([],[],[]).
member1(T,[],T).
member1([],Closed,[]).
member1([H|T],Closed,New):-member(H,Closed),member1(T,Closed,New).
member1([H|T],Closed,[H|New]):-not(member(H,Closed)),member1(T,Closed,New).

appe([],[],[]).
appe([],L,L).
appe(L,[],L).
appe([H|T],L,[H|T2]):-
appe(T,L,T2).

go(Start,Goal):-
empty_stack(Closed),empty_stack(Empty_Open),stack(Start,Empty_Open,Open),
path(Open,Closed,Goal).
path(Open,_,_):-empty_stack(Open),write('no solution').

path(Open,Closed,Goal):-stack(X,Res,Open),X==Goal,write('Solutionis : '),
rev_stack_print(Closed),write(X).


path(Open,Closed,Goal):-stack(X,Res,Open),not(X==Goal),deed_ended(X),path(Res,[X|Closed],Goal).

path(Open,Closed,Goal):-stack(X,Res,Open),not(X==Goal),has_child(X,L),member1(L,Closed,NewL),
appe(NewL,Res,NRes),path(NRes,[X|Closed],Goal).