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
            (   [ ( left_, "left" )
                , ( right_, "right" )
                , ( top_, "top" )
                , ( bottom_, "bottom" )
                , ( center, "center" )
                , ( pct 23, "23%" )
                ]
                ++ CssTest.length
            )
        , CssTest.property { functionName = "backgroundPosition2", propertyName = "background-position" }
            ([ ( backgroundPosition2 left_ top_, "left top" )
             , ( backgroundPosition2 right_ bottom_, "right bottom" )
             , ( backgroundPosition2 center center, "center center" )
             , ( backgroundPosition2 (pct 10) (pct 23), "10% 23%" )
             , ( backgroundPosition2 (px 2) top_, "2px top" )
             , ( backgroundPosition2 left_ (pct 5), "left 5%" )
             ]
                ++ CssTest.length2 backgroundPosition2
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
            [ ( backgroundPosition4 left_ (pct 10) bottom_ (pt 20), "left 10% bottom 20pt" )
            , ( backgroundPosition4 left_ (ch 1) top_ (ch 2), "left 1ch top 2ch" )
            , ( backgroundPosition4 right_ (cm 1) top_ (cm 2), "right 1cm top 2cm" )
            , ( backgroundPosition4 left_ (em 1) bottom_ (em 2), "left 1em bottom 2em" )
            , ( backgroundPosition4 right_ (ex 1) bottom_ (ex 2), "right 1ex bottom 2ex" )
            , ( backgroundPosition4 left_ (inch 1) top_ (inch 2), "left 1in top 2in" )
            , ( backgroundPosition4 right_ (mm 1) top_ (mm 2), "right 1mm top 2mm" )
            , ( backgroundPosition4 left_ (pc 1) bottom_ (pc 2), "left 1pc bottom 2pc" )
            , ( backgroundPosition4 right_ (pt 1) bottom_ (pt 2), "right 1pt bottom 2pt" )
            , ( backgroundPosition4 left_ (px 1) top_ (px 2), "left 1px top 2px" )
            , ( backgroundPosition4 right_ (q 1) top_ (q 2), "right 1Q top 2Q" )
            , ( backgroundPosition4 left_ (rem 1) bottom_ (rem 2), "left 1rem bottom 2rem" )
            , ( backgroundPosition4 right_ (vh 1) bottom_ (vh 2), "right 1vh bottom 2vh" )
            , ( backgroundPosition4 left_ (vw 1) top_ (vw 2), "left 1vw top 2vw" )
            , ( backgroundPosition4 right_ (vmax 1) top_ (vmax 2), "right 1vmax top 2vmax" )
            , ( backgroundPosition4 left_ (vmin 1) bottom_ (vmin 2), "left 1vmin bottom 2vmin" )
            , ( backgroundPosition4 right_ (ex 1) bottom_ zero, "right 1ex bottom 0" )
            , ( backgroundPosition4 right_ zero bottom_ (em 2), "right 0 bottom 2em" )
            , ( backgroundPosition4 left_ (calc (rem 3) (plus (pct 2))) top_ (calc (vh 10) (dividedBy (num 3))), "left calc(3rem + 2%) top calc(10vh / 3)" )
            ]
        
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
