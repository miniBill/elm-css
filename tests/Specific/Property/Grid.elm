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

autoRowsColumnTest = 
    (   [ ( auto, "auto" )
        , ( minContent, "min-content" )
        , ( maxContent, "max-content" )
        , ( pct 10, "10%" )
        , ( fr 3, "3fr" )
        ]
        ++ CssTest.length
        ++ CssTest.fitContentTo
        ++ CssTest.minmax
    )

autoRowsColumnManyTest propertyUnderTest =
    [ ( propertyUnderTest [ minContent, maxContent, auto ], "min-content max-content auto" )
    , ( propertyUnderTest [ px 100, px 150, px 390], "100px 150px 390px" )
    , ( propertyUnderTest [ pct 10, pct 33.3 ], "10% 33.3%" )
    , ( propertyUnderTest [ fr 3, fr 3,fr 2 ], "3fr 3fr 2fr" )
    , ( propertyUnderTest [ (minmax (px 100) auto), (minmax maxContent (fr 2)), (minmax (pct 20) (vmax 80))], "minmax(100px,auto) minmax(max-content,2fr) minmax(20%,80vmax)")
    , ( propertyUnderTest [ px 100, (minmax (px 100) auto), pct 10, fr 0.5, (fitContentTo(px 400))], "100px minmax(100px,auto) 10% 0.5fr fit-content(400px)")
    ]


templateRowsColumnsTest =
    [ ( none, "none" )
    , ( trackList
            ( lineNames ["line1", "line2"] )
            [ px 300
            , lineNames ["line3"]
            ]
        , "[line1 line2] 300px [line3]"
        )
    , ( autoTrackList
            ( minmax (px 210) maxContent )
            [ autoRepeat autoFill [px 200]
            , pct 20
            ]
        , "minmax(210px,max-content) repeat(auto-fill,200px) 20%"
        )
    ]

all : Test
all =
    Test.concat
        [ CssTest.property1 gridAutoFlow
            { functionName = "gridAutoFlow", propertyName = "grid-auto-flow" }
            [ ( row, "row" )
            , ( column, "column" )
            , ( dense, "dense" )
            ]
        
        , CssTest.property
            { functionName = "gridAutoFlow2", propertyName = "grid-auto-flow" }
            [ ( gridAutoFlow2 row dense, "row dense" )
            , ( gridAutoFlow2 column dense, "column dense" )
            ]
            
        , CssTest.property1 gridAutoRows
            { functionName = "gridAutoRows", propertyName = "grid-auto-rows" }
            autoRowsColumnTest

        
        , CssTest.property
            { functionName = "gridAutoRowsMany", propertyName = "grid-auto-rows" }
            ( autoRowsColumnManyTest gridAutoRowsMany )

        , CssTest.property1 gridAutoColumns
            { functionName = "gridAutoColumns", propertyName = "grid-auto-columns" }
            autoRowsColumnTest        
            
        , CssTest.property
            { functionName = "gridAutoColumnsMany", propertyName = "grid-auto-columns" }
            ( autoRowsColumnManyTest gridAutoColumnsMany )

        , CssTest.property1 gridArea
            { functionName = "gridArea", propertyName = "grid-area" }
            [ ( auto, "auto")
            , ( gridLineIdent "some-area" Nothing, "some-area" )
            , ( gridLineIdent "big-area" (Just 4), "big-area 4" )
            , ( gridLineSpan (Just "big-area") (Just 4), "span big-area 4" )
            ]
        
        , CssTest.property
            { functionName = "gridArea2", propertyName = "grid-area" }
            [ ( gridArea2 auto auto, "auto/auto")
            , ( gridArea2
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "other-area" Nothing )
                , "big-area/other-area"
                )
            , ( gridArea2
                    ( gridLineIdent "big-area" (Just 4) )
                    ( gridLineIdent "another-area" (Just 2) )
                , "big-area 4/another-area 2"
                )
            , ( gridArea2
                    ( gridLineSpan Nothing (Just 4) )
                    ( gridLineSpan (Just "another-area") Nothing)
                , "span 4/span another-area"
                )
            ]
        
        , CssTest.property
            { functionName = "gridArea3", propertyName = "grid-area" }
            [ ( gridArea3 auto auto auto, "auto/auto/auto")
            , ( gridArea3
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "other-area" Nothing )
                    ( gridLineSpan (Just "other-area") Nothing )
                , "big-area/other-area/span other-area"
                )
            , ( gridArea3
                    ( gridLineIdent "big-area" (Just 4) )
                    ( gridLineIdent "another-area" (Just 2) )
                    ( gridLineIdent "another-area" (Just 3) )
                , "big-area 4/another-area 2/another-area 3"
                )
            , ( gridArea3
                    ( gridLineSpan Nothing (Just 4) )
                    ( gridLineSpan (Just "another-area") Nothing)
                    ( gridLineIdent "other-area" Nothing)
                , "span 4/span another-area/other-area"
                )
            ]
        
        , CssTest.property
            { functionName = "gridArea4", propertyName = "grid-area" }
            [ ( gridArea4 auto auto auto auto, "auto/auto/auto/auto")
            , ( gridArea4
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "other-area" Nothing )
                    ( gridLineSpan (Just "other-area") Nothing )
                    ( gridLineIdent "misc-area" Nothing )
                , "big-area/other-area/span other-area/misc-area"
                )
            , ( gridArea4
                    ( gridLineIdent "big-area" (Just 4) )
                    ( gridLineIdent "another-area" (Just 2) )
                    ( gridLineIdent "another-area" (Just 3) )
                    ( gridLineIdent "another-area" Nothing )
                , "big-area 4/another-area 2/another-area 3/another-area"
                )
            , ( gridArea4
                    ( gridLineSpan Nothing (Just 4) )
                    ( gridLineSpan (Just "another-area") Nothing)
                    ( gridLineIdent "big-area" (Just 4) )
                    ( gridLineIdent "another-area" (Just 2) )
                , "span 4/span another-area/big-area 4/another-area 2"
                )
            ]
        
        , CssTest.property1 gridRow
            { functionName = "gridRow", propertyName = "grid-row" }
            [ ( auto, "auto" )
            , ( gridLineIdent "big-area" Nothing, "big-area" )
            , ( gridLineIdent "big-area" (Just 4), "big-area 4" )
            , ( gridLineSpan (Just "some-area") (Just 5), "span some-area 5" )
            ]
        
        , CssTest.property
            { functionName = "gridRow2", propertyName = "grid-row" }
            [ ( gridRow2 auto auto, "auto/auto" )
            , ( gridRow2
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "another-area" Nothing )
                , "big-area/another-area"
                )
            , ( gridRow2
                    ( gridLineIdent "big-area" (Just 4) )
                    ( num 6 )
                , "big-area 4/6"
                )
            , (  gridRow2
                    ( gridLineSpan (Just "some-area") (Just 3) )
                    ( num 6 )
                , "span some-area 3/6"
                )
            , ( gridRow2
                    ( gridLineSpan (Just "some-area") Nothing )
                    ( gridLineSpan (Just "another-area") Nothing )
                , "span some-area/span another-area"
                )
            , ( gridRow2
                    ( gridLineSpan (Just "some-area") (Just 5) )
                    ( gridLineSpan Nothing (Just 2) )
                , "span some-area 5/span 2"
                )
            ]
        
        , CssTest.property1 gridColumn
            { functionName = "gridColumn", propertyName = "grid-column" }
            [ ( auto, "auto" )
            , ( gridLineIdent "big-area" Nothing, "big-area" )
            , ( gridLineIdent "big-area" (Just 4), "big-area 4" )
            , ( gridLineSpan (Just "some-area") (Just 5), "span some-area 5" )
            ]
        
        , CssTest.property
            { functionName = "gridColumn2", propertyName = "grid-column" }
            [ ( gridColumn2 auto auto, "auto/auto" )
            , ( gridColumn2
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "another-area" Nothing )
                , "big-area/another-area"
                )
            , ( gridColumn2
                    ( gridLineIdent "big-area" (Just 4) )
                    ( num 6 )
                , "big-area 4/6"
                )
            , (  gridColumn2
                    ( gridLineSpan (Just "some-area") (Just 3) )
                    ( num 6 )
                , "span some-area 3/6"
                )
            , ( gridColumn2
                    ( gridLineSpan (Just "some-area") Nothing )
                    ( gridLineSpan (Just "another-area") Nothing )
                , "span some-area/span another-area"
                )
            , ( gridColumn2
                    ( gridLineSpan (Just "some-area") (Just 5) )
                    ( gridLineSpan Nothing (Just 2) )
                , "span some-area 5/span 2"
                )
            ]

        , CssTest.property1 gridRowStart
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

        , CssTest.property1 gridTemplateRows
            { functionName = "gridTemplateRows", propertyName = "grid-template-rows" }
            templateRowsColumnsTest

        , CssTest.property1 gridTemplateColumns
            { functionName = "gridTemplateColumns", propertyName = "grid-template-columns" }
            templateRowsColumnsTest
        ]
