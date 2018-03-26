module Section exposing (sectionBox)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Section =
    { title : String
    , content : List ( String, String )
    }

sectionBox : List (Html msg)
sectionBox =
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
    
allSections : List Section
allSections =
    [ { title = "Programming"
      , content = [ ("https://github.com", "github")
                  , ("https://news.ycombinator.com", "hackernews")
                  , ("http://devdocs.io/", "devdocs")
                  ]
      }

    , { title = "Download"
      , content = [ ("https://thepiratebay.org/", "piratebay")
                  ]
      }

    , { title = "Reddit"
      , content = [ ("https://www.reddit.com", "front")
                  , ("https://reddit.com/r/fantasy", "fantasy")
                  , ("https://www.reddit.com/user/noirdragon/m/cs_student_subs", "cs_student_subs")
                  ]
      }

    , { title = "Read"
      , content = [ ("http://tvtropes.org/", "tvtropes")
                  , ("http://www.animenewsnetwork.com/", "ANN")
                  , ("https://medium.com/", "medium")
                  ]
      }


    , { title = "Random"
      , content = [ ("https://www.wikipedia.org/wiki/Special:Random", "Wikipedia")
                  ]
      }
    ]
