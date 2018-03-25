module Sections exposing (Section, allSections)


type alias Section =
    { title : String
    , content : List ( String, String )
    }

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
