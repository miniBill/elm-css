module Properties.Margin exposing (..)

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
                [ class "em"
                    [ property (em 20)
                    ]
                , class "ch"
                    [ property (ch 100)
                    ]
                , class "ex"
                    [ property (ex 30)
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
            .em {
                """++actualCSSproperty++""":20em;
            }

            .ch {
                """++actualCSSproperty++""":100ch;
            }

            .ex {
                """++actualCSSproperty++""":30ex;
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

marginTest : Test
marginTest = singleValTest "margin" margin "margin"

margin2Test : Test
margin2Test = twoValTest "margin2" margin2 "margin"

margin3Test : Test
margin3Test = threeValTest "margin3" margin3 "margin"

margin4Test : Test
margin4Test = fourValTest "margin4" margin4 "margin"

marginTopTest : Test
marginTopTest = singleValTest "marginTop" marginTop "margin-top"

marginRightTest : Test
marginRightTest = singleValTest "marginRight" marginRight "margin-right"

marginBottomTest : Test
marginBottomTest = singleValTest "marginBottom" marginBottom "margin-bottom"

marginLeftTest : Test
marginLeftTest = singleValTest "marginLeft" marginLeft "margin-left"

marginBlockTest : Test
marginBlockTest = singleValTest "marginBlock" marginBlock "margin-block"

marginBlock2Test : Test
marginBlock2Test = twoValTest "marginBlock2" marginBlock2 "margin-block"

marginBlockStartTest : Test
marginBlockStartTest = singleValTest "marginBlockStart" marginBlockStart "margin-block-start"

marginBlockEndTest : Test
marginBlockEndTest = singleValTest "marginBlockEnd" marginBlockEnd "margin-block-end"

marginInlineTest : Test
marginInlineTest = singleValTest "marginInline" marginInline "margin-inline"

marginInline2Test : Test
marginInline2Test = twoValTest "marginInline2" marginInline2 "margin-inline"

marginInlineStartTest : Test
marginInlineStartTest = singleValTest "marginInlineStart" marginInlineStart "margin-inline-start"

marginInlineEndTest : Test
marginInlineEndTest = singleValTest "marginInlineEnd" marginInlineEnd "margin-inline-end"
