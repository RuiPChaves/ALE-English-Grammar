:- write('Loading consistency checker...'),nl.

% ------------------------------------------------------------------------------
% Grammar consistency check 
%
% p_v/1 (verbose)
% p_s/1 (silent)
% ------------------------------------------------------------------------------

% Grammatical test set 
% ------------------------------------------------------------------------------
s(g,1,[i,smile]).
s(g,2,[you,smile]).
s(g,3,[she,smiles]).
s(g,4,[you,smile]).
s(g,5,[they,smile]).
s(g,6,[we,smile]).
s(g,7,[i,saw,her]).
s(g,8,[the,cat,fell]).
s(g,9,[each,cat,fell]).
s(g,10,[these,cats,fell]).
s(g,11,[much,cash,fell]).
s(g,12,[mia,relies,on,us]).
s(g,13,[mia,relied,on,him]).
s(g,14,[the,boy,relied,on,some,girl]).
s(g,15,[the,girl,saw,the,cat,yesterday]).
s(g,16,[the,girl,saw,the,cat,often]).
s(g,17,[tom,said,a,friend,of,mia,smiled,yesterday]).
s(g,18,[tom,said,the,teachers,smiled,yesterday]).
s(g,19,[tom,said,that,tom,saw,a,cat,yesterday]).
s(g,20,[tom,knows,one,fact]).
s(g,21,[tom,accepted,the,claim,that,tom,sneezed]).

% Ungrammatical test set
% ------------------------------------------------------------------------------
s(u,1,[i,smiles]).
s(u,2,[you,smiles]).
s(u,3,[she,smile]).
s(u,4,[they,smiles]).
s(u,5,[we,smiles]).
s(u,6,[i,saw,she]).
s(u,7,[the,cat,fall]).
s(u,8,[each,cash,fell]).
s(u,9,[these,cat,fell]).
s(u,10,[these,boys,smiles]).
s(u,11,[much,cats,fell]).
s(u,12,[cat,fell]).
s(u,13,[mia,relies,with,us]).
s(u,14,[mia,rely,on,us]).
s(u,15,[mia,relied,on,we]).
s(u,16,[the,girl,yesterday,saw,the,cat]).
s(u,17,[the,girl,saw,the,cat,never]).
s(u,18,[tom,said,a,friend,of,mia,yesterday]).
s(u,19,[tom,said,the,teachers,smiles,yesterday]).
s(u,20,[tom,said,that,saw,a,cat,yesterday]).
s(u,21,[tom,accepted,the,claim,sneezed]).

s(_,0,stop).


% ------------------------------------------------------------------------------
% Parse with verbose output p_v/1
%   "p_v(g)" for grammatical examples
%   "p_v(u)" for ungrammatical examples
%   "p_v(_)" for both
% ------------------------------------------------------------------------------

p_v(Type) :-
        repeat,
            s(Type,N,S),
            parse_v(S,N,Type),
            !.

parse_v(stop,0,_).
                  
parse_v(S,N,Type) :-  
         write('Parsing '), write(Type), write(' sentence number '), write(N), write('... '),
        (call(time(rec(S,_,_,_,(phrase,sem:store:(a_ []))))) ; (tab(18), write('Failed.'), nl)),!,
         fail.

% ------------------------------------------------------------------------------         
% Parse with 'silent' output p_s/1
%  "p_s(g)" for grammatical examples
%  "p_s(u)" for ungrammatical examples
%  "p_s(_)" for both
% ------------------------------------------------------------------------------

p_s(Type) :-
        repeat,
            s(Type,N,S),
            parse_s(Type,S,N),
            !.

parse_s(_,stop,0).

parse_s(g,S,N) :-  
        (
            call(rec(S,_,_,_,(phrase,sem:store:(a_ [])))) ;
            (
                write('Failed: expected ('), write(N), write(') '),
                write(S),
                write(' to be grammatical, but it was ungrammatical'), nl
            )
        ),!,
        fail.
parse_s(u,S,N) :-  
        (
            call(rec(S,_,_,_,(phrase,sem:store:(a_ [])))) ,
            (
                write('Failed: expected ('), write(N), write(') '),
                write(S),
                write(' to be ungrammatical, but it was grammatical'), nl
            )
        ),!,
        fail.
