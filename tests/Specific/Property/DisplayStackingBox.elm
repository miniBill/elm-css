module Specific.Property.DisplayStackingBox exposing (..)


import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 display
            { functionName = "display", propertyName = "display" }
            [ ( none, "none" )
            , ( contents, "contents" )
            , ( inline, "inline" )
            , ( block, "block" )
            , ( listItem, "list-item" )
            , ( inlineBlock, "inline-block" )
            , ( inlineFlex, "inline-flex" )
            , ( inlineGrid, "inline-grid" )
            , ( inlineTable, "inline-table" )
            , ( flex_, "flex" )
            , ( flow, "flow" )
            , ( flowRoot, "flow-root" )
            , ( grid_, "grid" )
            , ( table, "table" )
            , ( ruby, "ruby" )
            , ( rubyBase, "ruby-base" )
            , ( rubyBaseContainer, "ruby-base-container" )
            , ( rubyText, "ruby-text" )
            , ( rubyTextContainer, "ruby-text-container" )
            , ( runIn, "run-in" )
            , ( tableCaption, "table-caption" )
            , ( tableCell, "table-cell" )
            , ( tableColumn, "table-column" )
            , ( tableColumnGroup, "table-column-group" )
            , ( tableFooterGroup, "table-footer-group" )
            , ( tableHeaderGroup, "table-header-group" )
            , ( tableRow, "table-row" )
            , ( tableRowGroup, "table-row-group" )
            ]
        , CssTest.property { functionName = "display2", propertyName = "display" }
            [ ( display2 inline flow, "inline flow" )
            , ( display2 block flowRoot, "block flow-root" )
            , ( display2 block table, "block table" )
            , ( display2 runIn flex_, "run-in flex" )
            , ( display2 inline grid_, "inline grid" )
            , ( display2 runIn ruby, "run-in ruby" )
            ]
        , CssTest.property { functionName = "displayListItem2", propertyName = "display" }
            [ ( displayListItem2 block, "list-item block" )
            , ( displayListItem2 inline, "list-item inline" )
            , ( displayListItem2 runIn, "list-item run-in" )
            , ( displayListItem2 flow, "list-item flow" )
            , ( displayListItem2 flowRoot, "list-item flow-root" )
            ]
        , CssTest.property { functionName = "displayListItem3", propertyName = "display" }
            [ ( displayListItem3 block flow, "list-item block flow" )
            , ( displayListItem3 inline flowRoot, "list-item inline flow-root" )
            , ( displayListItem3 runIn flow, "list-item run-in flow" )
            ]
        , CssTest.property1 zIndex
            { functionName = "zIndex", propertyName = "z-index" }
            [ ( auto, "auto" )
            , ( int 5, "5" )
            ]
        , CssTest.property1 boxSizing
            { functionName = "boxSizing", propertyName = "box-sizing" }
            [ ( contentBox, "content-box" )
            , ( borderBox, "border-box" )
            ]
        ]
