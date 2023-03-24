module Values.Length exposing (..)

import Css exposing (..)
import Css.Global exposing (class)
import Css.Preprocess exposing (stylesheet)
import Css.Value exposing (Value)
import Compile
import Test exposing (Test)

chTest : Test
chTest =
    Compile.test
            "ch"
            ( stylesheet [ class "test" [ containIntrinsicSize (ch 20) ] ] )
            (".test {contain-intrinsic-size:20ch;}")

emTest : Test
emTest =
    Compile.test
            "em"
            ( stylesheet [ class "test" [ containIntrinsicSize (em 9) ] ] )
            (".test {contain-intrinsic-size:9em;}")

exTest : Test
exTest =
    Compile.test
            "ex"
            ( stylesheet [ class "test" [ containIntrinsicSize (ex 90) ] ] )
            (".test {contain-intrinsic-size:90ex;}")

remTest : Test
remTest =
    Compile.test
            "rem"
            ( stylesheet [ class "test" [ containIntrinsicSize (rem 6) ] ] )
            (".test {contain-intrinsic-size:6rem;}")

vhTest : Test
vhTest =
    Compile.test
            "vh"
            ( stylesheet [ class "test" [ containIntrinsicSize (vh 9) ] ] )
            (".test {contain-intrinsic-size:9vh;}")

vwTest : Test
vwTest =
    Compile.test
            "vw"
            ( stylesheet [ class "test" [ containIntrinsicSize (vw 9) ] ] )
            (".test {contain-intrinsic-size:9vw;}")

pxTest : Test
pxTest =
    Compile.test
            "px"
            ( stylesheet [ class "test" [ containIntrinsicSize (px 9) ] ] )
            (".test {contain-intrinsic-size:9px;}")

cmTest : Test
cmTest =
    Compile.test
            "cm"
            ( stylesheet [ class "test" [ containIntrinsicSize (cm 109) ] ] )
            (".test {contain-intrinsic-size:109cm;}")

mmTest : Test
mmTest =
    Compile.test
            "mm"
            ( stylesheet [ class "test" [ containIntrinsicSize (mm 9) ] ] )
            (".test {contain-intrinsic-size:9mm;}")

qTest : Test
qTest =
    Compile.test
            "q"
            ( stylesheet [ class "test" [ containIntrinsicSize (q 9) ] ] )
            (".test {contain-intrinsic-size:9Q;}")

inTest : Test
inTest =
    Compile.test
            "inch"
            ( stylesheet [ class "test" [ containIntrinsicSize (inch 9) ] ] )
            (".test {contain-intrinsic-size:9in;}")

pcTest : Test
pcTest =
    Compile.test
            "pc"
            ( stylesheet [ class "test" [ containIntrinsicSize (pc 9) ] ] )
            (".test {contain-intrinsic-size:9pc;}")

ptTest : Test
ptTest =
    Compile.test
            "pt"
            ( stylesheet [ class "test" [ containIntrinsicSize (pt 9) ] ] )
            (".test {contain-intrinsic-size:9pt;}")

vminTest : Test
vminTest =
    Compile.test
            "vmin"
            ( stylesheet [ class "test" [ containIntrinsicSize (vmin 9) ] ] )
            (".test {contain-intrinsic-size:9vmin;}")

vmaxTest : Test
vmaxTest =
    Compile.test
            "vmax"
            ( stylesheet [ class "test" [ containIntrinsicSize (vmax 9) ] ] )
            (".test {contain-intrinsic-size:9vmax;}")
