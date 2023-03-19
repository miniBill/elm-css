module Properties.ScrollPadding exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value, Supported)
import Compile
import Test exposing (Test)


singleValTest :
    String
    -> ( BaseValue
        ( LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
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
                    [ property (pct 25)
                    ]
                , class "auto"
                    [ property auto
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
                """++actualCSSproperty++""":25%;
            }

            .auto {
                """++actualCSSproperty++""":auto;
            }
            """
            )


twoValTest :
    String
    ->  ( Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Style
        )
    -> String
    -> Test
twoValTest title property2 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property2 (pct 20) (px 20)
                    ]
                , class "two"
                    [ property2 auto (em 2)
                    ]
                , class "three"
                    [ property2 (mm 30) (q 23)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20% 20px;
            }

            .two {
                """++actualCSSproperty++""":auto 2em;
            }

            .three {
                """++actualCSSproperty++""":30mm 23Q;
            }
            """
            )

threeValTest :
    String
    ->  ( Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Style
        )
    -> String
    -> Test
threeValTest title property3 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property3 (pct 20) (px 20) (ch 2)
                    ]
                , class "two"
                    [ property3 (rem 100) auto (rem 2)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20% 20px 2ch;
            }

            .two {
                """++actualCSSproperty++""":100rem auto 2rem;
            }
            """
            )

fourValTest :
    String
    ->  ( Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
        -> Style
        )
    -> String
    -> Test
fourValTest title property4 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property4 (pct 20) (px 20) (pc 1) (inch 12)
                    ]
                , class "two"
                    [ property4 (rem 100) (em 2) auto (em 4)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20% 20px 1pc 12in;
            }

            .two {
                """++actualCSSproperty++""":100rem 2em auto 4em;
            }
            """
            )


scrollPaddingTest : Test
scrollPaddingTest = singleValTest "scrollPadding" scrollPadding "scroll-padding"

scrollPadding2Test : Test
scrollPadding2Test = twoValTest "scrollPadding2" scrollPadding2 "scroll-padding"

scrollPadding3Test : Test
scrollPadding3Test = threeValTest "scrollPadding3" scrollPadding3 "scroll-padding"

scrollPadding4Test : Test
scrollPadding4Test = fourValTest "scrollPadding4" scrollPadding4 "scroll-padding"

scrollPaddingTopTest : Test
scrollPaddingTopTest = singleValTest "scrollPaddingTop" scrollPaddingTop "scroll-padding-top"

scrollPaddingRightTest : Test
scrollPaddingRightTest = singleValTest "scrollPaddingRight" scrollPaddingRight "scroll-padding-right"

scrollPaddingBottomTest : Test
scrollPaddingBottomTest = singleValTest "scrollPaddingBottom" scrollPaddingBottom "scroll-padding-bottom"

scrollPaddingLeftTest : Test
scrollPaddingLeftTest = singleValTest "scrollPaddingLeft" scrollPaddingLeft "scroll-padding-left"

scrollPaddingBlockTest : Test
scrollPaddingBlockTest = singleValTest "scrollPaddingBlock" scrollPaddingBlock "scroll-padding-block"

scrollPaddingBlock2Test : Test
scrollPaddingBlock2Test = twoValTest "scrollPaddingBlock2" scrollPaddingBlock2 "scroll-padding-block"

scrollPaddingBlockStartTest : Test
scrollPaddingBlockStartTest = singleValTest "scrollPaddingBlockStart" scrollPaddingBlockStart "scroll-padding-block-start"

scrollPaddingBlockEndTest : Test
scrollPaddingBlockEndTest = singleValTest "scrollPaddingBlockEnd" scrollPaddingBlockEnd "scroll-padding-block-end"

scrollPaddingInlineTest : Test
scrollPaddingInlineTest = singleValTest "scrollPaddingInline" scrollPaddingInline "scroll-padding-inline"

scrollPaddingInline2Test : Test
scrollPaddingInline2Test = twoValTest "scrollPaddingInline2" scrollPaddingInline2 "scroll-padding-inline"

scrollPaddingInlineStartTest : Test
scrollPaddingInlineStartTest = singleValTest "scrollPaddingInlineStart" scrollPaddingInlineStart "scroll-padding-inline-start"

scrollPaddingInlineEndTest : Test
scrollPaddingInlineEndTest = singleValTest "scrollPaddingInlineEnd" scrollPaddingInlineEnd "scroll-padding-inline-end"
