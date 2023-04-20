module Specific.Property.Outline exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 outline
            { functionName = "outline", propertyName = "outline" }
            (( auto, "auto" )
                :: CssTest.length
                ++ CssTest.color
                ++ CssTest.lineStyleWithoutHidden
            )
        , CssTest.property { functionName = "outline3", propertyName = "outline" }
            (   ( outline3 (ch 2.3) auto (hsla 10 0.2 0.3 0.95), "2.3ch auto hsla(10,20%,30%,0.95)" )
                :: CssTest.lineWidthStyleAndColorWithoutHidden outline3
            )
        , CssTest.property1 outlineWidth
            { functionName = "outlineWidth", propertyName = "outline-width" }
            CssTest.lineWidth
        , CssTest.property1 outlineColor
            { functionName = "outlineColor", propertyName = "outline-color" }
            (( invert_, "invert" ) :: CssTest.color)
        , CssTest.property1 outlineStyle
            { functionName = "outlineStyle", propertyName = "outline-style" }
            (( auto, "auto" ) :: CssTest.lineStyleWithoutHidden)
        , CssTest.property1 outlineOffset
            { functionName = "outlineOffset", propertyName = "outline-offset" }
            CssTest.length
        ]
