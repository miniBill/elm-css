module Specific.Property.Tables exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property1 borderCollapse
            { functionName = "borderCollapse", propertyName = "border-collapse" }
            [ ( collapse, "collapse" )
            , ( separate, "separate" )
            ]
        , CssTest.property1 borderSpacing
            { functionName = "borderSpacing", propertyName = "border-spacing" }
            CssTest.length
        
        , CssTest.property
            { functionName = "borderSpacing2", propertyName = "border-spacing" }
            ( CssTest.length2 borderSpacing2 )

        , CssTest.property1 captionSide
            { functionName = "captionSide", propertyName = "caption-side" }
            [ ( top_, "top" )
            , ( bottom_, "bottom" )
            , ( blockStart, "block-start" )
            , ( blockEnd, "block-end" )
            , ( inlineStart, "inline-start" )
            , ( inlineEnd, "inline-end" )
            ]

        , CssTest.property1 tableLayout
            { functionName = "tableLayout", propertyName = "table-layout" }
            [ ( auto, "auto" )
            , ( fixed, "fixed" )
            ]
        , CssTest.property1 emptyCells
            { functionName = "emptyCells", propertyName = "empty-cells" }
            [ ( show, "show" )
            , ( hide, "hide" )
            ]
        ]
