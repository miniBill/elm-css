module Properties.Gap exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Supported)
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
                    [ property inherit
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
                """++actualCSSproperty++""":inherit;
            }
            """
            )


gapTest : Test
gapTest = singleValTest "gap" gap "gap"


gap2Test : Test
gap2Test =
    Compile.test
            "gap2"
            ( stylesheet
                [ class "em"
                    [ gap2 (em 20) (vmin 1)
                    ]
                , class "ch"
                    [ gap2 (ch 100) (mm 20)
                    ]
                , class "ex"
                    [ gap2 (ex 30) (pct 10)
                    ]
                , class "zero"
                    [ gap2 zero (pc 10)
                    ]
                , class "pct"
                    [ gap2 (px 100) (pct 25)
                    ]
                , class "auto"
                    [ gap2 (pct 10) (pct 30)
                    ]
                ]
            )
            (
            """
            .em {
                gap:20em 1vmin;
            }

            .ch {
                gap:100ch 20mm;
            }

            .ex {
                gap:30ex 10%;
            }

            .zero {
                gap:0 10pc;
            }

            .pct {
                gap:100px 25%;
            }

            .auto {
                gap:10% 30%;
            }
            """
            )

rowGapTest : Test
rowGapTest = singleValTest "rowGap" rowGap "row-gap"


columnGapTest : Test
columnGapTest =
    Compile.test
            "columnGap"
            ( stylesheet
                [ class "em"
                    [ columnGap (em 20)
                    ]
                , class "ch"
                    [ columnGap (ch 100)
                    ]
                , class "ex"
                    [ columnGap normal
                    ]
                , class "zero"
                    [ columnGap zero
                    ]
                , class "pct"
                    [ columnGap (pct 25)
                    ]
                , class "auto"
                    [ columnGap inherit
                    ]
                ]
            )
            (
            """
            .em {
                column-gap:20em;
            }

            .ch {
                column-gap:100ch;
            }

            .ex {
                column-gap:normal;
            }

            .zero {
                column-gap:0;
            }

            .pct {
                column-gap:25%;
            }

            .auto {
                column-gap:inherit;
            }
            """
            )
