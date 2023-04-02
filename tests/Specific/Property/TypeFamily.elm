module Specific.Property.TypeFamily exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 fontFamily
            { functionName = "fontFamily", propertyName = "font-family" }
            [ ( serif, "serif" )
            , ( sansSerif, "sans-serif" )
            , ( monospace, "monospace" )
            , ( cursive, "cursive" )
            , ( fantasy, "fantasy" )
            , ( systemUi, "system-ui" )
            , ( uiSerif, "ui-serif" )
            , ( uiSansSerif, "ui-sans-serif" )
            , ( uiMonospace, "ui-monospace" )
            , ( uiRounded, "ui-rounded" )
            , ( emoji, "emoji" )
            , ( math, "math" )
            , ( fangsong, "fangsong" )
            ]
        , CssTest.property
            { functionName = "fontFamilies", propertyName = "font-family" }
            [ ( fontFamilies [ "Gill Sans", "Helvetica" ] serif, "\"Gill Sans\",\"Helvetica\",serif" )
            , ( fontFamilies [ "Georgia", "Times" ] sansSerif, "\"Georgia\",\"Times\",sans-serif" )
            , ( fontFamilies [ "Source Code Pro", "Lucida Console" ] monospace, "\"Source Code Pro\",\"Lucida Console\",monospace" )
            , ( fontFamilies [ "Brush Script Std", "Lucida Calligraphy" ] cursive, "\"Brush Script Std\",\"Lucida Calligraphy\",cursive")
            , ( fontFamilies [ "Herculanum", "Harrington" ] fantasy, "\"Herculanum\",\"Harrington\",fantasy")
            , ( fontFamilies [ "San Francisco", "Segoe UI" ] systemUi, "\"San Francisco\",\"Segoe UI\",system-ui" )
            , ( fontFamilies [ "Georgia", "Times" ] uiSerif, "\"Georgia\",\"Times\",ui-serif" )
            , ( fontFamilies [ "San Francisco", "Segoe UI" ] uiSansSerif, "\"San Francisco\",\"Segoe UI\",ui-sans-serif" )
            , ( fontFamilies [ "San Francisco", "Segoe UI" ] uiMonospace, "\"San Francisco\",\"Segoe UI\",ui-monospace" )
            , ( fontFamilies [ "Gill Sans", "Helvetica" ] uiRounded, "\"Gill Sans\",\"Helvetica\",ui-rounded" )
            , ( fontFamilies [ "Apple Color Emoji" ] emoji, "\"Apple Color Emoji\",emoji" )
            , ( fontFamilies [ "Georgia", "Times" ] math, "\"Georgia\",\"Times\",math" )
            , ( fontFamilies [ "Georgia", "Times" ] fangsong, "\"Georgia\",\"Times\",fangsong" )
            ]
        ]
