module Specific.Property.TypeBasic exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 color
            { functionName = "color", propertyName = "color" }
            CssTest.color
        
        , CssTest.property1 fontSize
            { functionName = "fontSize", propertyName = "font-size" }
            (   [ ( xxSmall, "xx-small" )
                , ( xSmall, "x-small" )
                , ( small, "small" )
                , ( medium, "medium" )
                , ( large, "large" )
                , ( xLarge, "x-large" )
                , ( xxLarge, "xx-large" )
                , ( xxxLarge, "xxx-large" )
                , ( smaller, "smaller" )
                , ( larger, "larger" )
                , ( pct 90, "90%" )
                ]
                ++ CssTest.length
            )
        
        , CssTest.property1 fontSizeAdjust
            { functionName = "fontSizeAdjust", propertyName = "font-size-adjust" }
            [ ( none, "none" )
            , ( num 0.5, "0.5" )
            ]

        , CssTest.property1 fontWeight
            { functionName = "fontWeight", propertyName = "font-weight" }
            [ ( bold, "bold" )
            , ( normal, "normal" )
            , ( bolder, "bolder" )
            , ( lighter, "lighter" )
            , ( int 100, "100" )
            , ( int 200, "200" )
            , ( int 300, "300" )
            , ( int 400, "400" )
            , ( int 500, "500" )
            , ( int 600, "600" )
            , ( int 700, "700" )
            , ( int 800, "800" )
            , ( int 900, "900" )
            ]
            
        , CssTest.property1 fontStyle
            { functionName = "fontStyle", propertyName = "font-style" }
            [ ( normal, "normal" )
            , ( italic, "italic" )
            , ( oblique, "oblique" )
            ]

        , CssTest.property1 fontStretch
            { functionName = "fontStretch", propertyName = "font-stretch" }
            [ ( ultraCondensed, "ultra-condensed" )
            , ( extraCondensed, "extra-condensed" )
            , ( condensed, "condensed" )
            , ( semiCondensed, "semi-condensed" )
            , ( normal, "normal" )
            , ( semiExpanded, "semi-expanded" )
            , ( expanded, "expanded" )
            , ( extraExpanded, "extra-expanded" )
            , ( ultraExpanded, "ultra-expanded" )
            , ( pct 10, "10%" )
            ]
        
        , CssTest.property1 fontSynthesis
            { functionName = "fontSynthesis", propertyName = "font-synthesis" }
            [ ( none, "none" )
            , ( weight, "weight" )
            , ( style, "style" )
            , ( smallCaps, "small-caps" )
            ]

        , CssTest.property
            { functionName = "fontSynthesis2", propertyName = "font-synthesis" }
            [ ( fontSynthesis2 weight style, "weight style" )
            , ( fontSynthesis2 smallCaps style, "small-caps style" )
            , ( fontSynthesis2 weight smallCaps, "weight small-caps" )
            ]

        , CssTest.property
            { functionName = "fontSynthesis3", propertyName = "font-synthesis" }
            [ ( fontSynthesis3 weight style smallCaps, "weight style small-caps" )
            ]

        , CssTest.property1 fontVariationSettings
            { functionName = "fontVariationSettings", propertyName = "font-variation-settings" }
            [ ( normal, "normal")
            ]
        
        , CssTest.property
            { functionName = "fontVariationSettingsMany", propertyName = "font-variation-settings" }
            [ ( fontVariationSettingsMany [], "unset" )
            , ( fontVariationSettingsMany [ ("XHGT", 0.7) ], "\"XHGT\" 0.7" )
            , ( fontVariationSettingsMany [ ("wdth", 0.3), ("wght", 800) ], "\"wdth\" 0.3, \"wght\" 800" )
            ]
        
        ]
