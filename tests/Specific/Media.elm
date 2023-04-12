module Specific.Media exposing (..)


import Css
import Css.Global exposing (..)
import Css.Value exposing (Value(..))
import Css.Preprocess exposing (Stylesheet, stylesheet)
import Css.Media as Media exposing (..)
import CssTest
import Test exposing (Test)


withMediaTest : Expression -> String -> (Stylesheet, String)
withMediaTest mediaFeatureUnderTest mfName =
    ( stylesheet
        [ p
            [ withMedia [ only Media.screen [ mediaFeatureUnderTest ] ]
                [ Css.backgroundColor ( Css.rgba 255 0 0 0.25 ) ]
            ]
        ]
    , "@media only screen and ("++mfName++"){p{background-color:rgba(255,0,0,0.25);}}"
    )

repeatWithValueLists : ( a -> Expression ) -> String -> List (a, String) -> List (Stylesheet, String)
repeatWithValueLists mediaFeatureUnderTest mfName valueList =
    List.map
        (\ ( val, expectedVal) -> 
            ( withMediaTest ( mediaFeatureUnderTest val ) ( mfName ++ ": " ++ expectedVal ) )
        )
        valueList 


mediaFeatures : Test
mediaFeatures =
    Test.concat

        -- media features
        ---------------------------------------------------
        [ CssTest.stylesheet "width"
            ( repeatWithValueLists width "width" CssTest.length )

        , CssTest.stylesheet "minWidth"
            ( repeatWithValueLists minWidth "min-width" CssTest.length )

        , CssTest.stylesheet "maxWidth"
            ( repeatWithValueLists maxWidth "max-width" CssTest.length )

        

        , CssTest.stylesheet "height"
            ( repeatWithValueLists height "height" CssTest.length )

        , CssTest.stylesheet "minHeight"
            ( repeatWithValueLists minHeight "min-height" CssTest.length )

        , CssTest.stylesheet "maxHeight"
            ( repeatWithValueLists maxHeight "max-height" CssTest.length )
        



        , CssTest.stylesheet "overflowBlock"
            [ withMediaTest ( overflowBlock Css.none ) "overflow-block: none"
            , withMediaTest ( overflowBlock Css.scroll ) "overflow-block: scroll"
            , withMediaTest ( overflowBlock optionalPaged ) "overflow-block: optional-paged"
            , withMediaTest ( overflowBlock paged ) "overflow-block: paged"
            ]
        
        , CssTest.stylesheet "overflowInline"
            [ withMediaTest ( overflowInline Css.none ) "overflow-inline: none"
            , withMediaTest ( overflowInline Css.scroll ) "overflow-inline: scroll"
            ]

        -- aspect ratio

        , CssTest.stylesheet "aspectRatio"
            [ withMediaTest ( aspectRatio 1 1 ) "aspect-ratio: 1/1"
            , withMediaTest ( aspectRatio 16 9 ) "aspect-ratio: 16/9"
            ]
        , CssTest.stylesheet "minAspectRatio"
            [ withMediaTest ( minAspectRatio 1 1 ) "min-aspect-ratio: 1/1"
            , withMediaTest ( minAspectRatio 16 9 ) "min-aspect-ratio: 16/9"
            ]
        , CssTest.stylesheet "maxAspectRatio"
            [ withMediaTest ( maxAspectRatio 1 1 ) "max-aspect-ratio: 1/1"
            , withMediaTest ( maxAspectRatio 16 9 ) "max-aspect-ratio: 16/9"
            ]

        -- orientation

        , CssTest.stylesheet "orientation"
            [ withMediaTest ( orientation portrait ) "orientation: portrait"
            , withMediaTest ( orientation landscape ) "orientation: landscape"
            ]

        -- resolution

        , CssTest.stylesheet "resolution"
            ( repeatWithValueLists resolution "resolution" CssTest.resolution )

        , CssTest.stylesheet "minResolution"
            ( repeatWithValueLists minResolution "min-resolution" CssTest.resolution )

        , CssTest.stylesheet "maxResolution"
            ( repeatWithValueLists maxResolution "max-resolution" CssTest.resolution )
        

        -- scanning process

        , CssTest.stylesheet "scan"
            [ withMediaTest ( scan interlace ) "scan: interlace"
            , withMediaTest ( scan progressive ) "scan: progressive"
            ]

        -- grid

        , CssTest.stylesheet "grid"
            [ withMediaTest ( grid ) "grid" ]

        -- color depth

        , CssTest.stylesheet "color"
            [ withMediaTest ( color ) "color" ]
        , CssTest.stylesheet "minColor"
            [ withMediaTest ( minColor 128 ) "min-color: 128" ]
        , CssTest.stylesheet "maxColor"
            [ withMediaTest ( maxColor 128 ) "max-color: 128" ]

        , CssTest.stylesheet "monochrome"
            [ withMediaTest ( monochrome True ) "monochrome" ]
        , CssTest.stylesheet "minMonochrome"
            [ withMediaTest ( minMonochrome 128 ) "min-monochrome: 128" ]
        , CssTest.stylesheet "maxMonochrome"
            [ withMediaTest ( maxMonochrome 128 ) "max-monochrome: 128" ]

        , CssTest.stylesheet "colorIndex"
            [ withMediaTest ( colorIndex 128 ) "color-index: 128" ]
        , CssTest.stylesheet "minColorIndex"
            [ withMediaTest ( minColorIndex 128 ) "min-color-index: 128" ]
        , CssTest.stylesheet "maxColorIndex"
            [ withMediaTest ( maxColorIndex 128 ) "max-color-index: 128" ]
        
        -- color gamut

        , CssTest.stylesheet "colorGamut"
            [ withMediaTest ( colorGamut srgb ) "color-gamut: srgb"
            , withMediaTest ( colorGamut p3 ) "color-gamut: p3"
            , withMediaTest ( colorGamut rec2020 ) "color-gamut: rec2020"
            ]

        -- pointers and hover

        , CssTest.stylesheet "pointer"
            [ withMediaTest ( pointer Css.none ) "pointer: none"
            , withMediaTest ( pointer coarse ) "pointer: coarse"
            , withMediaTest ( pointer fine ) "pointer: fine"
            ]
        
        , CssTest.stylesheet "anyPointer"
            [ withMediaTest ( anyPointer Css.none ) "any-pointer: none"
            , withMediaTest ( anyPointer coarse ) "any-pointer: coarse"
            , withMediaTest ( anyPointer fine ) "any-pointer: fine"
            ]

        , CssTest.stylesheet "hover"
            [ withMediaTest ( hover Css.none ) "hover: none"
            , withMediaTest ( hover hover_ ) "hover: hover"
            ]
        
        , CssTest.stylesheet "anyHover"
            [ withMediaTest ( anyHover Css.none ) "any-hover: none"
            , withMediaTest ( anyHover hover_ ) "any-hover: hover"
            ]

        -- scripting

        , CssTest.stylesheet "scripting"
            [ withMediaTest ( scripting initialOnly ) "scripting: initial-only"
            , withMediaTest ( scripting enabled ) "scripting: enabled"
            , withMediaTest ( scripting Css.none ) "scripting: none"
            ]
        ]
