module Quotes exposing (quoteBox)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode as Decode


quoteBox : String -> List (Html msg)
quoteBox quote =
    [ div [ class "box quote-box" ]
          [ text quote ]
    ]

