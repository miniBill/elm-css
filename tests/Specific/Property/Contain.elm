module Specific.Property.Contain exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)


twoValTest propertyUnderTest =
    [ ( propertyUnderTest auto (px 300), "auto 300px" )
    ]

fourValTest propertyUnderTest =
    [ ( propertyUnderTest auto (px 300) auto (rem 4), "auto 300px auto 4rem" )
    , ( propertyUnderTest auto (mm 2) auto (cm 4), "auto 2mm auto 4cm" )
    ]

all : Test
all =
    Test.concat
        [ CssTest.property1 contain
            { functionName = "contain", propertyName = "contain" }
            [ ( none, "none" )
            , ( strict, "strict" )
            , ( content, "content" )
            , ( size, "size" )
            , ( inlineSize_, "inline-size")
            , ( layout, "layout" )
            , ( style, "style" )
            , ( paint, "paint" )
            ]
        
        , CssTest.property
            { functionName = "contain2", propertyName = "contain" }
            [ ( contain2 size paint, "size paint" )
            , ( contain2 inlineSize_ layout, "inline-size layout" )
            , ( contain2 style paint, "style paint" )
            ]

        , CssTest.property
            { functionName = "contain3", propertyName = "contain" }
            [ ( contain3 size paint style, "size paint style" )
            , ( contain3 inlineSize_ layout paint, "inline-size layout paint" )
            , ( contain3 style paint layout, "style paint layout" )
            ]
        
        , CssTest.property
            { functionName = "contain4", propertyName = "contain" }
            [ ( contain4 size paint style layout, "size paint style layout" )
            , ( contain4 inlineSize_ layout paint style, "inline-size layout paint style" )
            ]

        , CssTest.property1 containIntrinsicSize
            { functionName = "containIntrinsicSize", propertyName = "contain-intrinsic-size" }
            (   ( none, "none" )
                :: CssTest.length
            )
        , CssTest.property 
            { functionName = "containIntrinsicSize2", propertyName = "contain-intrinsic-size" }
            (   [ ( containIntrinsicSize2 (px 1000) (em 1.5), "1000px 1.5em" )
                , ( containIntrinsicSize2 auto (px 300), "auto 300px" )
                ]
                ++ CssTest.length2 containIntrinsicSize2
            )
        , CssTest.property 
            { functionName = "containIntrinsicSize4", propertyName = "contain-intrinsic-size" }
            ( fourValTest containIntrinsicSize4 )



        , CssTest.property1 containIntrinsicWidth
            { functionName = "containIntrinsicWidth", propertyName = "contain-intrinsic-width" }
            (   ( none, "none" )
                :: CssTest.length
            )
        , CssTest.property 
            { functionName = "containIntrinsicWidth2", propertyName = "contain-intrinsic-width" }
            ( twoValTest containIntrinsicWidth2 )



        , CssTest.property1 containIntrinsicHeight
            { functionName = "containIntrinsicHeight", propertyName = "contain-intrinsic-height" }
            (   ( none, "none" )
                :: CssTest.length
            )
        , CssTest.property 
            { functionName = "containIntrinsicHeight2", propertyName = "contain-intrinsic-height" }
            ( twoValTest containIntrinsicHeight2 )



        , CssTest.property1 containIntrinsicBlockSize
            { functionName = "containIntrinsicBlockSize", propertyName = "contain-intrinsic-block-size" }
            (   ( none, "none" )
                :: CssTest.length
            )
        , CssTest.property 
            { functionName = "containIntrinsicBlockSize2", propertyName = "contain-intrinsic-block-size" }
            ( twoValTest containIntrinsicBlockSize2 )
        

        , CssTest.property1 containIntrinsicInlineSize
            { functionName = "containIntrinsicInlineSize", propertyName = "contain-intrinsic-inline-size" }
            (   ( none, "none" )
                :: CssTest.length
            )
        , CssTest.property 
            { functionName = "containIntrinsicInlineSize2", propertyName = "contain-intrinsic-inline-size" }
            ( twoValTest containIntrinsicInlineSize2 )
        ]
