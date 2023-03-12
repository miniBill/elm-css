module Css.Media exposing
    ( MediaQuery, MediaType, Expression

    -- rule constructors
    , withMedia, withMediaQuery

    -- query constructors
    , all, only, not

    -- media type
    , screen, print, speech

    -- size
    , width, minWidth, maxWidth
    , height, minHeight, maxHeight

    -- aspect ratio
    , aspectRatio, minAspectRatio, maxAspectRatio

    -- orientation
    , OrientationSupported, Orientation
    , landscape, portrait, orientation

    -- resolution
    , ResolutionSupported, Resolution
    , dpi, dpcm, dppx, x
    , resolution, minResolution, maxResolution

    -- scanning
    , ScanningProcessSupported, ScanningProcess
    , scan
    , progressive, interlace
    
    -- grid or bitmap-based screen
    , grid

    -- overflow-block
    , overflowBlock, overflowInline
    , paged, optionalPaged
    
    -- color depth
    , color, minColor, maxColor
    , monochrome, minMonochrome, maxMonochrome
    , colorIndex, minColorIndex, maxColorIndex
    
    -- color gamut
    , colorGamut, srgb, p3, rec2020

    -- interaction features
    , PointingAccuracySupported, PointingAccuracy
    , pointer, anyPointer
    , hover, anyHover
    , fine, coarse, hover_

    -- scripting
    , scripting, initialOnly, enabled
    )

{-| Functions for building [`@media` queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries).

# Data Structures

@docs MediaQuery, MediaType, Expression

-------------------------------

# Constructors

## `@media` rule constructors

@docs withMedia, withMediaQuery

## Query constructors

@docs all, only, not

-------------------------------

# Media types

@docs screen, print, speech

-------------------------------

# Size media features

For querying either the size of the viewport
or the size of a printed page.

@docs width, minWidth, maxWidth
@docs height, minHeight, maxHeight

## Ratio

@docs aspectRatio, minAspectRatio, maxAspectRatio

## Orientation

@docs OrientationSupported, Orientation
@docs orientation
@docs landscape, portrait

-------------------------------

# Display Quality Media Features

## Resolution

@docs ResolutionSupported, Resolution
@docs dpi, dpcm, dppx, x
@docs resolution, minResolution, maxResolution

## Display scanning

@docs ScanningProcessSupported, ScanningProcess
@docs scan, progressive, interlace

## Bitmap or grid-based display

@docs grid

## Overflow

@docs overflowBlock, overflowInline
@docs paged, optionalPaged

-------------------------------

# Color Media Features

## Bit depth

@docs color, minColor, maxColor
@docs monochrome, minMonochrome, maxMonochrome
@docs colorIndex, minColorIndex, maxColorIndex

## Color gamut

@docs colorGamut
@docs srgb, p3, rec2020

-------------------------------

# Interaction Media Features

@docs PointingAccuracySupported, PointingAccuracy
@docs pointer, anyPointer
@docs hover, anyHover
@docs coarse, fine, hover_

-------------------------------

# Scripting Media Features

@docs scripting
@docs enabled, initialOnly
-}

import Css exposing (Style, Supported)
import Css.Preprocess as Preprocess
import Css.Structure as Structure exposing (..)
import Json.Encode exposing (Value)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------- DATA STRUCTURES -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


type Value supports
    = Value String


{-| One query of a media rule. A media rule can have multiple queries.
The CSS below contains 1 rule, with 2 queries.
```css
@media print, screen and (monochrome) {
    body {
        color: black;
    }
}
```
The above rule roughly translates as:
_If the device is a printer or is a monochrome screen, the body color is black._
In elm-css, queries are joined into rules using a special `MediaQuery`
returned by the `or` function.
-}
type alias MediaQuery =
    Structure.MediaQuery


{-| A [media type](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#Media_types).
-}
type alias MediaType =
    Structure.MediaType


{-| A media expression.
An expression is a [media feature](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#Media_features) with an optional value, which resolves to
either true or false.
In the media query `screen and (min-width: 768px)`,
  - `screen` is a media type,
  - `min-width` is a media feature, and
  - `(min-width: 768px)` is an expression.
-}
type alias Expression =
    Structure.MediaExpression


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------- PRIVATE HELPERS -----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


feature : String -> String -> Expression
feature key val =
    { feature = key, value = Just val }


unparameterizedFeature : String -> Expression
unparameterizedFeature key =
    { feature = key, value = Nothing }


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------ RULE CONSTRUCTORS ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Combines media queries that are nested under selectors into a `@media` rule.

    css
        [ withMedia [ only screen [ Media.minWidth (px 300), Media.maxWidth (px 800) ] ]
            [ Css.maxWidth (px 300) ]

The above code translates into the following CSS:

```css
@media only screen and (min-width: 300px) and (max-width: 800px) {
    ._c9f0fd {
        max-width: 300px;
    }
}
```
-}
withMedia : List MediaQuery -> List Style -> Style
withMedia =
    Preprocess.WithMedia


{-| Manually specify a `@media` rule that is nested under an element or class
using a List of strings.

    body
        [ withMediaQuery [ "screen and (min-width: 320px)", "screen and (max-height: 400px)" ]
            [ fontSize (px 14 px) ]
        ]

The above code translates into the following CSS:

```css
@media screen and (min-width: 320px), screen and (max-height: 400px) {
    body {
        font-size: 14px;
    }
}
```
-}
withMediaQuery : List String -> List Style -> Style
withMediaQuery queries =
    queries
        |> List.map Structure.CustomQuery
        |> Preprocess.WithMedia




------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------ QUERY CONSTRUCTORS ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Build a media query that will match all media types.
The supplied `expressions` are combined with `and`.

    withMedia [ all [ color, landscape ] ]
        [ body [ Css.color (hex "ff0000") ] ]

The above code translates into the following CSS:

```css
@media (color) and (landscape) {
    body {
        color: #ff0000;
    }
}
```
-}
all : List Expression -> MediaQuery
all =
    AllQuery


{-| Build a media query matching a single media type.

    withMedia [ only screen [ minWidth (px 320), portrait ] ]
        [ body [ Css.color (hex "ff0000") ] ]

The above code translates into the following CSS:

```css
@media only screen and (min-width: 320px) and (portrait) {
    body {
        color: #ff0000;
    }
}
```
-}
only : MediaType -> List Expression -> MediaQuery
only =
    OnlyQuery


{-| Build a negated media query.

    withMedia [ not screen [] ]
        [ body [ Css.color (hex "ff0000") ] ]

The above code translates into the following CSS:

```css
@media not screen {
    body {
        color: #ff0000;
    }
}
```
-}
not : MediaType -> List Expression -> MediaQuery
not =
    NotQuery


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------ MEDIA TYPE ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Css [media type](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_types)
for printers.

    withMedia print [ a [ color (hex 0), textDecoration none ] ]
-}
print : MediaType
print =
    Structure.Print


{-| CSS [media type](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_types)
for any device not matched by print or speech.

    withMedia (and screen (maxWidth (px 600)) [ Css.class mobileNav display none ]
-}
screen : MediaType
screen =
    Structure.Screen


{-| CSS [media type](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_types)
for screenreaders and similar devices that read out a page.

Note: support for this may be patchy

    withMedia (not speech) [ Css.class screenReaderOnly [ display none ] ]
-}
speech : MediaType
speech =
    Structure.Speech


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------------- SIZE ---------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`width`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
media feature.

    withMedia (Media.width (px 200)) [ ... ]
-}
width :
    Value
        ( Css.Length
        )
    -> Expression
width (Value val) =
    feature "width" val


{-| The [`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
CSS media feature.

    withMedia (Media.minWidth (px 600)) [ Css.class Container [ Css.maxWidth (px 500) ] ]
-}
minWidth :
    Value
        ( Css.Length
        )
    -> Expression
minWidth (Value val) =
    feature "min-width" val


{-| The [`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
CSS media feature.

    withMedia (Media.maxWidth (px 800)) [ Css.class MobileNav [ display none ] ]
-}
maxWidth :
    Value
        ( Css.Length
        )
    -> Expression
maxWidth (Value val) =
    feature "max-width" val


{-| The [`height`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
CSS media feature.

    withMedia (Media.height (px 200)) [ ... ]
-}
height :
    Value
        ( Css.Length
        )
    -> Expression
height (Value val) =
    feature "height" val


{-| The [`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
CSS media feature.

    withMedia (Media.minHeight (px 400)) [ Css.class TopBanner [ display block ] ]
-}
minHeight :
    Value
        ( Css.Length
        )
    -> Expression
minHeight (Value val) =
    feature "min-height" val


{-| The [`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
CSS media feature.

    withMedia (Media.maxHeight (px 399)) [ Css.class TopBanner [ display none ] ]
-}
maxHeight :
    Value
        ( Css.Length
        )
    -> Expression
maxHeight (Value val) =
    feature "max-height" val


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------------- RATIO --------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| Internal helper function that constructs the ratio Ints into a
ratio string that's formatted correctly for CSS.
-}
packRatio : Int -> Int -> String
packRatio numerator denominator =
    String.fromInt numerator ++ "/" ++ String.fromInt denominator 


{-| The [`aspect-ratio`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
CSS media feature.

    withMedia (aspectRatio 16 10) [ ... ]
-}
aspectRatio : Int -> Int -> Expression
aspectRatio numerator denominator =
    feature "aspect-ratio" <| packRatio numerator denominator


{-| The [`min-aspect-ratio`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
CSS media feature.

    withMedia (minAspectRatio 1 1) [ ... ]
-}
minAspectRatio : Int -> Int -> Expression
minAspectRatio numerator denominator =
    feature "min-aspect-ratio" <| packRatio numerator denominator


{-| The [`max-aspect-ratio`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
CSS media feature.

    withMedia (maxAspectRatio 16 9) [ ... ]
-}
maxAspectRatio : Int -> Int -> Expression
maxAspectRatio numerator denominator =
    feature "max-aspect-ratio" <| packRatio numerator denominator


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- ORIENTATION ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

{-| A type alias used to accept an orientation value, among others.
-}
type alias OrientationSupported supported =
    { supported
        | landscape : Supported
        , portrait : Supported
    }

{-| A type alias used to accept an orientation value.
-}
type Orientation =
    OrientationSupported {}


{-| Media feature [`orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/orientation).
-}
orientation : Value Orientation -> Expression
orientation (Value val) =
    feature "orientation" val


{-| The `landscape` value for the [`orientation`](#orientation) CSS media feature.
-}
landscape : Value { provides | landscape : Supported }
landscape = Value "landscape"

{-| The `portrait` value for the [`orientation`](#orientation) CSS media feature.
-}
portrait : Value { provides | portrait : Supported }
portrait = Value "portrait"



------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- RESOLUTION -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type alias used to accept a [resolution](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution)
among other values.
-}
type alias ResolutionSupported supported =
    { supported
        | dpi : Supported
        , dpcm : Supported
        , dppx : Supported
        , x : Supported
    }


{-| A type alias used to accept a [resolution](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution).
-}
type alias Resolution =
    ResolutionSupported {}


{-| [`dpi`](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution) resolution units.
-}
dpi : Float -> Value { provides | dpi : Supported }
dpi val =
    Value <| String.fromFloat val ++ "dpi"


{-| [`dpcm`](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution) resolution units.
-}
dpcm : Float -> Value { provides | dpcm : Supported }
dpcm val =
    Value <| String.fromFloat val ++ "dpcm"


{-| [`dppx`](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution) resolution units.
-}
dppx : Float -> Value { provides | dppx : Supported }
dppx val =
    Value <| String.fromFloat val ++ "dppx"


{-| An alias for [`dppx`](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution) resolution units.
-}
x : Float -> Value { provides | x : Supported }
x val =
    Value <| String.fromFloat val ++ "x"


{-| The [`resolution`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/resolution)
CSS media feature.

It describes the resolution of the output device.

    withMedia (resolution (dppx 2)) [ img [ width (pct 50) ] ]
-}
resolution : Value Resolution -> Expression
resolution (Value val) =
    feature "resolution" val


{-| The [`min-resolution`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/resolution)
CSS media feature.

It describes the minimum resolution of the output device.

    withMedia (minResolution (dpi 600)) [ Css.class HiResImg [ display block ] ]
-}
minResolution : Value Resolution -> Expression
minResolution (Value val) =
    feature "min-resolution" val


{-| The [`max-resolution`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/resolution)
CSS media feature.

It describes the maximum resolution of the output device.

    withMedia (maxResolution (dpcm 65)) [ Css.class HiResImg [ display none ] ]
-}
maxResolution : Value Resolution -> Expression
maxResolution (Value val) =
    feature "max-resolution" val


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------- SCANNING PROCESS ---------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type alias used to accept an scanning process value, among others.
-}
type alias ScanningProcessSupported supported =
    { supported
        | progressive : Supported
        , interlaced : Supported
    }


{-| A type alias used to accept an scanning process value.
-}
type alias ScanningProcess =
    ScanningProcessSupported {}
    

{-| The [`scan`](https://drafts.csswg.org/mediaqueries/#scan)
CSS media feature.

Queries scanning process of the device. Accepts `innterlace` (some TVs) or `progressive` (most things).
-}
scan : Value ScanningProcess -> Expression
scan (Value val) =
    feature "scan" val


{-| CSS Media query value for when a screen has progressive scan.

    scan progressive
-}
progressive : Value { provides | progressive : Supported }
progressive = Value "progressive"


{-| CSS Media query value for when a screen has interlaced scan.

    scan interlace
-}
interlace : Value { provides | interlaced : Supported }
interlace = Value "interlaced"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------- GRID OR BITMAP-BASED SCREEN -----------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`grid`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/grid)
CSS media feature.

Queries whether the output device's screen works on bitmaps or a character-based grids.
-}
grid : Expression
grid =
    unparameterizedFeature "grid"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------- OVERFLOW -------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`overflow-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/overflow-block)
CSS media feature.

It describes the behavior of the device when content overflows the
initial containing block in the block axis.
-}
overflowBlock :
    Value 
        { none : Supported
        , scroll : Supported
        , optionalPaged : Supported
        , paged : Supported
        }
    -> Expression
overflowBlock (Value val) =
    feature "overflow-block" val


{-| The [`overflow-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/overflow-inline)
CSS media feature.

It describes the behavior of the device when content overflows
the initial containing block in the block axis.
-}
overflowInline : 
    Value 
        { none : Supported
        , scroll : Supported
        }
    -> Expression
overflowInline (Value val) =
    feature "overflow-inline" val


{-| CSS Media query value for the block-overflow media feature.

    blockOverflow optionalPaged
-}
optionalPaged : Value { provides | optionalPaged : Supported }
optionalPaged = Value "optional-paged"


{-| CSS Media query value for the block-overflow media feature.

    blockOverflow paged
-}
paged : Value { provides | paged : Supported }
paged = Value "paged"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- COLOR DEPTH ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`color`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
CSS media feature.

    withMedia (not color) [ body [ Css.color (hex "000000") ] ]
-}
color : Expression
color =
    unparameterizedFeature "color"


{-| The [`min-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
CSS media feature.

    withMedia (screen (minColor 256)) [ a [ Css.color (hex "D9534F") ] ]
-}
minColor : Int -> Expression
minColor val =
    feature "min-color" (String.fromInt val)


{-| The [`max-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
CSS media feature.

    withMedia (and screen (maxColor 8)) [ a [ Css.color (hex "FF0000") ] ]
-}
maxColor : Int -> Expression
maxColor val =
    feature "max-color" (String.fromInt val)


{-| The [`monochrome`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
CSS media feature.

    withMedia [ monochrome ] [ body [ Css.color (hex "000000") ] ]
-}
monochrome : Expression
monochrome =
    unparameterizedFeature "monochrome"


{-| The [`min-monochrome`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
CSS media feature.

-}
minMonochrome : Int -> Expression
minMonochrome val =
    feature "min-monochrome" (String.fromInt val)


{-| The [`max-monochrome`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
CSS media feature.

-}
maxMonochrome : Int -> Expression
maxMonochrome val =
    feature "max-monochrome" (String.fromInt val)


{-| The [`color-index`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
CSS media feature.

It queries the number of colors in the user agent's color lookup table.

    withMedia (and screen (colorIndex 16777216)) [ a [ Css.color (hex "D9534F") ] ]
-}
colorIndex : Int -> Expression
colorIndex val =
    feature "color-index" (String.fromInt val)


{-| The [`min-color-index`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
CSS media feature.

It queries the number of colors in the user agent's color lookup table.

    withMedia (and screen (minColorIndex 16777216)) [ a [ Css.color (hex "D9534F") ] ]
-}
minColorIndex : Int -> Expression
minColorIndex val =
    feature "min-color-index" (String.fromInt val)


{-| The [`max-color-index`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
CSS media feature.

It queries the number of colors in the user agent's color lookup table.

    withMedia (and screen (maxColorIndex 256)) [ a [ Css.color (hex "FF0000") ] ]
-}
maxColorIndex : Int -> Expression
maxColorIndex val =
    feature "max-color-index" (String.fromInt val)


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
----------------------------- COLOR GAMUT ------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`color-gamut`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-gamut)
CSS media feature.

The keyword values this supports in order of how wide each color gamut is:

- `srgb` (narrowest, most common)
- `p3`
- `rec2020` (widest)

    withMedia (and screen (colorGamut rec2020)) [ Css.class HiColorImg [ display block ] ]
-}
colorGamut :
    Value
        { srgb : Supported
        , p3 : Supported
        , rec2020 : Supported
        }
    -> Expression
colorGamut (Value val) =
    feature "color-gamut" val


{-| The SRGB value for the [`colorGamut`](#colorGamut) CSS media feature.

This will enable specific CSS for when a device is using the SRGB colour space.

SRGB is the lowest gamut keyword that `colorGamut` accepts. This is a very common colour space.

    withMedia (and screen (colorGamut srgb)) []
-}
srgb : Value { provides | srgb : Supported }
srgb = Value "srgb"


{-| The P3 value for the [`colorGamut`](#colorGamut) CSS media feature.

This will enable specific CSS for when a device is using the Apple P3 colour space.

This color gamut is wider than [`srgb`](#srgb) but narrower than [`rec2020`](#rec2020).

    withMedia (and screen (colorGamut p3)) []
-}
p3 : Value { provides | p3 : Supported }
p3 = Value "p3"


{-| The SRGB value for the [`colorGamut`](#colorGamut) CSS media feature.

This will enable specific CSS for when a device is using the ITU Recommendation BT.2020
(or Rec. 2020 for short) colour space. This is often known as High Dynamic Range (HDR).

This is the widest gamut that `colorGamut` accepts.

    withMedia (and screen (colorGamut rec2020))
-}
rec2020 : Value { provides | rec2020 : Supported }
rec2020 = Value "rec2020"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------ INTERACTION DEVICES ---------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| A type alias used to accept an pointer device accuracy value, among others.
-}
type alias PointingAccuracySupported supported =
    { supported
        | coarse : Supported
        , fine : Supported
    }


{-| A type alias used to accept an pointer device accuracy value.
-}
type alias PointingAccuracy =
    PointingAccuracySupported {}


{-| The [`pointer`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/pointer)
CSS media feature.

This queries whether the user has a pointing device, and if so, how accurate the **primary**
pointing device is.

If you want to test the accuracy of **any** pointing device, use [`anyPointer`](#anyPointer)
instead.

    withMedia (Media.pointer coarse) [ a [ display block, Css.height (px 24) ] ]
-}
pointer :
    Value
        ( PointingAccuracySupported
            { none : Supported
            }
        )
    -> Expression
pointer (Value val) =
    feature "pointer" val


{-| The [`any-pointer`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/any-pointer)
CSS media feature.

This queries whether the user has **any** pointing device, and if so, how accurate it is.

If you want to test the accuracy of **any** pointing device, use [`anyPointer`](#anyPointer)
instead.

    withMedia (Media.pointer coarse) [ a [ display block, Css.height (px 24) ] ]
-}
anyPointer :
    Value
        ( PointingAccuracySupported
            { none : Supported
            }
        )
    -> Expression
anyPointer (Value val) =
    feature "any-pointer" val


{-| The [`hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/hover)
CSS media feature.

Queries the if the user agent's primary input mechanism has the ability to hover over elements.

    withMedia (Media.hover canHover) [ a [ Css.hover [ textDecoration underline ] ] ]
-}
hover :
    Value
        { none : Supported
        , hover_ : Supported
        }
    -> Expression
hover (Value val) =
    feature "hover" val


{-| The [`any-hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/any-hover)
CSS media feature.

Queries the if any of user agent's input mechanisms have the ability to hover over elements

    withMedia (anyHover hover_) [ a [ Css.hover [ textDecoration underline ] ] ]
-}
anyHover :
    Value
        { none : Supported
        , hover_ : Supported
        }
    -> Expression
anyHover (Value val) =
    feature "any-hover" val


{-| The `coarse` value for the [`pointer`](#pointer) and [`anyPointer`](#anyPointer) CSS Media Features.

This is for input mechanism(s) that have limited accuracy.

    withMedia (Media.pointer coarse) []
-}
coarse : Value { provides | coarse : Supported }
coarse = Value "coarse"


{-| The `fine` value for the [`pointer`](#pointer) and [`anyPointer`](#anyPointer) CSS Media Features.

This is for input mechanism(s) that are somewhat accurate.

    withMedia (Media.pointer fine) []
-}
fine : Value { provides | fine : Supported }
fine = Value "fine"


{-| The `hover` value for the [`hover`](#hover) and [`anyHover`](#anyHover) CSS Media Features.

This is for input mechanism(s) that are capable of hovering over interactable objects.

    withMedia (Media.hover hover_) []

Note: This is called `hover_` instead of `hover` because `hover` is already a CSS media feature.
-}
hover_ : Value { provides | hover_ : Supported }
hover_ = Value "hover"


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------ INTERACTION DEVICES ---------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


{-| The [`scripting`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/scripting)
CSS media feature.

This tests whether scripting like JS is available.

    withMedia (scripting none) [ Css.class NoScript [ display block ] ]
-}
scripting :
    Value
        { none : Supported
        , initialOnly : Supported
        , enabled : Supported
        }
    -> Expression
scripting (Value val) =
    feature "scripting" val


{-| The `initialOnly` value for the [`scripting`](#scripting) CSS media feature.

This is for scripting that is allowed only on initial page load.

    withMedia (scripting initialOnly) []
-}
initialOnly : Value { provides | initialOnly : Supported }
initialOnly = Value "initialOnly"


{-| The `enabled` value for the [`scripting`](#scripting) CSS media feature.

This is for scripting that is allowed and active on the current document.

    withMedia (scripting enabled) []
-}
enabled : Value { provides | enabled : Supported }
enabled = Value "enabled"

