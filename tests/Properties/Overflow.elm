module Properties.Overflow exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value, Supported)
import Compile
import Test exposing (Test)


singleValTest :
    String
    -> ( BaseValue
        { visible : Supported
        , hidden : Supported
        , clip : Supported
        , scroll : Supported
        , auto : Supported
        }
        -> Style
        )
    -> String
    -> Test
singleValTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property auto
                    ]
                , class "two"
                    [ property clip
                    ]
                , class "three"
                    [ property scroll
                    ]
                , class "zero"
                    [ property inherit
                    ]
                , class "pct"
                    [ property visible
                    ]
                , class "auto"
                    [ property hidden
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":auto;
            }

            .two {
                """++actualCSSproperty++""":clip;
            }

            .three {
                """++actualCSSproperty++""":scroll;
            }

            .zero {
                """++actualCSSproperty++""":inherit;
            }

            .pct {
                """++actualCSSproperty++""":visible;
            }

            .auto {
                """++actualCSSproperty++""":hidden;
            }
            """
            )


logicalValTest :
    String
    -> ( BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        }
        -> Style
        )
    -> String
    -> Test
logicalValTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property auto
                    ]
                , class "two"
                    [ property unset
                    ]
                , class "three"
                    [ property scroll
                    ]
                , class "zero"
                    [ property inherit
                    ]
                , class "pct"
                    [ property visible
                    ]
                , class "auto"
                    [ property hidden
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":auto;
            }

            .two {
                """++actualCSSproperty++""":unset;
            }

            .three {
                """++actualCSSproperty++""":scroll;
            }

            .zero {
                """++actualCSSproperty++""":inherit;
            }

            .pct {
                """++actualCSSproperty++""":visible;
            }

            .auto {
                """++actualCSSproperty++""":hidden;
            }
            """
            )


twoValTest :
    String
    -> ( ( Value
            { visible : Supported
            , hidden : Supported
            , clip : Supported
            , scroll : Supported
            , auto : Supported
            }
            )
        -> ( Value
            { visible : Supported
            , hidden : Supported
            , clip : Supported
            , scroll : Supported
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
                    [ property2 auto visible
                    ]
                , class "two"
                    [ property2 clip scroll
                    ]
                , class "three"
                    [ property2 hidden visible
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":auto visible;
            }

            .two {
                """++actualCSSproperty++""":clip scroll;
            }

            .three {
                """++actualCSSproperty++""":hidden visible;
            }
            """
            )

overflowTest : Test
overflowTest = singleValTest "overflow" overflow "overflow"

overflow2Test : Test
overflow2Test = twoValTest "overflow2" overflow2 "overflow"

overflowXTest : Test
overflowXTest = singleValTest "overflowX" overflowX "overflow-x"

overflowYTest : Test
overflowYTest = singleValTest "overflowY" overflowY "overflow-y"

overflowBlockTest : Test
overflowBlockTest = logicalValTest "overflowBlock" overflowBlock "overflow-block"

overflowInlineTest : Test
overflowInlineTest = logicalValTest "overflowInline" overflowInline "overflow-inline"

overflowAnchorTest : Test
overflowAnchorTest =
    let
        actualCSSproperty = "overflow-anchor"
    in
    Compile.test
        "overflowAnchor"
        ( stylesheet
            [ class "one"
                [ overflowAnchor auto
                ]
            , class "two"
                [ overflowAnchor none
                ]
            , class "three"
                [ overflowAnchor inherit
                ]
            ]
        )
        (
        """
        .one {
            """++actualCSSproperty++""":auto;
        }

        .two {
            """++actualCSSproperty++""":none;
        }

        .three {
            """++actualCSSproperty++""":inherit;
        }
        """
        )

overflowWrapTest : Test
overflowWrapTest =
    let
        actualCSSproperty = "overflow-wrap"
    in
    Compile.test
        "overflowWrap"
        ( stylesheet
            [ class "one"
                [ overflowWrap normal
                ]
            , class "two"
                [ overflowWrap breakWord
                ]
            , class "three"
                [ overflowWrap anywhere
                ]
            , class "four"
                [ overflowWrap inherit
                ]
            , class "five"
                [ overflowWrap revert
                ]
            ]
        )
        (
        """
        .one {
            """++actualCSSproperty++""":normal;
        }

        .two {
            """++actualCSSproperty++""":break-word;
        }

        .three {
            """++actualCSSproperty++""":anywhere;
        }

        .four {
            """++actualCSSproperty++""":inherit;
        }

        .five {
            """++actualCSSproperty++""":revert;
        }
        """
        )
