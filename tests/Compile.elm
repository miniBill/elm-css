module Compile exposing (test)

import Css.Preprocess exposing (Stylesheet)
import Expect
import Test exposing (Test)
import TestUtil exposing (..)

test : String -> Stylesheet -> String -> Test
test title stylesheet output =
    Test.test title
       ( \_ ->
            outdented (prettyPrint stylesheet)
                |> Expect.equal (outdented output))
