module Properties.Border exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value, Supported)
import Compile
import Test exposing (Test)





oneSideOneValTest :
    String
    -> ( BaseValue LineWidth
        -> Style
        )
    -> String
    -> Test
oneSideOneValTest title property actualCSSproperty =
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
            """
            )

oneSideTwoValTest :
    String
    -> ( Value LineWidth
        -> Value LineStyle
        -> Style
        )
    -> String
    -> Test
oneSideTwoValTest title property2 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property2 (rem 2) solid
                    ]
                , class "two"
                    [ property2 (px 2) dotted
                    ]
                , class "three"
                    [ property2 (px 8) dashed
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":2rem solid;
            }

            .two {
                """++actualCSSproperty++""":2px dotted;
            }

            .three {
                """++actualCSSproperty++""":8px dashed;
            }
            """
            )

oneSideThreeValTest :
    String
    -> ( Value LineWidth
        -> Value LineStyle
        -> Value Color
        -> Style
        )
    -> String
    -> Test
oneSideThreeValTest title property3 actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property3 (rem 2) solid (hex "ff0000")
                    ]
                , class "two"
                    [ property3 (px 2) dotted (hex "999")
                    ]
                , class "three"
                    [ property3 (px 8) dashed (rgba 254 122 122 0.5)
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":2rem solid #ff0000;
            }

            .two {
                """++actualCSSproperty++""":2px dotted #999;
            }

            .three {
                """++actualCSSproperty++""":8px dashed rgba(254,122,122,0.5);
            }
            """
            )

colorTest :
    String
    -> ( BaseValue Color
        -> Style
        )
    -> String
    -> Test
colorTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (hex "00ff00")
                    ]
                , class "two"
                    [ property (hex "eee")
                    ]
                , class "three"
                    [ property (rgba 0 0 0 0.5)
                    ]
                , class "four"
                    [ property inherit
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":#00ff00;
            }

            .two {
                """++actualCSSproperty++""":#eee;
            }

            .three {
                """++actualCSSproperty++""":rgba(0,0,0,0.5);
            }

            .four {
                """++actualCSSproperty++""":inherit;
            }
            """
            )

widthTest :
    String
    -> ( BaseValue LineWidth
        -> Style
        )
    -> String
    -> Test
widthTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property (rem 10)
                    ]
                , class "two"
                    [ property (pc 2)
                    ]
                , class "three"
                    [ property (px 100)
                    ]
                , class "four"
                    [ property inherit
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":10rem;
            }

            .two {
                """++actualCSSproperty++""":2pc;
            }

            .three {
                """++actualCSSproperty++""":100px;
            }

            .four {
                """++actualCSSproperty++""":inherit;
            }
            """
            )

styleTest :
    String
    -> ( BaseValue LineStyle
        -> Style
        )
    -> String
    -> Test
styleTest title property actualCSSproperty =
    Compile.test
            title
            ( stylesheet
                [ class "one"
                    [ property none
                    ]
                , class "two"
                    [ property groove
                    ]
                , class "three"
                    [ property double
                    ]
                , class "four"
                    [ property inherit
                    ]
                ]
            )
            (
            """
            .one {
                """++actualCSSproperty++""":none;
            }

            .two {
                """++actualCSSproperty++""":groove;
            }

            .three {
                """++actualCSSproperty++""":double;
            }

            .four {
                """++actualCSSproperty++""":inherit;
            }
            """
            )

----------------- all

borderTest : Test
borderTest = oneSideOneValTest "border" border "border"

border2Test : Test
border2Test = oneSideTwoValTest "border2" border2 "border"

border3Test : Test
border3Test = oneSideThreeValTest "border3" border3 "border"

borderStyleTest : Test
borderStyleTest = styleTest "borderStyle" borderStyle "border-style"

style2Test : Test
style2Test =
    Compile.test
            "borderStyle2"
            ( stylesheet
                [ class "one"
                    [ borderStyle2 none groove
                    ]
                , class "two"
                    [ borderStyle2 groove ridge
                    ]
                , class "three"
                    [ borderStyle2 inset_ double
                    ]
                , class "four"
                    [ borderStyle2 outset dotted
                    ]
                ]
            )
            (
            """
            .one {
                border-style:none groove;
            }

            .two {
                border-style:groove ridge;
            }

            .three {
                border-style:inset double;
            }

            .four {
                border-style:outset dotted;
            }
            """
            )


style3Test : Test
style3Test =
    Compile.test
            "borderStyle3"
            ( stylesheet
                [ class "one"
                    [ borderStyle3 none groove solid
                    ]
                , class "two"
                    [ borderStyle3 groove double ridge
                    ]
                , class "three"
                    [ borderStyle3 inset_ dashed double
                    ]
                ]
            )
            (
            """
            .one {
                border-style:none groove solid;
            }

            .two {
                border-style:groove double ridge;
            }

            .three {
                border-style:inset dashed double;
            }
            """
            )

style4Test : Test
style4Test =
    Compile.test
            "borderStyle4"
            ( stylesheet
                [ class "one"
                    [ borderStyle4 none groove solid ridge
                    ]
                , class "two"
                    [ borderStyle4 groove double ridge dashed
                    ]

                ]
            )
            (
            """
            .one {
                border-style:none groove solid ridge;
            }

            .two {
                border-style:groove double ridge dashed;
            }
            """
            )

borderWidthTest : Test
borderWidthTest = widthTest "borderWidth" borderWidth "border-width"

width2Test : Test
width2Test =
    Compile.test
            "borderWidth2"
            ( stylesheet
                [ class "one"
                    [ borderWidth2 (px 4) (pc 2)
                    ]
                , class "two"
                    [ borderWidth2 thick (px 100)
                    ]
                , class "three"
                    [ borderWidth2 (rem 2) (em 16)
                    ]
                ]
            )
            (
            """
            .one {
                border-width:4px 2pc;
            }

            .two {
                border-width:thick 100px;
            }

            .three {
                border-width:2rem 16em;
            }
            """
            )


width3Test : Test
width3Test =
    Compile.test
            "borderWidth3"
            ( stylesheet
                [ class "one"
                    [ borderWidth3 (px 18) (rem 444) (inch 10)
                    ]
                , class "two"
                    [ borderWidth3 (cm 12) thin (pt 18)
                    ]
                ]
            )
            (
            """
            .one {
                border-width:18px 444rem 10in;
            }

            .two {
                border-width:12cm thin 18pt;
            }

            """
            )

width4Test : Test
width4Test =
    Compile.test
            "borderWidth4"
            ( stylesheet
                [ class "one"
                    [ borderWidth4 (q 18) zero medium (vh 10)
                    ]
                , class "two"
                    [ borderWidth4 (vmax 1) (ex 18) (cm 10) (em 20)
                    ]

                ]
            )
            (
            """
            .one {
                border-width:18Q 0 medium 10vh;
            }

            .two {
                border-width:1vmax 18ex 10cm 20em;
            }
            """
            )


borderColorTest : Test
borderColorTest = colorTest "borderColor" borderColor "border-color"

color2Test : Test
color2Test =
    Compile.test
            "borderColor2"
            ( stylesheet
                [ class "one"
                    [ borderColor2 (hsla 200 0.51 0.24 0.5) (hex "ff0000")
                    ]
                , class "two"
                    [ borderColor2 currentcolor (hsl 2 0.51 0.9)
                    ]
                , class "three"
                    [ borderColor2 (rgb 2 1 20) (rgba 16 200 128 0.5)
                    ]
                ]
            )
            (
            """
            .one {
                border-color:hsla(200,51%,24%,0.5) #ff0000;
            }

            .two {
                border-color:currentcolor hsl(2,51%,90%);
            }

            .three {
                border-color:rgb(2,1,20) rgba(16,200,128,0.5);
            }
            """
            )


color3Test : Test
color3Test =
    Compile.test
            "borderColor3"
            ( stylesheet
                [ class "one"
                    [ borderColor3 (hsla 200 0.51 0.24 0.5) (hex "ff0000") (hex "999")
                    ]
                , class "two"
                    [ borderColor3 currentcolor (hsl 2 0.51 0.9) (rgb 100 200 244)
                    ]
                , class "three"
                    [ borderColor3 (rgb 2 1 20) (hex "384120") (rgba 16 200 128 0.5)
                    ]
                ]
            )
            (
            """
            .one {
                border-color:hsla(200,51%,24%,0.5) #ff0000 #999;
            }

            .two {
                border-color:currentcolor hsl(2,51%,90%) rgb(100,200,244);
            }

            .three {
                border-color:rgb(2,1,20) #384120 rgba(16,200,128,0.5);
            }
            """
            )

color4Test : Test
color4Test =
    Compile.test
            "borderColor4"
            ( stylesheet
                [ class "one"
                    [ borderColor4 (hsla 200 0.51 0.24 0.5) (hex "ff0000") (hex "999") currentcolor
                    ]
                ]
            )
            (
            """
            .one {
                border-color:hsla(200,51%,24%,0.5) #ff0000 #999 currentcolor;
            }

            """
            )


------------------ absolute

------- top

borderTopTest : Test
borderTopTest = oneSideOneValTest "borderTop" borderTop "border-top"

borderTop2Test : Test
borderTop2Test = oneSideTwoValTest "borderTop2" borderTop2 "border-top"

borderTop3Test : Test
borderTop3Test = oneSideThreeValTest "borderTop3" borderTop3 "border-top"

borderTopStyleTest : Test
borderTopStyleTest = styleTest "borderTopStyle" borderTopStyle "border-top-style"

borderTopWidthTest : Test
borderTopWidthTest = widthTest "borderTopWidth" borderTopWidth "border-top-width"

borderTopColorTest : Test
borderTopColorTest = colorTest "borderTopColor" borderTopColor "border-top-color"

------- right

borderRightTest : Test
borderRightTest = oneSideOneValTest "borderRight" borderRight "border-right"

borderRight2Test : Test
borderRight2Test = oneSideTwoValTest "borderRight2" borderRight2 "border-right"

borderRight3Test : Test
borderRight3Test = oneSideThreeValTest "borderRight3" borderRight3 "border-right"

borderRightStyleTest : Test
borderRightStyleTest = styleTest "borderRightStyle" borderRightStyle "border-right-style"

borderRightWidthTest : Test
borderRightWidthTest = widthTest "borderRightWidth" borderRightWidth "border-right-width"

borderRightColorTest : Test
borderRightColorTest = colorTest "borderRightColor" borderRightColor "border-right-color"

------- bottom

borderBottomTest : Test
borderBottomTest = oneSideOneValTest "borderBottom" borderBottom "border-bottom"

borderBottom2Test : Test
borderBottom2Test = oneSideTwoValTest "borderBottom2" borderBottom2 "border-bottom"

borderBottom3Test : Test
borderBottom3Test = oneSideThreeValTest "borderBottom3" borderBottom3 "border-bottom"

borderBottomStyleTest : Test
borderBottomStyleTest = styleTest "borderBottomStyle" borderBottomStyle "border-bottom-style"

borderBottomWidthTest : Test
borderBottomWidthTest = widthTest "borderBottomWidth" borderBottomWidth "border-bottom-width"

borderBottomColorTest : Test
borderBottomColorTest = colorTest "borderBottomColor" borderBottomColor "border-bottom-color"

------- left

borderLeftTest : Test
borderLeftTest = oneSideOneValTest "borderLeft" borderLeft "border-left"

borderLeft2Test : Test
borderLeft2Test = oneSideTwoValTest "borderLeft2" borderLeft2 "border-left"

borderLeft3Test : Test
borderLeft3Test = oneSideThreeValTest "borderLeft3" borderLeft3 "border-left"

borderLeftStyleTest : Test
borderLeftStyleTest = styleTest "borderLeftStyle" borderLeftStyle "border-left-style"

borderLeftWidthTest : Test
borderLeftWidthTest = widthTest "borderLeftWidth" borderLeftWidth "border-left-width"

borderLeftColorTest : Test
borderLeftColorTest = colorTest "borderLeftColor" borderLeftColor "border-left-color"




------------------ logical

------- block

borderBlockTest : Test
borderBlockTest = oneSideOneValTest "borderBlock" borderBlock "border-block"

borderBlock2Test : Test
borderBlock2Test = oneSideTwoValTest "borderBlock2" borderBlock2 "border-block"

borderBlock3Test : Test
borderBlock3Test = oneSideThreeValTest "borderBlock3" borderBlock3 "border-block"

borderBlockStyleTest : Test
borderBlockStyleTest = styleTest "borderBlockStyle" borderBlockStyle "border-block-style"

borderBlockWidthTest : Test
borderBlockWidthTest = widthTest "borderBlockWidth" borderBlockWidth "border-block-width"

borderBlockColorTest : Test
borderBlockColorTest = colorTest "borderBlockColor" borderBlockColor "border-block-color"

------- block start

borderBlockStartTest : Test
borderBlockStartTest = oneSideOneValTest "borderBlockStart" borderBlockStart "border-block-start"

borderBlockStart2Test : Test
borderBlockStart2Test = oneSideTwoValTest "borderBlockStart2" borderBlockStart2 "border-block-start"

borderBlockStart3Test : Test
borderBlockStart3Test = oneSideThreeValTest "borderBlockStart3" borderBlockStart3 "border-block-start"

borderBlockStartStyleTest : Test
borderBlockStartStyleTest = styleTest "borderBlockStartStyle" borderBlockStartStyle "border-block-start-style"

borderBlockStartWidthTest : Test
borderBlockStartWidthTest = widthTest "borderBlockStartWidth" borderBlockStartWidth "border-block-start-width"

borderBlockStartColorTest : Test
borderBlockStartColorTest = colorTest "borderBlockStartColor" borderBlockStartColor "border-block-start-color"

------- block end

borderBlockEndTest : Test
borderBlockEndTest = oneSideOneValTest "borderBlockEnd" borderBlockEnd "border-block-end"

borderBlockEnd2Test : Test
borderBlockEnd2Test = oneSideTwoValTest "borderBlockEnd2" borderBlockEnd2 "border-block-end"

borderBlockEnd3Test : Test
borderBlockEnd3Test = oneSideThreeValTest "borderBlockEnd3" borderBlockEnd3 "border-block-end"

borderBlockEndStyleTest : Test
borderBlockEndStyleTest = styleTest "borderBlockEndStyle" borderBlockEndStyle "border-block-end-style"

borderBlockEndWidthTest : Test
borderBlockEndWidthTest = widthTest "borderBlockEndWidth" borderBlockEndWidth "border-block-end-width"

borderBlockEndColorTest : Test
borderBlockEndColorTest = colorTest "borderBlockEndColor" borderBlockEndColor "border-block-end-color"

------- inline

borderInlineTest : Test
borderInlineTest = oneSideOneValTest "borderInline" borderInline "border-inline"

borderInline2Test : Test
borderInline2Test = oneSideTwoValTest "borderInline2" borderInline2 "border-inline"

borderInline3Test : Test
borderInline3Test = oneSideThreeValTest "borderInline3" borderInline3 "border-inline"

borderInlineStyleTest : Test
borderInlineStyleTest = styleTest "borderInlineStyle" borderInlineStyle "border-inline-style"

borderInlineWidthTest : Test
borderInlineWidthTest = widthTest "borderInlineWidth" borderInlineWidth "border-inline-width"

borderInlineColorTest : Test
borderInlineColorTest = colorTest "borderInlineColor" borderInlineColor "border-inline-color"


------- inline start

borderInlineStartTest : Test
borderInlineStartTest = oneSideOneValTest "borderInlineStart" borderInlineStart "border-inline-start"

borderInlineStart2Test : Test
borderInlineStart2Test = oneSideTwoValTest "borderInlineStart2" borderInlineStart2 "border-inline-start"

borderInlineStart3Test : Test
borderInlineStart3Test = oneSideThreeValTest "borderInlineStart3" borderInlineStart3 "border-inline-start"

borderInlineStartStyleTest : Test
borderInlineStartStyleTest = styleTest "borderInlineStartStyle" borderInlineStartStyle "border-inline-start-style"

borderInlineStartWidthTest : Test
borderInlineStartWidthTest = widthTest "borderInlineStartWidth" borderInlineStartWidth "border-inline-start-width"

borderInlineStartColorTest : Test
borderInlineStartColorTest = colorTest "borderInlineStartColor" borderInlineStartColor "border-inline-start-color"


------- inline end

borderInlineEndTest : Test
borderInlineEndTest = oneSideOneValTest "borderInlineEnd" borderInlineEnd "border-inline-end"

borderInlineEnd2Test : Test
borderInlineEnd2Test = oneSideTwoValTest "borderInlineEnd2" borderInlineEnd2 "border-inline-end"

borderInlineEnd3Test : Test
borderInlineEnd3Test = oneSideThreeValTest "borderInlineEnd3" borderInlineEnd3 "border-inline-end"

borderInlineEndStyleTest : Test
borderInlineEndStyleTest = styleTest "borderInlineEndStyle" borderInlineEndStyle "border-inline-end-style"

borderInlineEndWidthTest : Test
borderInlineEndWidthTest = widthTest "borderInlineEndWidth" borderInlineEndWidth "border-inline-end-width"

borderInlineEndColorTest : Test
borderInlineEndColorTest = colorTest "borderInlineEndColor" borderInlineEndColor "border-inline-end-color"
