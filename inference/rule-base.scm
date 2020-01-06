
;; Load the rules (use load for relative path w.r.t. to that file)
(load "./meta-rules/conditional-instantiation-meta-rule.scm")
(load "./rules/fuzzy-conjunction-introduction-rule.scm")

(define go-rbs (ConceptNode "go-rbs"))
(Inheritance go-rbs (ConceptNode "URE"))

;; Associate the rules to the rule base (with weights, their semantics
;; is currently undefined, we might settled with probabilities but it's
;; not sure)
(MemberLink (stv 1 1)
conditional-full-instantiation-meta-rule-name
go-rbs
)
(MemberLink (stv 1 1)
fuzzy-conjunction-introduction-2ary-rule-name
go-rbs
)

(ExecutionLink
    (SchemaNode "URE:maximum-iterations")
    go-rbs
    (NumberNode "20")
    
    )

;; Attention allocation (set the TV strength to 0 to disable it, 1 to
;; enable it)
(EvaluationLink (stv 0 1)
    (PredicateNode "URE:attention-allocation")
    go-rbs
)