module Model exposing (..)


type alias Model =
    { orgNumber : String
    , companyName : String
    , currentUnits : List Unit
    , currentPage : Int
    }



{- TODO: Fix dato -}


type alias Units =
    { units : List Unit }


type alias Address =
    { address : String
    , postalNumber : String
    , postal : String
    }


type alias Unit =
    { orgNumber : Int
    , name : String
    , organisationForm : String
    , unitAddress : Address
    , bankrupt : Bool

    --, registerDate : String
    --, description : String
    }
