module Specific.Property.ScrollMargin exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 scrollMargin
            { functionName = "scrollMargin", propertyName = "scroll-margin" }
            CssTest.length
        
        , CssTest.property
            { functionName = "scrollMargin2", propertyName = "scroll-margin" }
            (CssTest.length2 scrollMargin2)

        , CssTest.property
            { functionName = "scrollMargin3", propertyName = "scroll-margin" }
            (CssTest.length3 scrollMargin3)

        , CssTest.property
            { functionName = "scrollMargin4", propertyName = "scroll-margin" }
            (CssTest.length4 scrollMargin4)

        , CssTest.property1 scrollMarginTop
            { functionName = "scrollMarginTop", propertyName = "scroll-margin-top" }
            CssTest.length

        , CssTest.property1 scrollMarginRight
            { functionName = "scrollMarginRight", propertyName = "scroll-margin-right" }
            CssTest.length
        
        , CssTest.property1 scrollMarginBottom
            { functionName = "scrollMarginBottom", propertyName = "scroll-margin-bottom" }
            CssTest.length
        
        , CssTest.property1 scrollMarginLeft
            { functionName = "scrollMarginLeft", propertyName = "scroll-margin-left" }
            CssTest.length
        
        , CssTest.property1 scrollMarginBlock
            { functionName = "scrollMarginBlock", propertyName = "scroll-margin-block" }
            CssTest.length
        
        , CssTest.property
            { functionName = "scrollMarginBlock2", propertyName = "scroll-margin-block" }
            (CssTest.length2 scrollMarginBlock2)
        
        , CssTest.property1 scrollMarginBlockStart
            { functionName = "scrollMarginBlockStart", propertyName = "scroll-margin-block-start" }
            CssTest.length
        
        , CssTest.property1 scrollMarginBlockEnd
            { functionName = "scrollMarginBlockEnd", propertyName = "scroll-margin-block-end" }
            CssTest.length
        
        , CssTest.property1 scrollMarginInline
            { functionName = "scrollMarginInline", propertyName = "scroll-margin-inline" }
            CssTest.length
        
        , CssTest.property
            { functionName = "scrollMarginInline2", propertyName = "scroll-margin-inline" }
            (CssTest.length2 scrollMarginInline2)
        
        , CssTest.property1 scrollMarginInlineStart
            { functionName = "scrollMarginInlineStart", propertyName = "scroll-margin-inline-start" }
            CssTest.length
        
        , CssTest.property1 scrollMarginInlineEnd
            { functionName = "scrollMarginInlineEnd", propertyName = "scroll-margin-inline-end" }
            CssTest.length
        ]
