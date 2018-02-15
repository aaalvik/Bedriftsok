module Update exposing (..)

import Http
import Model exposing (Model, Unit, Units)
import Request
import Validation


type Msg
    = NoOp Int
    | ReceivedUnit (Result Http.Error Units)
    | UpdateOrgNumberInput String
    | KeyDownOrgNumber Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp _ ->
            ( model, Cmd.none )

        ReceivedUnit result ->
            case result of
                Ok unitObject ->
                    let
                        newModel =
                            { model | currentUnits = unitObject.units }
                    in
                    Debug.log ("Received unit: " ++ toString unitObject) ( newModel, Cmd.none )

                Err str ->
                    Debug.log ("Tried to get unit by orgNumber, but got: " ++ toString str) ( model, Cmd.none )

        UpdateOrgNumberInput str ->
            let
                newModel =
                    { model | orgNumber = str }
            in
            ( newModel, Cmd.none )

        KeyDownOrgNumber key ->
            if key == 13 then
                updateByOrgNumber model
            else
                ( model, Cmd.none )


updateByOrgNumber : Model -> ( Model, Cmd Msg )
updateByOrgNumber model =
    case Validation.validOrgNumber model.orgNumber of
        ( True, num ) ->
            -- TODO: make call to API
            ( model, Request.getUnitByOrgNumber num ReceivedUnit )

        _ ->
            ( model, Cmd.none )



-- updateUnits : Model -> Model
-- updateUnits model =
--     model
-- ReceivedScores result ->
--     case result of
--         Ok scores ->
--             ( { model | scores = scores }, Cmd.none )
--         Err err ->
--             ( model, Cmd.none )
--                 |> Debug.log ("Tried to retreive scores from db, failed: " ++ toString err)
-- updateScores : Model -> Model
-- updateScores model =
--     let
--         score =
--             Result.withDefault 0 (String.toFloat model.score)
--         scoreItem =
--             { name = model.name, score = score }
--         newScores =
--             List.sortBy .score <| scoreItem :: model.scores
--     in
--     { model | scores = newScores }
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
