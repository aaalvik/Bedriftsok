module Decode exposing (..)

import Json.Decode exposing (Decoder, field, int, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Model exposing (Unit, Units)


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



--|> required "orgform" orgForm
--|> required "institusjonellSektorkode" string
--|> required "registerDate" string
--|> required "description" string
-- JsonDecode.map6 Unit
--     (JsonDecode.field "organisasjonsnummer" JsonDecode.int)
--     (JsonDecode.field "name" JsonDecode.string)


orgForm =
    string



-- scores : Decoder Model.Scores
-- scores =
--     JsonDecode.list score
-- score : Decoder Model.ScoreItem
-- score =
--     JsonDecode.map2 Model.ScoreItem
--         (JsonDecode.field "name" JsonDecode.string)
--         (JsonDecode.field "score" JsonDecode.float)
