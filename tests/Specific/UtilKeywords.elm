module Specific.UtilKeywords exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property { functionName = "important", propertyName = "background-color" }
            [ ( backgroundColor (rgb 129 20 100) |> important, "rgb(129,20,100) !important" )
            , ( property "background-color" "#234 !IMPORTANT", "#234 !IMPORTANT" )
            ]
        ]
