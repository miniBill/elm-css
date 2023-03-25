module Property.Border exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest as Test
import Test exposing (Test)


test2 propertyUnderTest =
    [ ( propertyUnderTest (px 1) solid, "1px solid" )
    , ( propertyUnderTest (rem 11) dotted, "11rem dotted" )
    , ( propertyUnderTest (pc 20) dashed, "20pc dashed" )
    , ( propertyUnderTest (px 1) ridge, "1px ridge" )
    ]

test3 propertyUnderTest =
    [ ( propertyUnderTest (px 1) solid (hex "#000"), "1px solid #000" )
    , ( propertyUnderTest (rem 11) dotted (rgb 111 230 122), "11rem dotted rgb(111,230,122)" )
    , ( propertyUnderTest (pc 20) dashed currentcolor, "20pc dashed currentcolor" )
    , ( propertyUnderTest (px 1) ridge (hsl 33 0.1 0.5), "1px ridge hsl(33,10%,50%)" )
    ]
all : Test
all =
    Test.concat
        [ Test.property1 border
            { functionName = "border", propertyName = "border" }
            Test.length
        , Test.property
            { functionName = "border2", propertyName = "border" }
            (test2 border2)
        , Test.property
            { functionName = "border3", propertyName = "border" }
            (test3 border3)



        -- combined in absolute direction
        -----------------------------------------------------
        , Test.property1 borderTop
            { functionName = "borderTop", propertyName = "border-top" }
            Test.length
        , Test.property
            { functionName = "borderTop2", propertyName = "border-top" }
            (test2 borderTop2)
        , Test.property
            { functionName = "borderTop3", propertyName = "border-top" }
            (test3 borderTop3)
        
        , Test.property1 borderRight
            { functionName = "borderRight", propertyName = "border-right" }
            Test.length
        , Test.property
            { functionName = "borderRight2", propertyName = "border-right" }
            (test2 borderRight2)
        , Test.property
            { functionName = "borderRight3", propertyName = "border-right" }
            (test3 borderRight3)
        
        , Test.property1 borderBottom
            { functionName = "borderBottom", propertyName = "border-bottom" }
            Test.length
        , Test.property
            { functionName = "borderBottom2", propertyName = "border-bottom" }
            (test2 borderBottom2)
        , Test.property
            { functionName = "borderBottom3", propertyName = "border-bottom" }
            (test3 borderBottom3)

        , Test.property1 borderLeft
            { functionName = "borderLeft", propertyName = "border-left" }
            Test.length
        , Test.property
            { functionName = "borderLeft2", propertyName = "border-left" }
            (test2 borderLeft2)
        , Test.property
            { functionName = "borderLeft3", propertyName = "border-left" }
            (test3 borderLeft3)



        -- combined in logical direction
        -----------------------------------------------------
        , Test.property1 borderBlock
            { functionName = "borderBlock", propertyName = "border-block" }
            Test.length
        , Test.property
            { functionName = "borderBlock2", propertyName = "border-block" }
            (test2 borderBlock2)
        , Test.property
            { functionName = "borderBlock3", propertyName = "border-block" }
            (test3 borderBlock3)
        
        , Test.property1 borderBlockStart
            { functionName = "borderBlockStart", propertyName = "border-block-start" }
            Test.length
        , Test.property
            { functionName = "borderBlockStart2", propertyName = "border-block-start" }
            (test2 borderBlockStart2)
        , Test.property
            { functionName = "borderBlockStart3", propertyName = "border-block-start" }
            (test3 borderBlockStart3)
        
        , Test.property1 borderBlockEnd
            { functionName = "borderBlockEnd", propertyName = "border-block-end" }
            Test.length
        , Test.property
            { functionName = "borderBlockEnd2", propertyName = "border-block-end" }
            (test2 borderBlockEnd2)
        , Test.property
            { functionName = "borderBlockEnd3", propertyName = "border-block-end" }
            (test3 borderBlockEnd3)
        
        , Test.property1 borderInline
            { functionName = "borderInline", propertyName = "border-inline" }
            Test.length
        , Test.property
            { functionName = "borderInline2", propertyName = "border-inline" }
            (test2 borderInline2)
        , Test.property
            { functionName = "borderInline3", propertyName = "border-inline" }
            (test3 borderInline3)

        , Test.property1 borderInlineStart
            { functionName = "borderInlineStart", propertyName = "border-inline-start" }
            Test.length
        , Test.property
            { functionName = "borderInlineStart2", propertyName = "border-inline-start" }
            (test2 borderInlineStart2)
        , Test.property
            { functionName = "borderInlineStart3", propertyName = "border-inline-start" }
            (test3 borderInlineStart3)
        
        , Test.property1 borderInlineEnd
            { functionName = "borderInlineEnd", propertyName = "border-inline-end" }
            Test.length
        , Test.property
            { functionName = "borderInlineEnd2", propertyName = "border-inline-end" }
            (test2 borderInlineEnd2)
        , Test.property
            { functionName = "borderInlineEnd3", propertyName = "border-inline-end" }
            (test3 borderInlineEnd3)



        -- border style
        -----------------------------------------------------
        , Test.property1 borderStyle
            { functionName = "borderStyle", propertyName = "border-style" }
            Test.lineStyle
        
        , Test.property 
            { functionName = "borderStyle2", propertyName = "border-style" }
            [ ( borderStyle2 none groove, "none groove" )
            , ( borderStyle2 groove ridge, "groove ridge" )
            , ( borderStyle2 inset_ double, "inset double" )
            , ( borderStyle2 outset dotted, "outset dotted" )
            ]
        
        , Test.property 
            { functionName = "borderStyle3", propertyName = "border-style" }
            [ ( borderStyle3 none groove solid, "none groove solid" )
            , ( borderStyle3 groove double ridge, "groove double ridge" )
            , ( borderStyle3 inset_ dashed double, "inset dashed double")
            ]

        , Test.property 
            { functionName = "borderStyle4", propertyName = "border-style" }
            [ ( borderStyle4 none groove solid ridge, "none groove solid ridge" )
            , ( borderStyle4 groove double ridge dashed, "groove double ridge dashed" )
            ]

        , Test.property1 borderTopStyle
            { functionName = "borderTopStyle", propertyName = "border-top-style" }
            Test.lineStyle
        
        , Test.property1 borderRightStyle
            { functionName = "borderRightStyle", propertyName = "border-right-style" }
            Test.lineStyle
        
        , Test.property1 borderBottomStyle
            { functionName = "borderBottomStyle", propertyName = "border-bottom-style" }
            Test.lineStyle

        , Test.property1 borderLeftStyle
            { functionName = "borderLeftStyle", propertyName = "border-left-style" }
            Test.lineStyle

        , Test.property1 borderBlockStyle
            { functionName = "borderBlockStyle", propertyName = "border-block-style" }
            Test.lineStyle
        
        , Test.property1 borderBlockStartStyle
            { functionName = "borderBlockStartStyle", propertyName = "border-block-start-style" }
            Test.lineStyle
        
        , Test.property1 borderBlockEndStyle
            { functionName = "borderBlockEndStyle", propertyName = "border-block-end-style" }
            Test.lineStyle
        
        , Test.property1 borderInlineStyle
            { functionName = "borderInlineStyle", propertyName = "border-inline-style" }
            Test.lineStyle
        
        , Test.property1 borderInlineStartStyle
            { functionName = "borderInlineStartStyle", propertyName = "border-inline-start-style" }
            Test.lineStyle
        
        , Test.property1 borderInlineEndStyle
            { functionName = "borderInlineEndStyle", propertyName = "border-inline-end-style" }
            Test.lineStyle



        -- border width
        -----------------------------------------------------
        , Test.property1 borderWidth
            { functionName = "borderWidth", propertyName = "border-width" }
            Test.lineWidth

        , Test.property { functionName = "borderWidth2", propertyName = "border-width" }
            ([ ( borderWidth2 thin medium, "thin medium" )
             , ( borderWidth2 medium thick, "medium thick" )
             , ( borderWidth2 thick thin, "thick thin" )
             ]
                ++ Test.length2 borderWidth2
            )
        , Test.property { functionName = "borderWidth3", propertyName = "border-width" }
            ([ ( borderWidth3 thin medium thick, "thin medium thick" )
             , ( borderWidth3 medium thick thin, "medium thick thin" )
             , ( borderWidth3 thick thin medium, "thick thin medium" )
             ]
                ++ Test.length3 borderWidth3
            )
        , Test.property { functionName = "borderWidth4", propertyName = "border-width" }
            ([ ( borderWidth4 thin medium thick thin, "thin medium thick thin" )
             , ( borderWidth4 medium thick thin thick, "medium thick thin thick" )
             , ( borderWidth4 thick thin medium medium, "thick thin medium medium" )
             ]
                ++ Test.length4 borderWidth4
            )
        
        , Test.property1 borderTopWidth
            { functionName = "borderTopWidth", propertyName = "border-top-width" }
            Test.lineWidth
        
        , Test.property1 borderRightWidth
            { functionName = "borderRightWidth", propertyName = "border-right-width" }
            Test.lineWidth
        
        , Test.property1 borderBottomWidth
            { functionName = "borderBottomWidth", propertyName = "border-bottom-width" }
            Test.lineWidth

        , Test.property1 borderLeftWidth
            { functionName = "borderLeftWidth", propertyName = "border-left-width" }
            Test.lineWidth

        , Test.property1 borderBlockWidth
            { functionName = "borderBlockWidth", propertyName = "border-block-width" }
            Test.lineWidth
        
        , Test.property1 borderBlockStartWidth
            { functionName = "borderBlockStartWidth", propertyName = "border-block-start-width" }
            Test.lineWidth
        
        , Test.property1 borderBlockEndWidth
            { functionName = "borderBlockEndWidth", propertyName = "border-block-end-width" }
            Test.lineWidth
        
        , Test.property1 borderInlineWidth
            { functionName = "borderInlineWidth", propertyName = "border-inline-width" }
            Test.lineWidth
        
        , Test.property1 borderInlineStartWidth
            { functionName = "borderInlineStartWidth", propertyName = "border-inline-start-width" }
            Test.lineWidth
        
        , Test.property1 borderInlineEndWidth
            { functionName = "borderInlineEndWidth", propertyName = "border-inline-end-width" }
            Test.lineWidth



        -- border color
        -----------------------------------------------------
        , Test.property1 borderColor
            { functionName = "borderColor", propertyName = "border-color" }
            Test.color
        
        , Test.property
            { functionName = "borderColor2", propertyName = "border-color"}
            (Test.color2 borderColor2)
        , Test.property

            { functionName = "borderColor3", propertyName = "border-color"}
            (Test.color3 borderColor3)
        , Test.property

            { functionName = "borderColor4", propertyName = "border-color"}
            (Test.color4 borderColor4)
        
        , Test.property1 borderTopColor
            { functionName = "borderTopColor", propertyName = "border-top-color" }
            Test.color
        
        , Test.property1 borderRightColor
            { functionName = "borderRightColor", propertyName = "border-right-color" }
            Test.color
        
        , Test.property1 borderBottomColor
            { functionName = "borderBottomColor", propertyName = "border-bottom-color" }
            Test.color

        , Test.property1 borderLeftColor
            { functionName = "borderLeftColor", propertyName = "border-left-color" }
            Test.color

        , Test.property1 borderBlockColor
            { functionName = "borderBlockColor", propertyName = "border-block-color" }
            Test.color
        
        , Test.property1 borderBlockStartColor
            { functionName = "borderBlockStartColor", propertyName = "border-block-start-color" }
            Test.color
        
        , Test.property1 borderBlockEndColor
            { functionName = "borderBlockEndColor", propertyName = "border-block-end-color" }
            Test.color
        
        , Test.property1 borderInlineColor
            { functionName = "borderIncolor", propertyName = "border-inline-color" }
            Test.color
        
        , Test.property1 borderInlineStartColor
            { functionName = "borderInlineStartColor", propertyName = "border-inline-start-color" }
            Test.color
        
        , Test.property1 borderInlineEndColor
            { functionName = "borderInlineEndColor", propertyName = "border-inline-end-color" }
            Test.color
        ]
