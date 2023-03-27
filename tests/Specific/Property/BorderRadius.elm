module Specific.Property.BorderRadius exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 borderRadius
            { functionName = "borderRadius", propertyName = "border-radius" }
            (( pct 2, "2%" ) :: CssTest.length)
        , CssTest.property { functionName = "borderRadius2", propertyName = "border-radius" }
            (( borderRadius2 (pct 2) (pct 1), "2% 1%" ) :: CssTest.length2 borderRadius2)
        , CssTest.property { functionName = "borderRadius3", propertyName = "border-radius" }
            (( borderRadius3 (pct 1) (pct 2) (pct 3), "1% 2% 3%" ) :: CssTest.length3 borderRadius3)
        , CssTest.property { functionName = "borderRadius4", propertyName = "border-radius" }
            (( borderRadius4 (pct 1) (pct 2) (pct 3) (pct 4), "1% 2% 3% 4%" ) :: CssTest.length4 borderRadius4)
        
        -- absolute
        ----------------------------------------------------
        , CssTest.property1 borderTopLeftRadius
            { functionName = "borderTopLeftRadius", propertyName = "border-top-left-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderTopLeftRadius2", propertyName = "border-top-left-radius" }
            ( ( borderTopLeftRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderTopLeftRadius2
            )

        , CssTest.property1 borderTopRightRadius
            { functionName = "borderTopRightRadius", propertyName = "border-top-right-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderTopRightRadius2", propertyName = "border-top-right-radius" }
            ( ( borderTopRightRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderTopRightRadius2
            )
        
        , CssTest.property1 borderBottomLeftRadius
            { functionName = "borderBottomLeftRadius", propertyName = "border-bottom-left-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderBottomLeftRadius2", propertyName = "border-bottom-left-radius" }
            ( ( borderBottomLeftRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderBottomLeftRadius2
            )

        , CssTest.property1 borderBottomRightRadius
            { functionName = "borderBottomRightRadius", propertyName = "border-bottom-right-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderBottomRightRadius2", propertyName = "border-bottom-right-radius" }
            ( ( borderBottomRightRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderBottomRightRadius2
            )
        
        -- logical
        ----------------------------------------------------
        , CssTest.property1 borderStartStartRadius
            { functionName = "borderStartStartRadius", propertyName = "border-start-start-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderStartStartRadius2", propertyName = "border-start-start-radius" }
            ( ( borderStartStartRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderStartStartRadius2
            )

        , CssTest.property1 borderStartEndRadius
            { functionName = "borderStartEndRadius", propertyName = "border-start-end-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderStartEndRadius2", propertyName = "border-start-end-radius" }
            ( ( borderStartEndRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderStartEndRadius2
            )
        
        , CssTest.property1 borderEndStartRadius
            { functionName = "borderEndStartRadius", propertyName = "border-end-start-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderEndStartRadius2", propertyName = "border-end-start-radius" }
            ( ( borderEndStartRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderEndStartRadius2
            )

        , CssTest.property1 borderEndEndRadius
            { functionName = "borderEndEndRadius", propertyName = "border-end-end-radius" }
            ( ( pct 2, "2%") :: CssTest.length
            )
        , CssTest.property
            { functionName = "borderEndEndRadius2", propertyName = "border-end-end-radius" }
            ( ( borderEndEndRadius2 (pct 20) (pct 10), "20% 10%" )
            :: CssTest.length2 borderEndEndRadius2
            )
        ]
