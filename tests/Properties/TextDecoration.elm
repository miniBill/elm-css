module Properties.TextDecoration exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Compile
import Test exposing (Test)


textDecorationLineTest : Test
textDecorationLineTest =
    Compile.test
            "textDecorationLine"
            ( stylesheet
                [ class "one"
                    [ textDecorationLine none
                    ]
                , class "two"
                    [ textDecorationLine underline
                    ]
                , class "three"
                    [ textDecorationLine overline
                    ]
                , class "four"
                    [ textDecorationLine lineThrough
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-line:none;
            }

            .two {
                text-decoration-line:underline;
            }

            .three {
                text-decoration-line:overline;
            }

            .four {
                text-decoration-line:line-through;
            }
            """
            )

textDecorationLine2Test : Test
textDecorationLine2Test =
    Compile.test
            "textDecorationLine2"
            ( stylesheet
                [ class "one"
                    [ textDecorationLine2 underline overline
                    ]
                , class "two"
                    [ textDecorationLine2 lineThrough overline
                    ]
                , class "three"
                    [ textDecorationLine2 overline lineThrough
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-line:underline overline;
            }

            .two {
                text-decoration-line:line-through overline;
            }

            .three {
                text-decoration-line:overline line-through;
            }

            """
            )

textDecorationLine3Test : Test
textDecorationLine3Test =
    Compile.test
            "textDecorationLine3"
            ( stylesheet
                [ class "one"
                    [ textDecorationLine3 underline overline lineThrough
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-line:underline overline line-through;
            }

            """
            )


textDecorationStyleTest : Test
textDecorationStyleTest =
    Compile.test
            "textDecorationStyle"
            ( stylesheet
                [ class "one"
                    [ textDecorationStyle solid
                    ]
                , class "two"
                    [ textDecorationStyle double
                    ]
                , class "three"
                    [ textDecorationStyle dotted
                    ]
                , class "four"
                    [ textDecorationStyle dashed
                    ]
                , class "five"
                    [ textDecorationStyle wavy
                    ]
                , class "six"
                    [ textDecorationStyle unset
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-style:solid;
            }

            .two {
                text-decoration-style:double;
            }

            .three {
                text-decoration-style:dotted;
            }

            .four {
                text-decoration-style:dashed;
            }

            .five {
                text-decoration-style:wavy;
            }
            
            .six {
                text-decoration-style:unset;
            }

            """
            )


textDecorationColorTest : Test
textDecorationColorTest =
    Compile.test
            "textDecorationColor"
            ( stylesheet
                [ class "one"
                    [ textDecorationColor currentcolor
                    ]
                , class "two"
                    [ textDecorationColor (hex "ff0000")
                    ]
                , class "three"
                    [ textDecorationColor transparent
                    ]
                , class "four"
                    [ textDecorationColor initial
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-color:currentcolor;
            }

            .two {
                text-decoration-color:#ff0000;
            }

            .three {
                text-decoration-color:transparent;
            }

            .four {
                text-decoration-color:initial;
            }
            """
            )


textDecorationThicknessTest : Test
textDecorationThicknessTest =
    Compile.test
            "textDecorationThickness"
            ( stylesheet
                [ class "one"
                    [ textDecorationThickness auto
                    ]
                , class "two"
                    [ textDecorationThickness fromFont
                    ]
                , class "three"
                    [ textDecorationThickness (em 3)
                    ]
                , class "four"
                    [ textDecorationThickness (px 3)
                    ]
                , class "five"
                    [ textDecorationThickness (pct 100)
                    ]
                , class "six"
                    [ textDecorationThickness revert
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-thickness:auto;
            }

            .two {
                text-decoration-thickness:from-font;
            }

            .three {
                text-decoration-thickness:3em;
            }

            .four {
                text-decoration-thickness:3px;
            }

            .five {
                text-decoration-thickness:100%;
            }
            
            .six {
                text-decoration-thickness:revert;
            }

            """
            )


textDecorationSkipInkTest : Test
textDecorationSkipInkTest =
    Compile.test
            "textDecorationSkipInk"
            ( stylesheet
                [ class "one"
                    [ textDecorationSkipInk none
                    ]
                , class "two"
                    [ textDecorationSkipInk auto
                    ]
                , class "three"
                    [ textDecorationSkipInk all_
                    ]
                , class "four"
                    [ textDecorationSkipInk inherit
                    ]
                , class "five"
                    [ textDecorationSkipInk revert
                    ]
                ]
            )
            (
            """
            .one {
                text-decoration-skip-ink:none;
            }

            .two {
                text-decoration-skip-ink:auto;
            }

            .three {
                text-decoration-skip-ink:all;
            }

            .four {
                text-decoration-skip-ink:inherit;
            }

            .five {
                text-decoration-skip-ink:revert;
            }
            """
            )
