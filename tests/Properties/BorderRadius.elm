module Properties.BorderRadius exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value, Supported)
import Compile
import Test exposing (Test)


oneCornerOneValTest :
    String
    -> ( BaseValue ( LengthSupported { pct : Supported } )
        -> Style
        )
    -> String
    -> Test
oneCornerOneValTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (rem 2)
                    ]
                , class "two"
                    [ property inherit
                    ]
                , class "three"
                    [ property (px 8)
                    ]
                , class "four"
                    [ property (pct 80)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":2rem;
            }

            .two {
                """++actualCSSproperty++""":inherit;
            }

            .three {
                """++actualCSSproperty++""":8px;
            }

            .four {
                """++actualCSSproperty++""":80%;
            }
            """
            )

oneCornerTwoValTest :
    String
    -> ( Value ( LengthSupported { pct : Supported } )
        -> Value ( LengthSupported { pct : Supported } )
        -> Style
        )
    -> String
    -> Test
oneCornerTwoValTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (rem 2) (em 4)
                    ]
                , class "two"
                    [ property (pct 20) (pct 10)
                    ]
                , class "three"
                    [ property (px 8) (em 1)
                    ]
                , class "four"
                    [ property (pct 80) (px 3)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":2rem 4em;
            }

            .two {
                """++actualCSSproperty++""":20% 10%;
            }

            .three {
                """++actualCSSproperty++""":8px 1em;
            }

            .four {
                """++actualCSSproperty++""":80% 3px;
            }
            """
            )

borderRadiusTest : Test
borderRadiusTest = oneCornerOneValTest "borderRadius" borderRadius "border-radius"

borderRadius2Test : Test
borderRadius2Test = oneCornerTwoValTest "borderRadius2" borderRadius2 "border-radius"

borderRadius3Test : Test
borderRadius3Test =
    Compile.test
            "borderRadius3"
            ( stylesheet
                [ class "one"
                    [ borderRadius3 (rem 2) (em 4) (ex 4)
                    ]
                , class "two"
                    [ borderRadius3 (pct 20) (pct 10) (px 100)
                    ]
                , class "three"
                    [ borderRadius3 (px 8) (em 1) (pct 20)
                    ]
                , class "four"
                    [ borderRadius3 (pct 80) (em 10) (px 3)
                    ]
                ]
            )
            (
            """
            .one {
                border-radius:2rem 4em 4ex;
            }

            .two {
                border-radius:20% 10% 100px;
            }

            .three {
                border-radius:8px 1em 20%;
            }

            .four {
                border-radius:80% 10em 3px;
            }
            """
            )

borderRadius4Test : Test
borderRadius4Test =
    Compile.test
            "borderRadius4"
            ( stylesheet
                [ class "one"
                    [ borderRadius4 (rem 2) (em 4) (ex 4) (pct 40)
                    ]
                , class "two"
                    [ borderRadius4 (pct 20) (pct 10) (px 100) (px 120)
                    ]
                ]
            )
            (
            """
            .one {
                border-radius:2rem 4em 4ex 40%;
            }

            .two {
                border-radius:20% 10% 100px 120px;
            }

            """
            )


borderTopLeftRadiusTest : Test
borderTopLeftRadiusTest = oneCornerOneValTest "borderTopLeftRadius" borderTopLeftRadius "border-top-left-radius"

borderTopLeftRadius2Test : Test
borderTopLeftRadius2Test = oneCornerTwoValTest "borderTopLeftRadius2" borderTopLeftRadius2 "border-top-left-radius"

borderTopRightRadiusTest : Test
borderTopRightRadiusTest = oneCornerOneValTest "borderTopRightRadius" borderTopRightRadius "border-top-right-radius"

borderTopRightRadius2Test : Test
borderTopRightRadius2Test = oneCornerTwoValTest "borderTopRightRadius2" borderTopRightRadius2 "border-top-right-radius"

borderBottomLeftRadiusTest : Test
borderBottomLeftRadiusTest = oneCornerOneValTest "borderBottomLeftRadius" borderBottomLeftRadius "border-bottom-left-radius"

borderBottomLeftRadius2Test : Test
borderBottomLeftRadius2Test = oneCornerTwoValTest "borderBottomLeftRadius2" borderBottomLeftRadius2 "border-bottom-left-radius"

borderBottomRightRadiusTest : Test
borderBottomRightRadiusTest = oneCornerOneValTest "borderBottomRightRadius" borderBottomRightRadius "border-bottom-right-radius"

borderBottomRightRadius2Test : Test
borderBottomRightRadius2Test = oneCornerTwoValTest "borderBottomRightRadius2" borderBottomRightRadius2 "border-bottom-right-radius"

borderStartStartRadiusTest : Test
borderStartStartRadiusTest = oneCornerOneValTest "borderStartStartRadius" borderStartStartRadius "border-start-start-radius"

borderStartStartRadius2Test : Test
borderStartStartRadius2Test = oneCornerTwoValTest "borderStartStartRadius2" borderStartStartRadius2 "border-start-start-radius"

borderStartEndRadiusTest : Test
borderStartEndRadiusTest = oneCornerOneValTest "borderStartEndRadius" borderStartEndRadius "border-start-end-radius"

borderStartEndRadius2Test : Test
borderStartEndRadius2Test = oneCornerTwoValTest "borderStartEndRadius2" borderStartEndRadius2 "border-start-end-radius"

borderEndStartRadiusTest : Test
borderEndStartRadiusTest = oneCornerOneValTest "borderEndStartRadius" borderEndStartRadius "border-end-start-radius"

borderEndStartRadius2Test : Test
borderEndStartRadius2Test = oneCornerTwoValTest "borderEndStartRadius2" borderEndStartRadius2 "border-end-start-radius"

borderEndEndRadiusTest : Test
borderEndEndRadiusTest = oneCornerOneValTest "borderEndEndRadius" borderEndEndRadius "border-end-end-radius"

borderEndEndRadius2Test : Test
borderEndEndRadius2Test = oneCornerTwoValTest "borderEndEndRadius2" borderEndEndRadius2 "border-end-end-radius"
