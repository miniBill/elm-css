module Specific.PsuedoElement exposing (all)

import Css exposing (..)
import Css.Global exposing (..)
import Css.Value exposing (Value(..))
import Css.Preprocess exposing (Stylesheet, stylesheet)
import CssTest
import Test exposing (Test)


commonTest : ( List Style -> Style ) -> String -> (Stylesheet, String)
commonTest psuedoElementUnderTest peName =
    ( stylesheet
        [ class "test"
            [ psuedoElementUnderTest
                [ backgroundColor (rgba 255 0 0 0.25 ) ]
            ]
        ]
    , ".test::"++peName++"{background-color:rgba(255,0,0,0.25);}"
    )

all : Test
all =
    Test.concat
        [ CssTest.stylesheet "after"
            [ ( commonTest after "after" ) ]

        , CssTest.stylesheet "backdrop"
            [ ( commonTest backdrop "backdrop" ) ]
        
        , CssTest.stylesheet "before"
            [ ( commonTest before "before" ) ]

        , CssTest.stylesheet "cue"
            [ ( commonTest cue "cue" ) ]
        
        , CssTest.stylesheet "firstLetter"
            [ ( commonTest firstLetter "first-letter" ) ]

        , CssTest.stylesheet "firstLine"
            [ ( commonTest firstLine "first-line" ) ]

        , CssTest.stylesheet "marker"
            [ ( commonTest marker "marker" ) ]

        , CssTest.stylesheet "placeholder"
            [ ( commonTest placeholder "placeholder" ) ]

        , CssTest.stylesheet "selection"
            [ ( commonTest selection "selection" ) ]

        , CssTest.stylesheet "slotted"
            [ ( commonTest (slotted "*") "slotted(*)" )
            , ( commonTest (slotted "span") "slotted(span)" )
            ]

        ]
