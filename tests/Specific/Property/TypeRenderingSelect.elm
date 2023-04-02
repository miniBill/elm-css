module Specific.Property.TypeRenderingSelect exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 textRendering
            { functionName = "textRendering", propertyName = "text-rendering" }
            [ ( auto, "auto" )
            , ( optimizeSpeed, "optimizeSpeed" )
            , ( optimizeLegibility, "optimizeLegibility" )
            , ( geometricPrecision, "geometricPrecision" )
            ]
        , CssTest.property1 userSelect
            { functionName = "userSelect", propertyName = "user-select" }
            [ ( none, "none" )
            , ( auto, "auto" )
            , ( text, "text" )
            , ( contain_, "contain" )
            , ( all_, "all" )
            ]
        ]
