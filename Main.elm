import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Sections exposing (Section, allSections)

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
    main_ []
        ( [ h1 [] [ text "Home" ]
          , hr [] []
          ] ++ (List.concat (List.map makeSectionItems allSections))
        )

makeSectionItems : Section -> List (Html msg)
makeSectionItems {title, content} =
   [ ul [] ((li [ class "categ" ] [ text title ])
           :: (List.map makeListItem content))
   , hr [] []
   ]
              
makeListItem : ( String, String ) -> Html msg
makeListItem (link, title) =
    li []
        [ a [ href link ] [ text title ] ]
    

