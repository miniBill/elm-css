module Specific.Property.Inset exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 inset
            { functionName = "inset", propertyName = "inset" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "inset2", propertyName = "inset" }
            (   [ ( inset2 (pct 30) (pct 42), "30% 42%")
                , ( inset2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 inset2
            )


        , CssTest.property
            { functionName = "inset3", propertyName = "inset" }
            (   [ ( inset3 (pct 30) (pct 42) (pct 1), "30% 42% 1%")
                , ( inset3 auto auto auto, "auto auto auto" )
                ]
                ++ CssTest.length3 inset3
            )
            
        
        , CssTest.property
            { functionName = "inset4", propertyName = "inset" }
            (   [ ( inset4 (pct 99) (pct 30) (pct 42) (pct 1), "99% 30% 42% 1%" )
                , ( inset4 auto auto auto auto, "auto auto auto auto" )
                ]
                ++ CssTest.length4 inset4
            )
            

        , CssTest.property1 top
            { functionName = "top", propertyName = "top" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 right
            { functionName = "right", propertyName = "right" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 bottom
            { functionName = "bottom", propertyName = "bottom" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 left
            { functionName = "left", propertyName = "left" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 insetBlock
            { functionName = "insetBlock", propertyName = "inset-block" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "insetBlock2", propertyName = "inset-block" }
            (   [ ( insetBlock2 (pct 30) (pct 42), "30% 42%")
                , ( insetBlock2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 insetBlock2
            )
        
        , CssTest.property1 insetBlockStart
            { functionName = "insetBlockStart", propertyName = "inset-block-start" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 insetBlockEnd
            { functionName = "insetBlockEnd", propertyName = "inset-block-end" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 insetInline
            { functionName = "insetInline", propertyName = "inset-inline" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "insetInline2", propertyName = "inset-inline" }
            (   [ ( insetInline2 (pct 30) (pct 42), "30% 42%")
                , ( insetInline2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 insetInline2
            )
        
        , CssTest.property1 insetInlineStart
            { functionName = "insetInlineStart", propertyName = "inset-inline-start" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 insetInlineEnd
            { functionName = "insetInlineEnd", propertyName = "inset-inline-end" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        ]
