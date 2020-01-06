
(define go-rbs (ConceptNode "go-rbs"))
(Inheritance go-rbs (ConceptNode "URE"))

(Execution
    (SchemaNode "URE:maximum-iterations")
    go-rbs
    (Number 20)
    
    )

;; Attention allocation (set the TV strength to 0 to disable it, 1 to
;; enable it)
(EvaluationLink (stv 0 1)
    (PredicateNode "URE:attention-allocation")
    go-rbs
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reasoning over is_a relationship;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;If A is B and B is C, then A is C
(define if-a-is-b-and-b-is-c-then-a-is-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )

        (And
            (Inheritance
                (Variable "$a")
                (Variable "$b")
                )
            (Inheritance
                (Variable "$b")
                (Variable "$c")
                )
            )
        (Inheritance
            (Variable "$a")
            (Variable "$c")      
            )
    )
    
)

(define if-a-is-b-and-b-is-c-then-a-is-c-rule-name
    (DefinedSchema "if-a-is-b-and-b-is-c-then-a-is-c-rule-name")
    )

(Define
    if-a-is-b-and-b-is-c-then-a-is-c-rule-name
    if-a-is-b-and-b-is-c-then-a-is-c
    )

(Member (stv 0.9 1)
    if-a-is-b-and-b-is-c-then-a-is-c-rule-name
    if-a-is-b-and-b-is-c-then-a-is-c 
    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reasoning over part_of relationship;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;If A is part_of B and B is part_of C, then A is part_of C
(define if-a-part-b-and-b-part-c-then-a-part-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            ) 
        (And
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                )
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                )
            )
        (Evaluation
            (Predicate "GO_part_of")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            )

    )
)

(define if-a-part-b-and-b-part-c-then-a-part-c-rule-name
    (DefinedSchema
        "if-a-part-b-and-b-part-c-then-a-part-c"
        )
    )

(Define
    if-a-part-b-and-b-part-c-then-a-part-c-rule-name
    if-a-part-b-and-b-part-c-then-a-part-c
    )

(Member (stv 0.9 1)
    if-a-part-b-and-b-part-c-then-a-part-c-rule-name
    go-rbs
)

;;If A is part_of B and B is C, then A is part_of C
(define if-a-part-b-and-b-is-c-then-a-part-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
        (And
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                )
            (Inheritance
                (Variable "$b")
                (Variable "$c")
                )
            
            )
        (Evaluation
            (Predicate "GO_part_of")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            )
        
        )
    
)

(define if-a-part-b-and-b-is-c-then-a-part-c-rule-name
    (DefinedSchema
        "if-a-part-b-and-b-is-c-then-a-part-c"
        )
    )

(Define
    if-a-part-b-and-b-is-c-then-a-part-c-rule-name
    if-a-part-b-and-b-is-c-then-a-part-c
    )

(Member (stv 0.9 1)
    if-a-part-b-and-b-is-c-then-a-part-c-rule-name
    go-rbs
)

;;If A is B and B is part_of C, then A is part_of C
(define if-a-is-b-and-b-part-c-then-a-part-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
        (And
            (Inheritance
                (Variable "$a")
                (Variable "$b")
                )
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                )
            
            )
        (Evaluation
            (Predicate "GO_part_of")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
            )      
        )
    
    )
  
(define if-a-is-b-and-b-part-c-then-a-part-c-rule-name
    (DefinedSchema
        "if-a-is-b-and-b-part-c-then-a-part-c"
        )
    )
(Define
    if-a-is-b-and-b-part-c-then-a-part-c-rule-name
    if-a-is-b-and-b-part-c-then-a-part-c
    )

(Member (stv 0.9 1)
    if-a-is-b-and-b-part-c-then-a-part-c-rule-name
    go-rbs
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reasoning over has_part relationship;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;If A has_part B and B has_part C, then A has_part C
(define if-a-has-part-b-and-b-has-part-c-then-a-has-part-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_has_part")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                )
            
            (Evaluation
                (Predicate "GO_has_part")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                
                )
            
            )
    
        (Evaluation
            (Predicate "GO_has_part")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
            )
        )
    
    )

(define if-a-has-part-b-and-b-has-part-c-then-a-has-part-c-rule-name
    (DefinedSchema
        "if-a-has-part-b-and-b-has-part-c-then-a-has-part-c"
        )
    )

(Define
    if-a-has-part-b-and-b-has-part-c-then-a-has-part-c-rule-name
    if-a-has-part-b-and-b-has-part-c-then-a-has-part-c
    )

(Member (stv 0.9 1)
    if-a-has-part-b-and-b-has-part-c-then-a-has-part-c-rule-name
    go-rbs
)

;;If A has part B, and B is a C, then A has part C.
(define if-a-has-part-b-and-b-is-c-then-a-has-part-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_has_part")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                )
            (Inheritance
                (Variable "$b")
                (Variable "$c")
                )
            
            )
        (Evaluation
            (Predicate "GO_has_part")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
            )
        
        )
    
)

(define if-a-has-part-b-and-b-is-c-then-a-has-part-c-rule-name
    (DefinedSchema
        "if-a-has-part-b-and-b-is-c-then-a-has-part-c"
        )
    )

(Define
    if-a-has-part-b-and-b-is-c-then-a-has-part-c-rule-name
    if-a-has-part-b-and-b-is-c-then-a-has-part-c
)

(Member (stv 0.9 1)
    if-a-has-part-b-and-b-is-c-then-a-has-part-c
    go-rbs

)

;;If A is a B, and B has part C,then A has part C.
(define if-a-is-b-and-b-has-part-c-then-a-has-part-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Inheritance
                (Variable "$a")
                (Variable "$b")
                )
            (Evaluation
                (Predicate "GO_has_part")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                )
            
            )
    
        (Evaluation
            (Predicate "GO_has_part")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
            )
        
        )
    
    )

(define if-a-is-b-and-b-has-part-c-then-a-has-part-c-rule-name
    (DefinedSchema
        "if-a-is-b-and-b-has-part-c-then-a-has-part-c"
        )
    )

(Define
    if-a-is-b-and-b-has-part-c-then-a-has-part-c-rule-name
    if-a-is-b-and-b-has-part-c-then-a-has-part-c
    )

(Member (stv 0.9 1)
    if-a-is-b-and-b-has-part-c-then-a-has-part-c-rule-name
    go-rbs
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Reasoning over regulates relationship  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;If A is B and B regulates C, then A regulates C
(define if-a-is-b-and-b-regulates-c-then-a-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Inheritance
                (Variable "$a")
                (Variable "$b")
                )
            (Evaluation
                (Predicate "GO_regulates")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                )
            )
    
        (Evaluation
            (Predicate "GO_regualtes")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            )
        
        
        )
    
    )


(define if-a-is-b-and-b-regulates-c-then-a-regulates-c-name 
    (DefinedSchema "if-a-is-b-and-b-regulates-c-then-a-regulates-c"))

(Define
    if-a-is-b-and-b-regulates-c-then-a-regulates-c-name
    if-a-is-b-and-b-regulates-c-then-a-regulates-c
)

(Member (stv 0.9 1)
    if-a-is-b-and-b-regulates-c-then-a-regulates-c-name
    go-rbs
)


(define if-a-is-b-and-b-pos-regulates-c-then-a-pos-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Inheritance
                (Variable "$a")
                (Variable "$b")
                )
            (Evaluation
                (Predicate "GO_positively_regulates")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                )
            )
    
        (Evaluation
            (Predicate "GO_positively_regualtes")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            )
))


(define if-a-is-b-and-b-pos-regulates-c-then-a-pos-regulates-c-name 
    (DefinedSchema "if-a-is-b-and-b-pos-regulates-c-then-a-pos-regulates-c"))

(Define
    if-a-is-b-and-b-pos-regulates-c-then-a-pos-regulates-c-name
    if-a-is-b-and-b-pos-regulates-c-then-a-pos-regulates-c
)

(Member (stv 0.9 1)
    if-a-is-b-and-b-pos-regulates-c-then-a-pos-regulates-c-name
    go-rbs
)


(define if-a-is-b-and-b-neg-regulates-c-then-a-neg-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Inheritance
                (Variable "$a")
                (Variable "$b")
                )
            (Evaluation
                (Predicate "GO_negatively_regulates")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )
                )
            )
    
        (Evaluation
            (Predicate "GO_negatively_regualtes")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            )
    
))




(define if-a-is-b-and-b-neg-regulates-c-then-a-neg-regulates-c-name 
    (DefinedSchema "if-a-is-b-and-b-neg-regulates-c-then-a-neg-regulates-c"))

(Define
    if-a-is-b-and-b-neg-regulates-c-then-a-neg-regulates-c-name
    if-a-is-b-and-b-neg-regulates-c-then-a-neg-regulates-c
)

(Member (stv 0.9 1)
    if-a-is-b-and-b-neg-regulates-c-then-a-neg-regulates-c-name
    go-rbs
)

;;If A regulates B and B is C, then A regulates C
(define if-a-regulates-b-and-b-is-c-then-a-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_regulates")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                
                )
    
            (Inheritance
                (Variable "$b")
                (Variable "$c")
            )       
        )
    
        (Evaluation
            (Predicate "GO_regulates")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
            )       
        )    
)

(define if-a-regulates-b-and-b-is-c-then-a-regulates-c-name
    (DefinedSchema
        "if-a-regulates-b-and-b-is-c-then-a-regulates-c"
        )
    
    )

(Define
    if-a-regulates-b-and-b-is-c-then-a-regulates-c-name
    if-a-regulates-b-and-b-is-c-then-a-regulates-c
    )

(Member (stv 0.9 1)
    if-a-regulates-b-and-b-is-c-then-a-regulates-c
    go-rbs
)

(define if-a-pos-regulates-b-and-b-is-c-then-a-pos-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_positively_regulates")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                
                )
    
            (Inheritance
                (Variable "$b")
                (Variable "$c")
            )       
        )
    
        (Evaluation
            (Predicate "GO_positively_regulates")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
        )   
))

(define if-a-pos-regulates-b-and-b-is-c-then-a-pos-regulates-c-name
    (DefinedSchema
        "if-a-pos-regulates-b-and-b-is-c-then-a-pos-regulates-c"
        )
    
    )

(Define
    if-a-pos-regulates-b-and-b-is-c-then-a-pos-regulates-c-name
    if-a-pos-regulates-b-and-b-is-c-then-a-pos-regulates-c
    )

(Member (stv 0.9 1)
    if-a-pos-regulates-b-and-b-is-c-then-a-pos-regulates-c
    go-rbs
)

(define if-a-neg-regulates-b-and-b-is-c-then-a-neg-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_negatively_regulates")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                
                )
    
            (Inheritance
                (Variable "$b")
                (Variable "$c")
            )       
        )
    
        (Evaluation
            (Predicate "GO_negatively_regulates")
            (List
                (Variable "$a")
                (Variable "$c")
                )
            
            )      
        )    
)

(define if-a-neg-regulates-b-and-b-is-c-then-a-neg-regulates-c-name
    (DefinedSchema
        "if-a-neg-regulates-b-and-b-is-c-then-a-neg-regulates-c"
        )
    
    )

(Define
    if-a-neg-regulates-b-and-b-is-c-then-a-neg-regulates-c-name
    if-a-neg-regulates-b-and-b-is-c-then-a-neg-regulates-c
    )

(Member (stv 0.9 1)
    if-a-neg-regulates-b-and-b-is-c-then-a-neg-regulates-c
    go-rbs
)

;;;;If A regulates B, and B is part of C, then A regulates C
(define if-a-regulates-b-and-b-part-c-then-a-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_regulates")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                
                )
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )            
                )
            )
        (Evaluation
            (Predicate "GO_regulates")
            (List
                (Variable "$a")
                (Variable "$c")
                ) 
            )     
        )    
)

(define if-a-regulates-b-and-b-part-c-then-a-regulates-c-name
    (DefinedSchema
        "if-a-regulates-b-and-b-part-c-then-a-regulates-c"
        )
    
    )

(Define
    if-a-regulates-b-and-b-part-c-then-a-regulates-c-name
    if-a-regulates-b-and-b-part-c-then-a-regulates-c
    )

(Member (stv 0.9 1)
    if-a-regulates-b-and-b-part-c-then-a-regulates-c
    go-rbs
)


(define if-a-pos-regulates-b-and-b-part-c-then-a-pos-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_positively_regulates")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                
                )
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )            
                )
            )
        (Evaluation
            (Predicate "GO_positively_regulates")
            (List
                (Variable "$a")
                (Variable "$c")
                ) 
        )  
))

(define if-a-pos-regulates-b-and-b-part-c-then-a-pos-regulates-c-name
    (DefinedSchema
        "if-a-pos-regulates-b-and-b-part-c-then-a-pos-regulates-c"
        )
    
    )

(Define
    if-a-pos-regulates-b-and-b-part-c-then-a-pos-regulates-c-name
    if-a-pos-regulates-b-and-b-part-c-then-a-pos-regulates-c
    )

(Member (stv 0.9 1)
    if-a-pos-regulates-b-and-b-part-c-then-a-pos-regulates-c
    go-rbs
)


(define if-a-neg-regulates-b-and-b-part-c-then-a-neg-regulates-c
    (BindLink
        (VariableList
            (TypedVariable
                (Variable "$a")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$b")
                (Type "ConceptNode")
                )
            (TypedVariable
                (Variable "$c")
                (Type "ConceptNode")
                )
            )
    
        (And
            (Evaluation
                (Predicate "GO_negatively_regulates")
                (List
                    (Variable "$a")
                    (Variable "$b")
                    )
                
                )
            (Evaluation
                (Predicate "GO_part_of")
                (List
                    (Variable "$b")
                    (Variable "$c")
                    )            
                )
            )
        (Evaluation
            (Predicate "GO_negatively_regulates")
            (List
                (Variable "$a")
                (Variable "$c")
                ) 
            )   
        )    
)

(define if-a-neg-regulates-b-and-b-part-c-then-a-neg-regulates-c-name
    (DefinedSchema
        "if-a-neg-regulates-b-and-b-part-c-then-a-neg-regulates-c"
        )
    
    )

(Define
    if-a-neg-regulates-b-and-b-part-c-then-a-neg-regulates-c-name
    if-a-neg-regulates-b-and-b-part-c-then-a-neg-regulates-c
    )

(Member (stv 0.9 1)
    if-a-neg-regulates-b-and-b-part-c-then-a-neg-regulates-c
    go-rbs
)