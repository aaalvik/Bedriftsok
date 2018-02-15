module Request exposing (..)

import Decode
import Http


globalUrl =
    "http://data.brreg.no/enhetsregisteret/enhet.json?"



--page=0&size=5"
--getUnitByOrgNumber : Int -> Cmd msg
-- TEST ORG: 920440215


getUnitByOrgNumber orgNumber msg =
    let
        urlFilter =
            "&$filter=organisasjonsnummer eq '" ++ toString orgNumber ++ "'"

        url =
            globalUrl ++ "page=0&size=5" ++ urlFilter

        request =
            Http.get url Decode.units
    in
    Http.send msg request



-- getUnits : Int -> Cmd Msg
-- getUnits pageNumber =
--     let
--         url =
--             globalUrl ++ "page=" ++ toString pageNumber ++ "&size=5"
--         request =
--             Http.get url Decode.units
--     in
--     Http.send ReceivedUnits request
-- getScores : Cmd Msg
-- getScores =
--     let
--         url =
--             globalUrl ++ "/scores"
--         request =
--             Http.get url Decode.scores
--     in
--     Http.send ReceivedScores request
