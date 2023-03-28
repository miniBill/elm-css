module Specific.Property.Masks exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 maskBorderMode
            { functionName = "maskBorderMode", propertyName = "mask-border-mode" }
            [ ( luminance, "luminance" )
            , ( alpha, "alpha" )
            ]

        , CssTest.property1 maskBorderOutset
            { functionName = "maskBorderOutset", propertyName = "mask-border-outset" }
            (   ( num 2, "2" )
                :: CssTest.length
            )

        , CssTest.property
            { functionName = "maskBorderOutset2", propertyName = "mask-border-outset" }
            (   [ ( maskBorderOutset2 (num 2) (num 4), "2 4" )
                , ( maskBorderOutset2 (px 3) (num 4), "3px 4" )
                , ( maskBorderOutset2 (num 10) (rem 5), "10 5rem" )
                ]
                ++ CssTest.length2 maskBorderOutset2
            )

        , CssTest.property
            { functionName = "maskBorderOutset3", propertyName = "mask-border-outset" }
            (   [ ( maskBorderOutset3 (num 2) (num 4) (num 11), "2 4 11" )
                , ( maskBorderOutset3 (px 3) (num 4) (num 4), "3px 4 4" )
                , ( maskBorderOutset3 (num 10) (rem 5) (num 5), "10 5rem 5" )
                , ( maskBorderOutset3 (num 2) (num 4) (mm 2), "2 4 2mm" )
                , ( maskBorderOutset3 (pc 67) (em 30) (num 4), "67pc 30em 4" )
                , ( maskBorderOutset3 (px 5) (rem 5) (num 5), "5px 5rem 5" )
                ]
                ++ CssTest.length3 maskBorderOutset3
            )
        
        , CssTest.property
            { functionName = "maskBorderOutset4", propertyName = "mask-border-outset" }
            (   [ ( maskBorderOutset4 (num 2) (num 4) (num 11) (num 10), "2 4 11 10" )
                , ( maskBorderOutset4 (px 3) (num 4) (num 4) (px 30), "3px 4 4 30px" )
                , ( maskBorderOutset4 (num 10) (rem 5) (num 5) (em 2), "10 5rem 5 2em" )
                , ( maskBorderOutset4 (num 2) (num 4) (mm 2) (vmax 1), "2 4 2mm 1vmax" )
                , ( maskBorderOutset4 (vh 4) (pc 67) (em 30) (num 4), "4vh 67pc 30em 4" )
                , ( maskBorderOutset4 (px 5) (num 10) (rem 5) (num 5), "5px 10 5rem 5" )
                ]
                ++ CssTest.length4 maskBorderOutset4
            )

        , CssTest.property1 maskBorderRepeat
            { functionName = "maskBorderRepeat", propertyName = "mask-border-repeat" }
            [ ( stretch, "stretch" )
            , ( repeat, "repeat" )
            , ( round_, "round" )
            , ( space, "space" )
            ]
        
        , CssTest.property
            { functionName = "maskBorderRepeat2", propertyName = "mask-border-repeat" }
            [   ( maskBorderRepeat2 round_ stretch, "round stretch" )
            ]

        , CssTest.property1 maskBorderWidth
            { functionName = "maskBorderWidth", propertyName = "mask-border-width" }
            (   [ ( auto, "auto" )
                , ( pct 12, "12%")
                , ( num 3, "3" )
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "maskBorderWidth2", propertyName = "mask-border-width" }
            (   [ ( maskBorderWidth2 (num 2) (num 4), "2 4" )
                , ( maskBorderWidth2 (px 3) (num 4), "3px 4" )
                , ( maskBorderWidth2 (num 10) (rem 5), "10 5rem" )
                , ( maskBorderWidth2 (num 10) auto, "10 auto" )
                , ( maskBorderWidth2 (pct 30) (num 4), "30% 4" )
                ]
                ++ CssTest.length2 maskBorderWidth2
            )
        
        , CssTest.property
            { functionName = "maskBorderWidth3", propertyName = "mask-border-width" }
            (   [ ( maskBorderWidth3 (num 2) (num 4) (num 11), "2 4 11" )
                , ( maskBorderWidth3 (px 3) (num 4) (num 4), "3px 4 4" )
                , ( maskBorderWidth3 (num 10) (rem 5) (pct 5), "10 5rem 5%" )
                , ( maskBorderWidth3 auto (num 4) (mm 2), "auto 4 2mm" )
                , ( maskBorderWidth3 (pc 67) (em 30) (num 4), "67pc 30em 4" )
                , ( maskBorderWidth3 (px 5) (rem 5) (num 5), "5px 5rem 5" )
                ]
                ++ CssTest.length3 maskBorderWidth3
            )
        
        , CssTest.property
            { functionName = "maskBorderWidth4", propertyName = "mask-border-width" }
            (   [ ( maskBorderWidth4 (num 2) (num 4) (num 11) (num 10), "2 4 11 10" )
                , ( maskBorderWidth4 (px 3) (num 4) (num 4) (px 30), "3px 4 4 30px" )
                , ( maskBorderWidth4 (num 10) (rem 5) (pct 5) (em 2), "10 5rem 5% 2em" )
                , ( maskBorderWidth4 (num 2) (num 4) auto (vmax 1), "2 4 auto 1vmax" )
                , ( maskBorderWidth4 (vh 4) (pc 67) (em 30) (num 4), "4vh 67pc 30em 4" )
                , ( maskBorderWidth4 auto (num 10) (rem 5) (num 5), "auto 10 5rem 5" )
                ]
                ++ CssTest.length4 maskBorderWidth4
            )
        
        , CssTest.property1 maskClip
            { functionName = "maskClip", propertyName = "mask-clip" }
            [ ( contentBox, "content-box" )
            , ( paddingBox, "padding-box" )
            , ( borderBox, "border-box" )
            , ( marginBox, "margin-box" )
            , ( fillBox, "fill-box" )
            , ( strokeBox, "stroke-box" )
            , ( viewBox, "view-box" )
            , ( noClip, "no-clip" )
            ]

        , CssTest.property
            { functionName = "maskClipMany", propertyName = "mask-clip" }
            [ ( maskClipMany [ contentBox, fillBox ], "content-box,fill-box" )
            , ( maskClipMany [ strokeBox, viewBox, marginBox ], "stroke-box,view-box,margin-box" )
            , ( maskClipMany [ borderBox, paddingBox, viewBox ], "border-box,padding-box,view-box")
            , ( maskClipMany [], "unset" )
            ]

        , CssTest.property1 maskComposite
            { functionName = "maskComposite", propertyName = "mask-composite" }
            [ ( add, "add" )
            , ( subtract, "subtract" )
            , ( intersect, "intersect" )
            , ( exclude, "exclude" )
            ]

        , CssTest.property1 maskMode
            { functionName = "maskMode", propertyName = "mask-mode" }
            [ ( alpha, "alpha" )
            , ( luminance, "luminance" )
            , ( matchSource, "match-source" )
            ]
        
        , CssTest.property
            { functionName = "maskModeMany", propertyName = "mask-mode" }
            [ ( maskModeMany [ alpha, luminance ], "alpha,luminance" )
            , ( maskModeMany [ alpha, luminance, matchSource ], "alpha,luminance,match-source" )
            , ( maskModeMany [], "unset" )
            ]
        
        , CssTest.property1 maskOrigin
            { functionName = "maskOrigin", propertyName = "mask-origin" }
            [ ( contentBox, "content-box" )
            , ( paddingBox, "padding-box" )
            , ( borderBox, "border-box" )
            , ( marginBox, "margin-box" )
            ]
        
        , CssTest.property
            { functionName = "maskOriginMany", propertyName = "mask-origin" }
            [ ( maskOriginMany [ contentBox, paddingBox ], "content-box,padding-box" )
            , ( maskOriginMany [ contentBox, borderBox, marginBox ], "content-box,border-box,margin-box" )
            , ( maskOriginMany [ borderBox, paddingBox, marginBox ], "border-box,padding-box,margin-box")
            , ( maskOriginMany [], "unset" )
            ]

        ]
