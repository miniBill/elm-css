module CssTest exposing
    ( property1
    , property
    , length
    , length2
    , length3
    , length4
    , lineWidth
    , lineStyleWithoutHidden
    , lineStyle
    , lineWidthAndStyle
    , lineWidthStyleAndColor
    , lineWidthStyleAndColorWithoutHidden
    , color
    , color2
    , color3
    , color4
    , image
    , listStyleType
    , time
    , blendMode
    )

{-| Module for creating large-scale, fully comprehensive CSS function/value tests.

## CSS property testing

@docs property1, property

## Prepared comprehensive value sets to run through with properties

### Length

@docs length, length2, length3, length4

### Other

@docs lineWidth, lineStyleWithoutHidden, lineStyle, color, image, listStyleType, time
-}

import Css exposing (..)
import Css.Preprocess exposing (toPropertyStrings)
import Css.Value exposing (Value(..), Supported)
import Expect
import Test exposing (Test)


{-| Type encapsulating some extra information for testing.

- functionName: The name of the CSS property function we're testing, so it shows up nicely.
- propertyName: The equivalent CSS property name, for comparative CSS compilation testing.
-}
type alias PropertyDescription =
    { functionName : String, propertyName : String }


{-| For testing any single-argument property function. Has BaseValue testing built-in.
-}
property1 :
    (Value
        { provides
            | initial : Supported
            , inherit : Supported
            , unset : Supported
            , revert : Supported
        }
     -> Style
    )
    -> PropertyDescription
    ->
        List
            ( Value
                { provides
                    | initial : Supported
                    , inherit : Supported
                    , unset : Supported
                    , revert : Supported
                }
            , String
            )
    -> Test
property1 propertyUnderTest description valuePairs =
    property
        description
        (List.map (\( value, expected ) -> ( propertyUnderTest value, expected )) valuePairs
            ++ testBaseValues propertyUnderTest
        )


{-| For testing any property functions that isn't a single-argument variant.
-}
property : PropertyDescription -> List ( Style, String ) -> Test
property { functionName, propertyName } modifierPairs =
    Test.describe functionName
        (List.map (expectPropertyWorks propertyName) modifierPairs)


{-| Helper function that tests a single property/value pair.
-}
expectPropertyWorks : String -> ( Style, String ) -> Test
expectPropertyWorks propertyName ( style, expectedStr ) =
    Test.describe (propertyName ++ ": " ++ expectedStr)
        [ Test.test "emitted as expected" <|
            \() ->
                toPropertyStrings [ style ]
                    |> Expect.equal [ propertyName ++ ":" ++ expectedStr ]
        ]


{-| Tests the BaseValue keywords, which should be in
every single-argument variant of a property.
-}
testBaseValues :
    (Value
        { provides
            | initial : Supported
            , inherit : Supported
            , unset : Supported
            , revert : Supported
        }
     -> Style
    )
    -> List ( Style, String )
testBaseValues propertyUnderTest =
    [ ( propertyUnderTest initial, "initial" )
    , ( propertyUnderTest inherit, "inherit" )
    , ( propertyUnderTest unset, "unset" )
    , ( propertyUnderTest revert, "revert")
    ]


{-| Adds full testing sets for Length types to a CSS property that
takes 1 Length value.
-}
length :
    List
        ( Value
            { supported
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
        , String
        )
length =
    [ ( ch 2.3, "2.3ch" )
    , ( cm 13.3, "13.3cm" )
    , ( em 0.625, "0.625em" )
    , ( ex 3.14, "3.14ex" )
    , ( inch 2.54, "2.54in" )
    , ( mm 12.345, "12.345mm" )
    , ( pc 7.7, "7.7pc" )
    , ( pt 65.4, "65.4pt" )
    , ( px 1.5, "1.5px" )
    , ( q 8.4, "8.4Q" )
    , ( rem 5.3, "5.3rem" )
    , ( vh 99.54, "99.54vh" )
    , ( vw 33.333, "33.333vw" )
    , ( vmax 4.73, "4.73vmax" )
    , ( vmin 12.7, "12.7vmin" )
    , ( zero, "0" )
    , ( calc (rem 3.2) (minus (px 5.5)), "calc(3.2rem - 5.5px)" )
    ]


{-| Adds full testing sets for Length types to a CSS property
that takes 2 Length values.
-}
length2 :
    (Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inch : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
        }
     ->
        Value
            { value2
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     -> Style
    )
    -> List ( Style, String )
length2 propertyUnderTest =
    [ ( propertyUnderTest (ch 2.3) (ch 4.5), "2.3ch 4.5ch" )
    , ( propertyUnderTest (cm 13.3) (cm 2.8), "13.3cm 2.8cm" )
    , ( propertyUnderTest (em 0.625) (em 1), "0.625em 1em" )
    , ( propertyUnderTest (ex 3.14) (ex 4.3), "3.14ex 4.3ex" )
    , ( propertyUnderTest (inch 2.54) (inch 0.5), "2.54in 0.5in" )
    , ( propertyUnderTest (mm 12.345) (mm 2.54), "12.345mm 2.54mm" )
    , ( propertyUnderTest (pc 7.7) (pc 3), "7.7pc 3pc" )
    , ( propertyUnderTest (pt 65.4) (pt 12), "65.4pt 12pt" )
    , ( propertyUnderTest (px 1.5) (px 25), "1.5px 25px" )
    , ( propertyUnderTest (q 8.4) (q 24), "8.4Q 24Q" )
    , ( propertyUnderTest (rem 5.3) (rem 2), "5.3rem 2rem" )
    , ( propertyUnderTest (vh 99.54) (vh 20), "99.54vh 20vh" )
    , ( propertyUnderTest (vw 33.333) (vw 14), "33.333vw 14vw" )
    , ( propertyUnderTest (vmax 4.73) (vmax 3), "4.73vmax 3vmax" )
    , ( propertyUnderTest (vmin 12.7) (vmin 5.4), "12.7vmin 5.4vmin" )
    , ( propertyUnderTest zero zero, "0 0" )
    , ( propertyUnderTest (calc (rem 3.2) (minus (px 5.5))) (calc (pt 12.5) (plus (ex 2))), "calc(3.2rem - 5.5px) calc(12.5pt + 2ex)" )
    ]


{-| Adds full testing sets for Length types to a CSS property
that takes 3 Length values.
-}
length3 :
    (Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inch : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
        }
     ->
        Value
            { value2
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     ->
        Value
            { value3
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     -> Style
    )
    -> List ( Style, String )
length3 propertyUnderTest =
    [ ( propertyUnderTest (ch 2.3) (ch 4.5) (ch 26), "2.3ch 4.5ch 26ch" )
    , ( propertyUnderTest (cm 13.3) (cm 2.8) (cm 4.2), "13.3cm 2.8cm 4.2cm" )
    , ( propertyUnderTest (em 0.625) (em 1) (em 3.4), "0.625em 1em 3.4em" )
    , ( propertyUnderTest (ex 3.14) (ex 4.3) (ex 7), "3.14ex 4.3ex 7ex" )
    , ( propertyUnderTest (inch 2.54) (inch 0.5) (inch 1.3), "2.54in 0.5in 1.3in" )
    , ( propertyUnderTest (mm 12.345) (mm 2.54) (mm 4), "12.345mm 2.54mm 4mm" )
    , ( propertyUnderTest (pc 7.7) (pc 3) (pc 5), "7.7pc 3pc 5pc" )
    , ( propertyUnderTest (pt 65.4) (pt 12) (pt 5), "65.4pt 12pt 5pt" )
    , ( propertyUnderTest (px 1.5) (px 25) (px 100), "1.5px 25px 100px" )
    , ( propertyUnderTest (q 8.4) (q 24) (q 1.8), "8.4Q 24Q 1.8Q" )
    , ( propertyUnderTest (rem 5.3) (rem 2) (rem 7), "5.3rem 2rem 7rem" )
    , ( propertyUnderTest (vh 99.54) (vh 20) (vh 4), "99.54vh 20vh 4vh" )
    , ( propertyUnderTest (vw 33.333) (vw 14) (vw 6), "33.333vw 14vw 6vw" )
    , ( propertyUnderTest (vmax 4.73) (vmax 3) (vmax 8), "4.73vmax 3vmax 8vmax" )
    , ( propertyUnderTest (vmin 12.7) (vmin 5.4) (vmin 5), "12.7vmin 5.4vmin 5vmin" )
    , ( propertyUnderTest zero zero zero, "0 0 0" )
    , ( propertyUnderTest
            (calc (rem 3.2) (minus (px 5.5)))
            (calc (pt 12.5) (plus (ex 2)))
            (calc (vh 1) (times (num 3)))
      , "calc(3.2rem - 5.5px) calc(12.5pt + 2ex) calc(1vh * 3)"
      )
    ]


{-| Adds full testing sets for Length types to a CSS property that
takes 4 Length values.
-}
length4 :
    (Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inch : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
        }
     ->
        Value
            { value2
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     ->
        Value
            { value3
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     ->
        Value
            { value4
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     -> Style
    )
    -> List ( Style, String )
length4 propertyUnderTest =
    [ ( propertyUnderTest (ch 2.3) (ch 4.5) (ch 26) (ch 1), "2.3ch 4.5ch 26ch 1ch" )
    , ( propertyUnderTest (cm 13.3) (cm 2.8) (cm 4.2) (cm 1), "13.3cm 2.8cm 4.2cm 1cm" )
    , ( propertyUnderTest (em 0.625) (em 1) (em 3.4) (em 1), "0.625em 1em 3.4em 1em" )
    , ( propertyUnderTest (ex 3.14) (ex 4.3) (ex 7) (ex 1), "3.14ex 4.3ex 7ex 1ex" )
    , ( propertyUnderTest (inch 2.54) (inch 0.5) (inch 1.3) (inch 1), "2.54in 0.5in 1.3in 1in" )
    , ( propertyUnderTest (mm 12.345) (mm 2.54) (mm 4) (mm 1), "12.345mm 2.54mm 4mm 1mm" )
    , ( propertyUnderTest (pc 7.7) (pc 3) (pc 5) (pc 1), "7.7pc 3pc 5pc 1pc" )
    , ( propertyUnderTest (pt 65.4) (pt 12) (pt 5) (pt 1), "65.4pt 12pt 5pt 1pt" )
    , ( propertyUnderTest (px 1.5) (px 25) (px 100) (px 1), "1.5px 25px 100px 1px" )
    , ( propertyUnderTest (q 8.4) (q 24) (q 1.8) (q 1), "8.4Q 24Q 1.8Q 1Q" )
    , ( propertyUnderTest (rem 5.3) (rem 2) (rem 7) (rem 1), "5.3rem 2rem 7rem 1rem" )
    , ( propertyUnderTest (vh 99.54) (vh 20) (vh 4) (vh 1), "99.54vh 20vh 4vh 1vh" )
    , ( propertyUnderTest (vw 33.333) (vw 14) (vw 6) (vw 1), "33.333vw 14vw 6vw 1vw" )
    , ( propertyUnderTest (vmax 4.73) (vmax 3) (vmax 8) (vmax 1), "4.73vmax 3vmax 8vmax 1vmax" )
    , ( propertyUnderTest (vmin 12.7) (vmin 5.4) (vmin 5) (vmin 1), "12.7vmin 5.4vmin 5vmin 1vmin" )
    , ( propertyUnderTest zero zero zero zero, "0 0 0 0" )
    , ( propertyUnderTest
            (calc (rem 3.2) (minus (px 5.5)))
            (calc (pt 12.5) (plus (ex 2)))
            (calc (vh 1) (times (num 3)))
            (calc (pt 16) (dividedBy (num 2.3)))
      , "calc(3.2rem - 5.5px) calc(12.5pt + 2ex) calc(1vh * 3) calc(16pt / 2.3)"
      )
    ]


{-| Adds full testing sets for Length types to a CSS property that
takes 4 Length values.
-}
lineWidth :
    List
        ( Value
            { supported
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inch : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
                , thin : Supported
                , medium : Supported
                , thick : Supported
            }
        , String
        )
lineWidth =
    length
        ++ [ ( thin, "thin" )
           , ( medium, "medium" )
           , ( thick, "thick" )
           ]


lineStyleWithoutHidden :
    List
        ( Value
            { provides
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset_ : Supported
                , outset : Supported
            }
        , String
        )
lineStyleWithoutHidden =
    [ ( none, "none" )
    , ( solid, "solid" )
    , ( dotted, "dotted" )
    , ( dashed, "dashed" )
    , ( double, "double" )
    , ( groove, "groove" )
    , ( ridge, "ridge" )
    , ( inset_, "inset" )
    , ( outset, "outset" )
    ]


lineStyle :
    List
        ( Value
            { provides
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , hidden : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset_ : Supported
                , outset : Supported
            }
        , String
        )
lineStyle =
    ( hidden, "hidden" ) :: lineStyleWithoutHidden


lineWidthAndStyle :
    ( Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inch : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
        }
     ->
        Value
            { value2
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , hidden : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset_ : Supported
                , outset : Supported
            }
     -> Style
    )
    -> List ( Style, String )
lineWidthAndStyle propertyUnderTest =
    [ ( propertyUnderTest (px 3) solid, "3px solid" )
    , ( propertyUnderTest thick dashed, "thick dashed" )
    , ( propertyUnderTest (rem 2) inset_, "2rem inset" )
    , ( propertyUnderTest (px 1) solid, "1px solid" )
    , ( propertyUnderTest (rem 11) dotted, "11rem dotted" )
    , ( propertyUnderTest (pc 20) dashed, "20pc dashed" )
    , ( propertyUnderTest (px 1) ridge, "1px ridge" )
    ]


lineWidthStyleAndColor :
    ( Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inch : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
        }
     ->
        Value
            { value2
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , hidden : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset_ : Supported
                , outset : Supported
            }
    -> 
        Value
            { value3
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
     -> Style
    )
    -> List ( Style, String )
lineWidthStyleAndColor propertyUnderTest =
    ( propertyUnderTest (pt 15.5) hidden (hex "#feda"), "15.5pt hidden #feda" )
    :: lineWidthStyleAndColorWithoutHidden propertyUnderTest
    
lineWidthStyleAndColorWithoutHidden :
    ( Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inch : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
        }
     ->
        Value
            { value2
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset_ : Supported
                , outset : Supported
            }
    -> 
        Value
            { value3
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
     -> Style
    )
    -> List ( Style, String )
lineWidthStyleAndColorWithoutHidden propertyUnderTest =
    [ ( propertyUnderTest (px 3) solid (hex "ff0000"), "3px solid #ff0000" )
    , ( propertyUnderTest thick dashed (hsl 212 0.4 0.8), "thick dashed hsl(212,40%,80%)" )
    , ( propertyUnderTest (rem 2) inset_ currentcolor, "2rem inset currentcolor" )
    , ( propertyUnderTest (px 1) solid (hex "#000"), "1px solid #000" )
    , ( propertyUnderTest (rem 11) dotted (rgb 111 230 122), "11rem dotted rgb(111,230,122)" )
    , ( propertyUnderTest (pc 20) dashed currentcolor, "20pc dashed currentcolor" )
    , ( propertyUnderTest (px 1) ridge (hsl 33 0.1 0.5), "1px ridge hsl(33,10%,50%)" )
    , ( propertyUnderTest (px 10) none (hsl 120 0.5 0.5), "10px none hsl(120,50%,50%)" )
    , ( propertyUnderTest (cm 3.1) solid (rgb 112 22 75), "3.1cm solid rgb(112,22,75)" )
    , ( propertyUnderTest (em 0.2) dotted (rgba 112 22 75 0.1), "0.2em dotted rgba(112,22,75,0.1)" )
    , ( propertyUnderTest (ex 10.5) dashed (hex "fadffe"), "10.5ex dashed #fadffe" )
    , ( propertyUnderTest (inch 1) solid (hex "eef"), "1in solid #eef" )
    , ( propertyUnderTest (mm 2.54) double (hex "#ddfead99"), "2.54mm double #ddfead99" )
    , ( propertyUnderTest (pc 8.7) groove (hex "#356265"), "8.7pc groove #356265" )
    , ( propertyUnderTest (pt 15.5) ridge (hex "#feda"), "15.5pt ridge #feda" )
    , ( propertyUnderTest (q 5) ridge currentcolor, "5Q ridge currentcolor" )
    , ( propertyUnderTest (rem 1.1) inset_ (hex "844c"), "1.1rem inset #844c" )
    , ( propertyUnderTest (vh 1.2) outset (hex "ef5f7e9f"), "1.2vh outset #ef5f7e9f" )
    , ( propertyUnderTest (vw 2.1) solid (rgb 112 22 75), "2.1vw solid rgb(112,22,75)" )
    , ( propertyUnderTest (vmax 3.5) solid (rgb 112 22 75), "3.5vmax solid rgb(112,22,75)" )
    , ( propertyUnderTest (vmin 4.2) solid (rgb 112 22 75), "4.2vmin solid rgb(112,22,75)" )
    , ( propertyUnderTest zero solid (rgb 112 22 75), "0 solid rgb(112,22,75)" )
    , ( propertyUnderTest (calc (rem 3.2) (minus (px 5.5))) solid (rgb 112 22 75), "calc(3.2rem - 5.5px) solid rgb(112,22,75)" )
    ]

color :
    List
        ( Value
            { provides
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
        , String
        )
color =
    [ ( hsl 120 0.5 0.5, "hsl(120,50%,50%)" )
    , ( hsla 120 0.5 0.5 0.5, "hsla(120,50%,50%,0.5)" )
    , ( rgb 255 230 211, "rgb(255,230,211)" )
    , ( rgba 12 2 33 0.95, "rgba(12,2,33,0.95)" )
    , ( hex "fff", "#fff" )
    , ( hex "#14ac34", "#14ac34" )
    , ( hex "#000c", "#000c" )
    , ( hex "00112233", "#00112233" )
    , ( currentcolor, "currentcolor" )
    ]

color2 :
    ( Value
        { value1
            | hsl : Supported
            , hsla : Supported
            , rgb : Supported
            , rgba : Supported
            , hex : Supported
            , currentcolor : Supported
        }
     ->
        Value
            { value2
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
     -> Style
    )
    -> List ( Style, String )
color2 propertyUnderTest =
    [ ( propertyUnderTest (hsl 120 0.5 0.5) (hsl 314 0.6 0.2), "hsl(120,50%,50%) hsl(314,60%,20%)" )
    , ( propertyUnderTest (hsla 120 0.5 0.5 0.5) (hsla 15 0.1 0.79 0.56), "hsla(120,50%,50%,0.5) hsla(15,10%,79%,0.56)" )
    , ( propertyUnderTest (rgb 255 230 211) (rgb 12 78 245), "rgb(255,230,211) rgb(12,78,245)" )
    , ( propertyUnderTest (rgba 12 2 33 0.95) (rgba 65 124 46 0.6), "rgba(12,2,33,0.95) rgba(65,124,46,0.6)" )
    , ( propertyUnderTest (hex "fff") (hex "eee"), "#fff #eee" )
    , ( propertyUnderTest (hex "#14ac34") (hex "#87fe3a"), "#14ac34 #87fe3a" )
    , ( propertyUnderTest (hex "#000c") (hex "#1225"), "#000c #1225" )
    , ( propertyUnderTest (hex "00112233") (hex "45671248"), "#00112233 #45671248" )
    , ( propertyUnderTest currentcolor currentcolor, "currentcolor currentcolor" )
    ]

color3 :
    ( Value
        { value1
            | hsl : Supported
            , hsla : Supported
            , rgb : Supported
            , rgba : Supported
            , hex : Supported
            , currentcolor : Supported
        }
     ->
        Value
            { value2
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
    ->
        Value
            { value3
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
     -> Style
    )
    -> List ( Style, String )
color3 propertyUnderTest =
    [ ( propertyUnderTest (hsl 120 0.5 0.5) (hsl 314 0.6 0.2) (hsla 120 0.5 0.5 0.5), "hsl(120,50%,50%) hsl(314,60%,20%) hsla(120,50%,50%,0.5)" )
    , ( propertyUnderTest (hsla 15 0.1 0.79 0.56) (rgb 255 230 211) (rgb 12 78 245), "hsla(15,10%,79%,0.56) rgb(255,230,211) rgb(12,78,245)" )
    , ( propertyUnderTest (rgba 12 2 33 0.95) (rgba 65 124 46 0.6) (hex "fff"), "rgba(12,2,33,0.95) rgba(65,124,46,0.6) #fff" )
    , ( propertyUnderTest (hex "#eee") (hex "#14ac34") (hex "#87fe3a"), "#eee #14ac34 #87fe3a" )
    , ( propertyUnderTest (hex "#000c") (hex "#1225") (hex "00112233"), "#000c #1225 #00112233" )
    , ( propertyUnderTest  (hex "45671248") currentcolor currentcolor, "#45671248 currentcolor currentcolor" )
    ]

color4 :
    ( Value
        { value1
            | hsl : Supported
            , hsla : Supported
            , rgb : Supported
            , rgba : Supported
            , hex : Supported
            , currentcolor : Supported
        }
     ->
        Value
            { value2
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
    ->
        Value
            { value3
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
    ->
        Value
            { value4
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
     -> Style
    )
    -> List ( Style, String )
color4 propertyUnderTest =
    [ ( propertyUnderTest (hsl 120 0.5 0.5) (hsl 314 0.6 0.2) (hsla 120 0.5 0.5 0.5) (hex "#eee"), "hsl(120,50%,50%) hsl(314,60%,20%) hsla(120,50%,50%,0.5) #eee" )
    , ( propertyUnderTest (hsla 15 0.1 0.79 0.56) (rgb 255 230 211) (rgb 12 78 245) (hex "#14ac34"), "hsla(15,10%,79%,0.56) rgb(255,230,211) rgb(12,78,245) #14ac34" )
    , ( propertyUnderTest (rgba 12 2 33 0.95) (rgba 65 124 46 0.6) (hex "fff") (hex "#87fe3a"), "rgba(12,2,33,0.95) rgba(65,124,46,0.6) #fff #87fe3a" )
    , ( propertyUnderTest (hex "#000c") (hex "#1225") (hex "00112233") (hex "44444422"), "#000c #1225 #00112233 #44444422" )
    , ( propertyUnderTest currentcolor (hex "45671248") currentcolor currentcolor, "currentcolor #45671248 currentcolor currentcolor" )
    ]

image :
    List
        ( Value
            { provides
                | url : Supported
                , linearGradient : Supported
                , radialGradient : Supported
                , repeatingLinearGradient : Supported
                , repeatingRadialGradient : Supported
            }
        , String
        )
image =
    [ ( url "https://example.com", "url(https://example.com)" )
    , ( linearGradient (stop <| hex "111") (stop <| hex "222") [], "linear-gradient(#111,#222)" )

    --TODO radialGradient
    --TODO repeatingLinearGradient
    --TODO repeatingRadialGradient
    ]


listStyleType :
    List
        ( Value
            { supported
                | customIdent : Supported
                , string : Supported
                , none : Supported
                , arabicIndic : Supported
                , armenian : Supported
                , bengali : Supported
                , cambodian : Supported
                , circle_ : Supported
                , cjkDecimal : Supported
                , cjkEarthlyBranch : Supported
                , cjkHeavenlyStem : Supported
                , cjkIdeographic : Supported
                , decimal : Supported
                , decimalLeadingZero : Supported
                , devanagari : Supported
                , disc : Supported
                , disclosureClosed : Supported
                , disclosureOpen : Supported
                , ethiopicNumeric : Supported
                , georgian : Supported
                , gujarati : Supported
                , gurmukhi : Supported
                , hebrew : Supported
                , hiragana : Supported
                , hiraganaIroha : Supported
                , japaneseFormal : Supported
                , japaneseInformal : Supported
                , kannada : Supported
                , katakana : Supported
                , katakanaIroha : Supported
                , khmer : Supported
                , koreanHangulFormal : Supported
                , koreanHanjaFormal : Supported
                , koreanHanjaInformal : Supported
                , lao : Supported
                , lowerAlpha : Supported
                , lowerArmenian : Supported
                , lowerGreek : Supported
                , lowerLatin : Supported
                , lowerRoman : Supported
                , malayalam : Supported
                , monogolian : Supported
                , myanmar : Supported
                , oriya : Supported
                , persian : Supported
                , simpChineseFormal : Supported
                , simpChineseInformal : Supported
                , square : Supported
                , tamil : Supported
                , telugu : Supported
                , thai : Supported
                , tibetan : Supported
                , tradChineseFormal : Supported
                , tradChineseInformal : Supported
                , upperAlpha : Supported
                , upperArmenian : Supported
                , upperLatin : Supported
                , upperRoman : Supported
            }
        , String
        )
listStyleType =
    [ ( none, "none" )
    , ( string "arbitrary\n\"\\", "\"arbitrary\\A \\\"\\\\\"" )
    , ( customIdent "hello-world", "hello-world" )
    , ( arabicIndic, "arabic-indic" )
    , ( armenian, "armenian" )
    , ( bengali, "bengali" )
    , ( cambodian, "cambodian" )
    , ( circle_, "circle" )
    , ( cjkDecimal, "cjk-decimal" )
    , ( cjkEarthlyBranch, "cjk-earthly-branch" )
    , ( cjkHeavenlyStem, "cjk-heavenly-stem" )
    , ( cjkIdeographic, "cjk-ideographic" )
    , ( decimal, "decimal" )
    , ( decimalLeadingZero, "decimal-leading-zero" )
    , ( devanagari, "devanagari" )
    , ( disc, "disc" )
    , ( disclosureClosed, "disclosure-closed" )
    , ( disclosureOpen, "disclosure-open" )
    , ( ethiopicNumeric, "ethiopic-numeric" )
    , ( georgian, "georgian" )
    , ( gujarati, "gujarati" )
    , ( gurmukhi, "gurmukhi" )
    , ( hebrew, "hebrew" )
    , ( hiragana, "hiragana" )
    , ( hiraganaIroha, "hiragana-iroha" )
    , ( japaneseFormal, "japanese-formal" )
    , ( japaneseInformal, "japanese-informal" )
    , ( kannada, "kannada" )
    , ( katakana, "katakana" )
    , ( katakanaIroha, "katakana-iroha" )
    , ( khmer, "khmer" )
    , ( koreanHangulFormal, "korean-hangul-formal" )
    , ( koreanHanjaFormal, "korean-hanja-formal" )
    , ( koreanHanjaInformal, "korean-hanja-informal" )
    , ( lao, "lao" )
    , ( lowerAlpha, "lower-alpha" )
    , ( lowerArmenian, "lower-armenian" )
    , ( lowerGreek, "lower-greek" )
    , ( lowerLatin, "lower-latin" )
    , ( lowerRoman, "lower-roman" )
    , ( malayalam, "malayalam" )
    , ( myanmar, "myanmar" )
    , ( oriya, "oriya" )
    , ( persian, "persian" )
    , ( simpChineseFormal, "simp-chinese-formal" )
    , ( simpChineseInformal, "simp-chinese-informal" )
    , ( square, "square" )
    , ( tamil, "tamil" )
    , ( telugu, "telugu" )
    , ( thai, "thai" )
    , ( tibetan, "tibetan" )
    , ( tradChineseFormal, "trad-chinese-formal" )
    , ( tradChineseInformal, "trad-chinese-informal" )
    , ( upperAlpha, "upper-alpha" )
    , ( upperArmenian, "upper-armenian" )
    , ( upperLatin, "upper-latin" )
    , ( upperRoman, "upper-roman" )
    ]


time :
    List
        ( Value
            { supported
                | s : Supported
                , ms : Supported
            }
        , String
        )
time =
    [ ( s 1.2, "1.2s" )
    , ( ms 300, "300ms" )
    ]


blendMode :
    List
        ( Value
            { supported
                | normal : Supported
                , multiply : Supported
                , screen : Supported
                , overlay : Supported
                , darken : Supported
                , lighten : Supported
                , colorDodge : Supported
                , colorBurn : Supported
                , hardLight : Supported
                , softLight : Supported
                , difference : Supported
                , exclusion : Supported
                , hue : Supported
                , saturation : Supported
                , color_ : Supported
                , luminosity : Supported
            }
        , String
        )
blendMode =
    [ ( normal, "normal" )
    , ( multiply, "multiply" )
    , ( screen, "screen" )
    , ( overlay, "overlay" )
    , ( darken, "darken" )
    , ( lighten, "lighten" )
    , ( colorDodge, "color-dodge" )
    , ( colorBurn, "color-burn" )
    , ( hardLight, "hard-light" )
    , ( softLight, "soft-light" )
    , ( difference, "difference" )
    , ( exclusion, "exclusion" )
    , ( hue, "hue" )
    , ( saturation, "saturation" )
    , ( color_, "color" )
    , ( luminosity, "luminosity")
    ]
