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
            (   [ ( top_, "top" )
                , ( bottom_, "bottom" )
                , ( left_, "left" )
                , ( right_, "right" )
                , ( center, "center" )
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "objectPosition2", propertyName = "object-position"}
            (   [ ( objectPosition2 left_ (pt 20), "left 20pt" )
                , ( objectPosition2 right_ (ex 30), "right 30ex" )
                , ( objectPosition2 center (cm 10), "center 10cm" )
                , ( objectPosition2 left_ (pct 20), "left 20%" )
                , ( objectPosition2 right_ (pct 30), "right 30%" )
                , ( objectPosition2 center (pct 10), "center 10%" )
                , ( objectPosition2 left_ top_, "left top" )
                , ( objectPosition2 right_ top_, "right top" )
                , ( objectPosition2 center top_, "center top" )
                , ( objectPosition2 left_ bottom_, "left bottom" )
                , ( objectPosition2 right_ bottom_, "right bottom" )
                , ( objectPosition2 center bottom_, "center bottom" )
                ]
                ++ CssTest.length2 objectPosition2
            )
        
        , CssTest.property
            { functionName = "objectPosition4", propertyName = "object-position"}
            [ ( objectPosition4 left_ (pt 20) top_ (pct 50), "left 20pt top 50%" )
            , ( objectPosition4 right_ (px 10) top_ (rem 2), "right 10px top 2rem" )
            , ( objectPosition4 left_ (pct 60) bottom_ (rem 2), "left 60% bottom 2rem" )
            , ( objectPosition4 right_ (pct 20) bottom_ (pct 40), "right 20% bottom 40%" )
            ]
        ]
