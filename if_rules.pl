% Composition


% Plain Cooper storage
store_n([ ], Q, [Q]).

% Recursive Keller storage
store_n([A|B], Q, [ [ Q | [A|B]] ]).


% Det + N

compose( (syn : (head : det),
                  sem : (store : (a_ [Q - [V, Arg] ]))),                  
                 (syn : (head : noun),
                  sem : (restr : (a_ [X]),
                             store : (a_ S ))),                
                 (restr : (a_ [ ]) ,
                             store : (a_ S2 ) )) 
                if prolog( (Arg =.. [_,X,_] , 
                                store_n(S,Q - [V, Arg],S2) ) ).


% Subj + VP

compose( (syn : (head : noun),
                  sem : (store : (a_ S1))),                  
                 (syn : (head : verb),
                  sem : (restr : X,
                             store : (a_ S2 ))),                
                 (restr : X ,
                    store : (a_ S ) )) 
                if prolog( append(S1,S2,S) ).
                   

% Storage Retrieval 

% Cooper
retrieve( (restr : (a_ [X]),
               top : T,
               store : (a_ CurrentStore )),                
              (restr : (a_ [Q - [V,Arg]]),
              top : T,
               store : (a_ NewStore )), _)                
             if prolog( (select(Q - [V,Arg], CurrentStore,NewStore), 
                             Arg =.. [_,_,X] )).

% Keller 
retrieve( (restr : (a_ [X]),
               top : T,
               store : (a_ CurrentStore )),                
              (restr : (a_ [Q - [V,Arg]]),
               top : T,
               store : (a_ NewStore )), _ )                
             if prolog( (select([Q - [V,Arg]|NestedStore],CurrentStore,TempStore), 
                            append(NestedStore,TempStore,NewStore), 
                            Arg =.. [_,_,X] ) ).


% Top retrieval (only retrieve if value of I(ndependent)C(lause) is "plus".
retrieve( (restr : (a_ [X]),
               store : (a_ [ ]),
               top : (a_  [Q - [V,Arg] | L] )),                
              (restr : (a_ [Q - [V,Arg]]),
               store : (a_ [ ]),               
               top : (a_ L )), plus ) if prolog(Arg =.. [_,_,X]).
               
