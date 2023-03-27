module Specific.Property.Visual exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 visibility
            { functionName = "visibility", propertyName = "visibility" }
            [ ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( collapse, "collapse" )
            ]
        ,  CssTest.property1 opacity
            { functionName = "opacity", propertyName = "opacity" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( pct 23.4, "23.4%" )
            ]
        ]
