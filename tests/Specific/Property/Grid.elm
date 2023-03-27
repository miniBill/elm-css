module Specific.Property.Grid exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


columRowStartEndTest =
    [ ( auto, "auto" )
    , ( gridLineIdent "some-area" Nothing, "some-area" )
    , ( num 2, "2" )
    , ( gridLineIdent "big-area" (Just 4), "big-area 4" )
    , ( gridLineSpan Nothing (Just 3), "span 3" )
    , ( gridLineSpan (Just "some-area") Nothing, "span some-area" )
    , ( gridLineSpan (Just "some-area") (Just 3), "span some-area 3" )
    ]

all : Test
all =
    Test.concat
        [ CssTest.property1 gridRowStart
            { functionName = "gridRowStart", propertyName = "grid-row-start" }
            columRowStartEndTest

        , CssTest.property1 gridRowEnd
            { functionName = "gridRowEnd", propertyName = "grid-row-end" }
            columRowStartEndTest
        
        , CssTest.property1 gridColumnStart
            { functionName = "gridColumnStart", propertyName = "grid-column-start" }
            columRowStartEndTest
        
        , CssTest.property1 gridColumnEnd
            { functionName = "gridColumnEnd", propertyName = "grid-column-end" }
            columRowStartEndTest
            
        -- grid-template
        ---------------------------------------------  
        , CssTest.property1 gridTemplate
            { functionName = "gridTemplate", propertyName = "grid-template" }
            [ ( none, "none" )
            , ( templateAreasRowsColumns
                      [ templateAreaRow
                          ( Just <| lineNames ["header-left"] )
                          "head head"
                          ( Just <| px 30 )
                          ( Just <| lineNames ["header-right"] )
                      
                      , templateAreaRow
                          ( Just <| lineNames ["main-left"] )
                          "nav main"
                          ( Just <| fr 1 )
                          ( Just <| lineNames ["main-right"])

                      , templateAreaRow
                          ( Just <| lineNames ["footer-left"] )
                          "nav foot"
                          ( Just <| px 30 )
                          ( Just <| lineNames ["footer-right"])
                      ]
                      ( Just <| templateColumns
                          ( px 120 )
                          [ fr 120
                          ]
                      )
                ,
                """[header-left] "head head" 30px [header-right] [main-left] "nav main" 1fr [main-right] [footer-left] "nav foot" 30px [footer-right]/120px 120fr"""
                )
            , ( templateRowsColumns
                      ( trackList
                          ( lineNames ["line1", "line2"] )
                          [ px 300
                          , lineNames ["line3"]
                          ]
                      )
                      
                      ( autoTrackList
                          ( minmax (px 210) maxContent )
                          [ autoRepeat autoFill [px 200]
                          , pct 20
                          ]
                      )
                ,
                """[line1 line2] 300px [line3]/minmax(210px,max-content) repeat(auto-fill,200px) 20%"""
                )
            ]
        , CssTest.property1 gridTemplateAreas
            { functionName = "gridTemplateAreas", propertyName = "grid-template-areas" }
            [ ( none, "none" )
            ]

        , CssTest.property 
            { functionName = "gridTemplateAreasCells", propertyName = "grid-template-areas" }
            [ ( gridTemplateAreasCells [ "a b" ], "\"a b\"")
            , ( gridTemplateAreasCells [ "a b b", "a c d"], "\"a b b\"\"a c d\"")
            , ( gridTemplateAreasCells [], "unset")
            ]
        ]
