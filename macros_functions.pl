% Macros
% ------------------------------------------------------------------------------

 np(A,V,C) macro (syn_sign, syn: (head : (noun,                        
                                                              agr : A,
                                                             case : C),
                                                   val : (  spr :  [ ],
                                                   comps: [ ] )),
                                                sem : index :  V).


 n macro (syn_sign, syn: (head : (noun),                        
                                                   val : (  spr :  [ _ ],
                                                   comps: [ ] ))).


 det(X,Y,Z) macro (syn_sign, (syn: (head : (det,                        
                                                                    agr : X,
                                                                    count : Y),
                                                         val : (  spr :  [ ],
                                                                    comps: [ ] )),
                                                 sem : (index : Z))).


 pp(X,V) macro (syn_sign, syn: (head : (prep,                        
                                                           pform : X),
                                              val : (  spr :  [ ],
                                              comps: [ ],
                                              mod : none )),
                                            sem : index : V).

opt_pp(X,[V|_]) macro ( [] ; [(syn_sign, syn: (head : (prep,                        
                                                           pform : X),
                                              val : (  spr :  [ ],
                                              comps: [ ],
                                              mod : none )),
                                            sem : index : (a_ V))]).


 vp macro (syn_sign, syn: (head : (verb),                       
                                           val : (  spr :  [ _ ],
                                           comps: [  ] ))).


s(X,T) macro (syn_sign, (syn: (head: (T, ic : minus),
	   		                     val : ( spr : [],
				                       comps: [])),
                                    sem : restr : X)).


opt_s(X,T) macro ( [] ; [ @s(X,T) ] ).




% Functions
% ------------------------------------------------------------------------------


/* np +++> (syn: (head : noun,
                         val : ( spr :  [],
                                   comps: [] ))).
*/
