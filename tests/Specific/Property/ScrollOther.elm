module Specific.Property.ScrollOther exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


all : Test
all =
    Test.concat
        [ CssTest.property1 scrollBehavior
            { functionName = "scrollBehavior", propertyName = "scroll-behavior" }
            [ ( auto, "auto" )
            , ( smooth, "smooth" )
            ]
        
        , CssTest.property1 scrollSnapAlign
            { functionName = "scrollSnapAlign", propertyName = "scroll-snap-align" }
            [ ( none, "none" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            ]
        
        , CssTest.property1 scrollSnapStop
            { functionName = "scrollSnapStop", propertyName = "scroll-snap-stop" }
            [ ( normal, "normal" )
            , ( Css.always, "always" )
            ]
        
        , CssTest.property1 scrollSnapType
            { functionName = "scrollSnapType", propertyName = "scroll-snap-type" }
            [ ( none, "none" )
            , ( x, "x" )
            , ( y, "y" )
            , ( block, "block" )
            , ( inline, "inline" )
            , ( both, "both" )
            ]
        
        , CssTest.property
            { functionName = "scrollSnapType2", propertyName = "scroll-snap-type" }
            [ ( scrollSnapType2 x mandatory, "x mandatory" )
            , ( scrollSnapType2 y mandatory, "y mandatory" )
            , ( scrollSnapType2 block mandatory, "block mandatory" )
            , ( scrollSnapType2 inline mandatory, "inline mandatory" )
            , ( scrollSnapType2 both mandatory, "both mandatory" )
            , ( scrollSnapType2 x proximity, "x proximity" )
            , ( scrollSnapType2 y proximity, "y proximity" )
            , ( scrollSnapType2 block proximity, "block proximity" )
            , ( scrollSnapType2 inline proximity, "inline proximity" )
            , ( scrollSnapType2 both proximity, "both proximity" )
            ]
        
        , CssTest.property1 scrollbarColor
            { functionName = "scrollbarColor", propertyName = "scrollbar-color" }
            (   ( auto, "auto" )
                :: CssTest.color
            )
        
        , CssTest.property1 scrollbarGutter
            { functionName = "scrollbarGutter", propertyName = "scrollbar-gutter" }
            [ ( auto, "auto" )
            , ( stable, "stable" )
            ]
        
        , CssTest.property
            { functionName = "scrollbarGutter2", propertyName = "scrollbar-gutter" }
            [ ( scrollbarGutter2 stable bothEdges, "stable both-edges" )
            ]
        
        , CssTest.property1 scrollbarWidth
            { functionName = "scrollbarWidth", propertyName = "scrollbar-width" }
            [ ( auto, "auto" )
            , ( thin, "thin" )
            , ( none, "none" )
            ]
        ]
