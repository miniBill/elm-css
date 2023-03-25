module Property.Margin exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 margin
            { functionName = "margin", propertyName = "margin" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "margin2", propertyName = "margin" }
            (   [ ( margin2 (pct 30) (pct 42), "30% 42%")
                , ( margin2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 margin2
            )


        , CssTest.property
            { functionName = "margin3", propertyName = "margin" }
            (   [ ( margin3 (pct 30) (pct 42) (pct 1), "30% 42% 1%")
                , ( margin3 auto auto auto, "auto auto auto" )
                ]
                ++ CssTest.length3 margin3
            )
            
        
        , CssTest.property
            { functionName = "margin4", propertyName = "margin" }
            (   [ ( margin4 (pct 99) (pct 30) (pct 42) (pct 1), "99% 30% 42% 1%" )
                , ( margin4 auto auto auto auto, "auto auto auto auto" )
                ]
                ++ CssTest.length4 margin4
            )
            

        , CssTest.property1 marginTop
            { functionName = "marginTop", propertyName = "margin-top" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginRight
            { functionName = "marginRight", propertyName = "margin-right" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginBottom
            { functionName = "marginBottom", propertyName = "margin-bottom" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginLeft
            { functionName = "marginLeft", propertyName = "margin-left" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginBlock
            { functionName = "marginBlock", propertyName = "margin-block" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "marginBlock2", propertyName = "margin-block" }
            (   [ ( marginBlock2 (pct 30) (pct 42), "30% 42%")
                , ( marginBlock2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 marginBlock2
            )
        
        , CssTest.property1 marginBlockStart
            { functionName = "marginBlockStart", propertyName = "margin-block-start" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginBlockEnd
            { functionName = "marginBlockEnd", propertyName = "margin-block-end" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginInline
            { functionName = "marginInline", propertyName = "margin-inline" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "marginInline2", propertyName = "margin-inline" }
            (   [ ( marginInline2 (pct 30) (pct 42), "30% 42%")
                , ( marginInline2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 marginInline2
            )
        
        , CssTest.property1 marginInlineStart
            { functionName = "marginInlineStart", propertyName = "margin-inline-start" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 marginInlineEnd
            { functionName = "marginInlineEnd", propertyName = "margin-inline-end" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        ]
