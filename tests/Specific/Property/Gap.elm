module Specific.Property.Gap exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 gap
            { functionName = "gap", propertyName = "gap" }
            (   ( (pct 39), "39%" )
                :: CssTest.length
            )
        , CssTest.property
            { functionName = "gap2", propertyName = "gap" }
            (   ( gap2 (pct 39) (pct 48), "39% 48%" )
                :: CssTest.length2 gap2
            )
        , CssTest.property1 rowGap
            { functionName = "rowGap", propertyName = "row-gap" }
            (   ( (pct 39), "39%" )
                :: CssTest.length
            )
        , CssTest.property1 columnGap
            { functionName = "columnGap", propertyName = "column-gap" }
            (   [ ( (pct 39), "39%" )
                , ( normal, "normal" )
                ]
                ++ CssTest.length
            )
        ]
