module Css.Value exposing (Value(..), Supported(..), unpack)
{-| A module for handling elm-css's phantom types.

Unless you want to create functionality on top of the way
Elm CSS properties and values work, you don't need to use this module.

@docs Value, unpack, Supported
-}


{-| A value that can be passed to a CSS property.

    limeGreen : Value { supports | rgb : Supported }
    limeGreen =
        rgb 0 100 44

The type variable value of `{ supports | rgb : Supported }` is there because
CSS has so many overloaded values. For example, it's important that
`display none` and `flex none` both compile, yet whereas `display block` should
compile, `flex block` should not. Having open records in the type variables
for `Value` makes satisfying these overlapping constraints possible.

For convenience, there are type aliases for certain values which are often
reused. [`Color`](#Color) is one of these.

    limeGreen : Css.Color
    limeGreen =
        rgb 0 100 44

This is structured like an opaque type but is fully exposed. This is so separate
CSS modules like `Css.Media` can integrate with this.
-}
type Value supports
    = Value String


{-| A helper function that unpacks a `Value` type.
-}
unpack : Value a -> String
unpack (Value value) =
    value


{-| A type used to specify which properties and which values work together.
-}
type Supported
    = Supported
