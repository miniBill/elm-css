module Specific.Property.Cursor exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 cursor
            { functionName = "cursor", propertyName = "cursor" }
            [ ( pointer, "pointer" )
            , ( auto, "auto" )
            , ( default_, "default" )
            , ( none, "none" )
            , ( contextMenu, "context-menu" )
            , ( help, "help" )
            , ( Css.progress, "progress" )
            , ( wait, "wait" )
            , ( cell, "cell" )
            , ( crosshair, "crosshair" )
            , ( text, "text" )
            , ( verticalText, "vertical-text" )
            , ( alias, "alias" )
            , ( copy, "copy" )
            , ( move, "move" )
            , ( noDrop, "no-drop" )
            , ( notAllowed, "not-allowed" )
            , ( allScroll, "all-scroll" )
            , ( colResize, "col-resize" )
            , ( rowResize, "row-resize" )
            , ( nResize, "n-resize" )
            , ( eResize, "e-resize" )
            , ( wResize, "w-resize" )
            , ( sResize, "s-resize" )
            , ( neResize, "ne-resize" )
            , ( nwResize, "nw-resize" )
            , ( seResize, "se-resize" )
            , ( swResize, "sw-resize" )
            , ( ewResize, "ew-resize" )
            , ( nsResize, "ns-resize" )
            , ( neswResize, "nesw-resize" )
            , ( nwseResize, "nwse-resize" )
            , ( zoomIn, "zoom-in" )
            , ( zoomOut, "zoom-out" )
            , ( grab, "grab" )
            , ( grabbing, "grabbing" )
            ]

        , CssTest.property { functionName = "cursor2", propertyName = "cursor" }
            [ ( cursor2 (url "https://example.com") nwseResize, "url(https://example.com),nwse-resize" ) ]

        , CssTest.property { functionName = "cursor4", propertyName = "cursor" }
            [ ( cursor4 (url "https://example.com") (num 4.3) zero zoomIn, "url(https://example.com) 4.3 0,zoom-in" )
            , ( cursor4 (url "https://example.com") zero (num 100) zoomIn, "url(https://example.com) 0 100,zoom-in" )
            ]
        
        , CssTest.property1 caretColor
            { functionName = "caretColor", propertyName = "caret-color" }
            (   [ ( auto, "auto" )
                , ( transparent, "transparent" )
                ]
                ++ CssTest.color
            )
        ]
