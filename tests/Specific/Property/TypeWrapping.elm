module Specific.Property.TypeWrapping exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 wordBreak
            { functionName = "wordBreak", propertyName = "word-break"}
            [ ( normal, "normal")
            , ( breakAll, "break-all" )
            , ( keepAll, "keep-all" )
            , ( breakWord, "break-word" )
            ]

        , CssTest.property1 lineBreak
            { functionName = "lineBreak", propertyName = "line-break"}
            [ ( auto, "auto")
            , ( loose, "loose" )
            , ( normal, "normal" )
            , ( strict, "strict" )
            , ( anywhere, "anywhere" )
            ]
        
        , CssTest.property1 whiteSpace
            { functionName = "whiteSpace", propertyName = "white-space" }
            [ ( normal, "normal" )
            , ( nowrap, "nowrap" )
            , ( pre, "pre" )
            , ( preWrap, "pre-wrap" )
            , ( preLine, "pre-line" )
            , ( breakSpaces, "break-spaces" )
            ]
        
        , CssTest.property1 textOverflow
            { functionName = "textOverflow", propertyName = "text-overflow" }
            [ ( clip, "clip" )
            , ( ellipsis, "ellipsis" )
            ]

        , CssTest.property 
            { functionName = "textOverflow2", propertyName = "text-overflow" }
            [ ( textOverflow2 clip clip, "clip clip" )
            , ( textOverflow2 clip ellipsis, "clip ellipsis" )
            , ( textOverflow2 ellipsis ellipsis, "ellipsis ellipsis" )
            ]

        , CssTest.property1 hyphens
            { functionName = "hyphens", propertyName = "hyphens" }
            [ ( none, "none")
            , ( manual, "manual" )
            , ( auto, "auto" )
            ]
        
        , CssTest.property1 hangingPunctuation
            { functionName = "hangingPunctuation", propertyName = "hanging-punctuation" }
            [ ( none, "none" )
            , ( first_, "first" )
            , ( last, "last" )
            , ( forceEnd, "force-end" )
            , ( allowEnd, "allow-end" )
            ]
        
        , CssTest.property
            { functionName = "hangingPunctuation2", propertyName = "hanging-punctuation" }
            [ ( hangingPunctuation2 first_ last, "first last" )
            , ( hangingPunctuation2 first_ forceEnd, "first force-end" )
            , ( hangingPunctuation2 first_ allowEnd, "first allow-end" )
            , ( hangingPunctuation2 last forceEnd, "last force-end" )
            , ( hangingPunctuation2 last allowEnd, "last allow-end" )
            ]
        
        , CssTest.property
            { functionName = "hangingPunctuation3", propertyName = "hanging-punctuation" }
            [ ( hangingPunctuation3 first_ forceEnd last, "first force-end last" )
            , ( hangingPunctuation3 first_ allowEnd last, "first allow-end last" )
            ]
        ]
