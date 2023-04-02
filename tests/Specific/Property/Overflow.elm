module Specific.Property.Overflow exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 overflow
            { functionName = "overflow", propertyName = "overflow" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            , ( clip, "clip" )
            ]
        , CssTest.property
            { functionName = "overflow2", propertyName = "overflow" }
            [ ( overflow2 visible auto, "visible auto" )
            , ( overflow2 clip scroll, "clip scroll" )
            , ( overflow2 hidden clip, "hidden clip" )
            ]
        , CssTest.property1 overflowX
            { functionName = "overflowX", propertyName = "overflow-x" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            , ( clip, "clip" )
            ]
        , CssTest.property1 overflowY
            { functionName = "overflowY", propertyName = "overflow-y" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            , ( clip, "clip" )
            ]
        , CssTest.property1 overflowBlock
            { functionName = "overflowBlock", propertyName = "overflow-block" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            ]
        , CssTest.property1 overflowInline
            { functionName = "overflowInline", propertyName = "overflow-inline" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            ]
        , CssTest.property1 overflowAnchor
            { functionName = "overflowAnchor", propertyName = "overflow-anchor" }
            [ ( auto, "auto" )
            , ( none, "none" )
            ]
        , CssTest.property1 overflowWrap
            { functionName = "overflowWrap", propertyName = "overflow-wrap" }
            [ ( normal, "normal" )
            , ( anywhere, "anywhere" )
            , ( breakWord, "break-word" )
            ]
        , CssTest.property1 resize
            { functionName = "resize", propertyName = "resize" }
            [ ( none, "none" )
            , ( both, "both" )
            , ( horizontal, "horizontal" )
            , ( vertical, "vertical" )
            , ( block, "block" )
            , ( inline, "inline" )
            ]
        ]
