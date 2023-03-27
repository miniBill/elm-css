module Specific.Property.Tables exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property { functionName = "tableLayout", propertyName = "table-layout" }
            [ ( tableLayout inherit, "inherit" )
            , ( tableLayout initial, "initial" )
            , ( tableLayout unset, "unset" )
            , ( tableLayout auto, "auto" )
            , ( tableLayout fixed, "fixed" )
            ]
        ]
