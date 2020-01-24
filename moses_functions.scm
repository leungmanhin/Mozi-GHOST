(define-public (find-dataset-result x)
    (let* ((dataset (multi-word x)))
        (cog-execute!
            (GetLink
                (VariableNode "$x")
                (EquivalenceLink
                    (ConceptNode data)
                    (VariableNode "$x")
                )
            )
        )
    )
)


(define-public (find-project-result x)
    (let* ((project (multi-word x)))
        (cog-execute!
            (GetLink
                (VariableNode "$x")
                (VariableNode "$d")
                (AndLink
                    (Inheritance
                        (VariableNode "$d")
                        (ConceptNode project)
                    )
                    (EquivalenceLink
                        (ConceptNode data)
                        (VariableNode "$d")
                    )
                )
            )
        )
    )
)
