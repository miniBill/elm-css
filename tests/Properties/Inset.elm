module Properties.Inset exposing (..)

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
            , auto : Supported
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
                [ class "one"
                    [ property (vh 20)
                    ]
                , class "two"
                    [ property (vw 100)
                    ]
                , class "three"
                    [ property (mm 30)
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
            .one {
                """++actualCSSproperty++""":20vh;
            }

            .two {
                """++actualCSSproperty++""":100vw;
            }

            .three {
                """++actualCSSproperty++""":30mm;
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
                { pct : Supported
                , auto : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
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
                    [ property2 (pct 20) (vh 20)
                    ]
                , class "two"
                    [ property2 (rem 100) (em 2)
                    ]
                , class "three"
                    [ property2 (mm 30) auto
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20% 20vh;
            }

            .two {
                """++actualCSSproperty++""":100rem 2em;
            }

            .three {
                """++actualCSSproperty++""":30mm auto;
            }
            """
            )

threeValTest :
    String
    ->  ( Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
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
                , auto : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
        -> Value
            ( LengthSupported
                { pct : Supported
                , auto : Supported
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

insetTest : Test
insetTest = singleValTest "inset" inset "inset"

inset2Test : Test
inset2Test = twoValTest "inset2" inset2 "inset"

inset3Test : Test
inset3Test = threeValTest "inset3" inset3 "inset"

inset4Test : Test
inset4Test = fourValTest "inset4" inset4 "inset"

topTest : Test
topTest = singleValTest "top" top "top"

rightTest : Test
rightTest = singleValTest "right" right "right"

bottomTest : Test
bottomTest = singleValTest "bottom" bottom "bottom"

leftTest : Test
leftTest = singleValTest "left" left "left"

insetBlockTest : Test
insetBlockTest = singleValTest "insetBlock" insetBlock "inset-block"

insetBlock2Test : Test
insetBlock2Test = twoValTest "insetBlock2" insetBlock2 "inset-block"

insetBlockStartTest : Test
insetBlockStartTest = singleValTest "insetBlockStart" insetBlockStart "inset-block-start"

insetBlockEndTest : Test
insetBlockEndTest = singleValTest "insetBlockEnd" insetBlockEnd "inset-block-end"

insetInlineTest : Test
insetInlineTest = singleValTest "insetInline" insetInline "inset-inline"

insetInline2Test : Test
insetInline2Test = twoValTest "insetInline2" insetInline2 "inset-inline"

insetInlineStartTest : Test
insetInlineStartTest = singleValTest "insetInlineStart" insetInlineStart "inset-inline-start"

insetInlineEndTest : Test
insetInlineEndTest = singleValTest "insetInlineEnd" insetInlineEnd "inset-inline-end"

