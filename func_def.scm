(DefineLink
    (DefinedSchemaNode "findAboutGene")
    (LambdaLink
        (VariableNode "$X")
    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:findAboutGene")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "findRelationships")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:findRelationships")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)


(DefineLink
    (DefinedSchemaNode "GOname")
    (LambdaLink
    (VariableNode "$X")
    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:GOname")
        (ListLink
            (VariableNode "$X") 
        )
        )
)

(DefineLink
    (DefinedSchemaNode "find-genes")
    (LambdaLink
    (VariableNode "$X")
    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-genes")
        (ListLink
            (VariableNode "$X") 
        )
        )
))

(DefineLink
    (DefinedSchemaNode "find-gene-in")
    (LambdaLink
    (VariableNode "$X")
    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-gene-in")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "common-genes")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:common-genes")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)


(DefineLink 
    (DefinedSchemaNode "common-categories")
    (LambdaLink 
        (VariableList
            (VariableNode "$geneNodeNameA")
            (VariableNode "$geneNodeNameB")
        )
        (ExecutionOutputLink
            (GroundedSchemaNode "scm:common-categories")
            (ListLink
                (VariableNode "$geneNodeNameA")
                (VariableNode "$geneNodeNameB")
            )
        )
    )
)

(DefineLink
    (DefinedSchemaNode "findGONS")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:findGONS")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "findAboutGO")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:findAboutGO")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "findAboutGO")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:findAboutGO")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-regulates")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-regulates")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "gene-regulate")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:gene-regulate")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "is-regulate")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:is-regulate")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "is-GO-regulate")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:is-GO-regulate")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-about-GO")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-about-GO")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-synonym")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-synonym")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-GO-rel")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-GO-rel")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-ancestor")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-ancestor")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-descendant")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-descendant")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-cellular-comp")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-cellular-comp")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-bio-process")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-bio-process")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)


(DefineLink
    (DefinedSchemaNode "find-relationship")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-relationship")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-sub-process")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-sub-process")
        (ListLink
            (VariableNode "$X") 
        )
        )
)
)

(DefineLink
    (DefinedSchemaNode "find-is-rel")
    (LambdaLink
    (VariableList
        (VariableNode "$X")
        (VariableNode "$Y") 
    )    
    (ExecutionOutputLink
        (GroundedSchemaNode "scm:find-is-rel")
        (ListLink
            (VariableNode "$X") 
            (VariableNode "$Y")
        )
        )
)
)
