module Specific.Property.Background exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 backgroundImage
            { functionName = "backgroundImage", propertyName = "background-image" }
            (( none, "none" )
                :: CssTest.image
            )

        , CssTest.property1 backgroundClip
            { functionName = "backgroundClip", propertyName = "background-clip" }
            [ ( borderBox, "border-box" )
            , ( paddingBox, "padding-box" )
            , ( contentBox, "content-box" )
            , ( text, "text" )
            ]
        
        , CssTest.property
            { functionName = "backgroundClipMany", propertyName = "background-clip" }
            [ ( backgroundClipMany [], "unset" )
            , ( backgroundClipMany [ borderBox, text, paddingBox ], "border-box,text,padding-box" )
            , ( backgroundClipMany [ text, paddingBox, contentBox ], "text,padding-box,content-box" )
            ]

        , CssTest.property1 backgroundBlendMode
            { functionName = "backgroundBlendMode", propertyName = "background-blend-mode" }
            CssTest.blendMode
        
        , CssTest.property
            { functionName = "backgroundBlendModeMany", propertyName = "background-blend-mode" }
            [ ( backgroundBlendModeMany [], "unset" )
            , ( backgroundBlendModeMany [ darken, luminosity ], "darken,luminosity" )
            , ( backgroundBlendModeMany [ multiply, colorDodge, softLight ], "multiply,color-dodge,soft-light" )
            , ( backgroundBlendModeMany [ screen, overlay, colorBurn ], "screen,overlay,color-burn" )
            , ( backgroundBlendModeMany [ hardLight, difference, exclusion, hue ], "hard-light,difference,exclusion,hue" )
            , ( backgroundBlendModeMany [ saturation, color_, luminosity ], "saturation,color,luminosity" )
            ]

        , CssTest.property1 backgroundPosition
            { functionName = "backgroundPosition", propertyName = "background-position" }
            (   ( pct 23, "23%" )
                :: CssTest.length
                ++ CssTest.offsetKeyword
            )
        , CssTest.property { functionName = "backgroundPosition2", propertyName = "background-position" }
            (   ( backgroundPosition2 (pct 10) (pct 23), "10% 23%" )
                :: CssTest.length2 backgroundPosition2
                ++ CssTest.offsetKeyword2 backgroundPosition2
                ++ CssTest.offsetKeywordLength backgroundPosition2
                ++ CssTest.offsetKeywordPercent backgroundPosition2
            )
        , CssTest.property { functionName = "backgroundPosition3", propertyName = "background-position" }
            [ ( backgroundPosition3 left_ (pct 10) center, "left 10% center" )
            , ( backgroundPosition3 left_ (ch 1) center, "left 1ch center" )
            , ( backgroundPosition3 right_ (cm 1) center, "right 1cm center" )
            , ( backgroundPosition3 top_ (em 1) center, "top 1em center" )
            , ( backgroundPosition3 bottom_ (ex 1) center, "bottom 1ex center" )
            , ( backgroundPosition3 left_ (inch 1) center, "left 1in center" )
            , ( backgroundPosition3 right_ (mm 1) center, "right 1mm center" )
            , ( backgroundPosition3 top_ (pc 1) center, "top 1pc center" )
            , ( backgroundPosition3 bottom_ (pt 1) center, "bottom 1pt center" )
            , ( backgroundPosition3 left_ (px 1) center, "left 1px center" )
            , ( backgroundPosition3 right_ (q 1) center, "right 1Q center" )
            , ( backgroundPosition3 top_ (rem 1) center, "top 1rem center" )
            , ( backgroundPosition3 bottom_ (vh 1) center, "bottom 1vh center" )
            , ( backgroundPosition3 left_ (vw 1) center, "left 1vw center" )
            , ( backgroundPosition3 right_ (vmax 1) center, "right 1vmax center" )
            , ( backgroundPosition3 top_ (vmin 1) center, "top 1vmin center" )
            , ( backgroundPosition3 bottom_ zero center, "bottom 0 center" )
            , ( backgroundPosition3 left_ (calc (rem 3) (plus (pct 2))) center, "left calc(3rem + 2%) center" )
            ]
        , CssTest.property { functionName = "backgroundPosition4", propertyName = "background-position" }
            ( CssTest.offsetKeywordLengthPercentPair backgroundPosition4 )
        
        , CssTest.property1 backgroundOrigin
            { functionName = "backgroundOrigin", propertyName = "background-origin" }
            [ ( borderBox, "border-box" )
            , ( paddingBox, "padding-box" )
            , ( contentBox, "content-box")
            ]
        
        , CssTest.property1 backgroundRepeat
            { functionName = "backgroundRepeat", propertyName = "background-repeat" }
            [ ( repeatX, "repeat-x" )
            , ( repeat, "repeat" )
            , ( space, "space" )
            , ( round_, "round" )
            , ( noRepeat, "no-repeat" )
            ]
        
        , CssTest.property
            { functionName = "backgroundRepeat2", propertyName = "background-repeat" }
            [ ( backgroundRepeat2 repeat repeat, "repeat repeat" )
            , ( backgroundRepeat2 round_ space, "round space" )
            , ( backgroundRepeat2 noRepeat round_, "no-repeat round" )
            , ( backgroundRepeat2 space repeat, "space repeat" )
            , ( backgroundRepeat2 space noRepeat, "space no-repeat" )
            ]
        
        , CssTest.property1 backgroundSize
            { functionName = "backgroundSize", propertyName = "background-size" }
            (   [ ( pct 30, "30%" )
                , ( auto, "auto" )
                , ( cover, "cover" )
                , ( contain_, "contain" )
                ]
                ++ CssTest.length
            )
        
        , CssTest.property
            { functionName = "backgroundSize2", propertyName = "background-size" }
            (   [ ( backgroundSize2 auto (px 6), "auto 6px" )
                , ( backgroundSize2 (pct 50) (em 3), "50% 3em")
                , ( backgroundSize2 auto auto, "auto auto" )
                , ( backgroundSize2 (pct 50) auto, "50% auto" )
                ]
                ++ CssTest.length2 backgroundSize2
            )

        , CssTest.property1 backgroundColor
            { functionName = "backgroundColor", propertyName = "background-color" }
            (   ( transparent, "transparent" )
                :: CssTest.color
            )
        
        , CssTest.property1 backgroundAttachment
            { functionName = "backgroundAttachment", propertyName = "background-attachment" }
            [ ( scroll, "scroll" )
            , ( fixed, "fixed" )
            , ( local, "local" )
            ]
        ]
