% Type constraints
% ========================================================

% All names are nominal, third person, and allow no arguments of any kind.
%
pn_lxm cons (syn: (head: (noun, 
                                          agr : (per : trd)),
                             val :    (spr : [   ],
                                        comps : [  ],
                                        mod : none ) ),
                       sem : (index : (a_ X),
                              restr : (a_ []),
                              store : (a_ []),
                              top : (a_  [exists-[X,(_-[X]) & _ ] ] ))).

% ========================================================

% All pronouns are nominal, and allow no arguments of any kind.
%
pron_lxm cons (syn:(head: (noun),
                             val :    (spr : [   ],
                                        comps : [ ],
                                        mod : none  )),
                          sem : (index : (a_ X),
                                     restr :  (a_ []),
                                     top : (a_ []),
                                     store : (a_  [exists-[X,(_-[X]) & _ ]]  ))).
                                                                  
% ========================================================

% All common nouns are nominal, third person, require a D specifier but nothing else.
%
cn_lxm cons (syn : (head: (noun, 
                                         agr : (X, per : trd)),
                                 val : (spr : [  @det(X,_,Y)  ],
                                          mod : none ) ),
                          sem : (index : Y,
                                      top : (a_ []),
                                      store : (a_ [ ] ))).                                 
                                        

% "Singulare tantum" nouns are singular (e.g. cat, dog, house, gold, fun, etc.)

sing_n_lxm cons (syn:(head: (agr : (num: sg)))).

% "Plurale tantum" nouns are plural (e.g. pants, trunks, scissors, etc.) 

plur_n_lxm cons (syn:(head: (agr : (num: pl)),
                                        val : comps : []),
                             sem : restr : (a_ [_-[_]])).

% Count nouns (cat, dog, house, etc.) are COUNT +

count_sing_n_lxm cons (syn: (val : (spr : [ @det(_, plus,_) ] ))). 


% Simple count nouns take no complements or semantic arguments

simple_sn_lxm cons (syn: (val : (comps : [  ] )),
                                  sem : (index : (a_ X), 
                                            restr : (a_ [_-[X]]))).
                                            
% Simple count nouns take no complements or semantic arguments

clausal_n_lxm  cons (syn: (head : (agr : gnd : neut),
                                            val : (comps : @opt_s((a_ V),verbal) )),
                                  sem : (index : (a_ X), 
                                            restr : (a_ [_-[X,V]]))).                                                                   

% Relational count nouns can take a PP-of complements and semantic argument

rel_sn_lxm cons (syn: (val : (comps : [ @pp(of,(a_ X)) ] )),
                                  sem : (index : (a_ Y),
                                             restr : (a_ [_-[Y,X]]))).

% Derived singular count nouns 

der_sn_lxm cons (sem : (index : (a_ X), 
                                            restr : (a_ [_-[_,X|_]]))).


% Mass nouns (e.g. gold, wheat, cash, fun, etc.) are COUNT -

mass_sing_n_lxm cons (syn: (val : (spr : [  @det(_, minus,_) ],
                                                         comps : [ ] )),
                                       sem : (index  : (a_ X),
                                                  restr : (a_ [_-[X]]))).


% ========================================================
% Verbal constraints
% ========================================================

% Verbal lexemes select a nominative NP specifier and agree with it.
%
v_lxm cons (syn:(head: (verb, agr : A),
                             val :    (spr : [  @np(A,(a_ X),nom)  ],
                                        mod : none )) ,
                       sem : (index  : (a_ E), 
                                  restr : (a_  [  exists-[E,_-[E,X|_]]]  ),
                                  top : (a_ []),
                                  store : (a_ []))).

% Intransitive verbal lexemes require no complements.
%
intr_v_lxm cons (syn:(val : (comps : [   ] ) ),
                            sem : restr : (a_ [ _-[_,_-[_,_]]]  )).

%Sentential verbs require an S complement

sent_v_lxm cons (syn : (val: (comps : [ @s((a_ V),verbal) ])),
	   		    sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).

% Transitive verbal lexemes require one accusative NP complement.
%
trans_v_lxm cons (syn:(val : (comps : [  @np(_,(a_ V),acc)  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).

%Ditransitive verbs require two NP complements

ditrans_v_lxm cons (syn:(val : (comps : [  @np(_,(a_ V),acc), @np(_, (a_ Z),acc)  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V,Z]]] ))).

% on-Prepositional-transitive verbal lexemes require a PP[on] complement.
%
on_ptrans_v_lxm cons (syn:(val : (comps : [  @pp(on,(a_ V))  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).
%from-ditto
%
from_ptrans_v_lxm cons (syn:(val : (comps : [  @pp(from,(a_ V))  ] ) ),
                              sem : (restr : (a_[ _-[_,_-[_,_,V]]] ))).
%for-ditto
%
for_ptrans_v_lxm cons (syn:(val : (comps : [  @pp(for,(a_ V))  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).
%in-ditto
%
in_ptrans_v_lxm cons (syn:(val : (comps : [  @pp(in,(a_ V))  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).
%into-ditto
%
into_ptrans_v_lxm cons (syn:(val : (comps : [  @pp(into,(a_ V))  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).
% on--ditto
%
with_ptrans_v_lxm cons (syn:(val : (comps : [  @pp(with,(a_ V))  ] ) ),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]]  ))).

% ========================================================
% Determiner constraints
% ========================================================

% All determiners have empty valence 
%
dt_lxm cons (syn:(head: (det),
                             val :    (spr : [   ],
                                        comps : [  ],
                                        mod : none ) ),
                      sem : (index : (a_ X),
                                restr : (a_ [ ]),
                                  top : (a_ []),
                                store : (a_  [_-[X,_]] ) )).

% ========================================================
% Preposition constraints
% ========================================================

% All prepositions require an accusative NP complement, but no specifier
%
prep_lxm cons (syn:(head: prep,
                                val :    (spr : [   ],
                                           comps : [ @np(_,_,acc) ] ) ),
                          sem : (top : (a_ []),
                                     store : (a_ []) )).

% Argument-marking prepositions
%

marking_prep_lxm cons (syn : (val: (mod : none,
                                    comps : [ (sem : index : X) ])),
                                        sem : (index : X,
                                                   restr : (a_ [] ))).


% Modifying prepositions
%
mod_prep_lxm cons (syn:( val : (comps : [ (sem: index: (a_ Z))],
                                 mod : (left, sign : (sem : index : (a_ Y))))),
                                 sem : (index : (a_ X),
                                          restr : (a_  [_-[X,Y,Z]] ))).


% ========================================================
% Adverbial constraints
% ========================================================

% All adverbs have empty spr/comps and modifiy VP
%
adv_lxm cons (syn:(head: (adv),
                             val :    (spr : [   ],
                                        comps : [  ],
                                        mod : (sign : (@vp, sem : index : (a_ X)) ) )),
                         sem : (index : (a_ X),
                                    top : (a_ []),
                                    restr : (a_  [_-[X]] ),
                                    store : (a_ []))).

% ========================================================
% Adjectival constraints
% ========================================================

% All adjectives have empty spr and modifiy n
%
adj_lxm cons (syn:(head: (adj),
                             val :    (spr : [   ],
                                        mod : (sign : (@n, sem : index : (a_ X) ) ) )),
                         sem : (index : (a_ E),
                                    top : (a_ []),
                                    restr : (a_ [ _-[E,X|_] ] ),
                                    store : (a_ [ ]))).

% All simple adjectives have empty comps and modify rightwards
%
simple_adj_lxm cons (syn:(val :    (comps : [  ],
                                        mod : (right))),
                         sem : (restr : (a_ [ _-[_,_] ] ))).

% All relational adjectives have select PP[of] comps and modify leftwards
%
rel_adj_lxm cons (syn:(val :  (comps : [ @pp(of,(a_ Y))  ],
                                        mod : (left))),
                         sem : (restr : (a_ [ _-[_,_,Y] ] ))).

% ========================================================
% Complementizer constraints
% ========================================================

compl_lxm cons (syn : (head : compl,
                                     val : (spr :  [ ],
                                             comps : [ (@s(_,verb), sem : (index : I, 
                                                                                            restr : (a_ [X]) )) ],
                                             mod : none)),
                            sem : (index : I,
                                      top : (a_ []),
                                      store : (a_ []),
                                      restr : (a_ [X]))).
