module Specific.Property.Columns exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 columns
            { functionName = "columns", propertyName = "columns" }
            (   [ ( auto, "auto" )
                , ( num 2, "2" )
                ]
            ++ CssTest.length
            )

        , CssTest.property
            { functionName = "columns2", propertyName = "columns" }
            [ ( columns2 auto auto, "auto auto" )
            , ( columns2 (rem 12) auto, "12rem auto")
            ]

        , CssTest.property1 columnWidth
            { functionName = "columnWidth", propertyName = "column-width" }
            (   ( auto, "auto" )
                :: CssTest.length
            )

        , CssTest.property1 columnCount
            { functionName = "columnCount", propertyName = "column-count" }
            [ ( auto, "auto" )
            , ( int 3, "3" )
            ]

        , CssTest.property1 columnFill
            { functionName = "columnFill", propertyName = "column-fill" }
            [ ( auto, "auto" )
            , ( balance, "balance" )
            , ( balanceAll, "balance-all" )
            ]

        , CssTest.property1 columnSpan
            { functionName = "columnSpan", propertyName = "column-span" }
            [ ( none, "none" )
            , ( all_, "all" )
            ]

        , CssTest.property1 columnRule
            { functionName = "columnRule", propertyName = "column-rule" }
            ( CssTest.lineWidth )

        , CssTest.property
            { functionName = "columnRule2", propertyName = "column-rule" }
            ( CssTest.lineWidthAndStyle columnRule2 )
        
        , CssTest.property
            { functionName = "columnRule3", propertyName = "column-rule" }
            ( CssTest.lineWidthStyleAndColor columnRule3 )
        
        , CssTest.property1 columnRuleWidth
            { functionName = "columnRuleWidth", propertyName = "column-rule-width" }
            CssTest.lineWidth
        
        , CssTest.property1 columnRuleStyle
            { functionName = "columnRuleStyle", propertyName = "column-rule-style" }
            CssTest.lineStyle
        
        , CssTest.property1 columnRuleColor
            { functionName = "columnRuleColor", propertyName = "column-rule-color" }
            CssTest.color
        ]
