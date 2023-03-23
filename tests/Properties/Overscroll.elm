module Properties.Overscroll exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value, Supported)
import Compile
import Test exposing (Test)


singleValTest :
    String
    -> ( BaseValue
        { auto : Supported
        , none : Supported
        , contain_ : Supported
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
                    [ property contain_
                    ]
                , class "three"
                    [ property none
                    ]
                , class "zero"
                    [ property inherit
                    ]
                , class "pct"
                    [ property initial
                    ]
                , class "auto"
                    [ property revert
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":auto;
            }

            .two {
                """++actualCSSproperty++""":contain;
            }

            .three {
                """++actualCSSproperty++""":none;
            }

            .zero {
                """++actualCSSproperty++""":inherit;
            }

            .pct {
                """++actualCSSproperty++""":initial;
            }

            .auto {
                """++actualCSSproperty++""":revert;
            }
            """
            )



twoValTest :
    String
    ->  ( Value
            { auto : Supported
            , contain_ : Supported
            , none : Supported
            }
        -> Value
            { auto : Supported
            , contain_ : Supported
            , none : Supported
            }
        -> Style
        )
    -> String
    -> Test
twoValTest title property2 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property2 auto contain_
                    ]
                , class "two"
                    [ property2 none auto
                    ]
                , class "three"
                    [ property2 contain_ none
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":auto contain;
            }

            .two {
                """++actualCSSproperty++""":none auto;
            }

            .three {
                """++actualCSSproperty++""":contain none;
            }
            """
            )

overscrollBTest : Test
overscrollBTest = singleValTest "overscrollBehavior" overscrollBehavior "overscroll-behavior"

overscrollB2Test : Test
overscrollB2Test = twoValTest "overscrollBehavior2" overscrollBehavior2 "overscroll-behavior"

overscrollBXTest : Test
overscrollBXTest = singleValTest "overscrollBehaviorX" overscrollBehaviorX "overscroll-behavior-x"

overscrollBYTest : Test
overscrollBYTest = singleValTest "overscrollBehaviorY" overscrollBehaviorY "overscroll-behavior-y"

overscrollBBlockTest : Test
overscrollBBlockTest = singleValTest "overscrollBehaviorBlock" overscrollBehaviorBlock "overscroll-behavior-block"

overscrollBInlineTest : Test
overscrollBInlineTest = singleValTest "overscrollBehaviorInline" overscrollBehaviorInline "overscroll-behavior-inline"
