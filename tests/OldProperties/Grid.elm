module OldProperties.Grid exposing (..)

import Css exposing (..)
import Css.Global exposing (..)
import Css.Preprocess exposing (stylesheet)
import Compile
import Test exposing (Test)


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
    Compile.test
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
    Compile.test
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
    Compile.test
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


