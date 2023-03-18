module Grid exposing (..)

import Css exposing (..)
import Css.Global exposing (..)
import Css.Preprocess exposing (Stylesheet, stylesheet)
import Test exposing (Test, test)
import Expect
import TestUtil exposing (..)

compileTest : String -> Stylesheet -> String -> Test
compileTest title stylesheet output =
    test title
       ( \_ ->
            outdented (prettyPrint stylesheet)
                |> Expect.equal (outdented output))




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
                                --Grid Areas
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


gridAreaTest : Test
gridAreaTest =
    compileTest
        "gridArea/2/3/4"
        (stylesheet
            [ class "auto1"
                [ gridArea auto
                ]
            , class "auto2"
                [ gridArea2 auto auto
                ]
            , class "auto3"
                [ gridArea3 auto auto auto
                ]
            , class "auto4"
                [ gridArea4 auto auto auto auto
                ]
            , class "customIdent1"
                [ gridArea <| gridLineIdent "some-area" Nothing
                ]
            , class "customIdent2"
                [ gridArea2
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "other-area" Nothing )
                ]
            , class "intAndIdent1"
                [ gridArea <| gridLineIdent "big-area" (Just 4)
                ]
            , class "intAndIdent2"
                [ gridArea2
                    ( gridLineIdent "big-area" (Just 4) )
                    ( gridLineIdent "another-area" (Just 2) )
                ]
            , class "span1"
                [ gridArea <| gridLineSpan (Just "big-area") (Just 4)
                ]
            , class "span2"
                [ gridArea2
                    ( gridLineSpan Nothing (Just 4) )
                    ( gridLineSpan (Just "another-area") Nothing)
                ]
            , class "span3"
                [ gridArea2
                    ( gridLineSpan Nothing (Just 2) )
                    ( gridLineSpan (Just "another-area") Nothing )
                ]
            ]
        )
        """
        .auto1 {
          grid-area:auto;
        }

        .auto2 {
          grid-area:auto/auto;
        }

        .auto3 {
          grid-area:auto/auto/auto;
        }

        .auto4 {
          grid-area:auto/auto/auto/auto;
        }

        .customIdent1 {
          grid-area:some-area;
        }

        .customIdent2 {
          grid-area:big-area/other-area;
        }

        .intAndIdent1 {
          grid-area:big-area 4;
        }

        .intAndIdent2 {
          grid-area:big-area 4/another-area 2;
        }

        .span1 {
          grid-area:span big-area 4;
        }

        .span2 {
          grid-area:span 4/span another-area;
        }

        .span3 {
          grid-area:span 2/span another-area;
        }
        """

gridRowTest : Test
gridRowTest =
    compileTest
        "gridRow/2"
        (stylesheet
            [ class "baseVal"
                [ gridRow inherit
                ]
            , class "auto1"
                [ gridRow auto
                ]
            , class "auto2"
                [ gridRow2 auto auto
                ]
            , class "ident1"
                [ gridRow <| gridLineIdent "big-area" Nothing
                ]
            , class "ident2"
                [ gridRow2
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "another-area" Nothing )
                ]
            , class "multi1"
                [ gridRow <| gridLineIdent "big-area" (Just 4)
                ]
            , class "multi2"
                [ gridRow2
                    ( gridLineIdent "big-area" (Just 4) )
                    ( num 6 )
                ]
            , class "multi3"
                [ gridRow <| gridLineSpan (Just "some-area") (Just 5)
                ]
            , class "multi4"
                [ gridRow2
                    ( gridLineSpan (Just "some-area") (Just 3) )
                    ( num 6 )
                ]
            , class "multi5"
                [ gridRow2
                    ( gridLineSpan (Just "some-area") Nothing )
                    ( gridLineSpan (Just "another-area") Nothing )
                ]
            , class "multi6"
                [ gridRow2
                    ( gridLineSpan (Just "some-area") (Just 5) )
                    ( gridLineSpan Nothing (Just 2) )
                ]
            ]
        )
        (rowColumnTestString "grid-row")

gridColumnTest : Test
gridColumnTest =
    compileTest
        "gridColumn/2"
        (stylesheet
            [ class "baseVal"
                [ gridColumn inherit
                ]
            , class "auto1"
                [ gridColumn auto
                ]
            , class "auto2"
                [ gridColumn2 auto auto
                ]
            , class "ident1"
                [ gridColumn <| gridLineIdent "big-area" Nothing
                ]
            , class "ident2"
                [ gridColumn2
                    ( gridLineIdent "big-area" Nothing )
                    ( gridLineIdent "another-area" Nothing )
                ]
            , class "multi1"
                [ gridColumn <| gridLineIdent "big-area" (Just 4)
                ]
            , class "multi2"
                [ gridColumn2
                    ( gridLineIdent "big-area" (Just 4) )
                    ( num 6 )
                ]
            , class "multi3"
                [ gridColumn <| gridLineSpan (Just "some-area") (Just 5)
                ]
            , class "multi4"
                [ gridColumn2
                    ( gridLineSpan (Just "some-area") (Just 3) )
                    ( num 6 )
                ]
            , class "multi5"
                [ gridColumn2
                    ( gridLineSpan (Just "some-area") Nothing )
                    ( gridLineSpan (Just "another-area") Nothing )
                ]
            , class "multi6"
                [ gridColumn2
                    ( gridLineSpan (Just "some-area") (Just 5) )
                    ( gridLineSpan Nothing (Just 2) )
                ]
            ]
        )
        (rowColumnTestString "grid-column")

rowColumnTestString : String -> String
rowColumnTestString actualCSSproperty =
    """
    .baseVal {
      """++actualCSSproperty++""":inherit;
    }

    .auto1 {
      """++actualCSSproperty++""":auto;
    }

    .auto2 {
      """++actualCSSproperty++""":auto/auto;
    }

    .ident1 {
      """++actualCSSproperty++""":big-area;
    }

    .ident2 {
      """++actualCSSproperty++""":big-area/another-area;
    }

    .multi1 {
      """++actualCSSproperty++""":big-area 4;
    }

    .multi2 {
      """++actualCSSproperty++""":big-area 4/6;
    }

    .multi3 {
      """++actualCSSproperty++""":span some-area 5;
    }

    .multi4 {
      """++actualCSSproperty++""":span some-area 3/6;
    }

    .multi5 {
      """++actualCSSproperty++""":span some-area/span another-area;
    }

    .multi6 {
      """++actualCSSproperty++""":span some-area 5/span 2;
    }
    """



columRowStartEndTest : String -> ( BaseValue ( GridLine ) -> Style ) -> String -> Test
columRowStartEndTest title property actualCSSproperty =
    compileTest
            title
            (stylesheet
                [ class "baseVal"
                    [ property initial
                    ]
                , class "auto1"
                    [ property auto
                    ]
                , class "ident1"
                    [ property <| gridLineIdent "some-area" Nothing
                    ]
                , class "identAndNum1"
                    [ property (num 2)
                    ]
                , class "identAndNum2"
                    [ property <| gridLineIdent "big-area" (Just 4)
                    ]
                , class "span1"
                    [ property <| gridLineSpan Nothing (Just 3)
                    ]
                , class "span2"
                    [ property <| gridLineSpan (Just "some-area") Nothing
                    ]
                , class "span3"
                    [ property <| gridLineSpan (Just "some-area") (Just 3)
                    ]
                ]
            )
            (
            """
            .baseVal {
              """++actualCSSproperty++""":initial;
            }

            .auto1 {
              """++actualCSSproperty++""":auto;
            }
            
            .ident1 {
              """++actualCSSproperty++""":some-area;
            }

            .identAndNum1 {
              """++actualCSSproperty++""":2;
            }

            .identAndNum2 {
              """++actualCSSproperty++""":big-area 4;
            }

            .span1 {
              """++actualCSSproperty++""":span 3;
            }

            .span2 {
              """++actualCSSproperty++""":span some-area;
            }

            .span3 {
              """++actualCSSproperty++""":span some-area 3;
            }
            """
            )

gridRowStartTest : Test
gridRowStartTest =
  columRowStartEndTest "gridRowStart" gridRowStart "grid-row-start"

gridRowEndTest : Test
gridRowEndTest =
  columRowStartEndTest "gridRowEnd" gridRowEnd "grid-row-end"

gridColumnStartTest : Test
gridColumnStartTest =
  columRowStartEndTest "gridColumnStart" gridColumnStart "grid-column-start"

gridColumnEndTest : Test
gridColumnEndTest =
  columRowStartEndTest "gridColumnEnd" gridColumnEnd "grid-column-end"


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
                            --Grid Templates
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


gridTemplateTest : Test
gridTemplateTest =
  compileTest "gridTemplate"
      ( stylesheet
          [ class "baseVal"
              [ gridTemplate initial
              ]

          , class "none"
              [ gridTemplate none
              ]

          , class "areas-rows-columns"
              [ gridTemplate <|
                  templateAreasRowsColumns
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
              ]

            , class "rows-columns"
              [ gridTemplate <|
                  templateRowsColumns
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

              ]
          ]
      )
      """
      .baseVal {
        grid-template:initial;
      }

      .none {
        grid-template:none;
      }

      .areas-rows-columns {
        grid-template:[header-left] "head head" 30px [header-right] [main-left] "nav main" 1fr [main-right] [footer-left] "nav foot" 30px [footer-right]/120px 120fr;
      }

      .rows-columns {
        grid-template:[line1 line2] 300px [line3]/minmax(210px,max-content) repeat(auto-fill,200px) 20%;
      }
      """


gridTemplateAreasTest : Test
gridTemplateAreasTest =
    compileTest "gridTemplateAreas/Cells"
        ( stylesheet
            [ class "baseVal"
                [ gridTemplateAreas initial
                ]
            , class "none"
                [ gridTemplateAreas none
                ]
            , class "oneRow"
                [ gridTemplateAreasCells [ "a b" ]
                ]
            , class "manyRows"
                [ gridTemplateAreasCells ["a b b", "a c d"]
                ]
            , class "emptyList"
                [ gridTemplateAreasCells []
                ]
            ]
        )
        """
        .baseVal {
          grid-template-areas:initial;
        }

        .none {
          grid-template-areas:none;
        }

        .oneRow {
          grid-template-areas:"a b";
        }

        .manyRows {
          grid-template-areas:"a b b""a c d";
        }

        .emptyList {
          grid-template-areas:unset;
        }
        """
