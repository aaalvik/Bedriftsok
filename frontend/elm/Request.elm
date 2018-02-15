module Request exposing (..)

import Decode
import Http
import Update exposing (Msg(..))


globalUrl =
    "localhost:8000"



-- getUnits : Cmd Msg
-- getUnits =
--     let
--         url =
--             "somethingURL"
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
