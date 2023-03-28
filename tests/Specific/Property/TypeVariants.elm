module Specific.Property.TypeVariants exposing (all)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)






ligatures = 
    [ ( commonLigatures, "common-ligatures" )
    , ( noCommonLigatures, "no-common-ligatures" )
    , ( discretionaryLigatures, "discretionary-ligatures" )
    , ( historicalLigatures, "historical-ligatures" )
    , ( noHistoricalLigatures, "no-historical-ligatures" )
    , ( contextual, "contextual" )
    , ( noContextual, "no-contextual" )
    ]

caps =
    [ ( smallCaps, "small-caps" )
    , ( allSmallCaps, "all-small-caps" )
    , ( petiteCaps, "petite-caps" )
    , ( allPetiteCaps, "all-petite-caps" )
    , ( unicase, "unicase" )
    , ( titlingCaps, "titling-caps")
    ]

numeric =
    [ ( liningNums, "lining-nums" )
    , ( oldstyleNums, "oldstyle-nums" )
    , ( proportionalNums, "proportional-nums" )
    , ( tabularNums, "tabular-nums" )
    , ( diagonalFractions, "diagonal-fractions" )
    , ( stackedFractions, "stacked-fractions" )
    , ( ordinal, "ordinal" )
    , ( slashedZero, "slashed-zero" )
    ]

eastAsian =
    [ ( jis78, "jis78" )
    , ( jis83, "jis83" )
    , ( jis90, "jis90" )
    , ( jis04, "jis04" )
    , ( simplified, "simplified" )
    , ( traditional, "traditional" )
    , ( fullWidth, "full-width" )
    , ( proportionalWidth, "proportional-width")
    , ( ruby, "ruby" )
    ]


emojiVals =
    [ ( text, "text" )
    , ( emoji, "emoji" )
    , ( unicode, "unicode" )
    ]


position =
    [ ( sub, "sub" )
    , ( super, "super" )
    ]


all : Test
all =
    Test.concat
        [ CssTest.property1 fontVariant
            { functionName = "fontVariant", propertyName = "font-variant"}
            ( ligatures
            ++ caps
            ++ numeric
            ++ eastAsian
            ++ emojiVals
            ++ position
            )


        , CssTest.property
            { functionName = "fontVariant2", propertyName = "font-variant" }
            [ ( fontVariant2 noCommonLigatures proportionalNums, "no-common-ligatures proportional-nums" )
            , ( fontVariant2 commonLigatures tabularNums, "common-ligatures tabular-nums" )
            , ( fontVariant2 smallCaps slashedZero, "small-caps slashed-zero" )
            ]


        , CssTest.property1 fontVariantLigatures
            { functionName = "fontVariantLigatures", propertyName = "font-variant-ligatures"}
            ligatures


        , CssTest.property1 fontVariantCaps
            { functionName = "fontVariantCaps", propertyName = "font-variant-caps"}
            caps
        

        , CssTest.property1 fontVariantNumeric
            { functionName = "fontVariantNumeric", propertyName = "font-variant-numeric"}
            (   ( normal, "normal" )
                :: numeric
            )


        , CssTest.property
            { functionName = "fontVariantNumeric4" , propertyName = "font-variant-numeric" }
            [   ( fontVariantNumeric4 (Just ordinal) Nothing (Just tabularNums) Nothing
                , "ordinal tabular-nums"
                )
            ,   ( fontVariantNumeric4 Nothing Nothing Nothing Nothing
                , "normal"
                )
            ,   ( fontVariantNumeric4 Nothing (Just liningNums) Nothing (Just diagonalFractions)
                , "lining-nums diagonal-fractions"
                )
            ,   ( fontVariantNumeric4 (Just slashedZero) (Just oldstyleNums) (Just proportionalNums) (Just stackedFractions)
                , "slashed-zero oldstyle-nums proportional-nums stacked-fractions"
                )
            ]


        , CssTest.property1 fontVariantEastAsian
            { functionName = "fontVariantEastAsian", propertyName = "font-variant-east-asian" }
            (   ( normal, "normal" )
                :: eastAsian
            )
        

        , CssTest.property
            { functionName = "fontVariantEastAsian2", propertyName = "font-variant-east-asian" }
            [ ( fontVariantEastAsian2 jis83 fullWidth, "jis83 full-width" )
            , ( fontVariantEastAsian2 ruby jis04, "ruby jis04" )
            , ( fontVariantEastAsian2 jis78 proportionalWidth, "jis78 proportional-width" )
            ]
        

        , CssTest.property
            { functionName = "fontVariantEastAsian3", propertyName = "font-variant-east-asian" }
            [ ( fontVariantEastAsian3 ruby jis83 fullWidth, "ruby jis83 full-width" )
            , ( fontVariantEastAsian3 ruby jis04 proportionalWidth, "ruby jis04 proportional-width" )
            ]


        , CssTest.property1 fontVariantEmoji
            { functionName = "fontVariantEmoji", propertyName = "font-variant-emoji"}
            (   ( normal, "normal" )
                :: emojiVals
            )
        
        , CssTest.property1 fontVariantPosition
            { functionName = "fontVariantPosition", propertyName = "font-variant-position"}
            (   ( normal, "normal" )
                :: position
            )
        
        , CssTest.property1 fontKerning
            { functionName = "fontKerning", propertyName = "font-kerning" }
            [ ( auto, "auto" )
            , ( normal, "normal" )
            , ( none, "none" )
            ]
        
        , CssTest.property1 fontLanguageOverride
            { functionName = "fontLanguageOverride", propertyName = "font-language-override" }
            [ ( normal, "normal" )
            , ( string "ENG", "\"ENG\"")
            , ( string "FRA", "\"FRA\"")
            , ( string "TRK", "\"TRK\"")
            ]
        
        , CssTest.property1 fontOpticalSizing
            { functionName = "fontOpticalSizing", propertyName = "font-optical-sizing" }
            [ ( none, "none" )
            , ( auto, "auto" )
            ]
        ]
        
