module Properties.ScrollMargin exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value)
import Compile
import Test exposing (Test)


singleValTest :
    String
    -> ( BaseValue
        ( Length )
        -> Style
        )
    -> String
    -> Test
singleValTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "px"
                    [ property (px 20)
                    ]
                , class "rem"
                    [ property (rem 100)
                    ]
                , class "pt"
                    [ property (pt 30)
                    ]
                , class "zero"
                    [ property zero
                    ]
                , class "pct"
                    [ property (pc 25)
                    ]
                , class "auto"
                    [ property (rem 940)
                    ]
                ]
            )
            (
            """
            .px {
                """++actualCSSproperty++""":20px;
            }

            .rem {
                """++actualCSSproperty++""":100rem;
            }

            .pt {
                """++actualCSSproperty++""":30pt;
            }

            .zero {
                """++actualCSSproperty++""":0;
            }

            .pct {
                """++actualCSSproperty++""":25pc;
            }

            .auto {
                """++actualCSSproperty++""":940rem;
            }
            """
            )


twoValTest :
    String
    ->  ( Value
            ( Length )
        -> Value
            ( Length )
        -> Style
        )
    -> String
    -> Test
twoValTest title property2 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property2 (rem 151) (px 20)
                    ]
                , class "two"
                    [ property2 (px 124) (em 2)
                    ]
                , class "three"
                    [ property2 (mm 30) (q 23)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":151rem 20px;
            }

            .two {
                """++actualCSSproperty++""":124px 2em;
            }

            .three {
                """++actualCSSproperty++""":30mm 23Q;
            }
            """
            )

threeValTest :
    String
    ->  ( Value
            ( Length )
        -> Value
            ( Length )
        -> Value
            ( Length )
        -> Style
        )
    -> String
    -> Test
threeValTest title property3 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property3 (em 235) (px 20) (ch 2)
                    ]
                , class "two"
                    [ property3 (rem 100) (q 11) (rem 2)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":235em 20px 2ch;
            }

            .two {
                """++actualCSSproperty++""":100rem 11Q 2rem;
            }
            """
            )

fourValTest :
    String
    ->  ( Value
            ( Length )
        -> Value
            ( Length )
        -> Value
            ( Length )
        -> Value
            ( Length )
        -> Style
        )
    -> String
    -> Test
fourValTest title property4 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property4 (pc 10) (px 20) (pc 1) (inch 12)
                    ]
                , class "two"
                    [ property4 (rem 100) (em 2) (px 424) (em 4)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":10pc 20px 1pc 12in;
            }

            .two {
                """++actualCSSproperty++""":100rem 2em 424px 4em;
            }
            """
            )


scrollMarginTest : Test
scrollMarginTest = singleValTest "scrollMargin" scrollMargin "scroll-margin"

scrollMargin2Test : Test
scrollMargin2Test = twoValTest "scrollMargin2" scrollMargin2 "scroll-margin"

scrollMargin3Test : Test
scrollMargin3Test = threeValTest "scrollMargin3" scrollMargin3 "scroll-margin"

scrollMargin4Test : Test
scrollMargin4Test = fourValTest "scrollMargin4" scrollMargin4 "scroll-margin"

scrollMarginTopTest : Test
scrollMarginTopTest = singleValTest "scrollMarginTop" scrollMarginTop "scroll-margin-top"

scrollMarginRightTest : Test
scrollMarginRightTest = singleValTest "scrollMarginRight" scrollMarginRight "scroll-margin-right"

scrollMarginBottomTest : Test
scrollMarginBottomTest = singleValTest "scrollMarginBottom" scrollMarginBottom "scroll-margin-bottom"

scrollMarginLeftTest : Test
scrollMarginLeftTest = singleValTest "scrollMarginLeft" scrollMarginLeft "scroll-margin-left"

scrollMarginBlockTest : Test
scrollMarginBlockTest = singleValTest "scrollMarginBlock" scrollMarginBlock "scroll-margin-block"

scrollMarginBlock2Test : Test
scrollMarginBlock2Test = twoValTest "scrollMarginBlock2" scrollMarginBlock2 "scroll-margin-block"

scrollMarginBlockStartTest : Test
scrollMarginBlockStartTest = singleValTest "scrollMarginBlockStart" scrollMarginBlockStart "scroll-margin-block-start"

scrollMarginBlockEndTest : Test
scrollMarginBlockEndTest = singleValTest "scrollMarginBlockEnd" scrollMarginBlockEnd "scroll-margin-block-end"

scrollMarginInlineTest : Test
scrollMarginInlineTest = singleValTest "scrollMarginInline" scrollMarginInline "scroll-margin-inline"

scrollMarginInline2Test : Test
scrollMarginInline2Test = twoValTest "scrollMarginInline2" scrollMarginInline2 "scroll-margin-inline"

scrollMarginInlineStartTest : Test
scrollMarginInlineStartTest = singleValTest "scrollMarginInlineStart" scrollMarginInlineStart "scroll-margin-inline-start"

scrollMarginInlineEndTest : Test
scrollMarginInlineEndTest = singleValTest "scrollMarginInlineEnd" scrollMarginInlineEnd "scroll-margin-inline-end"
