module Model exposing (..)


type alias Model =
    { orgNumber : String
    , currentUnits : List Unit
    }



{- TODO: Fix dato -}


type alias Units =
    { units : List Unit }


type alias Unit =
    { orgNumber : Int
    , name : String

    --, organisationForm : String
    --, address : String
    --, registerDate : String
    --, description : String
    }
