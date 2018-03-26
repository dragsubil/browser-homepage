import Html exposing (..)
import Html.Attributes exposing (..)
import Links exposing (linkBox)
import Quotes exposing (quoteBox)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

-- MODEL

type alias Model =
    { quote : String }

type Msg = Reset | Quotes.Msg | Quotes.NewQuote (Result Http.Error String)

-- INIT

init : (Model, Cmd Msg)
init =
    (Model "Hello", Quotes.getQuote)

    
-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Reset -> (model, Cmd.none)
        Quotes.NewQuote (Ok quote) -> ({ model | quote = quote }, Cmd.none) 
        Quotes.NewQuote (Err _) -> (model, Cmd.none) 

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- VIEW

view : Model -> Html Msg
view model =
    main_ [] (List.concat [ linkBox, (quoteBox "really long placeholder quote must be replaced") ])


