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
            [ ( outline3 (px 10) none (hsl 120 0.5 0.5), "10px none hsl(120,50%,50%)" )
            , ( outline3 (ch 2.3) auto (hsla 10 0.2 0.3 0.95), "2.3ch auto hsla(10,20%,30%,0.95)" )
            , ( outline3 (cm 3.1) solid (rgb 112 22 75), "3.1cm solid rgb(112,22,75)" )
            , ( outline3 (em 0.2) dotted (rgba 112 22 75 0.1), "0.2em dotted rgba(112,22,75,0.1)" )
            , ( outline3 (ex 10.5) dashed (hex "fadffe"), "10.5ex dashed #fadffe" )
            , ( outline3 (inch 1) solid (hex "eef"), "1in solid #eef" )
            , ( outline3 (mm 2.54) double (hex "#ddfead99"), "2.54mm double #ddfead99" )
            , ( outline3 (pc 8.7) groove (hex "#356265"), "8.7pc groove #356265" )
            , ( outline3 (pt 15.5) ridge (hex "#feda"), "15.5pt ridge #feda" )
            , ( outline3 (q 5) ridge currentcolor, "5Q ridge currentcolor" )
            , ( outline3 (rem 1.1) inset_ (hex "844c"), "1.1rem inset #844c" )
            , ( outline3 (vh 1.2) outset (hex "ef5f7e9f"), "1.2vh outset #ef5f7e9f" )
            , ( outline3 (vw 2.1) solid (rgb 112 22 75), "2.1vw solid rgb(112,22,75)" )
            , ( outline3 (vmax 3.5) solid (rgb 112 22 75), "3.5vmax solid rgb(112,22,75)" )
            , ( outline3 (vmin 4.2) solid (rgb 112 22 75), "4.2vmin solid rgb(112,22,75)" )
            , ( outline3 zero solid (rgb 112 22 75), "0 solid rgb(112,22,75)" )
            , ( outline3 (calc (rem 3.2) (minus (px 5.5))) solid (rgb 112 22 75), "calc(3.2rem - 5.5px) solid rgb(112,22,75)" )
            ]
        , CssTest.property1 outlineWidth
            { functionName = "outlineWidth", propertyName = "outline-width" }
            CssTest.lineWidth
        , CssTest.property1 outlineColor
            { functionName = "outlineColor", propertyName = "outline-color" }
            (( invert, "invert" ) :: CssTest.color)
        , CssTest.property1 outlineStyle
            { functionName = "outlineStyle", propertyName = "outline-style" }
            (( auto, "auto" ) :: CssTest.lineStyleWithoutHidden)
        , CssTest.property1 outlineOffset
            { functionName = "outlineOffset", propertyName = "outline-offset" }
            CssTest.length
        ]
