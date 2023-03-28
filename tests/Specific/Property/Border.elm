module Specific.Property.Border exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property1 border
            { functionName = "border", propertyName = "border" }
            CssTest.length
        , CssTest.property
            { functionName = "border2", propertyName = "border" }
            (CssTest.lineWidthAndStyle border2)
        , CssTest.property
            { functionName = "border3", propertyName = "border" }
            (CssTest.lineWidthStyleAndColor border3)



        -- combined in absolute direction
        -----------------------------------------------------
        , CssTest.property1 borderTop
            { functionName = "borderTop", propertyName = "border-top" }
            CssTest.length
        , CssTest.property
            { functionName = "borderTop2", propertyName = "border-top" }
            (CssTest.lineWidthAndStyle borderTop2)
        , CssTest.property
            { functionName = "borderTop3", propertyName = "border-top" }
            (CssTest.lineWidthStyleAndColor borderTop3)
        
        , CssTest.property1 borderRight
            { functionName = "borderRight", propertyName = "border-right" }
            CssTest.length
        , CssTest.property
            { functionName = "borderRight2", propertyName = "border-right" }
            (CssTest.lineWidthAndStyle borderRight2)
        , CssTest.property
            { functionName = "borderRight3", propertyName = "border-right" }
            (CssTest.lineWidthStyleAndColor borderRight3)
        
        , CssTest.property1 borderBottom
            { functionName = "borderBottom", propertyName = "border-bottom" }
            CssTest.length
        , CssTest.property
            { functionName = "borderBottom2", propertyName = "border-bottom" }
            (CssTest.lineWidthAndStyle borderBottom2)
        , CssTest.property
            { functionName = "borderBottom3", propertyName = "border-bottom" }
            (CssTest.lineWidthStyleAndColor borderBottom3)

        , CssTest.property1 borderLeft
            { functionName = "borderLeft", propertyName = "border-left" }
            CssTest.length
        , CssTest.property
            { functionName = "borderLeft2", propertyName = "border-left" }
            (CssTest.lineWidthAndStyle borderLeft2)
        , CssTest.property
            { functionName = "borderLeft3", propertyName = "border-left" }
            (CssTest.lineWidthStyleAndColor borderLeft3)



        -- combined in logical direction
        -----------------------------------------------------
        , CssTest.property1 borderBlock
            { functionName = "borderBlock", propertyName = "border-block" }
            CssTest.length
        , CssTest.property
            { functionName = "borderBlock2", propertyName = "border-block" }
            (CssTest.lineWidthAndStyle borderBlock2)
        , CssTest.property
            { functionName = "borderBlock3", propertyName = "border-block" }
            (CssTest.lineWidthStyleAndColor borderBlock3)
        
        , CssTest.property1 borderBlockStart
            { functionName = "borderBlockStart", propertyName = "border-block-start" }
            CssTest.length
        , CssTest.property
            { functionName = "borderBlockStart2", propertyName = "border-block-start" }
            (CssTest.lineWidthAndStyle borderBlockStart2)
        , CssTest.property
            { functionName = "borderBlockStart3", propertyName = "border-block-start" }
            (CssTest.lineWidthStyleAndColor borderBlockStart3)
        
        , CssTest.property1 borderBlockEnd
            { functionName = "borderBlockEnd", propertyName = "border-block-end" }
            CssTest.length
        , CssTest.property
            { functionName = "borderBlockEnd2", propertyName = "border-block-end" }
            (CssTest.lineWidthAndStyle borderBlockEnd2)
        , CssTest.property
            { functionName = "borderBlockEnd3", propertyName = "border-block-end" }
            (CssTest.lineWidthStyleAndColor borderBlockEnd3)
        
        , CssTest.property1 borderInline
            { functionName = "borderInline", propertyName = "border-inline" }
            CssTest.length
        , CssTest.property
            { functionName = "borderInline2", propertyName = "border-inline" }
            (CssTest.lineWidthAndStyle borderInline2)
        , CssTest.property
            { functionName = "borderInline3", propertyName = "border-inline" }
            (CssTest.lineWidthStyleAndColor borderInline3)

        , CssTest.property1 borderInlineStart
            { functionName = "borderInlineStart", propertyName = "border-inline-start" }
            CssTest.length
        , CssTest.property
            { functionName = "borderInlineStart2", propertyName = "border-inline-start" }
            (CssTest.lineWidthAndStyle borderInlineStart2)
        , CssTest.property
            { functionName = "borderInlineStart3", propertyName = "border-inline-start" }
            (CssTest.lineWidthStyleAndColor borderInlineStart3)
        
        , CssTest.property1 borderInlineEnd
            { functionName = "borderInlineEnd", propertyName = "border-inline-end" }
            CssTest.length
        , CssTest.property
            { functionName = "borderInlineEnd2", propertyName = "border-inline-end" }
            (CssTest.lineWidthAndStyle borderInlineEnd2)
        , CssTest.property
            { functionName = "borderInlineEnd3", propertyName = "border-inline-end" }
            (CssTest.lineWidthStyleAndColor borderInlineEnd3)



        -- border style
        -----------------------------------------------------
        , CssTest.property1 borderStyle
            { functionName = "borderStyle", propertyName = "border-style" }
            CssTest.lineStyle
        
        , CssTest.property 
            { functionName = "borderStyle2", propertyName = "border-style" }
            [ ( borderStyle2 none groove, "none groove" )
            , ( borderStyle2 groove ridge, "groove ridge" )
            , ( borderStyle2 inset_ double, "inset double" )
            , ( borderStyle2 outset dotted, "outset dotted" )
            ]
        
        , CssTest.property 
            { functionName = "borderStyle3", propertyName = "border-style" }
            [ ( borderStyle3 none groove solid, "none groove solid" )
            , ( borderStyle3 groove double ridge, "groove double ridge" )
            , ( borderStyle3 inset_ dashed double, "inset dashed double")
            ]

        , CssTest.property 
            { functionName = "borderStyle4", propertyName = "border-style" }
            [ ( borderStyle4 none groove solid ridge, "none groove solid ridge" )
            , ( borderStyle4 groove double ridge dashed, "groove double ridge dashed" )
            ]

        , CssTest.property1 borderTopStyle
            { functionName = "borderTopStyle", propertyName = "border-top-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderRightStyle
            { functionName = "borderRightStyle", propertyName = "border-right-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderBottomStyle
            { functionName = "borderBottomStyle", propertyName = "border-bottom-style" }
            CssTest.lineStyle

        , CssTest.property1 borderLeftStyle
            { functionName = "borderLeftStyle", propertyName = "border-left-style" }
            CssTest.lineStyle

        , CssTest.property1 borderBlockStyle
            { functionName = "borderBlockStyle", propertyName = "border-block-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderBlockStartStyle
            { functionName = "borderBlockStartStyle", propertyName = "border-block-start-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderBlockEndStyle
            { functionName = "borderBlockEndStyle", propertyName = "border-block-end-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderInlineStyle
            { functionName = "borderInlineStyle", propertyName = "border-inline-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderInlineStartStyle
            { functionName = "borderInlineStartStyle", propertyName = "border-inline-start-style" }
            CssTest.lineStyle
        
        , CssTest.property1 borderInlineEndStyle
            { functionName = "borderInlineEndStyle", propertyName = "border-inline-end-style" }
            CssTest.lineStyle



        -- border width
        -----------------------------------------------------
        , CssTest.property1 borderWidth
            { functionName = "borderWidth", propertyName = "border-width" }
            CssTest.lineWidth

        , CssTest.property { functionName = "borderWidth2", propertyName = "border-width" }
            ([ ( borderWidth2 thin medium, "thin medium" )
             , ( borderWidth2 medium thick, "medium thick" )
             , ( borderWidth2 thick thin, "thick thin" )
             ]
                ++ CssTest.length2 borderWidth2
            )
        , CssTest.property { functionName = "borderWidth3", propertyName = "border-width" }
            ([ ( borderWidth3 thin medium thick, "thin medium thick" )
             , ( borderWidth3 medium thick thin, "medium thick thin" )
             , ( borderWidth3 thick thin medium, "thick thin medium" )
             ]
                ++ CssTest.length3 borderWidth3
            )
        , CssTest.property { functionName = "borderWidth4", propertyName = "border-width" }
            ([ ( borderWidth4 thin medium thick thin, "thin medium thick thin" )
             , ( borderWidth4 medium thick thin thick, "medium thick thin thick" )
             , ( borderWidth4 thick thin medium medium, "thick thin medium medium" )
             ]
                ++ CssTest.length4 borderWidth4
            )
        
        , CssTest.property1 borderTopWidth
            { functionName = "borderTopWidth", propertyName = "border-top-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderRightWidth
            { functionName = "borderRightWidth", propertyName = "border-right-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderBottomWidth
            { functionName = "borderBottomWidth", propertyName = "border-bottom-width" }
            CssTest.lineWidth

        , CssTest.property1 borderLeftWidth
            { functionName = "borderLeftWidth", propertyName = "border-left-width" }
            CssTest.lineWidth

        , CssTest.property1 borderBlockWidth
            { functionName = "borderBlockWidth", propertyName = "border-block-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderBlockStartWidth
            { functionName = "borderBlockStartWidth", propertyName = "border-block-start-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderBlockEndWidth
            { functionName = "borderBlockEndWidth", propertyName = "border-block-end-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderInlineWidth
            { functionName = "borderInlineWidth", propertyName = "border-inline-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderInlineStartWidth
            { functionName = "borderInlineStartWidth", propertyName = "border-inline-start-width" }
            CssTest.lineWidth
        
        , CssTest.property1 borderInlineEndWidth
            { functionName = "borderInlineEndWidth", propertyName = "border-inline-end-width" }
            CssTest.lineWidth



        -- border color
        -----------------------------------------------------
        , CssTest.property1 borderColor
            { functionName = "borderColor", propertyName = "border-color" }
            CssTest.color
        
        , CssTest.property
            { functionName = "borderColor2", propertyName = "border-color"}
            (CssTest.color2 borderColor2)
        , CssTest.property

            { functionName = "borderColor3", propertyName = "border-color"}
            (CssTest.color3 borderColor3)
        , CssTest.property

            { functionName = "borderColor4", propertyName = "border-color"}
            (CssTest.color4 borderColor4)
        
        , CssTest.property1 borderTopColor
            { functionName = "borderTopColor", propertyName = "border-top-color" }
            CssTest.color
        
        , CssTest.property1 borderRightColor
            { functionName = "borderRightColor", propertyName = "border-right-color" }
            CssTest.color
        
        , CssTest.property1 borderBottomColor
            { functionName = "borderBottomColor", propertyName = "border-bottom-color" }
            CssTest.color

        , CssTest.property1 borderLeftColor
            { functionName = "borderLeftColor", propertyName = "border-left-color" }
            CssTest.color

        , CssTest.property1 borderBlockColor
            { functionName = "borderBlockColor", propertyName = "border-block-color" }
            CssTest.color
        
        , CssTest.property1 borderBlockStartColor
            { functionName = "borderBlockStartColor", propertyName = "border-block-start-color" }
            CssTest.color
        
        , CssTest.property1 borderBlockEndColor
            { functionName = "borderBlockEndColor", propertyName = "border-block-end-color" }
            CssTest.color
        
        , CssTest.property1 borderInlineColor
            { functionName = "borderIncolor", propertyName = "border-inline-color" }
            CssTest.color
        
        , CssTest.property1 borderInlineStartColor
            { functionName = "borderInlineStartColor", propertyName = "border-inline-start-color" }
            CssTest.color
        
        , CssTest.property1 borderInlineEndColor
            { functionName = "borderInlineEndColor", propertyName = "border-inline-end-color" }
            CssTest.color
        ]
