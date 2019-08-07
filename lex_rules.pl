% Lexical Rules
%===================================================

% Ancillary constraints

fricative([_,s]).
fricative([_,z]).
fricative([s,h]).
fricative([c,h]).

consonant(X) :- member(X,[b,c,d,f,g,j,k,l,m,n,p,q,r,s,t,v,x,z]).


%===================================================
%===================================================
% INFLECTION
%===================================================
%===================================================


%===================================================
% Nominal rules
%===================================================

% Constant Lexeme Lexical rule

constant lex_rule  
   (const_lxm, (syn : S,
                       sem : M))
   **> (word, (syn : S,
                     sem : M))
 morphs
    X becomes X.


% Singular common noun lexical rule 

sing_n lex_rule  
   (cn_lxm, (syn : S,
                   sem : M))
   **> (word, (syn : S,
                     sem : M))
 morphs
    X becomes X.

% Plural noun lexical rule 

plur_n lex_rule  
   (count_sing_n_lxm, (syn : (head : (agr : (gnd : G,
                                                                   per : P)),
                                               val : (spr : [ @det(_,B,Z) ],
                                                        comps: C,
                                                        mod : D)),
                                     sem : M))
       **> (word, (syn : (head : (noun, 
                                               agr : (Y, (gnd: G,
                                                            per : P,
                                                            num : pl))),
                                    val : (spr : [ @det(Y,B,Z) ],
                                             comps : C,
                                             mod : D)),
                          sem : M))
 morphs
  sheep becomes sheep,
  man becomes men,
  woman becomes women,
  (X,[K,W]) becomes (X,[K,W],es) when fricative([K,W]),
  (X,z) becomes (X,zzes),
  (X) becomes (X,s).

% beach -> beaches
% lass - > lasses

% quiz -> quizzes


%===================================================
% Verbal rules
%===================================================

% Past tense lexical rule

past_v lex_rule  
   (v_lxm, 
         (syn: S,
          sem : M))
   **> (word, (syn: S,
                     sem : M))
  morphs
    see becomes saw,
    fall becomes fell,
    say becomes said,
    think becomes thought,
    (X,e) becomes (X,ed),
    (X,y) becomes (X,ied),
    (X) becomes (X,ed).


% Present tense lexical rule (case 1)

thirdper_v1 lex_rule  
   (v_lxm, 
        (syn: S,
         sem : M))
   **> (word, (syn: (S,head : (agr :(num: sg, 
                                                       per: trd))),
                      sem : M))
  morphs
    (X,[K],y) becomes (X,[K],ies) when consonant(K),
    (X,[K,W]) becomes (X,[K,W],es) when fricative([K,W]),
    X becomes (X,s).

% rely -> relies
% teach -> teaches
% smash -> smashes
% buzz -> buzzes

% Present tense lexical rule (case 2)

thirdper_v2 lex_rule  
   (v_lxm, 
         (syn: (S, head : (agr : (num: sg, (per : fst ; per: snd) ;
                                  (num : pl)))),
           sem : M))
   **> (word, (syn: S,
                     sem : M))
  morphs
   X becomes X.




%===================================================
%===================================================
% DERIVATION
%===================================================
%===================================================

%===================================================
% V-to-R (+er) rule
%===================================================

v_to_n lex_rule  
   (v_lxm, 
         (sem : (restr : (a_ [_ -[_,P-[_,Y|L]]]))))
   **> (der_n_lxm, (syn: (val :  (comps: @opt_pp(of,L)) ),
                           sem : (index : (a_ Y),
                            restr : (a_  [P-[_,Y|L]] ) )))
  morphs
    (X,e) becomes (X,er),
    (X) becomes (X,er).

% see -> seer
% teach -> teacher


