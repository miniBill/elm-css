module Property.Overscroll exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 overscrollBehavior
            { functionName = "overscrollBehavior", propertyName = "overscroll-behavior" }
            [ ( auto, "auto" )
            , ( contain_, "contain" )
            , ( none, "none" )
            ]

        , CssTest.property
            { functionName = "overscrollBehavior2", propertyName = "overscroll-behavior" }
            [ ( overscrollBehavior2 auto none, "auto none" )
            , ( overscrollBehavior2 none contain_, "none contain" )
            , ( overscrollBehavior2 contain_ auto, "contain auto" )
            ]
        
        , CssTest.property1 overscrollBehaviorX
            { functionName = "overscrollBehaviorX", propertyName = "overscroll-behavior-x" }
            [ ( auto, "auto" )
            , ( contain_, "contain" )
            , ( none, "none" )
            ]
        
        , CssTest.property1 overscrollBehaviorY
            { functionName = "overscrollBehaviorY", propertyName = "overscroll-behavior-y" }
            [ ( auto, "auto" )
            , ( contain_, "contain" )
            , ( none, "none" )
            ]
        
        , CssTest.property1 overscrollBehaviorBlock
            { functionName = "overscrollBehaviorBlock", propertyName = "overscroll-behavior-block" }
            [ ( auto, "auto" )
            , ( contain_, "contain" )
            , ( none, "none" )
            ]
        
        , CssTest.property1 overscrollBehaviorInline
            { functionName = "overscrollBehaviorInline", propertyName = "overscroll-behavior-inline" }
            [ ( auto, "auto" )
            , ( contain_, "contain" )
            , ( none, "none" )
            ]
        ]
