module Specific.Property.Perspective3D exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 backfaceVisibility
            { functionName = "backfaceVisibility", propertyName = "backface-visibility"}
            [ ( visible, "visible" )
            , ( hidden, "hidden" )
            ]
        ]
