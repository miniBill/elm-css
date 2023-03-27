module Specific.Property.TypeFeatures exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 fontFeatureSettings
            { functionName = "fontFeatureSettings", propertyName = "font-feature-settings" }
            [ ( featureTag "smcp", "\"smcp\"" )
            , ( featureTag2 "liga" 0, "\"liga\" 0" )
            , ( normal, "normal" )
            ]
        , CssTest.property { functionName = "fontFeatureSettingsMany", propertyName = "font-feature-settings" }
            [ ( fontFeatureSettingsMany [ featureTag2 "liga" 0, featureTag2 "swsh" 2 ], "\"liga\" 0,\"swsh\" 2" )
            , ( fontFeatureSettingsMany [ featureTag "ss13" ], "\"ss13\"" )
            ]
        ]
