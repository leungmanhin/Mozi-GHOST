(define-public (intro)
    (let* 
        (
            (text '())
            (str-port (open-output-string))
        )
        (set! text "Hi, how can I help you?")
        (set! ghost-result (make-result text "'()"))
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)
        (WordNode "Success")
    )
)

(define-public (find-about-gene X)
        (let* (
            (param (GeneNode (multi-word X)))
            (go-nodes (map create-go-node (remove-set-ln (findAboutGene param))))
            (gene-node (create-gene-node param #t))
            (nodes (append (list gene-node) go-nodes))
            (edges '())
            (graph '())
            (text '())
            (str-port (open-output-string))
            )

        (set! edges (append (create-member-ln gene-node go-nodes) edges))
        (set! graph (make-graph nodes edges))
        (if (= (length edges) 0)
            (let ()
                (set! text (string-append "I couldn't find any information for " (multi-word X)))
                (set! ghost-result (make-result text '()))
            )
            (let ()
                (set! text (string-append "Displaying results for " (multi-word X)))
                (set! ghost-result (make-result text graph))
            )
        )      
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)
        (WordNode "Success")
))

(define (find-genes x)
        (let* (
            [go (find-GO x)]
            [genes (remove-set-ln (findGene go))]
            [gene-nodes (map create-gene-node genes)]
            [main-node (create-go-node go #t)]
            [nodes (append (list main-node) gene-nodes)]
            [edges '()]
            [graph '()]
            [text '()]
            [str-port (open-output-string)]
        )
            (set! edges (append (create-member-ln main-node gene-nodes) edges))
            (set! graph (make-graph nodes edges))
            (if (= (length edges) 0)
                (let ()
                    (set! text (string-append "I didn't find any genes that are related to " (cog-name x)))
                    (set! ghost-result (make-result text '()))
                )
                (let ()
                    (set! text (string-append "I have found the following genes related to " (cog-name x)))
                    (set! ghost-result (make-result text graph))
                )
            )      
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)
            
            (WordNode "Success")
        )
    
)

(define-public (find-common-genes x y)
    (let* (
        [gox (find-GO x)]
        [goy (find-GO y)]
        [genes (findCommonGenes gox goy)]
        [gene-nodes (map create-gene-node genes)]
        [gox-node (create-go-node gox #t)]
        [goy-node (create-go-node goy #t)]
        [nodes (append (list gox-node goy-node) gene-nodes)]
        [edges '()]
        [graph '()]
        [text '()]
        [str-port (open-output-string)]
        )
        (set! edges (append (create-member-ln gox-node gene-nodes) edges))
        (set! edges (append (create-member-ln goy-node gene-nodes) edges))
        (set! graph (make-graph nodes edges))
        (if (= (length edges) 0)
            (let ()
                (set! text (string-append "I couldn't find any GO terms that annotate both " (cog-name x) "and" (cog-name y)))
                (set! ghost-result (make-result text '()))
            )
            (let ()
                (set! text (string-append "These GO terms annotate both " (cog-name x) "and" (cog-name y)))
                (set! ghost-result (make-result text graph))
            )
        )
        
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)
        
        (WordNode "Success")
        )       
)


(define-public (common-categories x y) 
    (let* (
            (genex (GeneNode (multi-word x)))
            (geney (GeneNode (multi-word y)))
            (go (findCommonCategories genex geney))
            (gene-nodex (create-gene-node genex #t))
            (gene-nodey (create-gene-node geney #t))
            (go-nodes (map create-go-node (remove-set-ln go)))
            (nodes (append (list gene-nodex gene-nodey) go-nodes))
            (edges '())
            (graph '())
            (text '())
            (str-port (open-output-string))
        )
        
        (set! edges (append (create-member-ln-rev gene-nodex go-nodes) edges))
        (set! edges (append (create-member-ln-rev gene-nodey go-nodes) edges))
        (set! graph (make-graph nodes edges))
        (if (= (length 0))
            (let ()
                (set! text "I didn't find anything for your query.")
                (set! ghost-result (make-result text '()))
            )
            (let ()
                (set! text "Here are the results I have found..")
                (set! ghost-result (make-result text graph))
            )
        )
       
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)
        
        (WordNode "Success")

    )
)

(define-public (find-GO-NS ns x)
    (let*
        (
            (paramx (ConceptNode (multi-word ns))) 
            (paramy (GeneNode (multi-word x)))
            (ns-nodes (map create-go-node (remove-set-ln (findGONS paramx paramy))))
            (gene-node (create-gene-node paramy #t))
            (nodes (append (list gene-node) ns-nodes))
            (edges '())
            (graph '())
            (text '())
            (str-port (open-output-string))
        )

        (set! edges (append (create-member-ln gene-node ns-nodes) edges))
        (set! graph (make-graph nodes edges))
        (if (= (length edges) 0)
            (let ()
                (set! text (string-append "I didn't find anything that matches your query."))
                (set! ghost-result (make-result text '()))
            )
            (let ()
                (set! text (string-append "These GO terms in namespace " (multi-word ns) " describe gene " (multi-word x)))
                (set! ghost-result (make-result text graph))
            )
        )
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)
        (WordNode "Success")
        )
    
)


(define-public (findAboutGO x)
        (let*
            (
                [gox (find-GO x)]
                [text '()]
                [str-port (open-output-string)]

            )
            (if gox 
                (let* (
                    [go-name (find-GO-name gox)]
                    [gene (map create-gene-node (remove-set-ln (findGene gox)))]
                    [part1 (map create-go-node (remove-set-ln (part-of-1 gox)))]
                    [part2 (map create-go-node (remove-set-ln (part-of-2 gox)))]
                    [pos-reg (map create-go-node (remove-set-ln (positive-regulates gox)))]
                    [neg-reg (map create-go-node (remove-set-ln (negativelty-regulates gox)))]
                    [parents (build-hierarchy gox (make-graph '() '()))]
                    [main-node (create-go-node gox #t)]
                    [nodes (append (list main-node) gene part1 part2 pos-reg neg-reg)]
                    [edges '()]
                    [graph '()]
                )
                    (set! edges (append (create-member-ln main-node gene) edges))
                    (set! edges (append (create-eval-ln "pos_regulates" main-node pos-reg "pos_reg") edges))
                    (set! edges (append (create-eval-ln "neg_regulates" main-node neg-reg "neg_reg") edges))   
                    (set! edges (append (create-eval-ln "part_of" main-node part1 "part_of") edges))             
                    
                    (set! graph (append-graph (make-graph nodes edges) parents))
                    (if (= (length edges) 0)
                        (let ()
                            (set! text (string-append "There is nothing I can find about " go-name))
                            (set! ghost-result (make-result text '()))
                        )
                        (let ()
                            (set! text (string-append "I found these about " go-name))
                            (set! ghost-result (make-result text graph))
                            )
                    ))
            (let () 
                (set! text (string-append "I couldn't find any term named " (multi-word x)))
                (set! ghost-result (make-result text '()))
            )
        )
                
                (scm->json ghost-result str-port)
                (set! ghost-result (get-output-string str-port))
                (close-port str-port)
                (WordNode "Success") 
            )
 
)

(define-public (get-subgraph x)
    (let*
        (
            [gox (find-GO x)]
            [go-name (find-GO-name gox)]
            [gene (map create-gene-node (remove-set-ln (findGene gox)))]
            [part1 (map create-go-node (remove-set-ln (part-of-1 gox)))]
            [part2 (map create-go-node (remove-set-ln (part-of-2 gox)))]
            [pos-reg (map create-go-node (remove-set-ln (positive-regulates gox)))]
            [neg-reg (map create-go-node (remove-set-ln (negativelty-regulates gox)))]
            [main-node (create-go-node gox #t)]
            [nodes (append part1 part2 pos-reg gene neg-reg)]
            [edges '()]
            [graph '()]
            [str-port (open-output-string)]

        )
            (set! edges (append (create-member-ln main-node gene) edges))
            (set! edges (append (create-eval-ln "pos_regulates" main-node pos-reg "pos_reg") edges))
            (set! edges (append (create-eval-ln "neg_regulates" main-node neg-reg "neg_reg") edges))   
            (set! edges (append (create-eval-ln "part_of" main-node part1 "part_of") edges))             
            
            (set! graph (make-graph nodes edges))
            (set! ghost-result (make-result "" graph))
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)
            (WordNode "Success") 
        )

)

(define-public (find-regulates x)
    (let*
        (
            [gox (find-GO x)]
            [text '()]
            [str-port (open-output-string)]
        )
        (if gox 
            (let* (
                [reg (map create-go-node (remove-set-ln (regulates gox)))]
                [pos-reg (map create-go-node (remove-set-ln (positive-regulates gox)))]
                [neg-reg (map create-go-node (remove-set-ln (negativelty-regulates gox)))]
                [main-node (create-go-node gox #t)]
                [nodes (append (list main-node) pos-reg neg-reg reg)]
                [edges '()]
                [graph '()]
            )
                (set! edges (append (create-eval-ln "regulates" main-node reg "reg")  edges))
                (set! edges (append (create-eval-ln "pos-regulates" main-node pos-reg "pos_reg")  edges))
                (set! edges (append (create-eval-ln "neg-regulates" main-node neg-reg "neg_reg")  edges))
        
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text (string-append "No terms regulate " (find-GO-name gox)))
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text (string-append "The following terms regulate " (find-GO-name gox)))
                        (set! ghost-result (make-result text graph))
                        )
                )
            )
            (let ()
                (set! text (string-append "I didn't find any term named " (cog-name x)))
                (set! ghost-result (make-result text '()))
            )
            
            )
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
        )
)

(define-public (gene-regulate x)
        (let*
            (
                [goterm (find-GO x)]
                [text '()]
                [str-port (open-output-string)]
            )
            (if goterm 
                (let* (
                    [reg (map findGene (remove-set-ln (regulates goterm)))]
                    [pos-reg (map findGene (remove-set-ln (positive-regulates goterm)))]
                    [neg-reg (map findGene (remove-set-ln (negativelty-regulates goterm)))]
    
                    [reg-nodes (map create-gene-node (remove-set-ln reg))]
                    [pos-reg-nodes (map create-gene-node (remove-set-ln pos-reg))]
                    [neg-reg-nodes (map create-gene-node (remove-set-ln neg-reg))]
                    [main-node (create-go-node goterm #t)]
                    [nodes (append (list main-node) reg-nodes pos-reg-nodes neg-reg-nodes)]
    
                    [edges '()]
                    [graph '()]
                )
                (set! edges (append (create-eval-ln "regulates" main-node reg-nodes "reg") edges))
                (set! edges (append (create-eval-ln "pos_regulates" main-node pos-reg-nodes "pos_reg") edges))
                (set! edges (append (create-eval-ln "neg_regulates" main-node reg-nodes "neg_reg") edges))
    
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text (string-append "I didn't find any genes that regulate " (find-GO-name goterm)))
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text (string-append "The following genes regulate " (find-GO-name goterm)))
                        (set! ghost-result (make-result text graph))
                    )
                ))
                (let ()
                    (set! text (string-append "I didn't find any term named " (cog-name x)))
                    (set! ghost-result (make-result text '()))
                )
                
            )
            
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)
    
            (WordNode "Success")
        )
)

(define-public (is-regulate x y)
       (let*
          (
            [genex (GeneNode (car (get-params x)))]
            [geney (GeneNode (car (get-params y)))]
            [gox (find-GO x)]
            [goy (find-GO y)]
            [regy (remove-set-ln (regulates goy))]
            [pos-regy (remove-set-ln (positive-regulates goy))]
            [neg-regy (remove-set-ln (negativelty-regulates goy))]
            [text '()]
            [str-port (open-output-string)]

          )
          (set! regy (member gox regy))
          (set! pos-regy (member gox pos-regy))
          (set! neg-regy (member gox neg-regy))
          (cond (pos-regy 
            (let ()
                (set! text (string-append (cog-name genex) " regulates " (cog-name geney) " positively"))
                (set! ghost-result (make-result text '()))))
            (neg-regy (let ()
                (set! text (string-append (cog-name genex) " regulates " (cog-name geney) " negatively"))
                (set! ghost-result (make-result text '()))))
            
            (else (let ()
                (set! text (string-append (cog-name genex) " does NOT regulate " (cog-name geney)))
                (set! ghost-result (make-result text '())))))
        
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)

            (WordNode "Success")
            
    )
)  

(define-public (is-GO-regulate x y)
       (let*
          (
            [gox (find-GO x)]
            [goy (find-GO y)]
            [text '()]
            [str-port (open-output-string)]
          )
          (if (and gox goy)
             (let* (
                [regy (remove-set-ln (regulates goy))]
                [pos-regy (remove-set-ln (positive-regulates goy))]
                [neg-regy (remove-set-ln (negativelty-regulates goy))]
             )
                (set! regy (member gox regy))
                (set! pos-regy (member gox pos-regy))
                (set! neg-regy (member gox neg-regy))
                (cond (pos-regy 
                (let ()
                    (set! text (string-append (cog-name gox) " regulates " (cog-name goy) " positively"))
                    (set! ghost-result (make-result text '()))))
                (neg-regy (let ()
                    (set! text (string-append (cog-name gox) " regulates " (cog-name goy) " negatively"))
                    (set! ghost-result (make-result text '()))))
                
                (else (let ()
                    (set! text (string-append (cog-name gox) " does NOT regulate " (cog-name goy)))
                    (set! ghost-result (make-result text '())))))  
            )
            (let ()
            (cond [(not gox) (set! ghost-result (make-result (string-append "Can't find any term named " (cog-name x)) '()))] 
                  [(not goy) (set! ghost-result (make-result (string-append "Can't find any term named " (cog-name y)) '()))]
                
            ))
          
          )
               
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)

            (WordNode "Success")

    )
)

(define-public (find-positive-regulates x)
    (let*
        (
            [go (find-GO x)]
            [str-port (open-output-string)]
            [text '()]
        )
        (if go 
            (let* (
                [pos-reg (remove-set-ln (positive-regulates go))]
            )
                (if (null? pos-reg)
                (let ()
                    (set! text (string-append "No term positively regulates " (find-GO-name go)))
                    (set! ghost-result (make-result text '()))
                )
                
                (let* (
                    [pos-reg-nodes (map create-go-node pos-reg)]
                    [main-node (create-go-node go #t)]
                    [nodes (append (list main-node) pos-reg-nodes)]
                    [edges '()]
                    [graph '()]
                )
                    (set! edges (append (create-eval-ln "pos_regulates" main-node pos-reg-nodes "pos_reg") edges))

                    (set! graph (make-graph (append nodes edges)))
                    (set! text (string-append "These terms positively regulate " (find-GO-name go)))
                    (set! ghost-result (make-result text graph))
                    
                    
                    )
                ) 
            )
            (let () 
                (set! text (string-append "I couldn't find any term named " (multi-word x)))
                (set! ghost-result (make-result text '()))
            )
            )
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
)
)

(define-public (find-neg-regulates x)
    (let*
        (
            [go (find-GO x)]
            [str-port (open-output-string)]
            [text '()]
        )
        (if go 
            (let* (
                [neg-reg (remove-set-ln (negativelty-regulates go))]
            )
            (if (null? neg-reg)
            (let ()
                (set! text (string-append "No term positively regulates " (find-GO-name go)))
                (set! ghost-result (make-result text '()))
            )
            (let* (
                [neg-reg-nodes (map create-go-node neg-reg)]
                [main-node (create-go-node go #t)]
                [nodes (append (list main-node) neg-reg-nodes)]
                [edges '()]
                [graph '()]
            )
                (set! edges (append (create-eval-ln "neg_regulates" main-node neg-reg-nodes "neg_reg") edges))

                (set! graph (make-graph nodes edges))
                (set! text (string-append "These terms negatively regulate " (find-GO-name go)))
                (set! ghost-result (make-result text graph))
                
            )
        ))
        (let () 
            (set! text (string-append "I couldn't find any term named " (multi-word x)))
            (set! ghost-result (make-result text '()))
        )
    )
        
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
    )   

)

(define-public (find-GO-rel rel x)
    (let
        (
            
            [go (find-GO x)]
            [text '()]
            [str-port (open-output-string)]           
        )
        (if go 
            (let* (
                [relType (multi-word rel)]
                [rs-nodes (map create-go-node (findGORel relType go))]
                [main-node (create-go-node go #t)]
                [nodes (append (list main-node) rs-nodes)]
                [edges '()]
                [graph '()]
            ) 
                (set! edges (create-eval-ln relType main-node rs-nodes "none"))
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text "I didn't find anything..")
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text "Displaying the results I have found..")
                        (set! ghost-result (make-result text graph))
                    )
                ))
            (let () 
                (set! text (string-append "I couldn't find any term named " (multi-word x)))
                (set! ghost-result (make-result text '()))
            )    
            
            )
           
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)
        
        (WordNode "Success")
        )

)



(define-public (find-ancestor x)
        (let
            (
                [go (find-GO x)]         
                [text '()]
                [str-port (open-output-string)]
            )
            (if go 
                (let* (
                    [comp (build-hierarchy go (make-graph '() '()))]
                    [graph '()])

                    (set! graph comp)
                    (if (= (length (graph-edges graph)) 0)
                    (let ()
                        (set! text "I didn't find anything..")
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text "Displaying the results I have found..")
                        (set! ghost-result (make-result text graph))
                    )  
                    )
                
                )
                (let () 
                    (set! text (string-append "I couldn't find any term named " (multi-word x)))
                    (set! ghost-result (make-result text '()))
                )
                
           
            )
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)
            
            (WordNode "Success")
        )

)

(define-public (find-descendant x)
    (let
            (
                [go (find-GO x)]
                [text '()]
                [str-port (open-output-string)]

            )
            (if go
                (let* (
                    [child-nodes (map create-go-node (findChildren go))]
                    [main-node (create-go-node go #t)]
                    [nodes (append (list main-node) child-nodes)]
                    [edges '()]
                    [graph '()]
                )
                (set! edges (create-is-ln-rev main-node child-nodes) )  
                    (set! graph (make-graph nodes edges))
                    (if (= (length edges) 0)
                        (let ()
                            (set! text "I didn't find anything..")
                            (set! ghost-result (make-result text '()))
                        )
                        (let ()
                            (set! text "Displaying the results I have found..")
                            (set! ghost-result (make-result text graph))
                        )
                    )
                )
                (let () 
                    (set! text (string-append "I couldn't find any term named " (multi-word x)))
                    (set! ghost-result (make-result text '()))
                )
            )
            
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)
            
            (WordNode "Success")
        )                       

)


(define-public (find-cellular-comp x)
     (let
        (
            [go (find-GO x)]
            [text '()]
            [str-port (open-output-string)]
        )
        (if go
            (let* (
                [comp (findCellComp go)]
                [comp-node (create-go-node comp)]
                [main-node (create-go-node go #t)]
                [nodes (list main-node comp-node)]
                [edges '()]
                [graph '()]
            )
                (set! edges (append (create-eval-ln "occurs_in" main-node (list comp-node) "occurs_in") edges))
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text "I didn't find anything..")
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text "I have found the following results")
                        (set! ghost-result (make-result text graph))
                    )
                )
            )
            (let () 
                (set! text (string-append "I couldn't find any term named " (multi-word x)))
                (set! ghost-result (make-result text '()))
            )
        ) 
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
))

(define-public (find-bio-process x)
    (let
        (
            [go (find-GO x)]
           
            [text '()]
            [str-port (open-output-string)]
        )
        (if go
            (let* (
                [rs-nodes (map create-go-node   (findBioProcess go))]
                [main-node (create-go-node go #t)]
                [nodes (append (list main-node) rs-nodes)]
                [edges '()]
                [graph '()]
            )
                (set! edges (append (create-eval-ln "occurs_in" main-node rs-nodes "occurs_in") edges))
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text (string-append "There are no terms in biological namespace connected to " (find-GO-name go)))
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text "I have found the following GO terms")
                        (set! ghost-result (make-result text graph))
                    )
                )
            )
            (let () 
                (set! text (string-append "I couldn't find any term named " (multi-word x)))
                (set! ghost-result (make-result text '()))
            )
        
        )
        
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
    )

)

(define-public (find-mol-func x)
    (let
        (
            [go (find-GO x)]
            [text '()]
            [str-port (open-output-string)]
        )
        (if go
            (let* (
                [rs-nodes (map create-go-node (findMolFunc go))]
                [main-node (create-go-node go #t)]
                [nodes (append (list main-node) rs-nodes)]
                [edges '()]
                [graph '()]
            )
                (set! edges (append (create-eval-ln "function" main-node rs-nodes "func") edges))
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text (string-append "I didn't find any molecular function of " (find-GO-name go)))
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text "Displaying the results..")
                        (set! ghost-result (make-result text graph))
                    )
                )
            )

            (let () (set! text (string-append "I couldn't find any term named " (multi-word x)))
                    (set! ghost-result (make-result text '()))
            )
        
        )
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
    )

)

(define-public (find-sub-process x)
    (let
        (
            [go (find-GO x)]
            [text '()]
            [str-port (open-output-string)]

        )
        (if go
            (let* (
                [sub-proc-nodes (map create-go-node (findSubProc go))]
                [main-node (create-go-node go #t)]
                [nodes (append (list main-node) sub-proc-nodes)]
                [edges '()]
                [graph '()]
            )
                (set! edges (append (create-eval-ln "sub_process" main-node sub-proc-nodes "isln") edges))
                (set! graph (make-graph nodes edges))
                (if (= (length edges) 0)
                    (let ()
                        (set! text "I didn't find anything..")
                        (set! ghost-result (make-result text '()))
                    )
                    (let ()
                        (set! text "Displaying the results..")
                        (set! ghost-result (make-result text graph))
                    )
                )
            )
            (let () (set! text (string-append "I couldn't find any term named " (multi-word x)))
                    (set! ghost-result (make-result text '()))
            )
        
        )
        
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
        
        )

)

(define-public (find-is-rel x y)
    (let*
        (
            [gox (find-GO  x)]
            [goy (find-GO y)]
            [text '()]
            [str-port (open-output-string)]
        )
        (if (and gox goy)
          (let* ( 
            [ls '()]
            )
            (set! ls (remove-set-ln (cog-execute! 
                (GetLink
                    (VariableNode "$a")
                    (InheritanceLink
                        (VariableNode "$a")
                        goy
                    )
                ))))
            (set! ghost-result (find (lambda (x) (equal? x gox )) ls))              
            (if ghost-result   
                (set! text  (string-append "Yes, " (find-GO-name gox) " is a " (find-GO-name goy)))
                (set! text  (string-append "No, " (find-GO-name gox) " is NOT " (find-GO-name goy)))
            )
        )
        (let ()
            (cond [(not gox) (set! text (string-append "Can't find any term named " (cog-name x)))] 
                  [(not goy) (set! text (string-append "Can't find any term named " (cog-name y)))]
                
        ))
    )
        (set! ghost-result (make-result text '()))
        (scm->json ghost-result str-port)
        (set! ghost-result (get-output-string str-port))
        (close-port str-port)

        (WordNode "Success")
    )
)


(define-public (find-gene-function x)
    (let* (
            (gene (GeneNode (multi-word x)))
            (go (remove-set-ln (findGeneFunc gene)))
            (go-nodes (map create-go-node go))
            (main-node (create-gene-node gene #t))
            (nodes (append (list main-node) go-nodes))
            (edges '())
            (graph '())
            (text '())
            (str-port (open-output-string))           
            )
            (set! edges (create-eval-ln "function" main-node go-nodes "func"))
            (set! graph (make-graph nodes edges))
            (if (= (length edges) 0)
                (let ()
                    (set! text (string-append "I didn't find any molecular function of " (cog-name go)))
                    (set! ghost-result (make-result text '()))
                )
                (let ()
                    (set! text "Displaying the results..")
                    (set! ghost-result (make-result text graph))
                )
            )
            (scm->json ghost-result str-port)
            (set! ghost-result (get-output-string str-port))
            (close-port str-port)

            (WordNode "Success")              
    )
)