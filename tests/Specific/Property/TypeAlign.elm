module Specific.Property.TypeAlign exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 textAlign
            { functionName = "textAlign", propertyName = "text-align" }
            [ ( start, "start" )
            , ( end, "end" )
            , ( left_, "left" )
            , ( right_, "right" )
            , ( center, "center" )
            , ( justify, "justify" )
            , ( matchParent, "match-parent" )
            ]
        , CssTest.property1 textJustify
            { functionName = "textJustify", propertyName = "text-justify" }
            [ ( none, "none" )
            , ( auto, "auto" )
            , ( interWord, "inter-word" )
            , ( interCharacter, "inter-character" )
            ]
        ]
