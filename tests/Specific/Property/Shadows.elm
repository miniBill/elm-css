module Specific.Property.Shadows exposing (..)

import Css exposing (..)
import Css.Value exposing (Value(..))
import CssTest
import Test exposing (Test)

all : Test
all =
    Test.concat
        [ CssTest.property1 boxShadow
            { functionName = "boxShadow", propertyName = "box-shadow" }
            [ ( none, "none" ) ]
        , CssTest.property { functionName = "boxShadowMany", propertyName = "box-shadow" }
            [ ( boxShadowMany [], "none" )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                      }
                    ]
              , "1px 2px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , color = Just <| hex "#333"
                      }
                    ]
              , "1px 2px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                      }
                    ]
              , "1px 2px 3px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , spreadRadius = Just <| px 3
                      }
                    ]
              , "1px 2px 0 3px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , inset = True
                      }
                    ]
              , "inset 2px 3px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , color = Just <| hex "333"
                      }
                    ]
              , "1px 2px 3px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                      }
                    ]
              , "1px 2px 3px 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , blurRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , spreadRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 0 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                        , color = Just <| hex "333"
                      }
                    ]
              , "1px 2px 3px 4px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 1px 2px 3px 4px"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , blurRadius = Just <| px 4
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 4px #333"
              )
            , ( boxShadowMany
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , spreadRadius = Just <| px 4
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 0 4px #333"
              )
            , ( boxShadowMany
                    [ { offsetX = px 1
                      , offsetY = px 2
                      , blurRadius = Just <| px 3
                      , spreadRadius = Just <| px 4
                      , color = Just <| hex "333"
                      , inset = True
                      }
                    ]
              , "inset 1px 2px 3px 4px #333"
              )
            , ( boxShadowMany
                    [ { offsetX = px 1
                      , offsetY = px 2
                      , blurRadius = Just <| px 3
                      , spreadRadius = Just <| px 4
                      , color = Just <| hex "333"
                      , inset = True
                      }
                    , { defaultBoxShadow
                        | offsetX = pt 3
                        , offsetY = rem 2.8
                      }
                    ]
              , "inset 1px 2px 3px 4px #333, 3pt 2.8rem"
              )
            ]

        , CssTest.property1 textShadow
          { functionName = "textShadow", propertyName = "text-shadow" }
          [ ( none, "none" ) ]

        , CssTest.property
          { functionName = "textShadowMany", propertyName = "text-shadow" }
          [   ( textShadowMany
                  [ { offsetX = px 20 
                    , offsetY = rem 3
                    , blurRadius = Just (px 3)
                    , color = Just (hex "333")
                    }
                  ]
              , "20px 3rem 3px #333"
              )

            , ( textShadowMany
                  [ { offsetX = px 20 
                    , offsetY = rem 3
                    , blurRadius = Just (px 3)
                    , color = Just (hex "333")
                    }
                  , { offsetX = px 3 
                    , offsetY = px 3
                    , blurRadius = Nothing
                    , color = Nothing
                    }
                  ]
              , "20px 3rem 3px #333,3px 3px"
              )
              
            , ( textShadowMany
                  [ { offsetX = px 20 
                    , offsetY = rem 3
                    , blurRadius = Just (px 3)
                    , color = Just (hex "333")
                    }
                  , { offsetX = px 3 
                    , offsetY = px 3
                    , blurRadius = Nothing
                    , color = Nothing
                    }
                  , { offsetX = pct 20 
                    , offsetY = pct 10
                    , blurRadius = Just (pct 5)
                    , color = Nothing
                    }
                  ]
              , "20px 3rem 3px #333,3px 3px,20% 10% 5%"
              )

          ]
        ]
