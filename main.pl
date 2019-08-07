:- op(600,xfy,'=>').
:- op(600,xfy,'&').


% -----------------------------------------------------------------------------------------------
% Auto-load ALE, consistency checker, and model checker.

 :- 
   compile('../ale_swi.pl'), 
   compile('check.pl'),
   compile('model_checker.pl'),
   compile('world_knowledge.pl').

% -----------------------------------------------------------------------------------------------
% Load Grammar

ldg :- 
   compile_sig('signature'),
   compile_fun('macros_functions'),
   compile_cons('cons'),
   compile_logic,
   compile_subsume,
   compile_lex_rules('lex_rules'),
   compile_lex('lexicon'),
   compile_rules('phrase_rules'),
   compile_dcs('if_rules').


% -----------------------------------------------------------------------------------------------
% Check truth value in KR model

eval(X) :- 
   rec(X,_,phrase(_-sem(_,_-a_ [Y],_,_),_),_,(phrase, (syn : (head : (verb, ic : plus),
                                                                                         val : (spr : [],
                                                                                             comps : [],
                                                                                             mod : none)),
                                                                            sem: (top : (a_ [ ]), store: (a_ [ ]) )))),
   sat([],Y,_).                 


ex(1) :- eval([every,dog,chased,a,cat]).
ex(2) :- eval([a,dog,chased,a,cat]).
ex(3) :- eval([a,dog,chased,every,cat]).

% -----------------------------------------------------------------------------------------------
% Parse sentences with empty storage:

recs(S) :- rec_list([S],(phrase, (syn : (head : (verb,
                                                                       ic : plus),
                                                           val : (spr :  [],
                                                                    comps : [ ],
                                                                    mod : none)),
                                                 sem : (top : (a_ [ ]),
                                                            store : (a_ [ ]))))).

% -----------------------------------------------------------------------------------------------
% Pretty-print semantic output (r = raw / c = clean)

sem(Input,T) :-
    rec(Input,_,phrase(_-sem(_,_-a_ [X],_,_),_),_,(phrase,sem: (top : (a_ [ ]), store: (a_ [ ]) ))),
    numbervars(X,0,_), 
    output(X,T).


output(X,r):-
    writeln(X).

output(X,c):- 
    pprint(X).

% Pprint:

pprint(X => Y):-
  pprint(X),
  write(' => '),
  pprint(Y).

pprint(X & Y):-
  pprint(X),
  write(' & '),
  pprint(Y).

pprint([X]):-
  pprint(X).

pprint([X,Y|L]):-
  pprint(X),
  write(' & '),
  pprint([Y|L]).

pprint(R-[X,Y]):-
    (Y =.. ['&',_,_] ; Y =.. ['=>',_,_]),!,
   write(R), write('('),
   write(X), write(','), 
   pprint(Y), write(')').

pprint(R-L):-
   write(R), write('('),
   pprintlist(L), write(')').

pprintlist([X]) :- pprint(X),!.   
pprintlist([X]) :- write(X).
pprintlist([X,Y|L]) :- write(X), write(', '), pprintlist([Y|L]),!.
   
