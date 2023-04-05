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
            { functionName = "fontFamilyMany", propertyName = "font-family" }
            [ ( fontFamilyMany [ "Gill Sans", "Helvetica" ] serif, "\"Gill Sans\",\"Helvetica\",serif" )
            , ( fontFamilyMany [ "Georgia", "Times" ] sansSerif, "\"Georgia\",\"Times\",sans-serif" )
            , ( fontFamilyMany [ "Source Code Pro", "Lucida Console" ] monospace, "\"Source Code Pro\",\"Lucida Console\",monospace" )
            , ( fontFamilyMany [ "Brush Script Std", "Lucida Calligraphy" ] cursive, "\"Brush Script Std\",\"Lucida Calligraphy\",cursive")
            , ( fontFamilyMany [ "Herculanum", "Harrington" ] fantasy, "\"Herculanum\",\"Harrington\",fantasy")
            , ( fontFamilyMany [ "San Francisco", "Segoe UI" ] systemUi, "\"San Francisco\",\"Segoe UI\",system-ui" )
            , ( fontFamilyMany [ "Georgia", "Times" ] uiSerif, "\"Georgia\",\"Times\",ui-serif" )
            , ( fontFamilyMany [ "San Francisco", "Segoe UI" ] uiSansSerif, "\"San Francisco\",\"Segoe UI\",ui-sans-serif" )
            , ( fontFamilyMany [ "San Francisco", "Segoe UI" ] uiMonospace, "\"San Francisco\",\"Segoe UI\",ui-monospace" )
            , ( fontFamilyMany [ "Gill Sans", "Helvetica" ] uiRounded, "\"Gill Sans\",\"Helvetica\",ui-rounded" )
            , ( fontFamilyMany [ "Apple Color Emoji" ] emoji, "\"Apple Color Emoji\",emoji" )
            , ( fontFamilyMany [ "Georgia", "Times" ] math, "\"Georgia\",\"Times\",math" )
            , ( fontFamilyMany [ "Georgia", "Times" ] fangsong, "\"Georgia\",\"Times\",fangsong" )
            ]
        ]
