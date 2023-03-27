module Specific.Property.Size exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 width
            { functionName = "width", propertyName = "width" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 minWidth
            { functionName = "minWidth", propertyName = "min-width" }
            ([ ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 maxWidth
            { functionName = "maxWidth", propertyName = "max-width" }
            ([ ( none, "none" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 height
            { functionName = "height", propertyName = "height" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 minHeight
            { functionName = "minHeight", propertyName = "min-height" }
            ([ ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 maxHeight
            { functionName = "maxHeight", propertyName = "max-height" }
            ([ ( none, "none" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        ,  CssTest.property1 blockSize
            { functionName = "blockSize", propertyName = "block-size" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 minBlockSize
            { functionName = "minBlockSize", propertyName = "min-block-size" }
            ([ ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 maxBlockSize
            { functionName = "maxBlockSize", propertyName = "max-block-size" }
            ([ ( none, "none" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        ,  CssTest.property1 inlineSize
            { functionName = "inlineSize", propertyName = "inline-size" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 minInlineSize
            { functionName = "minInlineSize", propertyName = "min-inline-size" }
            ([ ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )

        , CssTest.property1 maxInlineSize
            { functionName = "maxInlineSize", propertyName = "max-inline-size" }
            ([ ( none, "none" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( fitContentTo (pct 20), "fit-content(20%)" )
             , ( pct 90, "90%" )
             ]
                ++ CssTest.length
            )
        ]
