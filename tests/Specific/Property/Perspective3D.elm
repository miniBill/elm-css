module Specific.Property.Perspective3D exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 perspective
            { functionName = "perspective", propertyName = "perspective"}
            (   ( none, "none" )
                :: CssTest.length
            )

        , CssTest.property1 perspectiveOrigin
            { functionName = "perspectiveOrigin", propertyName = "perspective-origin"}
            (   ( pct 10, "10%" )
                :: CssTest.offsetKeyword
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "perspectiveOrigin2", propertyName = "perspective-origin"}
            (   ( perspectiveOrigin2 (pct 10) (pct 30), "10% 30%" )
                :: CssTest.offsetKeyword2 perspectiveOrigin2
                ++ CssTest.offsetKeywordLength perspectiveOrigin2
                ++ CssTest.offsetKeywordPercent perspectiveOrigin2
                ++ CssTest.length2 perspectiveOrigin2
            )
        , CssTest.property1 backfaceVisibility
            { functionName = "backfaceVisibility", propertyName = "backface-visibility"}
            [ ( visible, "visible" )
            , ( hidden, "hidden" )
            ]
        ]
