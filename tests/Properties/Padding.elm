module Properties.Padding exposing (..)

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
            { pct : Supported
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
            """
            )


twoValTest :
    String
    ->  ( Value
            ( LengthSupported
                { pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
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
                    [ property2 (rem 100) (em 2)
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
                """++actualCSSproperty++""":100rem 2em;
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
                { pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
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
                    [ property3 (rem 100) (em 2) (rem 2)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20% 20px 2ch;
            }

            .two {
                """++actualCSSproperty++""":100rem 2em 2rem;
            }
            """
            )

fourValTest :
    String
    ->  ( Value
            ( LengthSupported
                { pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
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
                    [ property4 (rem 100) (em 2) (vh 1) (em 4)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20% 20px 1pc 12in;
            }

            .two {
                """++actualCSSproperty++""":100rem 2em 1vh 4em;
            }
            """
            )


paddingTest : Test
paddingTest = singleValTest "padding" padding "padding"

padding2Test : Test
padding2Test = twoValTest "padding2" padding2 "padding"

padding3Test : Test
padding3Test = threeValTest "padding3" padding3 "padding"

padding4Test : Test
padding4Test = fourValTest "padding4" padding4 "padding"

paddingTopTest : Test
paddingTopTest = singleValTest "paddingTop" paddingTop "padding-top"

paddingRightTest : Test
paddingRightTest = singleValTest "paddingRight" paddingRight "padding-right"

paddingBottomTest : Test
paddingBottomTest = singleValTest "paddingBottom" paddingBottom "padding-bottom"

paddingLeftTest : Test
paddingLeftTest = singleValTest "paddingLeft" paddingLeft "padding-left"

paddingBlockTest : Test
paddingBlockTest = singleValTest "paddingBlock" paddingBlock "padding-block"

paddingBlock2Test : Test
paddingBlock2Test = twoValTest "paddingBlock2" paddingBlock2 "padding-block"

paddingBlockStartTest : Test
paddingBlockStartTest = singleValTest "paddingBlockStart" paddingBlockStart "padding-block-start"

paddingBlockEndTest : Test
paddingBlockEndTest = singleValTest "paddingBlockEnd" paddingBlockEnd "padding-block-end"

paddingInlineTest : Test
paddingInlineTest = singleValTest "paddingInline" paddingInline "padding-inline"

paddingInline2Test : Test
paddingInline2Test = twoValTest "paddingInline2" paddingInline2 "padding-inline"

paddingInlineStartTest : Test
paddingInlineStartTest = singleValTest "paddingInlineStart" paddingInlineStart "padding-inline-start"

paddingInlineEndTest : Test
paddingInlineEndTest = singleValTest "paddingInlineEnd" paddingInlineEnd "padding-inline-end"
