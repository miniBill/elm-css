module Specific.Property.TypeWrapping exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property { functionName = "whiteSpace", propertyName = "white-space" }
            [ ( whiteSpace initial, "initial" )
            , ( whiteSpace unset, "unset" )
            , ( whiteSpace inherit, "inherit" )
            , ( whiteSpace normal, "normal" )
            , ( whiteSpace nowrap, "nowrap" )
            , ( whiteSpace pre, "pre" )
            , ( whiteSpace preWrap, "pre-wrap" )
            , ( whiteSpace preLine, "pre-line" )
            ]
        ]
