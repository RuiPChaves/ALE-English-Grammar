% Grammar Rules
% ------------------------------------------------------------------------------

% ==== HEAD SPR RULE ====

head_spr_struc rule
(phrase,(syn:(head : H, 
                    val : (spr : [], 
                            comps : [], 
                            mod : M)),
               sem : (S, (index : I, 
                                top : (a_ T)))))
===>
cat> (X, sem : top: (a_ T1)),
cat> (syn_sign, (Y, (sem : (index : I, 
                                          top : (a_ T2)),
                              syn : (head : H,
                                val : (spr: [X], 
                                        comps : [],
                                        mod : M))))),
goal> (compose(X,Y, S), 
           prolog(append(T1,T2,T))).



% ==== HEAD COMPS RULE ====

head_comps_struc rule
(phrase,(syn:(head : H, 
                    val : (spr: X, 
                             comps: L,
                             mod : M)),
               sem : (index : I,
                          top : (a_ T),
                          restr : R,
                          store : (a_ S))))
===>
cat> (syn_sign, syn:(head : H,
                 val : (spr: X, 
                         comps: [C|L],
                         mod : M )),
                    sem : (index : I ,
                               top : (a_ T1),
                               restr : R,
                               store : (a_ S1))),
cat> (C,sem : (top: (a_ T2),
                        store: (a_ S2))),
goal> prolog( (append(S1,S2,S),
                      append(T1,T2,T) )).



% ==== Rightward HEAD MOD RULE ====

r_head_mod_struc rule
(phrase,(syn: X,
              sem : (index : I,
                         restr: (a_ [R2 & R1]),
                         top : (a_ T),
                         store : S)))
===>
cat> (syn_sign, syn:(val : (spr: [ ], 
                                         comps : [ ],
                                         mod : (right, sign : Y))),
                          sem : (top : (a_ T1),
                                      restr : (a_ [R1]))),
cat> (Y, (syn : X,
             sem : (index : I,
                       top : (a_ T2),
                        restr : (a_ [R2]),
                        store : S))),
goal> prolog( append(T1,T2,T) ).                      



% ==== Leftward HEAD MOD RULE ====

l_head_mod_struc rule
(phrase,(syn: X,
              sem : (index : I, 
                        top : (a_ T),
                        restr : (a_ [A & B]),
                        store : (a_ S ) )))
===>
cat> (Y, (syn : X,
             sem : (top : (a_ T1),
                        index : I,
                        restr : (a_ [A]),
                        store : (a_ S1) ) ) ),
cat> (syn_sign, syn:(val : (spr: [ ], 
					comps : [ ],
					mod : (left, sign : Y))),
                        sem : (top : (a_ T2),
                                   restr : (a_ [B]),
                                   store : (a_ S2 ) )),
goal> prolog( (append(T1,T2,T), 
                       append(S1,S2,S))).



% ==== STORE RETRIEVAL RULE 1 ====

store_retrieval_struc rule
(phrase,(syn:(X), 
              sem : (S2, index : I)))
===>
cat> (syn_sign, (syn:(X, (head : (verb, ic : B),
                                    val : (spr : [ ], 
                                            comps: [ ],
                                        mod : none))),
                          sem : (S1, index : I))),
goal> retrieve(S1,S2,B).


% ==== STORE RETRIEVAL RULE 2 ====


adnominal_store_retrieval_struc rule
(phrase,(syn:(X), 
               sem : (S2, (top : T, 
                                index : I))))
===>
cat> (syn_sign, (syn: (X, (val : (spr:[ ], 
                                         comps:[],
                                         mod : left))),
                          sem : (S1, ( top : T,
                                               index : I)))),
goal> retrieve(S1,S2,_).

