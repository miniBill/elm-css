module Specific.Property.TypeDecoration exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property1 textDecoration
            { functionName = "textDecoration", propertyName = "text-decoration" }
            ([ ( none, "none" )
             , ( underline, "underline" )
             , ( overline, "overline" )
             , ( lineThrough, "line-through" )
             , ( solid, "solid" )
             , ( double, "double" )
             , ( dotted, "dotted" )
             , ( dashed, "dashed" )
             , ( wavy, "wavy" )
             ]
                ++ CssTest.color
            )

        , CssTest.property { functionName = "textDecoration2", propertyName = "text-decoration" }
            [ ( textDecoration2 none solid, "none solid" )
            , ( textDecoration2 underline double, "underline double" )
            , ( textDecoration2 underline dotted, "underline dotted" )
            , ( textDecoration2 lineThrough dashed, "line-through dashed" )
            , ( textDecoration2 overline wavy, "overline wavy" )
            ]

        , CssTest.property { functionName = "textDecoration3", propertyName = "text-decoration" }
            [ ( textDecoration3 none solid (rgb 11 22 33), "none solid rgb(11,22,33)" )
            , ( textDecoration3 underline double (hex "3c84"), "underline double #3c84" )
            , ( textDecoration3 underline dotted (hsl 23 0.5 0.2), "underline dotted hsl(23,50%,20%)" )
            , ( textDecoration3 lineThrough dashed (hsla 11 0.22 0.33 0.44), "line-through dashed hsla(11,22%,33%,0.44)" )
            , ( textDecoration3 overline wavy (rgba 11 22 33 0.44), "overline wavy rgba(11,22,33,0.44)" )
            , ( textDecoration3 underline dotted currentcolor, "underline dotted currentcolor" )
            ]

        , CssTest.property1 textDecorationLine
            { functionName = "textDecorationLine", propertyName = "text-decoration-line" }
            [ ( none, "none" )
            , ( underline, "underline" )
            , ( overline, "overline" )
            , ( lineThrough, "line-through" )
            ]
            
        , CssTest.property { functionName = "textDecorationLine2", propertyName = "text-decoration-line" }
            [ ( textDecorationLine2 underline overline, "underline overline" )
            , ( textDecorationLine2 lineThrough underline, "line-through underline" )
            , ( textDecorationLine2 overline lineThrough, "overline line-through" )
            ]

        , CssTest.property { functionName = "textDecorationLine3", propertyName = "text-decoration-line" }
            [ ( textDecorationLine3 underline overline lineThrough, "underline overline line-through" ) ]
        
        , CssTest.property1 textDecorationStyle
            { functionName = "textDecorationStyle", propertyName = "text-decoration-style" }
            [ ( solid, "solid" )
            , ( double, "double" )
            , ( dotted, "dotted" )
            , ( dashed, "dashed" )
            , ( wavy, "wavy" )
            ]
        , CssTest.property1 textDecorationColor
            { functionName = "textDecorationColor", propertyName = "text-decoration-color" }
            CssTest.color

        , CssTest.property1 textUnderlinePosition
            { functionName = "textUnderlinePosition", propertyName = "text-underline-position" }
            [ ( auto, "auto" )
            , ( under, "under" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]

        , CssTest.property { functionName = "textUnderlinePosition2", propertyName = "text-underline-position" }
            [ ( textUnderlinePosition2 under left_, "under left" )
            , ( textUnderlinePosition2 under right_, "under right" )
            ]
            
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

        , CssTest.property1 textTransform
            { functionName = "textTransform", propertyName = "text-transform" }
            [ ( capitalize, "capitalize" )
            , ( uppercase, "uppercase" )
            , ( lowercase, "lowercase" )
            , ( none, "none" )
            , ( fullWidth, "full-width" )
            , ( fullSizeKana, "full-size-kana" )
            ]
        ]
