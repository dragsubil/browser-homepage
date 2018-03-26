module Quotes exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode as Decode


quoteBox : String -> List (Html msg)
quoteBox quote =
    [ div [ class "box quote-box" ]
          [ text quote ]
    ]


type Msg = NewQuote (Result Http.Error String)
    
getQuote : Cmd Msg
getQuote =
    let
        request = Http.get "http://quotes.rest/qod.json" quoteDecoder
    in
        Http.send NewQuote request


quoteDecoder : Decode.Decoder String
quoteDecoder =
    Decode.field "contents" (Decode.field "quotes" (Decode.index 0 (Decode.field "quote" Decode.string)))
