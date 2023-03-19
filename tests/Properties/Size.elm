module Properties.Size exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Supported)
import Compile
import Test exposing (Test)

normalTest :
    String
    -> ( BaseValue
        ( LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
        -> Style
        )
    -> String
    -> Test
normalTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (em 20)
                    ]
                , class "two"
                    [ property (ch 100)
                    ]
                , class "three"
                    [ property maxContent
                    ]
                , class "four"
                    [ property zero
                    ]
                , class "five"
                    [ property (pct 25)
                    ]
                , class "six"
                    [ property auto
                    ]
                , class "seven"
                    [ property <| fitContentTo (pct 100)
                    ]
                , class "eight"
                    [ property minContent
                    ]
                , class "nine"
                    [ property inherit
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20em;
            }

            .two {
                """++actualCSSproperty++""":100ch;
            }

            .three {
                """++actualCSSproperty++""":max-content;
            }

            .four {
                """++actualCSSproperty++""":0;
            }

            .five {
                """++actualCSSproperty++""":25%;
            }

            .six {
                """++actualCSSproperty++""":auto;
            }
            
            .seven {
                """++actualCSSproperty++""":fit-content(100%);
            }

            .eight {
                """++actualCSSproperty++""":min-content;
            }

            .nine {
                """++actualCSSproperty++""":inherit;
            }
            """
            )

minTest :
    String
    -> ( BaseValue
        ( LengthSupported
            { pct : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
        -> Style
        )
    -> String
    -> Test
minTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (em 20)
                    ]
                , class "two"
                    [ property (ch 100)
                    ]
                , class "three"
                    [ property maxContent
                    ]
                , class "four"
                    [ property zero
                    ]
                , class "five"
                    [ property (pct 25)
                    ]
                , class "six"
                    [ property fitContent
                    ]
                , class "seven"
                    [ property <| fitContentTo (pct 100)
                    ]
                , class "eight"
                    [ property minContent
                    ]
                , class "nine"
                    [ property inherit
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20em;
            }

            .two {
                """++actualCSSproperty++""":100ch;
            }

            .three {
                """++actualCSSproperty++""":max-content;
            }

            .four {
                """++actualCSSproperty++""":0;
            }

            .five {
                """++actualCSSproperty++""":25%;
            }

            .six {
                """++actualCSSproperty++""":fit-content;
            }
            
            .seven {
                """++actualCSSproperty++""":fit-content(100%);
            }

            .eight {
                """++actualCSSproperty++""":min-content;
            }

            .nine {
                """++actualCSSproperty++""":inherit;
            }
            """
            )


maxTest :
    String
    -> ( BaseValue
        ( LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , fitContentTo : Supported
            }
        )
        -> Style
        )
    -> String
    -> Test
maxTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (em 20)
                    ]
                , class "two"
                    [ property (ch 100)
                    ]
                , class "three"
                    [ property maxContent
                    ]
                , class "four"
                    [ property zero
                    ]
                , class "five"
                    [ property (pct 25)
                    ]
                , class "six"
                    [ property fitContent
                    ]
                , class "seven"
                    [ property <| fitContentTo (pct 100)
                    ]
                , class "eight"
                    [ property none
                    ]
                , class "nine"
                    [ property inherit
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":20em;
            }

            .two {
                """++actualCSSproperty++""":100ch;
            }

            .three {
                """++actualCSSproperty++""":max-content;
            }

            .four {
                """++actualCSSproperty++""":0;
            }

            .five {
                """++actualCSSproperty++""":25%;
            }

            .six {
                """++actualCSSproperty++""":fit-content;
            }
            
            .seven {
                """++actualCSSproperty++""":fit-content(100%);
            }

            .eight {
                """++actualCSSproperty++""":none;
            }

            .nine {
                """++actualCSSproperty++""":inherit;
            }
            """
            )

widthTest : Test
widthTest = normalTest "width" width "width"

minWidthTest : Test
minWidthTest = minTest "minWidth" minWidth "min-width"

maxWidthTest : Test
maxWidthTest = maxTest "maxWidth" maxWidth "max-width"

heightTest : Test
heightTest = normalTest "height" height "height"

minHeightTest : Test
minHeightTest = minTest "minHeight" minHeight "min-height"

maxHeightTest : Test
maxHeightTest = maxTest "maxHeight" maxHeight "max-height"

blockSizeTest : Test
blockSizeTest = normalTest "blockSize" blockSize "block-size"

minBlockSizeTest : Test
minBlockSizeTest = minTest "minBlockSize" minBlockSize "min-block-size"

maxBlockSizeTest : Test
maxBlockSizeTest = maxTest "maxBlockSize" maxBlockSize "max-block-size"

inlineSizeTest : Test
inlineSizeTest = normalTest "inlineSize" inlineSize "inline-size"

minInlineSizeTest : Test
minInlineSizeTest = minTest "minInlineSize" minInlineSize "min-inline-size"

maxInlineSizeTest : Test
maxInlineSizeTest = maxTest "maxInlineSize" maxInlineSize "max-inline-size"
