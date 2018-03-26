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
    { thing : String }

type Msg = Reset

-- INIT

init : (Model, Cmd Msg)
init =
    (Model "Hello", Cmd.none)

    
-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Reset -> (model, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- VIEW

view : Model -> Html Msg
view model =
    main_ [] (List.concat [ linkBox, (quoteBox "really long placeholder quote must be replaced") ])


