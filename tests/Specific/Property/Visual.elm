module Specific.Property.Visual exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 visibility
            { functionName = "visibility", propertyName = "visibility" }
            [ ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( collapse, "collapse" )
            ]
        , CssTest.property1 opacity
            { functionName = "opacity", propertyName = "opacity" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( pct 23.4, "23.4%" )
            ]
        , CssTest.property1 imageRendering
            { functionName = "imageRendering", propertyName = "image-rendering" }
            [ ( auto, "auto" )
            , ( crispEdges, "crisp-edges" )
            , ( pixelated, "pixelated" )
            ]

        , CssTest.property1 mixBlendMode
            { functionName = "mixBlendMode", propertyName = "mix-blend-mode" }
            CssTest.blendMode

        , CssTest.property1 clipPath
            { functionName = "clipPath", propertyName = "clip-path" }
            (   [ ( none, "none" )

                , ( url "test-img.svg", "url(test-img.svg)")

                , ( marginBox, "margin-box" )
                , ( borderBox, "border-box" )
                , ( paddingBox, "padding-box" )
                , ( contentBox, "content-box" )
                , ( fillBox, "fill-box" )
                , ( strokeBox, "stroke-box" )
                , ( viewBox, "view-box" )
                ]
                ++ CssTest.basicShape
            )
        
        , CssTest.property
            { functionName = "clipPath2", propertyName = "clip-path" }
            [ ( clipPath2 marginBox (circle (pct 10)), "margin-box circle(10%)" )
            , ( clipPath2 borderBox (ellipse (px 20) (px 10)), "border-box ellipse(20px 10px)" )
            , ( clipPath2 paddingBox (polygon [ (20, 30), (40, 80.3), (14, 50) ]), "padding-box polygon(20% 30%, 40% 80.3%, 14% 50%)" )
            , ( clipPath2 contentBox (ellipseAt (pct 20) (pct 10) (rem 5)), "content-box ellipse(20% 10% at 5rem)" )
            , ( clipPath2 fillBox (circle closestSide), "fill-box circle(closest-side)" )
            , ( clipPath2 strokeBox (insetRect3 (em 4) (em 1) (px 2) Nothing), "stroke-box inset(4em 1em 2px)" )
            , ( clipPath2 viewBox (circleAt2 closestSide (rem 5) (rem 1)), "view-box circle(closest-side at 5rem 1rem)" )
            ]
        ]
