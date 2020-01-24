;;Concept definistions
;;===========================================================================
(ghost-parse "concept: ~gene [genes gene Gene Genes geneNode \"gene node\" \"gene nodes\" \"gene product\"]")
(ghost-parse "concept: ~go [term terms \"GO term\" \"GO terms\" \"go term\" \"go terms\"]")
(ghost-parse "concept: ~ns [namespace name-space \"name space\"]")

;;============================================================================

;;
;;Query: What do you know about Gene X? 

;;
(ghost-parse "u: FINDGENE (find about ~gene _*)  ^find-about-gene('_0)")
(ghost-parse "u: (what do you know about ~gene _*) ^find-about-gene('_0)")
(ghost-parse "u: (tell me about ~gene _*) ^find-about-gene('_0)")

;;(test-ghost "find about gene IGLV3-12")
;;(test-ghost "what do you know about gene IGLV3-12")


;;




;; Find list of geneNodes in a given GO-term
(ghost-parse "u: FIG (find list of ~gene related to _*) ^find-genes('_0)")
(ghost-parse "u: (show *~3 ~gene related to _*) ^find-genes('_0)")

;;(test-ghost "Find list of genes in GO term GO:0000001")
; (ghost-parse "u: ([(do you know) (can you tell me)])")

;;
;; Find in GO name x
;;
(ghost-parse "u: FINDGENE (find *~1 ~gene in GO name _*)  ^find-gene-in('_0)")
(ghost-parse "u: (what ~gene [exist \"are found\"] in GO name _*)  ^find-gene-in('_0)")

;;(test-ghost "what genes exist in GO name reproduction")

;;
    ;;Query: Find the common genes in GO term x and y
;;
(ghost-parse "u: (find *~1 common ~gene in GO term _* and _*) ^find-common-genes('_0, '_1)")
(ghost-parse "u: (find ~gene that annotate both _* and _*) ^find-common-genes('_0, '_1)")
(ghost-parse "u: (what are the common genes between GO term _* and _*) ^find-common-genes('_0, '_1)")
(ghost-parse "u: (can you [show tell] me the common genes between GO term _* and _*) ^find-common-genes('_0, '_1)")

;;(test-ghost "find the common genes in GO term GO:0005654 and GO:0005829")
;;(test-ghost "what are the common genes between GO term GO:0005654 and GO:0005829")

;;
    ;;Find the common categories
    ;;Query: Does gene x annotate any GO terms that gene y annotates
;;
(ghost-parse "u: (find *~1 common categories of ~gene _* and ~gene _*) ^common-categories('_0, '_1)")
(ghost-parse "u: (find the categories of ~gene _* and _*)   ^common-categories('_0, '_1)")
(ghost-parse "u: (do ~gene _* annotate any ~go that ~gene _* annotate)   ^common-categories('_0, '_1)")

(ghost-parse "u: FINDREL (find the common categories genes _* and _*) ^common-categories('_0, '_1)")

(ghost-parse "u: (how are ~gene _* and _* are related) ^reuse(FINDREL)")

;;(test-ghost "how are genes LOC100509620 and FABP12 are related")
;;(test-ghost "find the common categories of genes IGLV1-50 and genes IGLV10-54")
;;(test-ghost "does gene LOC100509620 annotate any GO terms that gene FABP12 annotates")


;;
    ;;Query: what GO terms in name-space NS describe gene x?
;;
(ghost-parse "u: (what ~go in ~ns _* describe ~gene _*) ^find-GO-NS('_0, '_1)") 

;;(test-ghost "what GO terms in namespace biological process describe gene IL7R")


(ghost-parse "u: GOTERM ([can do] you *~3 GO term _*) ^findAboutGO('_0)")
(ghost-parse "u: (what [can do] you *~3 GO term _*) ^findAboutGO('_0)")
(ghost-parse "u: (find *~1 about GO term _*) ^findAboutGO('_0)")

;;(test-ghost "what can you tell me about GO term GO:0000001")
;;(test-ghost "what do you know about GO term GO:0000001")
;;(test-ghost "can you tell me about GO term GO:0000003")

;;
    ;;Query: Show me all GO terms related to x
;;
(ghost-parse "u: ([(can you show me) (show me) (what are)] *~1 GO terms related to _*) ^findAboutGO('_0)")

(ghost-parse "u: (find *~1 about GO term _*) ^findAboutGO('_0)")

;;
    ;;Query: Find GO terms that regulate x
;;
(ghost-parse "u: REGULATES ([(find) (what are the) (show me all)] ~go that regulate ~go _*)  ^find-regulates('_0)")

;;(test-ghost "show me all GO terms that regulate GO:0004693")

;;
    ;;Query: Find Genes that regulate x
;;

(ghost-parse "u: (find *~2 ~gene *~1 regulate _*) ^gene-regulate('_0)")
(ghost-parse "u: (what be ~gene *~1 regulate _*) ^gene-regulate('_0)")

;;(test-ghost "find genes that regulate kinase activity")


;;
    ;;Query: Does gene x regulate gene y
    ;;Query: How does gene x regulate gene y
;;

(ghost-parse "u: ISREG (do ~gene _* regulate ~gene _*) ^is-regulate('_0, '_1)")
(ghost-parse "u: (how do  ~gene _* regulate ~gene _*) ^is-regulate('_0, '_1)")

;;(test-ghost "does gene NBN regulate gene PMS2P1")
;;(test-ghost "how does gene NBN regulate gene PMS2P1")

;;
    ;;Query: Does GO term x regulate GO term y
    ;;Query: How does GO term x regulate GO term y
;;

(ghost-parse "u: (do ~go _* regulate ~go _*) ^is-GO-regulate('_0, '_1)")
(ghost-parse "u: (how do  ~go _* regulate ~go _*) ^is-GO-regulate('_0, '_1)")

;;(test-ghost "does GO term GO:0033674 regulate GO term GO:0016301")
;;(test-ghost "how does GO term GO:0033674 regulate GO term GO:0016301")
;;
    ;;Query: Tell me about kinase activity
    ;;Query: What do you know about kinase activity
;;
(ghost-parse "u: ([(tell me) (what do you know)] about _*)  ^findAboutGO('_0)")

;;(test-ghost "tell me about kinase activity")

;;
    ;;Query: Show me the list of synonyms of GO term x
    ;;Query: Find synonyms of GO term x
    ;;Query: What are synonyms of GO term x
;;

(ghost-parse "u: ([(show me the list of) (find) (what are)] synonyms of GO term _*) Here you go, ^find-synonym('_0)")

;;(test-ghost "show me the list of synonyms of GO term GO:0000001")

;;
    ;;Query: What GO terms are connected by is-a/has-part/part-of/regulates relationship to GO term x?
    ;;Query: Find all GO terms that have is-a/has-part/part-of/regulates relationship to GO term x?
;;
(ghost-parse "u: ([(find) (find all) (what)] ~go *~2 [\"connected by\" \"have\"] _* relationship [to with] ~go _*) ^find-GO-rel('_0, '_1)")

;;(test-ghost "find all GO terms that have positively-regulates relationships to GO term GO:0033674")

;;
    ;;Query: What are the ancestors of GO term x
    ;;Query: What are the descendants of GO term x
;;

(ghost-parse "u: ([(find all) (what be) (find)] *~1 [parents ancestors] *~1 ~go _*) ^find-ancestor('_0)")

;;(test-ghost "what are the parents of GO term GO:0000011")

(ghost-parse "u: ([(find all) (what be) (find)] *~1 [childern descendants] *~1 ~go _*) ^find-descendant('_0)")

;;(test-ghost "what are the descendants of GO term GO:0007033")

;;
    ;;Query: Where does GO term x  in namespace biological process or molecular function take place
    ;;Query: What cellular component GO terms are connected to x by genes
;;
(ghost-parse "u: (where do ~go _* *~2 [\"biological process\" \"molecular function\"] take place) ^find-cellular-comp('_0)")

(ghost-parse "u: (what cellular component ~go be connected to _* by genes) ^find-cellular-comp('_0)")

;;(test-ghost "where does GO term GO:0005215 in namespace molecular function take place")


;;
    ;;Query: What biological processes take place in cellular component GO term x
    ;;Query: What biological process GO terms are connected to x by genes
;;

(ghost-parse "u: (what biological process take place cellular component ~go _*) ^find-bio-process('_0)")

(ghost-parse "u:(what biological process ~go be connected *~1 _* by genes)  ^find-bio-process('_0)")

;;
      ;;Query: What is the relationship between GO term x and GO term y?
;;

(ghost-parse "u: (what be *~1 relationship between ~go _* and ~go _*) ^find-relationship('_0, '_1)")
(ghost-parse "u: (how be ~go _* and ~go _* related) ^find-relationship('_0, '_1)")

;;(test-ghost "what is the relationship between GO term GO:0000138 and GO term GO:0005215")

;;
    ;;Query: What GO terms are part of biological process x
    ;;Query: Show me all processes that are part of biological process x
;;
(ghost-parse "u: (what ~go be part *~1 biological process _*)  ^find-sub-process('_0)")
(ghost-parse "u: (show *~2 process *~2 part of biological process _*) ^find-sub-process('_0)")

;;(test-ghost "what GO terms are part of biological process mitotic sister chromatid segregation")
;;(test-ghost "show me all processes that are part of biological process mitotic sister chromatid segregation")

;;
    ;;Query: Is GO term x a GO term y?
    ;;Query: Is x a y?
;;
(ghost-parse "u: (be ~go _* a ~go _*) ^find-is-rel('_0, '_1)")
(ghost-parse "u: (be _* a _*) ^find-is-rel('_0, '_1)")

;;(test-ghost "Is GO term GO:0000278 a GO term GO:0000070")
;;(test-ghost "Is mitotic cell cycle a cell cycle")


;;
    ;;Query: List molecular functions of gene X?
    ;;Query: Show me molecular functions of gene x
;;
(ghost-parse "u: ([(list) (show me) (find)] molecular [function activity] {of} ~gene _*) ^find-gene-function('_0)")

;;(test-ghost "show me molecular functions of gene PMS2P1")
