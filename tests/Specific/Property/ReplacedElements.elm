module Specific.Property.ReplacedElements exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 objectFit
            { functionName = "objectFit", propertyName = "object-fit"}
            [ ( contain_, "contain" )
            , ( cover, "cover" )
            , ( fill_, "fill" )
            , ( none, "none" )
            , ( scaleDown, "scale-down" )
            ]
        
        , CssTest.property1 objectPosition
            { functionName = "objectPosition", propertyName = "object-position"}
            (   CssTest.length
                ++ CssTest.offsetKeyword
            )
        
        , CssTest.property
            { functionName = "objectPosition2", propertyName = "object-position"}
            (   CssTest.length2 objectPosition2
                ++ CssTest.offsetKeyword2 objectPosition2
                ++ CssTest.offsetKeywordPercent objectPosition2
            )
        
        , CssTest.property
            { functionName = "objectPosition4", propertyName = "object-position"}
            ( CssTest.offsetKeywordLengthPercentPair objectPosition4 )
        ]
