module Properties.TextDecoration exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Supported)
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
                    [ textDecorationStyle revert
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
                text-decoration-style:inherit;
            }

            """
            )
