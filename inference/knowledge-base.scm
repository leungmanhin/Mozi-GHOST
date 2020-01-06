;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reasoning over is_a relationship;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;If A is B and B is C, then A is C
(ImplicationScope (stv 1.0 1.0)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reasoning over part_of relationship;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;If A is part_of B and B is part_of C, then A is part_of C
(ImplicationScope (stv 1.0 1.0)
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

;;If A is part_of B and B is C, then A is part_of C
(ImplicationScope (stv 1.0 1.0)
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

;;If A is B and B is part_of C, then A is part_of C
(ImplicationScope (stv 1.0 1.0)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reasoning over has_part relationship;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;If A has_part B and B has_part C, then A has_part C
(ImplicationScope (stv 1.0 1.0)
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

;;If A has part B, and B is a C, then A has part C.
(ImplicationScope (stv 1.0 1.0)
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

;;If A is a B, and B has part C,then A has part C.
(ImplicationScope (stv 1.0 1.0)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Reasoning over regulates relationship  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;If A is B and B regulates C, then A regulates C
(ImplicationScope (stv 1.0 1.0)
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

(ImplicationScope (stv 1.0 1.0)
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
)

(ImplicationScope (stv 1.0 1.0)
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
)

;;If A regulates B and B is C, then A regulates C
(ImplicationScope (stv 1.0 1.0)
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

(ImplicationScope (stv 1.0 1.0)
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

)

(ImplicationScope (stv 1.0 1.0)
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

;;If A regulates B, and B is part of C, then A regulates C
(ImplicationScope (stv 1.0 1.0)
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

(ImplicationScope (stv 1.0 1.0)
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
)

(ImplicationScope (stv 1.0 1.0)
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