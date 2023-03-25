module Property.Flex exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 flex
            { functionName = "flex", propertyName = "flex" }
            ([ ( auto, "auto" )
             , ( content, "content" )
             , ( minContent, "min-content" )
             , ( maxContent, "max-content" )
             , ( fitContent, "fit-content" )
             , ( none, "none" )
             , ( num 2.3, "2.3" )
             ]
                ++ CssTest.length
            )
        , CssTest.property { functionName = "flex2", propertyName = "flex" }
            [ ( flex2 (num 1) (num 2), "1 2" )
            , ( flex2 zero zero, "0 0" )
            , ( flex2 (calc (num 3) (minus (num 2))) (calc (pct 100) (minus (rem 2.3))), "calc(3 - 2) calc(100% - 2.3rem)" )
            , ( flex2 (num 2) auto, "2 auto" )
            , ( flex2 (num 2) content, "2 content" )
            , ( flex2 (num 2) maxContent, "2 max-content" )
            , ( flex2 (num 2) minContent, "2 min-content" )
            , ( flex2 (num 2) fitContent, "2 fit-content" )
            , ( flex2 (num 2) (ch 2.3), "2 2.3ch" )
            , ( flex2 (num 2) (cm 3.2), "2 3.2cm" )
            , ( flex2 (num 2) (em 1), "2 1em" )
            , ( flex2 (num 2) (ex 2), "2 2ex" )
            , ( flex2 (num 2) (inch 0.75), "2 0.75in" )
            , ( flex2 (num 2) (mm 3.4), "2 3.4mm" )
            , ( flex2 (num 2) (pc 10), "2 10pc" )
            , ( flex2 (num 2) (pt 16), "2 16pt" )
            , ( flex2 (num 2) (px 45), "2 45px" )
            , ( flex2 (num 2) (q 32), "2 32Q" )
            , ( flex2 (num 2) (rem 2.05), "2 2.05rem" )
            , ( flex2 (num 2) (vh 33.33), "2 33.33vh" )
            , ( flex2 (num 2) (vw 10), "2 10vw" )
            , ( flex2 (num 2) (vmax 50), "2 50vmax" )
            , ( flex2 (num 2) (vmin 100), "2 100vmin" )
            , ( flex2 (num 2) (pct 26), "2 26%" )
            ]
        , CssTest.property { functionName = "flex3", propertyName = "flex" }
            [ ( flex3 zero zero zero, "0 0 0" )
            , ( flex3
                    (calc (num 3) (minus (num 2)))
                    (calc (num 16) (dividedBy (num 7)))
                    (calc (pct 100) (minus (rem 2.3)))
              , "calc(3 - 2) calc(16 / 7) calc(100% - 2.3rem)"
              )
            , ( flex3 (num 2) (num 3) auto, "2 3 auto" )
            , ( flex3 (num 2) (num 3) content, "2 3 content" )
            , ( flex3 (num 2) (num 3) maxContent, "2 3 max-content" )
            , ( flex3 (num 2) (num 3) minContent, "2 3 min-content" )
            , ( flex3 (num 2) (num 3) fitContent, "2 3 fit-content" )
            , ( flex3 (num 2) (num 3) (ch 2.3), "2 3 2.3ch" )
            , ( flex3 (num 2) (num 3) (cm 3.2), "2 3 3.2cm" )
            , ( flex3 (num 2) (num 3) (em 1), "2 3 1em" )
            , ( flex3 (num 2) (num 3) (ex 2), "2 3 2ex" )
            , ( flex3 (num 2) (num 3) (inch 0.75), "2 3 0.75in" )
            , ( flex3 (num 2) (num 3) (mm 3.4), "2 3 3.4mm" )
            , ( flex3 (num 2) (num 3) (pc 10), "2 3 10pc" )
            , ( flex3 (num 2) (num 3) (pt 16), "2 3 16pt" )
            , ( flex3 (num 2) (num 3) (px 45), "2 3 45px" )
            , ( flex3 (num 2) (num 3) (q 32), "2 3 32Q" )
            , ( flex3 (num 2) (num 3) (rem 2.05), "2 3 2.05rem" )
            , ( flex3 (num 2) (num 3) (vh 33.33), "2 3 33.33vh" )
            , ( flex3 (num 2) (num 3) (vw 10), "2 3 10vw" )
            , ( flex3 (num 2) (num 3) (vmax 50), "2 3 50vmax" )
            , ( flex3 (num 2) (num 3) (vmin 100), "2 3 100vmin" )
            , ( flex3 (num 2) (num 3) (pct 26), "2 3 26%" )
            ]
        , CssTest.property1 flexBasis
            { functionName = "flexBasis", propertyName = "flex-basis" }
            ([ ( auto, "auto" )
             , ( content, "content" )
             , ( minContent, "min-content" )
             , ( maxContent, "max-content" )
             , ( fitContent, "fit-content" )
             ]
                ++ CssTest.length
            )
        , CssTest.property1 flexWrap
            { functionName = "flexWrap", propertyName = "flex-wrap" }
            [ ( wrap, "wrap" )
            , ( nowrap, "nowrap" )
            , ( wrapReverse, "wrap-reverse" )
            ]
        , CssTest.property1 flexGrow
            { functionName = "flexGrow", propertyName = "flex-grow" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( calc (num 2) (times (num 4)), "calc(2 * 4)" )
            ]
        , CssTest.property1 flexShrink
            { functionName = "flexShrink", propertyName = "flex-shrink" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( calc (num 2) (times (num 4)), "calc(2 * 4)" )
            ]
        , CssTest.property1 flexDirection
            { functionName = "flexDirection", propertyName = "flex-direction" }
            [ ( row, "row" )
            , ( rowReverse, "row-reverse" )
            , ( column, "column" )
            , ( columnReverse, "column-reverse" )
            ]
        , CssTest.property1 flexFlow
            { functionName = "flexFlow", propertyName = "flex-flow" }
            [ ( row, "row" )
            , ( rowReverse, "row-reverse" )
            , ( column, "column" )
            , ( columnReverse, "column-reverse" )
            , ( nowrap, "nowrap" )
            , ( wrap, "wrap" )
            , ( wrapReverse, "wrap-reverse" )
            ]
        , CssTest.property { functionName = "flexFlow2", propertyName = "flex-flow" }
            [ ( flexFlow2 row wrap, "row wrap" )
            , ( flexFlow2 row nowrap, "row nowrap" )
            , ( flexFlow2 row wrapReverse, "row wrap-reverse" )
            , ( flexFlow2 rowReverse wrap, "row-reverse wrap" )
            , ( flexFlow2 rowReverse nowrap, "row-reverse nowrap" )
            , ( flexFlow2 rowReverse wrapReverse, "row-reverse wrap-reverse" )
            , ( flexFlow2 column wrap, "column wrap" )
            , ( flexFlow2 column nowrap, "column nowrap" )
            , ( flexFlow2 column wrapReverse, "column wrap-reverse" )
            , ( flexFlow2 columnReverse wrap, "column-reverse wrap" )
            , ( flexFlow2 columnReverse nowrap, "column-reverse nowrap" )
            , ( flexFlow2 columnReverse wrapReverse, "column-reverse wrap-reverse" )
            ]
        , CssTest.property1 alignContent
            { functionName = "alignContent", propertyName = "align-content" }
            [ ( normal, "normal" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( spaceBetween, "space-between" )
            , ( spaceAround, "space-around" )
            , ( spaceEvenly, "space-evenly" )
            , ( stretch, "stretch" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            ]
        , CssTest.property { functionName = "alignContent2", propertyName = "align-content" }
            [ ( alignContent2 safe center, "safe center" )
            , ( alignContent2 unsafe start, "unsafe start" )
            , ( alignContent2 safe end, "safe end" )
            , ( alignContent2 unsafe flexStart, "unsafe flex-start" )
            , ( alignContent2 safe flexEnd, "safe flex-end" )
            ]
        , CssTest.property1 alignItems
            { functionName = "alignItems", propertyName = "align-items" }
            [ ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            ]
        , CssTest.property { functionName = "alignItems2", propertyName = "align-items" }
            [ ( alignItems2 safe center, "safe center" )
            , ( alignItems2 unsafe start, "unsafe start" )
            , ( alignItems2 safe end, "safe end" )
            , ( alignItems2 unsafe flexStart, "unsafe flex-start" )
            , ( alignItems2 safe flexEnd, "safe flex-end" )
            , ( alignItems2 unsafe selfStart, "unsafe self-start" )
            , ( alignItems2 safe selfEnd, "safe self-end" )
            ]
        , CssTest.property1 alignSelf
            { functionName = "alignSelf", propertyName = "align-self" }
            [ ( auto, "auto" )
            , ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            ]
        , CssTest.property { functionName = "alignSelf2", propertyName = "align-self" }
            [ ( alignSelf2 safe center, "safe center" )
            , ( alignSelf2 unsafe start, "unsafe start" )
            , ( alignSelf2 safe end, "safe end" )
            , ( alignSelf2 unsafe flexStart, "unsafe flex-start" )
            , ( alignSelf2 safe flexEnd, "safe flex-end" )
            , ( alignSelf2 unsafe selfStart, "unsafe self-start" )
            , ( alignSelf2 safe selfEnd, "safe self-end" )
            ]
        , CssTest.property1 justifyContent
            { functionName = "justifyContent", propertyName = "justify-content" }
            [ ( normal, "normal" )
            , ( spaceAround, "space-around" )
            , ( spaceBetween, "space-between" )
            , ( spaceEvenly, "space-evenly" )
            , ( stretch, "stretch" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]
        , CssTest.property { functionName = "justifyContent2", propertyName = "justify-content" }
            [ ( justifyContent2 safe center, "safe center" )
            , ( justifyContent2 unsafe start, "unsafe start" )
            , ( justifyContent2 safe end, "safe end" )
            , ( justifyContent2 unsafe flexStart, "unsafe flex-start" )
            , ( justifyContent2 safe flexEnd, "safe flex-end" )
            ]
        , CssTest.property1 justifyItems
            { functionName = "justifyItems", propertyName = "justify-items" }
            [ ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            , ( left_, "left" )
            , ( right_, "right" )
            , ( legacy, "legacy" )
            , ( legacyLeft, "legacy left" )
            , ( legacyRight, "legacy right" )
            , ( legacyCenter, "legacy center" )
            ]
        , CssTest.property { functionName = "justifyItems2", propertyName = "justify-items" }
            [ ( justifyItems2 safe center, "safe center" )
            , ( justifyItems2 unsafe start, "unsafe start" )
            , ( justifyItems2 safe end, "safe end" )
            , ( justifyItems2 unsafe flexStart, "unsafe flex-start" )
            , ( justifyItems2 safe flexEnd, "safe flex-end" )
            , ( justifyItems2 unsafe selfStart, "unsafe self-start" )
            , ( justifyItems2 safe selfEnd, "safe self-end" )
            , ( justifyItems2 unsafe left_, "unsafe left" )
            , ( justifyItems2 safe right_, "safe right" )
            ]
        , CssTest.property1 justifySelf
            { functionName = "justifySelf", propertyName = "justify-self" }
            [ ( auto, "auto" )
            , ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]
        , CssTest.property { functionName = "justifySelf2", propertyName = "justify-self" }
            [ ( justifySelf2 safe center, "safe center" )
            , ( justifySelf2 unsafe start, "unsafe start" )
            , ( justifySelf2 safe end, "safe end" )
            , ( justifySelf2 unsafe flexStart, "unsafe flex-start" )
            , ( justifySelf2 safe flexEnd, "safe flex-end" )
            , ( justifySelf2 unsafe selfStart, "unsafe self-start" )
            , ( justifySelf2 safe selfEnd, "safe self-end" )
            , ( justifySelf2 unsafe left_, "unsafe left" )
            , ( justifySelf2 safe right_, "safe right" )
            ]
        ]
