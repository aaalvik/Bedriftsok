module Decode exposing (..)

import Json.Decode exposing (Decoder, field, int, list, map, string)
import Json.Decode.Pipeline exposing (decode, required)
import Model exposing (Address, Unit, Units)


units : Decoder Units
units =
    decode
        Units
        |> required "data" (list unit)


unit : Decoder Unit
unit =
    decode
        Unit
        |> required "organisasjonsnummer" int
        |> required "navn" string
        |> required "organisasjonsform" string
        |> required "forretningsadresse" address
        |> required "konkurs" bankrupt


address : Decoder Address
address =
    decode
        Address
        |> required "adresse" string
        |> required "postnummer" string
        |> required "poststed" string


bankrupt : Decoder Bool
bankrupt =
    let
        toBool s =
            case s of
                "N" ->
                    False

                _ ->
                    True
    in
    map toBool string


orgForm =
    string
