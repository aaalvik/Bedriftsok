module PrettyPrint exposing (..)

import Dict


shortHands =
    Dict.fromList [ ( "AS", "Aksjeselskap" ), ( "ENK", "Enkeltpersonforetak" ) ]


organisationForm : String -> String
organisationForm key =
    case Dict.get key shortHands of
        Just val ->
            val

        Nothing ->
            key
