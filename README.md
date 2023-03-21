# elm-css

## (Preamble) An attempt at making a more up to date and revamped fork

This is a fork of rtfeldman's elm-css module, where I wanted to try to resolve a few longstanding setbacks with the original and make it more up to date. Please read this section as it will help you understand whether using this is right for you!

*TLDR: It brings a bunch of new things to the table but is not fully comprehensive or battle tested yet. Please check to see if it would be a right fit for you. If you care about stability, please use the original version from rtfeldman for now!*

### Improvements

#### Phantom types
This uses phantom types (drawing from the hard work of rtfeldman and others who worked in the `phantom-types` branch of the original repo). In short, it means you get more readable compiler errors and more readable type annotations.

```
> import Css exposing (..)
> whiteSpace nowrap
AppendProperty (Property "white-space:nowrap")
    : Style
> whiteSpace auto
-- TYPE MISMATCH ---------------------------------------------------------- REPL

The 1st argument to `whiteSpace` is not what I expect:

4|   whiteSpace auto
                ^^^^
This `auto` value is a:

    Css.Value.Value
        { a
            | auto : Css.Value.Supported
            , breakSpaces : Css.Value.Supported
            , inherit : Css.Value.Supported
            , initial : Css.Value.Supported
            , normal : Css.Value.Supported
            , nowrap : Css.Value.Supported
            , pre : Css.Value.Supported
            , preLine : Css.Value.Supported
            , preWrap : Css.Value.Supported
            , revert : Css.Value.Supported
            , unset : Css.Value.Supported
        }

But `whiteSpace` needs the 1st argument to be:

    BaseValue
        { breakSpaces : Css.Value.Supported
        , normal : Css.Value.Supported
        , nowrap : Css.Value.Supported
        , pre : Css.Value.Supported
        , preLine : Css.Value.Supported
        , preWrap : Css.Value.Supported
        }
```

#### Better documentation

Documentation on properties is far more comprehensive, gives you much more information and has links to more information on CSS Tricks or MDN. Every CSS property has been grouped based on real world use case.

#### Newer properties

A bunch of new properties have been added. Including:

- Grid
- `gap`
- Logical properties (eg. `padding-inline-end`)
- Scrollbar customisation

### Drawbacks

#### Somewhat experimental

This is still in it's experimental stages and is only partly tested.

#### Some different naming schemes.

There are differences in naming conventions and some design approaches here. Depending on your codebase this will not be a drop-in replacement, but in most cases it will be a quick and painless upgrade.

#### A couple of things have probably been removed

If a CSS value or property is experimental and was in the other fork, I have removed it because they are unstable and can change at any time, making a massive project like this quite hard to manage than it can already be at times. I feel like it would be best to use the `Css.property` function to use experimental properties.

#### I have not fully checked parity

This is an incomplete upgrade. I needed to start using this fork for my own personal work so I have been working on getting this usable as a package over completely filling out every single CSS component that exists. [Here's a checklist of what has been covered so far](https://gist.github.com/dzuk-mutant/89bd30b02fedf270ebff720527a0f936)

#### I am not a professional and programming isn't my job

I have made this fork because I really like Elm and I like using custom CSS, I needed more CSS stuff and wanted to see the phantom types fork become usable. However I don't have complete understanding of this codebase nor *that* much expertise in general.

I will try to respond to things when I can, but there may be situations where I don't understand where an issue lies.

### Acknowledgements

I did a lot of repetitive work to try to bring the original phantom-types branch to a certain standard, but the original work was not mine. There are a lot of contributors who made this fork possible!

---

## (okay now here's the normal readme)

`elm-css` lets you define CSS in Elm. (For an Elm styling system that is a
complete departure from CSS, check out [style-elements](http://package.elm-lang.org/packages/mdgriffith/style-elements/latest).)

Here's an example of how to define some `elm-css` styles:

```elm
module MyCss exposing (main)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)


{-| A logo image, with inline styles that change on hover.
-}
logo : Html msg
logo =
    img
        [ src "logo.png"
        , css
            [ display inlineBlock
            , padding (px 20)
            , border3 (px 5) solid (rgb 120 120 120)
            , hover
                [ borderColor theme.primary
                , borderRadius (px 10)
                ]
            ]
        ]
        []


{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }


{-| A reusable button which has some styles pre-applied to it.
-}
btn : List (Attribute msg) -> List (Html msg) -> Html msg
btn =
    styled button
        [ margin (px 12)
        , color (rgb 250 250 250)
        , hover
            [ backgroundColor theme.primary
            , textDecoration underline
            ]
        ]


{-| A reusable style. Css.batch combines multiple styles into one, much
like mixins in CSS preprocessors.
-}
paragraphFont : Style
paragraphFont =
    Css.batch
        [ fontFamilies [ "Palatino Linotype", "Georgia", "serif" ]
        , fontSize (px 16)
        , fontWeight normal
        ]


{-| Css.property lets you define custom properties, using strings as their values.
-}
legacyBorderRadius : String -> Style
legacyBorderRadius amount =
    Css.batch
        [ property "-moz-border-radius" amount
        , property "-webkit-border-top-left-radius" amount
        , property "-webkit-border-top-right-radius" amount
        , property "-webkit-border-bottom-right-radius" amount
        , property "-webkit-border-bottom-left-radius" amount
        , property "border-radius" amount
        ]


view : Model -> Html Msg
view model =
    nav []
        [ img [ src "assets/backdrop.jpg", css [ width (pct 100) ] ] []
        , btn [ onClick DoSomething ] [ text "Click me!" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view >> toUnstyled
        , update = update
        , model = initialModel
        }
```

See [the `Css` module documentation](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css) for an explanation of how this code works.

`elm-css` draws inspiration from the excellent [Sass](http://sass-lang.com/), [Stylus](http://stylus-lang.com/), [CSS Modules](http://glenmaddern.com/articles/css-modules), and [styled-components](https://www.styled-components.com) libraries. It includes features like:

- [locally scoped CSS](https://medium.com/seek-blog/the-end-of-global-css-90d2a4a06284)
- [mixins](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#batch)
- [nested media queries](https://davidwalsh.name/write-media-queries-sass) (as well as pseudo-classes like `:hover` and pseudo-elements like `::after`)

### Examples

- A [reusable datepicker](https://github.com/abadi199/datetimepicker) built by Abadi Kurniawan
- The [website](https://noredink.github.io/json-to-elm) for [json-to-elm](https://github.com/eeue56/json-to-elm)
- This project's [examples](https://github.com/rtfeldman/elm-css/tree/master/examples) folder

## Related Projects

- [Elm CSS Normalize](https://github.com/scottcorgan/elm-css-normalize)
