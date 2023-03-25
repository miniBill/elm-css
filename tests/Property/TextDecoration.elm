module Property.TextDecoration exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 textDecorationLine
            { functionName = "textDecorationLine", propertyName = "text-decoration-line" }
            (   [ ( none, "none" )
                , ( underline, "underline" )
                , ( overline, "overline" )
                , ( lineThrough, "line-through" )
                ]
            )
        , CssTest.property 
            { functionName = "textDecorationLine2", propertyName = "text-decoration-line" }
            (   [ ( textDecorationLine2 overline underline, "overline underline" )
                , ( textDecorationLine2 lineThrough overline, "line-through overline" )
                , ( textDecorationLine2 underline lineThrough, "underline line-through" )
                ]
            )
        , CssTest.property 
            { functionName = "textDecorationLine3", propertyName = "text-decoration-line" }
            (   [ ( Css.textDecorationLine3 underline overline lineThrough, "underline overline line-through" )
                ]
            )
        , CssTest.property1 textDecorationStyle
            { functionName = "textDecorationStyle", propertyName = "text-decoration-style" }
            (   [ ( solid, "solid" )
                , ( double, "double" )
                , ( dotted, "dotted" )
                , ( dashed, "dashed" )
                , ( wavy, "wavy" )
                ]
            )
        , CssTest.property1 textDecorationColor
            { functionName = "textDecorationColor", propertyName = "text-decoration-color" }
            CssTest.color

        , CssTest.property1 textDecorationThickness
            { functionName = "textDecorationThickness", propertyName = "text-decoration-thickness" }
            (   [ ( auto, "auto" )
                , ( fromFont, "from-font" )
                , ( pct 10, "10%" )
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 textDecorationSkipInk
            { functionName = "textDecorationSkipInk", propertyName = "text-decoration-skip-ink" }
            [ ( auto, "auto" )
            , ( all_, "all" )
            , ( none, "none" )
            ]
        ]
