module Specific.Property.Script exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 direction
            { functionName = "direction", propertyName = "direction" }
            [ ( ltr, "ltr" )
            , ( rtl, "rtl" )
            ]
        , CssTest.property1 writingMode
            { functionName = "writingMode", propertyName = "writing-mode" }
            [ ( horizontalTb, "horizontal-tb" )
            , ( verticalRl, "vertical-rl" )
            , ( verticalLr, "vertical-lr" )
            ]
        , CssTest.property1 unicodeBidi
            { functionName = "unicodeBidi", propertyName = "unicode-bidi" }
            [ ( normal, "normal" )
            , ( embed, "embed" )
            , ( isolate, "isolate" )
            , ( bidiOverride, "bidi-override" )
            , ( isolateOverride, "isolate-override" )
            , ( plaintext, "plaintext" )
            ]
        , CssTest.property1 textOrientation
            { functionName = "textOrientation", propertyName = "text-orientation" }
            [ ( mixed, "mixed" )
            , ( upright, "upright" )
            , ( sidewaysRight, "sideways-right" )
            , ( sideways, "sideways" )
            , ( useGlyphOrientation, "use-glyph-orientation" )
            ]
        
        , CssTest.property1 quotes
            { functionName = "quotes", propertyName = "quotes" }
            [ ( none, "none" )
            , ( auto, "auto" )
            ]
        
        , CssTest.property
            { functionName = "quotes2", propertyName = "quotes" }
            [ ( quotes2 (string "<") (string ">"), "\"<\" \">\"" )
            ]
        
        , CssTest.property
            { functionName = "quotes4", propertyName = "quotes" }
            [ ( quotes4 (string "«") (string "»") (string "👏") (string "🤔"), "\"«\" \"»\" \"👏\" \"🤔\"" )
            ]
        ]
