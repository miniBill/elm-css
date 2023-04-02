module Specific.Property.Drawing exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 paintOrder
            { functionName = "paintOrder", propertyName = "paint-order" }
            [ ( normal, "normal" )
            , ( stroke, "stroke" )
            , ( markers, "markers" )
            ]
        
        , CssTest.property
            { functionName = "paintOrder2", propertyName = "paint-order" }
            [ ( paintOrder2 fill_ stroke, "fill stroke" )
            , ( paintOrder2 markers fill_, "markers fill" )
            , ( paintOrder2 stroke markers, "stroke markers" )
            ]

        , CssTest.property
            { functionName = "paintOrder3", propertyName = "paint-order" }
            [ ( paintOrder3 fill_ stroke markers, "fill stroke markers" )
            , ( paintOrder3 markers fill_ stroke, "markers fill stroke" )
            , ( paintOrder3 stroke markers fill_, "stroke markers fill" )
            ]
        ]
