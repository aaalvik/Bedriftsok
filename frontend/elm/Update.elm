module Update exposing (..)

--import Http

import Model exposing (Model)


type Msg
    = NoOp Int
    | ReceivedUnits Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp _ ->
            ( model, Cmd.none )

        ReceivedUnits num ->
            ( model, Cmd.none )



-- KeyDownName key ->
--     if key == 13 then
--         ( updateScores model, Cmd.none )
--     else
--         ( model, Cmd.none )
-- ReceivedScores result ->
--     case result of
--         Ok scores ->
--             ( { model | scores = scores }, Cmd.none )
--         Err err ->
--             ( model, Cmd.none )
--                 |> Debug.log ("Tried to retreive scores from db, failed: " ++ toString err)
