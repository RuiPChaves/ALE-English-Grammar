



% ==================================================
% Function i
% Determines the value of a variable/constant in an assignment G
% ==================================================

i(Var,G,Value):- 
    var(Var),
    member([Var2,Value],G), 
    Var == Var2.   

i(C,_,Value):- 
   nonvar(C),
   f(C,Value).


% ==================================================
% Function F
% Determines if a value is in the denotation of a Predicate/Relation
% ==================================================

f(Symbol,Value):- 
   denotes(Symbol,ListOfValues),  
   member(Value,ListOfValues).  

% ==================================================
% Extension of a variable assignment
% ==================================================

extend(G,X,[ [X,Val] | G]):-
  domain(D),
   member(Val,D).


% ==================================================
% Existential quantifier
% ==================================================

sat(G1,exists-[X,Formula],G3):-
   extend(G1,X,G2),
   sat(G2,Formula,G3).


% ==================================================
% Existential quantifier
% ==================================================

 sat(G1,the-[X, A & B],G3):-
   sat(G1,exists-[X, A & B],G3),
   i(X,G3,Value), 
   \+ ( ( sat(G1,exists-[X,A],G2), i(X,G2,Value2), \+(Value = Value2)) ).


% ==================================================
% Negation 
% ==================================================

sat(G,not-[Formula2],G):-
   \+ sat(G,Formula2,_).

% ==================================================
% Universal quantifier
% ==================================================

sat(G, forall-[X,Formula2],G):-
  sat(G,not-[exists-[X,not-[Formula2]]],G).


% ==================================================
% Conjunction
% ==================================================

sat(G1, Formula1 & Formula2,G3):-
  sat(G1,Formula1,G2), 
  sat(G2,Formula2,G3). 


% ==================================================
% Disjunction
% ==================================================

sat(G1,or-[Formula1,Formula2],G2):-
  ( sat(G1,Formula1,G2) ;
    sat(G1,Formula2,G2) ).


% ==================================================
% Implication
% ==================================================

sat(G1,Formula1 => Formula2,G2):-
   sat(G1,or-[not-[Formula1],Formula2],G2).


% ==================================================
% Predicates
% ==================================================

sat(G,P-[Var],G):-
   \+ (P = not),
   i(Var,G,Value),
   f(P,Value).

% ==================================================
% Two-place Relations
% ==================================================

sat(G,P-[Var1,Var2],G):-
   \+ ( P = or ),
   i(Var1,G,Value1),
   i(Var2,G,Value2),
   f(P,[Value1,Value2]).

% ==================================================
% Three-place Relations
% ==================================================

sat(G,P-[Var1,Var2,Var3],G):-
   \+ ( member(P, [forall, exists,the]) ),
   i(Var1,G,Value1),
   i(Var2,G,Value2),
    i(Var3,G,Value3),
   f(P,[Value1,Value2,Value3]).



