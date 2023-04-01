module Specific.Property.TypeMetrics exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 textIndent
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
        , CssTest.property
            { functionName = "textIndent3", propertyName = "text-indent" }
            [ ( textIndent3 (em 20) hanging eachLine, "20em hanging each-line" )
            , ( textIndent3 (pct 40) hanging eachLine, "40% hanging each-line" )
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
        , CssTest.property1 tabSize
            { functionName = "tabSize", propertyName = "tab-size" }
            (   [ ( int 4, "4" )
                , ( int 5, "5" )
                ]
                ++ CssTest.length
            )
        , CssTest.property1 wordSpacing
            { functionName = "wordSpacing", propertyName = "word-spacing" }
            (   ( normal, "normal" )
                :: CssTest.length
            )
            
        ]
