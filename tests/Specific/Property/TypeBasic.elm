module Specific.Property.TypeBasic exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 color
            { functionName = "color", propertyName = "color" }
            CssTest.color
        , CssTest.property1 fontWeight
            { functionName = "fontWeight", propertyName = "font-weight" }
            [ ( bold, "bold" )
            , ( normal, "normal" )
            , ( bolder, "bolder" )
            , ( lighter, "lighter" )
            , ( int 100, "100" )
            , ( int 200, "200" )
            , ( int 300, "300" )
            , ( int 400, "400" )
            , ( int 500, "500" )
            , ( int 600, "600" )
            , ( int 700, "700" )
            , ( int 800, "800" )
            , ( int 900, "900" )
            ]
        , CssTest.property1 fontStyle
            { functionName = "fontStyle", propertyName = "font-style" }
            [ ( normal, "normal" )
            , ( italic, "italic" )
            , ( oblique, "oblique" )
            ]
        ]
