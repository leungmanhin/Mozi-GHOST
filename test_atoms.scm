
(MemberLink
        (GeneNode "NBN")
        (ConceptNode "GO:0033674"))

(EvaluationLink
   (PredicateNode "GO_name")
   (ListLink
      (ConceptNode "GO:0016301")
      (ConceptNode "kinase activity")
   )
)




(EvaluationLink
   (PredicateNode "GO_positively_regulates")
   (ListLink
      (ConceptNode "GO:0033674")
      (ConceptNode "GO:0016301")
   )
)

(MemberLink
        (GeneNode "PMS2P1")
        (ConceptNode "GO:0016301"))



(EvaluationLink 
         (PredicateNode "GO_name")
         (ListLink 
                 (ConceptNode "GO:0000001")
                 (ConceptNode "mitochondrion inheritance")
         )
)

(EvaluationLink 
         (PredicateNode "GO_synonym_EXACT")
         (ListLink 
                 (ConceptNode "GO:0000001")
                 (ConceptNode "mitochondrial inheritance")
         )
)

(EvaluationLink
   (PredicateNode "GO_regulates")
   (ListLink
      (ConceptNode "GO:0033674")
      (ConceptNode "GO:0016301")
   )
)


(MemberLink
        (GeneNode "AP4M1")
        (ConceptNode "GO:0000138"))
(MemberLink
        (GeneNode "AP4M1")
        (ConceptNode "GO:0005215"))


(EvaluationLink
	(PredicateNode "GO_namespace")
	(ListLink
	    (ConceptNode "GO:0000138")
	    (ConceptNode "cellular_component")
	    )
	)

(MemberLink
        (GeneNode "FABP12")
        (ConceptNode "GO:0005215"))

(MemberLink
        (GeneNode "LOC100509620")
        (ConceptNode "GO:0005215"))

(MemberLink
        (GeneNode "LOC100509620")
        (ConceptNode "GO:0000138"))

(EvaluationLink
   (PredicateNode "GO_regulates")
   (ListLink
	(ConceptNode "GO:0000138")
	(ConceptNode "GO:0005215")
   )
)

(cog-execute! (GetLink
(VariableList
(VariableNode "$rel")
(VariableNode "$g")
)
(AndLink
(MemberLink
	(VariableNode "$g")
	(ConceptNode "GO:0005215")
)
(MemberLink
	(VariableNode "$g")
	(ConceptNode "GO:0000138")
)

(EvaluationLink
(VariableNode "$rel")
(ListLink
	(ConceptNode "GO:0000138")
	(ConceptNode "GO:0005215")
)
)
)))

(EvaluationLink 
         (PredicateNode "GO_name")
         (ListLink 
                 (ConceptNode "GO:0000022")
                 (ConceptNode "mitotic spindle elongation")
         )
)

(EvaluationLink 
         (PredicateNode "GO_namespace")
         (ListLink 
                 (ConceptNode "GO:0000022")
                 (ConceptNode "biological_process")
         )
)


(EvaluationLink 
         (PredicateNode "GO_part_of")
         (ListLink 
                 (ConceptNode "GO:0000022")
                 (ConceptNode "GO:0000070")
         )
)

(EvaluationLink 
         (PredicateNode "GO_name")
         (ListLink 
                 (ConceptNode "GO:0000070")
                 (ConceptNode "mitotic sister chromatid segregation")
         )
)

(EvaluationLink 
         (PredicateNode "GO_namespace")
         (ListLink 
                 (ConceptNode "GO:0000070")
                 (ConceptNode "biological_process")
         )
)


(InheritanceLink 
         (ConceptNode "GO:0000278")
         (ConceptNode "GO:0007049")
)

(EvaluationLink 
         (PredicateNode "GO_name")
         (ListLink 
                 (ConceptNode "GO:0000278")
                 (ConceptNode "mitotic cell cycle")
         )
)
(EvaluationLink 
         (PredicateNode "GO_name")
         (ListLink 
                 (ConceptNode "GO:0007049")
                 (ConceptNode "cell cycle")
         )
)



;;for inference testing to be removed
(EvaluationLink (stv 1.0 1.0)
         (PredicateNode "GO_regulates")
         (ListLink 
                 (ConceptNode "GO:0007049")
                 	(ConceptNode "GO:0000100")
         )
)


(MemberLink
        (GeneNode "PMS2P1")
        (ConceptNode "GO:0016301"))


(EvaluationLink 
         (PredicateNode "GO_namespace")
         (ListLink 
                 (ConceptNode "GO:0016301")
                 (ConceptNode "molecular_function")
         )
)

(use-modules (rnrs records syntactic) (rnrs records inspection))

(define-record-type node (fields id label x y size))

(define n1 (make-node 1 "kinase" 3 1 3 "#CCD" "GO term"))
(define n2 (make-node 1 "dfd" 3 1 3 "#CCD" "GO term"))

(define e1 (make-edge 1 "pos_reg" "1" "2" "#CCB" "3"))
(define e2 (make-edge 1 "pos_reg" "1" "2" "#CCB" "3"))

(define g (make-graph (list n1 n2) (list e1 e2)))

(scm->json n1)
(scm->json e1)
(json-build n1 (current-input-port) #f #f 0)