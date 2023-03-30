module Specific.Property.ContentFragmentation exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 breakAfter
            { functionName = "breakAfter", propertyName = "break-after" }
            [ ( auto, "auto" )
            , ( avoid, "avoid" )
            , ( avoidPage, "avoid-page" )
            , ( page, "page" )
            , ( left_, "left" )
            , ( right_, "right" )
            , ( avoidColumn, "avoid-column" )
            , ( column, "column" )
            ]

        , CssTest.property1 breakBefore
            { functionName = "breakBefore", propertyName = "break-before" }
            [ ( auto, "auto" )
            , ( avoid, "avoid" )
            , ( avoidPage, "avoid-page" )
            , ( page, "page" )
            , ( left_, "left" )
            , ( right_, "right" )
            , ( avoidColumn, "avoid-column" )
            , ( column, "column" )
            ]

        , CssTest.property1 breakInside
            { functionName = "breakInside", propertyName = "break-inside" }
            [ ( auto, "auto" )
            , ( avoid, "avoid" )
            , ( avoidPage, "avoid-page" )
            , ( avoidColumn, "avoid-column" )
            ]
        
        , CssTest.property1 pageBreakAfter
            { functionName = "pageBreakAfter", propertyName = "page-break-after" }
            [ ( auto, "auto" )
            , ( Css.always, "always")
            , ( avoid, "avoid" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]

        , CssTest.property1 pageBreakBefore
            { functionName = "pageBreakBefore", propertyName = "page-break-before" }
            [ ( auto, "auto" )
            , ( Css.always, "always")
            , ( avoid, "avoid" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]
        
        , CssTest.property1 pageBreakInside
            { functionName = "pageBreakInside", propertyName = "page-break-inside" }
            [ ( auto, "auto" )
            , ( avoid, "avoid" )
            ]
        
        , CssTest.property1 orphans
            { functionName = "orphans", propertyName = "orphans" }
            [ (int 2, "2" )
            ]
        
        , CssTest.property1 widows
            { functionName = "widows", propertyName = "widows" }
            [ (int 2, "2" )
            ]
        
        , CssTest.property1 boxDecorationBreak
            { functionName = "boxDecorationBreak", propertyName = "box-decoration-break" }
            [ ( slice, "slice" )
            , ( clone, "clone" )
            ]
        ]
