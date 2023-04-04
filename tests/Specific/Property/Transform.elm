module Specific.Property.Transform exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 transformBox
            { functionName = "transformBox", propertyName = "transform-box" }
            [ ( contentBox, "content-box" )
            , ( borderBox, "border-box" )
            , ( fillBox, "fill-box" )
            , ( strokeBox, "stroke-box" )
            , ( viewBox, "view-box" )
            ]

        , CssTest.property1 transformOrigin
            { functionName = "transformOrigin", propertyName = "transform-origin" }
            (   ( pct 30, "30%" )
                :: CssTest.length
                ++ CssTest.offsetKeyword
            )

        , CssTest.property 
            { functionName = "transformOrigin2", propertyName = "transform-origin" }
            (   ( transformOrigin2 ( pct 30 ) ( pct 40 ), "30% 40%" )
                :: CssTest.length2 transformOrigin2
                ++ CssTest.offsetKeyword2 transformOrigin2
                ++ CssTest.offsetKeywordLength transformOrigin2
                ++ CssTest.offsetKeywordPercent transformOrigin2
            )
        
        , CssTest.property 
            { functionName = "transformOrigin3", propertyName = "transform-origin" }
            (   [ ( transformOrigin3 ( pct 30 ) ( pct 40 ) (px 4), "30% 40% 4px" )

                , ( transformOrigin3 left_ top_ (px 4), "left top 4px" )
                , ( transformOrigin3 left_ bottom_ (px 4), "left bottom 4px" )
                , ( transformOrigin3 right_ top_ (px 4), "right top 4px" )
                , ( transformOrigin3 right_ bottom_ (px 4), "right bottom 4px" )

                , ( transformOrigin3 left_ (mm 5) (px 4), "left 5mm 4px" )
                , ( transformOrigin3 right_ (mm 5) (px 4), "right 5mm 4px" )
                , ( transformOrigin3 (rem 2) top_ (px 4), "2rem top 4px" )
                , ( transformOrigin3 (rem 2) bottom_ (px 4), "2rem bottom 4px" )
                ]
                ++ CssTest.length3 transformOrigin3
            )

        , CssTest.property1 transformStyle
            { functionName = "transformStyle", propertyName = "transform-style" }
            [ ( flat, "flat" )
            , ( preserve3d, "preserve-3d" )
            ]

        , CssTest.property1 transform
            { functionName = "transform", propertyName = "transform" }
            [ ( matrix 1.0 2.0 3.0 4.0 5.0 6.0, "matrix(1,2,3,4,5,6)" )
            , ( matrix3d 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1, "matrix3d(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1)")
            , ( translate (px 12), "translate(12px)" )
            , ( translate2 (px 12) (pct 50), "translate(12px,50%)")
            , ( translateX (em 2), "translateX(2em)")
            , ( translateY (inch 3), "translateY(3in)")
            , ( translateZ (px 2), "translateZ(2px)")
            , ( translate3d (px 12) (pct 50) (em 3), "translate3d(12px,50%,3em)")
            , ( scale_ 2, "scale(2)")
            , ( scale2_ 2 0.5, "scale(2,0.5)")
            , ( scaleX 2, "scaleX(2)")
            , ( scaleY 0.5, "scaleY(0.5)")
            , ( scaleZ 0.3, "scaleZ(0.3)")
            , ( scale3d 2.5 1.2 0.3, "scale3d(2.5,1.2,0.3)")
            , ( skew (deg 20), "skew(20deg)")
            , ( skew2 (deg 30) (deg 20), "skew(30deg,20deg)")
            , ( skewX (deg 30), "skewX(30deg)")
            , ( skewY (rad 1.07), "skewY(1.07rad)")
            , ( rotate_ (turn 0.5), "rotate(0.5turn)")
            , ( rotateX (deg 10), "rotateX(10deg)")
            , ( rotateY (deg 10), "rotateY(10deg)")
            , ( rotateZ (deg 10), "rotateZ(10deg)")
            , ( rotate3d 1 2.0 3.0 (deg 10), "rotate3d(1,2,3,10deg)")
            , ( perspective_ (px 17), "perspective(17px)")
            ]

        , CssTest.property
            { functionName = "transformMany", propertyName = "transform" }
            [ ( transformMany [], "unset" )

            , ( transformMany
                [ matrix 1.0 2.0 3.0 4.0 5.0 6.0
                , translateX (em 2)
                , translate2 (px 12) (pct 50)
                ]
                , "matrix(1,2,3,4,5,6) translateX(2em) translate(12px,50%)"
                )

            , ( transformMany
                [ scale2_ 2 0.5
                , skew (deg 20)
                , skewY (rad 1.07)
                , rotateZ (deg 10)
                ]
                , "scale(2,0.5) skew(20deg) skewY(1.07rad) rotateZ(10deg)"
                )
            ]

        
        , CssTest.property1 scale
            { functionName = "scale", propertyName = "scale" }
            [ ( none, "none" )
            , ( num 3, "3" )
            ]

        , CssTest.property
            { functionName = "scale2", propertyName = "scale" }
            [ ( scale2 (num 2) (num 3), "2 3" )
            ]

        , CssTest.property
            { functionName = "scale3", propertyName = "scale" }
            [ ( scale3 (num 2) (num 3) (num 0.5), "2 3 0.5" )
            ]

        
        , CssTest.property1 rotate
            { functionName = "rotate", propertyName = "rotate" }
            (   ( none, "none" )
                :: CssTest.angle
            )
        , CssTest.property
            { functionName = "rotate2", propertyName = "rotate" }
            [ ( rotate2 x ( deg 20 ), "x 20deg" )
            , ( rotate2 x ( grad 200 ), "x 200grad" )
            , ( rotate2 x ( rad 1.5 ), "x 1.5rad" )
            , ( rotate2 x ( turn 3 ), "x 3turn" )

            , ( rotate2 y ( deg 20 ), "y 20deg" )
            , ( rotate2 y ( grad 200 ), "y 200grad" )
            , ( rotate2 y ( rad 1.5 ), "y 1.5rad" )
            , ( rotate2 y ( turn 3 ), "y 3turn" )

            , ( rotate2 z ( deg 20 ), "z 20deg" )
            , ( rotate2 z ( grad 200 ), "z 200grad" )
            , ( rotate2 z ( rad 1.5 ), "z 1.5rad" )
            , ( rotate2 z ( turn 3 ), "z 3turn" )
            ]
        , CssTest.property
            { functionName = "rotate4", propertyName = "rotate" }
            [ ( rotate4 1 1 1 ( deg 20 ), "1 1 1 20deg" )
            , ( rotate4 1 1 1 ( grad 200 ), "1 1 1 200grad" )
            , ( rotate4 1 1 1 ( rad 1.5 ), "1 1 1 1.5rad" )
            , ( rotate4 1 1 1 ( turn 3 ), "1 1 1 3turn" )
            ]
        ]
