module Property.ScrollPadding exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 scrollPadding
            { functionName = "scrollPadding", propertyName = "scroll-padding" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "scrollPadding2", propertyName = "scroll-padding" }
            (   [ ( scrollPadding2 (pct 30) (pct 42), "30% 42%")
                , ( scrollPadding2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 scrollPadding2
            )


        , CssTest.property
            { functionName = "scrollPadding3", propertyName = "scroll-padding" }
            (   [ ( scrollPadding3 (pct 30) (pct 42) (pct 1), "30% 42% 1%")
                , ( scrollPadding3 auto auto auto, "auto auto auto" )
                ]
                ++ CssTest.length3 scrollPadding3
            )
            
        
        , CssTest.property
            { functionName = "scrollPadding4", propertyName = "scroll-padding" }
            (   [ ( scrollPadding4 (pct 99) (pct 30) (pct 42) (pct 1), "99% 30% 42% 1%" )
                , ( scrollPadding4 auto auto auto auto, "auto auto auto auto" )
                ]
                ++ CssTest.length4 scrollPadding4
            )
            

        , CssTest.property1 scrollPaddingTop
            { functionName = "scrollPaddingTop", propertyName = "scroll-padding-top" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingRight
            { functionName = "scrollPaddingRight", propertyName = "scroll-padding-right" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingBottom
            { functionName = "scrollPaddingBottom", propertyName = "scroll-padding-bottom" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingLeft
            { functionName = "scrollPaddingLeft", propertyName = "scroll-padding-left" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingBlock
            { functionName = "scrollPaddingBlock", propertyName = "scroll-padding-block" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "scrollPaddingBlock2", propertyName = "scroll-padding-block" }
            (   [ ( scrollPaddingBlock2 (pct 30) (pct 42), "30% 42%")
                , ( scrollPaddingBlock2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 scrollPaddingBlock2
            )
        
        , CssTest.property1 scrollPaddingBlockStart
            { functionName = "scrollPaddingBlockStart", propertyName = "scroll-padding-block-start" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingBlockEnd
            { functionName = "scrollPaddingBlockEnd", propertyName = "scroll-padding-block-end" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingInline
            { functionName = "scrollPaddingInline", propertyName = "scroll-padding-inline" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "scrollPaddingInline2", propertyName = "scroll-padding-inline" }
            (   [ ( scrollPaddingInline2 (pct 30) (pct 42), "30% 42%")
                , ( scrollPaddingInline2 auto auto, "auto auto" )
                ]
                ++ CssTest.length2 scrollPaddingInline2
            )
        
        , CssTest.property1 scrollPaddingInlineStart
            { functionName = "scrollPaddingInlineStart", propertyName = "scroll-padding-inline-start" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 scrollPaddingInlineEnd
            { functionName = "scrollPaddingInlineEnd", propertyName = "scroll-padding-inline-end" }
            (   [ (pct 10, "10%") 
                , (auto, "auto")
                ]
                ++ CssTest.length
            )
        ]
