# elm-css (Caius Nocturne's fork)

**This is a fork from the original package made by rtfeldman. To find out how this differs and why, scroll down towards the bottom of this readme.**


This package lets you write CSS for your Elm projects with these cool features:

- **Native Elm code** (seamlessly combine your CSS with Elm functions and data)
- **Type-checked** (the compiler will catch you if you make most invalid property/value combinations)
- **Locally-scoped by default** (no need to worry about class names and global style sheets)
- **Mixin support** for reusable styles
- [**Nested media queries**](https://davidwalsh.name/write-media-queries-sass)

For an Elm styling system that is a complete departure from CSS, check out [Elm UI](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/).)

---

[View this example on Ellie.](https://ellie-app.com/qhnXcyTLTgKa1)

```elm
module Main exposing (main)

import Browser
import Css exposing (..)
import Html.Styled as Html exposing (Html, Attribute, button, div, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)

--[...]--

{-| Css.batch combines multiple styles into one, much
like mixins in CSS preprocessors.
-}
customFontStyle : Style
customFontStyle =
    Css.batch
        [ fontFamilyMany ["Arial", "Helvetica"] sansSerif
        , fontSize (px 24)
        ]

    
{-| A reusable button which has some styles pre-applied to it.

-}
btn : List (Attribute msg) -> List (Html msg) -> Html msg
btn attrs content =
    Html.button
        ( (css
            [ padding (px 20)
            , color <| hex "090909"
            , border zero |> important
            , borderRadius (px 6)
            , cursor pointer
            , customFontStyle
            , hover
                [ backgroundColor <| hex "09fe67"
                ]
            ]
            )
        :: attrs -- make sure that you only have one set of styles per element.
        )
        content


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
    div [ css
            [ display flex_
            , flexDirection column
            , alignItems center
            , gap (px 8)
            , customFontStyle
            , fontWeight bold
            ]
        
        ]
        [ btn [ onClick Increment ] [ Html.text "+1" ]
        , div [] [ Html.text <| String.fromInt model.count ]
        , btn [ onClick Decrement ] [ Html.text "-1" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view >> Html.toUnstyled
        , update = update
        }

```

---


## Type-checking

Unlike traditional CSS, elm-css is almost entirely type checked, meaning that you can tell in most cases that you are typing correctly as long as the Elm compiles. If you write some CSS wrong, the compiler will also usually tell you what you did wrong.

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

There are some situations where the package can't validate every type of CSS value error. This is because either enforcing it would make the code unpleasant to write or because Elm doesn't have the types to be able to enforce it (such as positive integers).

The documentation for each property will tell you if there are things you need to watch out for that can't be checked by the compiler.


## Local scope by default

By default, elm-css works locally, so whenever you attach a style to an element, it generates a class only for that particular set of styles and nothing else, meaning [you don't need to worry about class/ID name collisions](https://medium.com/seek-blog/the-end-of-global-css-90d2a4a06284) and you can scale your application without worrying.

When you need to, you can also create global style sheets.


## Performance impact
In elm-css, CSS rules get compiled at runtime instead of being cached at build time. This will have some impact on the performance on your app.

[There are benchmarks for the original fork of elm-css](https://rawgit.com/webbhuset/test-elm-performance/master/results/charts.html). There's reasons to expect that this fork will perform better than the original because the way it compiles styles is different, but it will still have an impact nonetheless.


-----


# Differences to the original elm-css

This is a fork of rtfeldman's elm-css package, where I wanted to try to resolve a few longstanding setbacks with the original and make it more up to date. Please read this section as it will help you understand whether using this is right for you!

**[Check out this migration guide if you're interested in moving to this package!](https://github.com/dzuk-mutant/elm-css/wiki/Some-useful-tips-for-migrating)**



## Phantom types
This uses phantom types, drawing from the hard work of rtfeldman and others who originally came up with the idea and started work on it. In short, it means you get much more readable compiler errors and type annotations.


## Better documentation

Documentation on properties is far more comprehensive, with more information, examples and links to CSS Tricks or MDN. Every CSS property has been grouped based on real world use case.

## Newer properties

A bunch of new properties have been added. Including:

- Grid (all properties apart from `grid` itself)
- Gap
- All Logical property variants (eg. `margin-inline-end`, `padding-block-start`, `inset-block`, etc.)
- Scroll snapping and overscroll (`scroll-margin*`, `scroll-padding*`, `overscroll-behavior*`, etc.)
- Various font-related properties (`font-variant-emoji`, `font-variant-east-asian`)
- Filter properties (`filter`, `backdrop-filter`)
- Visual accessibility @media features (`prefers-reduced-motion`, `prefers-color-scheme`, `prefers-contrast`, `forced-colors`)


## Extensive CSS rule testing

There are extensive coverage tests on almost all aspects of CSS typing. In theory this should make writing CSS with this package relatively bug-free.


## This does not fully match functionality in the original fork

I needed to start using this fork for my own personal work so I have been working on getting this usable as a package over completely filling out every single CSS component that exists, or matching everything that the original fork of elm-css already had. [Here's a checklist of what has been covered so far](https://gist.github.com/dzuk-mutant/89bd30b02fedf270ebff720527a0f936).

**Most notably, this package does not have Animations or Transitions yet.**

## I am not a professional and programming isn't my job

I have made this fork because I really like Elm and I like what this package brings to my own projects. However I don't have a complete understanding of the inner workings of this codebase nor *that* much expertise in general.

I will try to respond to things when I can, but there may be situations where I don't understand where an issue lies.


---


# Contributors

I welcome contributions to this project! Please check the [`code of conduct`](https://github.com/dzuk-mutant/elm-css/wiki/Code-of-conduct) before you do. ^^


---


# Acknowledgements

I did a lot of repetitive work to try to bring the original phantom-types branch to a certain standard, but the original work was not mine. There are a lot of contributors who made this fork possible!

The original `elm-css` (and therefore this module too) draws inspiration from [Sass](http://sass-lang.com/), [Stylus](http://stylus-lang.com/), [CSS Modules](http://glenmaddern.com/articles/css-modules), and [styled-components](https://www.styled-components.com) libraries.

