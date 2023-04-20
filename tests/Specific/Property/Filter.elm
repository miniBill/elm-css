module Specific.Property.Filter exposing (..)


import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)



all : Test
all =
    Test.concat
        [ CssTest.property1 filter
            { functionName = "filter", propertyName = "filter" }
            (   [ ( url "filters.svg#filter1", "url(filters.svg#filter1)")
                , ( none, "none" )
                ]
                ++ CssTest.filterFunction
            )
        
        , CssTest.property
            { functionName = "filterMany", propertyName = "filter" }
            [ ( filterMany [] , "unset" )
            , ( filterMany [ contrast (pct 175), brightness(pct 3)], "contrast(175%) brightness(3%)")
            , ( filterMany [ url "test", contrast (pct 175), brightness(pct 3) ], "url(test) contrast(175%) brightness(3%)")
            , ( filterMany [ sepia (pct 75), saturate(pct 3)], "sepia(75%) saturate(3%)")
            ]

        , CssTest.property1 backdropFilter
            { functionName = "backdropFilter", propertyName = "backdrop-filter" }
            (   [ ( url "filters.svg#filter1", "url(filters.svg#filter1)")
                , ( none, "none" )
                ]
                ++ CssTest.filterFunction
            )
        
        , CssTest.property
            { functionName = "backdropFilterMany", propertyName = "backdrop-filter" }
            [ ( backdropFilterMany [] , "unset" )
            , ( backdropFilterMany [ contrast (pct 175), brightness(pct 3)], "contrast(175%) brightness(3%)")
            , ( backdropFilterMany [ url "test", contrast (pct 175), brightness(pct 3) ], "url(test) contrast(175%) brightness(3%)")
            , ( backdropFilterMany [ sepia (pct 75), saturate(pct 3)], "sepia(75%) saturate(3%)")
            ]
        ]
