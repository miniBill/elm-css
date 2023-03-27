module Specific.Property.Padding exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 padding
            { functionName = "padding", propertyName = "padding" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property
            { functionName = "padding2", propertyName = "padding" }
            (   ( ( padding2 (pct 30) (pct 42), "30% 42%")
                :: CssTest.length2 padding2
                )
            )
        
        , CssTest.property
            { functionName = "padding3", propertyName = "padding" }
            (   ( ( padding3 (pct 30) (pct 42) (pct 1), "30% 42% 1%")
                :: CssTest.length3 padding3
                )
            )
        
        , CssTest.property
            { functionName = "padding4", propertyName = "padding" }
            (   ( ( padding4 (pct 99) (pct 30) (pct 42) (pct 1), "99% 30% 42% 1%")
                :: CssTest.length4 padding4
                )
            )

        , CssTest.property1 paddingTop
            { functionName = "paddingTop", propertyName = "padding-top" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingRight
            { functionName = "paddingRight", propertyName = "padding-right" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingBottom
            { functionName = "paddingBottom", propertyName = "padding-bottom" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingLeft
            { functionName = "paddingLeft", propertyName = "padding-left" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingBlock
            { functionName = "paddingBlock", propertyName = "padding-block" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property
            { functionName = "paddingBlock2", propertyName = "padding-block" }
            (   ( ( paddingBlock2 (pct 30) (pct 42), "30% 42%")
                :: CssTest.length2 paddingBlock2
                )
            )
        
        , CssTest.property1 paddingBlockStart
            { functionName = "paddingBlockStart", propertyName = "padding-block-start" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingBlockEnd
            { functionName = "paddingBlockEnd", propertyName = "padding-block-end" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingInline
            { functionName = "paddingInline", propertyName = "padding-inline" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property
            { functionName = "paddingInline2", propertyName = "padding-inline" }
            (   ( ( paddingInline2 (pct 30) (pct 42), "30% 42%")
                :: CssTest.length2 paddingInline2
                )
            )
        
        , CssTest.property1 paddingInlineStart
            { functionName = "paddingInlineStart", propertyName = "padding-inline-start" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        
        , CssTest.property1 paddingInlineEnd
            { functionName = "paddingInlineEnd", propertyName = "padding-inline-end" }
            (   ( (pct 10, "10%")
                :: CssTest.length
                )
            )
        ]
