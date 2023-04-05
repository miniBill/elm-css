module Specific.PseudoClass exposing (..)



import Css exposing (..)
import Css.Global exposing (..)
import Css.Value exposing (Value(..))
import Css.Preprocess exposing (Stylesheet, stylesheet)
import CssTest
import Test exposing (Test)


commonTest : ( List Style -> Style ) -> String -> (Stylesheet, String)
commonTest psuedoClassUnderTest pcName =
    ( stylesheet
        [ p
            [ psuedoClassUnderTest
                [ backgroundColor (rgba 255 0 0 0.25 ) ]
            ]
        ]
    , "p:"++pcName++"{background-color:rgba(255,0,0,0.25);}"
    )

all : Test
all =
    Test.concat
        -- without arguments
        ---------------------------------------------------
        [ CssTest.stylesheet "active"
            [ ( commonTest active "active" ) ]

        , CssTest.stylesheet "checked"
            [ ( commonTest checked "checked" ) ]

        , CssTest.stylesheet "default"
            [ ( commonTest default "default" ) ]

        , CssTest.stylesheet "defined"
            [ ( commonTest defined "defined" ) ]

        , CssTest.stylesheet "disabled"
            [ ( commonTest disabled "disabled" ) ]

        , CssTest.stylesheet "empty"
            [ ( commonTest empty "empty" ) ]

        , CssTest.stylesheet "enabled"
            [ ( commonTest enabled "enabled" ) ]

        , CssTest.stylesheet "first"
            [ ( commonTest first "first" ) ]

        , CssTest.stylesheet "firstChild"
            [ ( commonTest firstChild "first-child" ) ]

        , CssTest.stylesheet "firstOfType"
            [ ( commonTest firstOfType "first-of-type" ) ]

        , CssTest.stylesheet "focus"
            [ ( commonTest focus "focus" ) ]

        , CssTest.stylesheet "fullscreen"
            [ ( commonTest fullscreen "fullscreen" ) ]

        , CssTest.stylesheet "hover"
            [ ( commonTest hover "hover" ) ]

        , CssTest.stylesheet "inRange"
            [ ( commonTest inRange "in-range" ) ]

        , CssTest.stylesheet "indeterminate"
            [ ( commonTest indeterminate "indeterminate" ) ]

        , CssTest.stylesheet "invalid"
            [ ( commonTest invalid "invalid" ) ]

        , CssTest.stylesheet "lastChild"
            [ ( commonTest lastChild "last-child" ) ]

        , CssTest.stylesheet "lastOfType"
            [ ( commonTest lastOfType "last-of-type" ) ]
        
        , CssTest.stylesheet "leftHandPage"
            [ ( commonTest leftHandPage "left" ) ]
        
        , CssTest.stylesheet "link"
            [ ( commonTest link "link" ) ]
        
        , CssTest.stylesheet "onlyChild"
            [ ( commonTest onlyChild "only-child" ) ]
        
        , CssTest.stylesheet "onlyOfType"
            [ ( commonTest onlyOfType "only-of-type" ) ]
        
        , CssTest.stylesheet "outOfRange"
            [ ( commonTest outOfRange "out-of-range" ) ]
        
        , CssTest.stylesheet "readOnly"
            [ ( commonTest readOnly "read-only" ) ]
        
        , CssTest.stylesheet "readWrite"
            [ ( commonTest readWrite "read-write" ) ]
        
        , CssTest.stylesheet "required"
            [ ( commonTest required "required" ) ]
        
        , CssTest.stylesheet "rightHandPage"
            [ ( commonTest rightHandPage "right" ) ]
        
        , CssTest.stylesheet "root"
            [ ( commonTest root "root" ) ]
        
        , CssTest.stylesheet "scope"
            [ ( commonTest scope "scope" ) ]
        
        , CssTest.stylesheet "target"
            [ ( commonTest target "target" ) ]

        , CssTest.stylesheet "valid"
            [ ( commonTest valid "valid" ) ]

        , CssTest.stylesheet "visited"
            [ ( commonTest visited "visited" ) ]

        -- with arguments
        ---------------------------------------------------
        , CssTest.stylesheet "dir"
            [ ( commonTest (dir ltr) "dir(ltr)" )
            , ( commonTest (dir rtl) "dir(rtl)" )
            ]
        
        , CssTest.stylesheet "lang"
            [ ( commonTest (lang "en-GB") "lang(en-GB)" ) ]
        
        , CssTest.stylesheet "not"
            [ ( commonTest (Css.not [".excluded-class"]) "not(.excluded-class)" ) ]
        
        , CssTest.stylesheet "nthChild"
            [ ( commonTest (nthChild "3") "nth-child(3)" ) ]
        
        , CssTest.stylesheet "nthLastChild"
            [ ( commonTest (nthLastChild "3n+4") "nth-last-child(3n+4)" ) ]
        
        , CssTest.stylesheet "nthLastOfType"
            [ ( commonTest (nthLastOfType "0n+1") "nth-last-of-type(0n+1)" ) ]
        
        , CssTest.stylesheet "nthOfType"
            [ ( commonTest (nthOfType "odd") "nth-of-type(odd)" ) ]
        ]
