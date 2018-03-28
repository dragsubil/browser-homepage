import Html exposing (..)
import Html.Attributes exposing (..)
import Http 
import Json.Decode as Decode
import Links exposing (linkBox)

main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

-- MODEL

type alias Model =
    { quote : String
    , author : String
    }

type Msg = Reset
         | NewQuote (Result Http.Error Quote)

-- INIT

init : (Model, Cmd Msg)
init =
    (Model "" "", getQuote)

    
-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Reset -> (model, Cmd.none)
        NewQuote (Ok quoteData) -> ({ model | quote = quoteData.quote , author = quoteData.author }
                                   , Cmd.none) 
        NewQuote (Err _) -> (model, Cmd.none) 

-- SUBSCRIPTIONS
 
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- VIEW

view : Model -> Html Msg
view model =
    main_ [] (List.concat
                  [ linkBox
                  , (quoteBox model.quote model.author)
                  ]
             )



-- QUOTES FUNCTIONS

type alias Quote =
    { quote : String
    , author : String
    }
    
quoteBox : String -> String -> List (Html msg)
quoteBox quote author =
    [ div [ class "box quote-box" ]
          [ text quote 
          , br [] []
          , text ("- " ++ author)
          ]
    ]
    
getQuote : Cmd Msg
getQuote =
    let
        request = Http.get "http://quotes.rest/qod.json" quoteDecoder
    in
        Http.send NewQuote request

quoteDecoder : Decode.Decoder Quote
quoteDecoder =
    Decode.map2 Quote quoteStringDecode quoteAuthorDecode
        
quoteStringDecode : Decode.Decoder String
quoteStringDecode = 
    Decode.field "contents" (Decode.field "quotes" (Decode.index 0 (Decode.field "quote" Decode.string)))

quoteAuthorDecode : Decode.Decoder String
quoteAuthorDecode = 
    Decode.field "contents" (Decode.field "quotes" (Decode.index 0 (Decode.field "author" Decode.string)))
