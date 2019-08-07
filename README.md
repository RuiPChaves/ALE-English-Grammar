# ALE-English-Grammar

This is a mid-size English grammar written in the Attribute Logic Engine (https://www.cs.toronto.edu/~gpenn/ale.html), using SWI Prolog. The grammar parses tokenized English sentences and outputs a morphosyntactic analysis and a First-Order Logic semantic representation. The grammar is also coupled to a model checker and toy world knowledge model so that it can determine whether a sentence is true or not.

# Files

main.pl loads ALE, the grammar (including the consistency checker) and the model checker for FOL representations (including the world knowledge model). This file contains the main commands for running the grammar utiltities. See file for details.

check.pl consists of a set of grammatical sentences and a set of ungrammatical sentences. Every time the grammar developer changes the grammar, it is possible to check whether the changes caused adverse effects on what was previously correctly parsed. This is a developer consistency check.

model_checker.pl is an implementation of the satisfaction function of Dynamic Predicate Logic. See Patrick Blackburn & Johan Bos, Representation and Inference for Natural Language: A First Course in Computational Semantics for details.

world_knowledge.pl is a very small proof-of-concept database for the model checker.

signature.pl contains the HPSG grammar signature in ALE format.

macros_functions.pl contains HPSG macros (abbreviations).

cons.pl contains HPSG type constraints over classes of lexemes.

lex_rules.pl contains a small repertoire of HPSG lexical rules for inflection and derivation.

phrase_rules.pl contains phrasal rules (syntax and semantics)

if_rules.pl contains ancillary ALE clauses, mostly for semantic composition, namely Cooper/Keller Storage quantifier scope resolution.

# Running

This version of the grammar has been developed for SWI Prolog 5.6.47. This version of ALE will not work on more recent SWI implementations. 

To load the grammar after compiling main.pl:
?- ldg. 

To parse a sentence with quantifier scope resolved:
?- recs(+ListOfTokens).

To obtain top node syntax and semantics included (Switch = r (raw ALE output) or c (clean pretty printed) )
?- sem(+ListoOfTokens,+Switch)

# Citation

At the moment, there is no paper associated to this software. Please link to the present repository if you use this work in a published or open-source project.







