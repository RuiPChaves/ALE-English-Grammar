% Signature
% ------------------------------------------------------------------------------

bot sub [sign, syn, pos, valence, list, agr, num, per, gnd, case, bool, pform, mod, sem, sem_obj, restr].
  sign sub [syn_sign, lex_sign]
	intro [syn : syn,
	         sem : sem].
        syn_sign sub [phrase, word].
        lex_sign sub [word, lexeme]. 
              lexeme sub [infl_lxm, const_lxm].
                      infl_lxm sub [cn_lxm, v_lxm].
                                 v_lxm sub [intr_v_lxm, trans_v_lxm, ptrans_v_lxm, ditrans_v_lxm, sent_v_lxm].
                                           ptrans_v_lxm sub [on_ptrans_v_lxm, with_ptrans_v_lxm, from_ptrans_v_lxm, for_ptrans_v_lxm, in_ptrans_v_lxm, into_ptrans_v_lxm].
                                 cn_lxm sub [sing_n_lxm, plur_n_lxm].
                                       sing_n_lxm sub [count_sing_n_lxm, mass_sing_n_lxm].
                                                          count_sing_n_lxm sub [simple_sn_lxm, clausal_n_lxm, rel_sn_lxm, der_n_lxm].
                      const_lxm sub [pn_lxm, pron_lxm, dt_lxm, prep_lxm, adv_lxm, adj_lxm, compl_lxm].
                      prep_lxm sub [mod_prep_lxm, marking_prep_lxm].
                      adj_lxm sub [simple_adj_lxm, rel_adj_lxm].
  syn sub [] 
      intro [val : valence,
               head: pos].
  pos sub [adj, adv, prep, verbal, agr_pos].        
      prep sub []
               intro [pform : pform].
      agr_pos sub [det, verb, noun]
                    intro [agr : agr].
            det sub []
                   intro [count : bool].
             noun sub []
                   intro [case : case]. 
       verbal sub [verb, compl]
                    intro [ic : bool]. 
   agr sub []
         intro [num : num,
                  per : per,
                  gnd : gnd].
  num sub [sg, pl].
  per sub [fst, snd, trd].
  gnd sub [fem,mas,neut].
  case sub [acc, nom].
  valence sub [] 
               intro [spr :list,
                       comps: list,
                       mod : mod].
         mod sub [none, mod_sign].
                  mod_sign sub [left, right]
                                  intro [sign : syn_sign].
  list sub [e_list, ne_list].
    ne_list sub [] 
            intro [hd: bot, 
                      tl : list].
  bool sub [minus, plus].
  pform sub [on, of, with, into, in, from, for, into].
  sem sub []
          intro [index : (a_ _),
                   restr : (a_ _),
                   store : (a_ _),
                   top : (a_ _) ].               
