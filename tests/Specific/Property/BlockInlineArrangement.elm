module Specific.Property.BlockInlineArrangement exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 float
            { functionName = "float", propertyName = "float" }
            [ ( left_, "left" )
            , ( right_, "right" )
            , ( none, "none" )
            , ( inlineStart, "inline-start" )
            , ( inlineEnd, "inline-end" )
            ]
        
        , CssTest.property1 clear
            { functionName = "clear", propertyName = "clear" }
            [ ( left_, "left" )
            , ( right_, "right" )
            , ( none, "none" )
            , ( both, "both" )
            , ( inlineStart, "inline-start" )
            , ( inlineEnd, "inline-end" )
            ]

        , CssTest.property1 verticalAlign
            { functionName = "verticalAlign", propertyName = "vertical-align" }
            (   [ ( baseline, "baseline" )
                , ( sub, "sub" )
                , ( super, "super" )
                , ( textTop, "text-top" )
                , ( textBottom, "text-bottom" )
                , ( middle, "middle" )
                , ( top_, "top" )
                , ( bottom_, "bottom" )
                , ( pct 30, "30%" )
                ]
                ++ CssTest.length
            )
        ]
