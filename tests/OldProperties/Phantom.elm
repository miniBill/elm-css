module OldProperties.Phantom exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property1 boxSizing
            { functionName = "boxSizing", propertyName = "box-sizing" }
            [ ( contentBox, "content-box" )
            , ( borderBox, "border-box" )
            ]
        , CssTest.property1 textIndent
            { functionName = "textIndent", propertyName = "text-indent" }
            (( pct 17.5, "17.5%" )
                :: CssTest.length
            )
        , CssTest.property { functionName = "textIndent2", propertyName = "text-indent" }
            [ ( textIndent2 (ch 3) hanging, "3ch hanging" )
            , ( textIndent2 (cm 2) eachLine, "2cm each-line" )
            , ( textIndent2 (em 0.625) hanging, "0.625em hanging" )
            , ( textIndent2 (ex 3.14) eachLine, "3.14ex each-line" )
            , ( textIndent2 (inch 2.54) hanging, "2.54in hanging" )
            , ( textIndent2 (mm 12.345) eachLine, "12.345mm each-line" )
            , ( textIndent2 (pc 7.7) hanging, "7.7pc hanging" )
            , ( textIndent2 (pt 65.4) eachLine, "65.4pt each-line" )
            , ( textIndent2 (px 1.5) hanging, "1.5px hanging" )
            , ( textIndent2 (q 3) hanging, "3Q hanging" )
            , ( textIndent2 (rem 5.3) eachLine, "5.3rem each-line" )
            , ( textIndent2 (vh 99.54) hanging, "99.54vh hanging" )
            , ( textIndent2 (vw 33.333) eachLine, "33.333vw each-line" )
            , ( textIndent2 (vmax 4.73) hanging, "4.73vmax hanging" )
            , ( textIndent2 (vmin 12.7) eachLine, "12.7vmin each-line" )
            , ( textIndent2 zero hanging, "0 hanging" )
            , ( textIndent2 (calc (rem 3.2) (minus (px 5.5))) eachLine, "calc(3.2rem - 5.5px) each-line" )
            ]
        , CssTest.property1 textDecoration
            { functionName = "textDecoration", propertyName = "text-decoration" }
            ([ ( none, "none" )
             , ( underline, "underline" )
             , ( overline, "overline" )
             , ( lineThrough, "line-through" )
             , ( solid, "solid" )
             , ( double, "double" )
             , ( dotted, "dotted" )
             , ( dashed, "dashed" )
             , ( wavy, "wavy" )
             ]
                ++ CssTest.color
            )
        , CssTest.property { functionName = "textDecoration2", propertyName = "text-decoration" }
            [ ( textDecoration2 none solid, "none solid" )
            , ( textDecoration2 underline double, "underline double" )
            , ( textDecoration2 underline dotted, "underline dotted" )
            , ( textDecoration2 lineThrough dashed, "line-through dashed" )
            , ( textDecoration2 overline wavy, "overline wavy" )
            ]
        , CssTest.property { functionName = "textDecoration3", propertyName = "text-decoration" }
            [ ( textDecoration3 none solid (rgb 11 22 33), "none solid rgb(11,22,33)" )
            , ( textDecoration3 underline double (hex "3c84"), "underline double #3c84" )
            , ( textDecoration3 underline dotted (hsl 23 0.5 0.2), "underline dotted hsl(23,50%,20%)" )
            , ( textDecoration3 lineThrough dashed (hsla 11 0.22 0.33 0.44), "line-through dashed hsla(11,22%,33%,0.44)" )
            , ( textDecoration3 overline wavy (rgba 11 22 33 0.44), "overline wavy rgba(11,22,33,0.44)" )
            , ( textDecoration3 underline dotted currentcolor, "underline dotted currentcolor" )
            ]
        , CssTest.property1 textDecorationLine
            { functionName = "textDecorationLine", propertyName = "text-decoration-line" }
            [ ( none, "none" )
            , ( underline, "underline" )
            , ( overline, "overline" )
            , ( lineThrough, "line-through" )
            ]
        , CssTest.property { functionName = "textDecorationLine2", propertyName = "text-decoration-line" }
            [ ( textDecorationLine2 underline overline, "underline overline" )
            , ( textDecorationLine2 lineThrough underline, "line-through underline" )
            , ( textDecorationLine2 overline lineThrough, "overline line-through" )
            ]
        , CssTest.property { functionName = "textDecorationLine3", propertyName = "text-decoration-line" }
            [ ( textDecorationLine3 underline overline lineThrough, "underline overline line-through" ) ]
        , CssTest.property1 textDecorationStyle
            { functionName = "textDecorationStyle", propertyName = "text-decoration-style" }
            [ ( solid, "solid" )
            , ( double, "double" )
            , ( dotted, "dotted" )
            , ( dashed, "dashed" )
            , ( wavy, "wavy" )
            ]
        , CssTest.property1 textDecorationColor
            { functionName = "textDecorationColor", propertyName = "text-decoration-color" }
            CssTest.color
        , CssTest.property1 textUnderlinePosition
            { functionName = "textUnderlinePosition", propertyName = "text-underline-position" }
            [ ( auto, "auto" )
            , ( under, "under" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]
        , CssTest.property { functionName = "textUnderlinePosition2", propertyName = "text-underline-position" }
            [ ( textUnderlinePosition2 under left_, "under left" )
            , ( textUnderlinePosition2 under right_, "under right" )
            ]
        , CssTest.property1 textTransform
            { functionName = "textTransform", propertyName = "text-transform" }
            [ ( capitalize, "capitalize" )
            , ( uppercase, "uppercase" )
            , ( lowercase, "lowercase" )
            , ( none, "none" )
            , ( fullWidth, "full-width" )
            , ( fullSizeKana, "full-size-kana" )
            ]
        , CssTest.property1 lineHeight
            { functionName = "lineHeight", propertyName = "line-height" }
            ([ ( normal, "normal" )
             , ( pct 10, "10%" )
             , ( num 1.8, "1.8" )
             , ( calc (px 5) (plus (pct 1)), "calc(5px + 1%)" )
             , ( calc (em 5.5) (minus (pt 1)), "calc(5.5em - 1pt)" )
             , ( calc (px 5) (plus (calc (pct 5) (plus (vh 3)))), "calc(5px + (5% + 3vh))" )
             , ( calc (px 5) (plus (calc (pct 5) (minus (vh 3)))), "calc(5px + (5% - 3vh))" )
             , ( calc (px 5) (minus (calc (pct 5) (plus (vh 3)))), "calc(5px - (5% + 3vh))" )
             , ( calc (px 5) (minus (calc (pct 5) (minus (vh 3)))), "calc(5px - (5% - 3vh))" )
             , ( calc (calc (pct 5) (plus (vh 3))) (plus (px 5)), "calc((5% + 3vh) + 5px)" )
             , ( calc (calc (pct 5) (minus (vh 3))) (plus (px 5)), "calc((5% - 3vh) + 5px)" )
             , ( calc (calc (pct 5) (plus (vh 3))) (minus (px 5)), "calc((5% + 3vh) - 5px)" )
             , ( calc (calc (pct 5) (minus (vh 3))) (minus (px 5)), "calc((5% - 3vh) - 5px)" )
             ]
                ++ CssTest.length
            )
        , CssTest.property1 visibility
            { functionName = "visibility", propertyName = "visibility" }
            [ ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( collapse, "collapse" )
            ]
        , CssTest.property1 textRendering
            { functionName = "textRendering", propertyName = "text-rendering" }
            [ ( auto, "auto" )
            , ( optimizeSpeed, "optimizeSpeed" )
            , ( optimizeLegibility, "optimizeLegibility" )
            , ( geometricPrecision, "geometricPrecision" )
            ]
        , CssTest.property1 display
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
        , CssTest.property1 pointerEvents
            { functionName = "pointerEvents", propertyName = "pointer-events" }
            [ ( auto, "auto" )
            , ( none, "none" )
            , ( visiblePainted, "visiblePainted" )
            , ( visibleFill, "visibleFill" )
            , ( visibleStroke, "visibleStroke" )
            , ( visible, "visible" )
            , ( painted, "painted" )
            , ( fill_, "fill" )
            , ( stroke, "stroke" )
            , ( all_, "all" )
            ]
        , CssTest.property1 order
            { functionName = "order", propertyName = "order" }
            [ ( int 1, "1" )
            , ( int -4, "-4" )
            ]
        , CssTest.property1 fontWeight
            { functionName = "fontWeight", propertyName = "font-weight" }
            [ ( bold, "bold" )
            , ( normal, "normal" )
            , ( bolder, "bolder" )
            , ( lighter, "lighter" )
            , ( int 100, "100" )
            , ( int 200, "200" )
            , ( int 300, "300" )
            , ( int 400, "400" )
            , ( int 500, "500" )
            , ( int 600, "600" )
            , ( int 700, "700" )
            , ( int 800, "800" )
            , ( int 900, "900" )
            ]
        , CssTest.property1 fontStyle
            { functionName = "fontStyle", propertyName = "font-style" }
            [ ( normal, "normal" )
            , ( italic, "italic" )
            , ( oblique, "oblique" )
            ]
        , CssTest.property1 fontFeatureSettings
            { functionName = "fontFeatureSettings", propertyName = "font-feature-settings" }
            [ ( featureTag "smcp", "\"smcp\"" )
            , ( featureTag2 "liga" 0, "\"liga\" 0" )
            , ( normal, "normal" )
            ]
        , CssTest.property { functionName = "fontFeatureSettingsMany", propertyName = "font-feature-settings" }
            [ ( fontFeatureSettingsMany [ featureTag2 "liga" 0, featureTag2 "swsh" 2 ], "\"liga\" 0,\"swsh\" 2" )
            , ( fontFeatureSettingsMany [ featureTag "ss13" ], "\"ss13\"" )
            ]
        , CssTest.property1 opacity
            { functionName = "opacity", propertyName = "opacity" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( pct 23.4, "23.4%" )
            ]
        , CssTest.property1 color
            { functionName = "color", propertyName = "color" }
            CssTest.color
        , CssTest.property1 cursor
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
        , CssTest.property1 outline
            { functionName = "outline", propertyName = "outline" }
            (( auto, "auto" )
                :: CssTest.length
                ++ CssTest.color
                ++ CssTest.lineStyleWithoutHidden
            )
        , CssTest.property { functionName = "outline3", propertyName = "outline" }
            [ ( outline3 (px 10) none (hsl 120 0.5 0.5), "10px none hsl(120,50%,50%)" )
            , ( outline3 (ch 2.3) auto (hsla 10 0.2 0.3 0.95), "2.3ch auto hsla(10,20%,30%,0.95)" )
            , ( outline3 (cm 3.1) solid (rgb 112 22 75), "3.1cm solid rgb(112,22,75)" )
            , ( outline3 (em 0.2) dotted (rgba 112 22 75 0.1), "0.2em dotted rgba(112,22,75,0.1)" )
            , ( outline3 (ex 10.5) dashed (hex "fadffe"), "10.5ex dashed #fadffe" )
            , ( outline3 (inch 1) solid (hex "eef"), "1in solid #eef" )
            , ( outline3 (mm 2.54) double (hex "#ddfead99"), "2.54mm double #ddfead99" )
            , ( outline3 (pc 8.7) groove (hex "#356265"), "8.7pc groove #356265" )
            , ( outline3 (pt 15.5) ridge (hex "#feda"), "15.5pt ridge #feda" )
            , ( outline3 (q 5) ridge currentcolor, "5Q ridge currentcolor" )
            , ( outline3 (rem 1.1) inset_ (hex "844c"), "1.1rem inset #844c" )
            , ( outline3 (vh 1.2) outset (hex "ef5f7e9f"), "1.2vh outset #ef5f7e9f" )
            , ( outline3 (vw 2.1) solid (rgb 112 22 75), "2.1vw solid rgb(112,22,75)" )
            , ( outline3 (vmax 3.5) solid (rgb 112 22 75), "3.5vmax solid rgb(112,22,75)" )
            , ( outline3 (vmin 4.2) solid (rgb 112 22 75), "4.2vmin solid rgb(112,22,75)" )
            , ( outline3 zero solid (rgb 112 22 75), "0 solid rgb(112,22,75)" )
            , ( outline3 (calc (rem 3.2) (minus (px 5.5))) solid (rgb 112 22 75), "calc(3.2rem - 5.5px) solid rgb(112,22,75)" )
            ]
        , CssTest.property1 outlineWidth
            { functionName = "outlineWidth", propertyName = "outline-width" }
            CssTest.lineWidth
        , CssTest.property1 outlineColor
            { functionName = "outlineColor", propertyName = "outline-color" }
            (( invert, "invert" ) :: CssTest.color)
        , CssTest.property1 outlineStyle
            { functionName = "outlineStyle", propertyName = "outline-style" }
            (( auto, "auto" ) :: CssTest.lineStyleWithoutHidden)
        , CssTest.property1 outlineOffset
            { functionName = "outlineOffset", propertyName = "outline-offset" }
            CssTest.length
        , CssTest.property1 boxShadow
            { functionName = "boxShadow", propertyName = "box-shadow" }
            [ ( none, "none" ) ]
        , CssTest.property { functionName = "boxShadowMany", propertyName = "box-shadow" }
            [ ( boxShadowMany [], "none" )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                      }
                    ]
              , "1px 2px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , color = Just <| hex "#333"
                      }
                    ]
              , "1px 2px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                      }
                    ]
              , "1px 2px 3px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , spreadRadius = Just <| px 3
                      }
                    ]
              , "1px 2px 0 3px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , inset = True
                      }
                    ]
              , "inset 2px 3px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , color = Just <| hex "333"
                      }
                    ]
              , "1px 2px 3px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                      }
                    ]
              , "1px 2px 3px 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , blurRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , spreadRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 0 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                        , color = Just <| hex "333"
                      }
                    ]
              , "1px 2px 3px 4px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 1px 2px 3px 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , blurRadius = Just <| px 4
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 4px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , spreadRadius = Just <| px 4
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 0 4px #333"
              )
            , ( boxShadowMany
                    [ { offsetX = px 1
                      , offsetY = px 2
                      , blurRadius = Just <| px 3
                      , spreadRadius = Just <| px 4
                      , color = Just <| hex "333"
                      , inset = True
                      }
                    ]
              , "inset 1px 2px 3px 4px #333"
              )
            , ( boxShadowMany
                    [ { offsetX = px 1
                      , offsetY = px 2
                      , blurRadius = Just <| px 3
                      , spreadRadius = Just <| px 4
                      , color = Just <| hex "333"
                      , inset = True
                      }
                    , { defaultBoxShadow
                        | offsetX = pt 3
                        , offsetY = rem 2.8
                      }
                    ]
              , "inset 1px 2px 3px 4px #333, 3pt 2.8rem"
              )
            ]
        , CssTest.property1 zIndex
            { functionName = "zIndex", propertyName = "z-index" }
            [ ( auto, "auto" )
            , ( int 5, "5" )
            ]
        , CssTest.property { functionName = "important", propertyName = "background-color" }
            [ ( backgroundColor (rgb 129 20 100) |> important, "rgb(129,20,100) !important" )
            , ( property "background-color" "#234 !IMPORTANT", "#234 !IMPORTANT" )
            ]
        , CssTest.property { functionName = "whiteSpace", propertyName = "white-space" }
            [ ( whiteSpace initial, "initial" )
            , ( whiteSpace unset, "unset" )
            , ( whiteSpace inherit, "inherit" )
            , ( whiteSpace normal, "normal" )
            , ( whiteSpace nowrap, "nowrap" )
            , ( whiteSpace pre, "pre" )
            , ( whiteSpace preWrap, "pre-wrap" )
            , ( whiteSpace preLine, "pre-line" )
            ]
        , CssTest.property { functionName = "tableLayout", propertyName = "table-layout" }
            [ ( tableLayout inherit, "inherit" )
            , ( tableLayout initial, "initial" )
            , ( tableLayout unset, "unset" )
            , ( tableLayout auto, "auto" )
            , ( tableLayout fixed, "fixed" )
            ]
        ]
