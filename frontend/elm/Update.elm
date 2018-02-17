module Update exposing (..)

import Http
import Model exposing (Model, Unit, Units)
import Request
import Validation


type Msg
    = NoOp Int
    | ReceivedUnits (Result Http.Error Units)
    | UpdateOrgNumberInput String
    | UpdateCompanyNameInput String
    | KeyDownOrgNumber Int
    | KeyDownCompanyName Int
    | NextPage
    | PreviousPage
    | OrgNumberButtonClicked
    | CompanyNameButtonClicked


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp _ ->
            ( model, Cmd.none )

        ReceivedUnits result ->
            case result of
                Ok unitObject ->
                    let
                        newModel =
                            { model | currentUnits = unitObject.units }
                    in
                    Debug.log ("Received units: " ++ toString unitObject) ( newModel, Cmd.none )

                Err str ->
                    Debug.log ("Tried to get units, but got: " ++ toString str) ( model, Cmd.none )

        UpdateOrgNumberInput str ->
            let
                newModel =
                    { model | orgNumber = str }
            in
            ( newModel, Cmd.none )

        UpdateCompanyNameInput str ->
            let
                newModel =
                    { model | companyName = str }
            in
            ( newModel, Cmd.none )

        KeyDownOrgNumber key ->
            if key == 13 then
                updateByOrgNumber model
            else
                ( model, Cmd.none )

        KeyDownCompanyName key ->
            if key == 13 then
                updateByCompanyName model
            else
                ( model, Cmd.none )

        OrgNumberButtonClicked ->
            updateByOrgNumber model

        CompanyNameButtonClicked ->
            updateByCompanyName model

        NextPage ->
            stepOnePage model ((+) 1)

        PreviousPage ->
            if model.currentPage == 0 then
                ( model, Cmd.none )
            else
                stepOnePage model (\n -> n - 1)


updateByOrgNumber : Model -> ( Model, Cmd Msg )
updateByOrgNumber model =
    case Validation.validOrgNumber model.orgNumber of
        ( True, num ) ->
            -- TODO: make call to API
            ( { model | currentPage = 0 }, Request.getUnitByOrgNumber num ReceivedUnits )

        _ ->
            ( model, Cmd.none )


updateByCompanyName : Model -> ( Model, Cmd Msg )
updateByCompanyName model =
    ( { model | currentPage = 0 }, Request.getUnitsByName model.companyName 0 ReceivedUnits )


stepOnePage : Model -> (Int -> Int) -> ( Model, Cmd Msg )
stepOnePage model incOrDec =
    let
        curPage =
            model.currentPage

        newModel =
            { model | currentPage = incOrDec curPage }
    in
    Debug.log ("pageBefore: " ++ toString curPage ++ ", updated: " ++ (toString <| incOrDec curPage)) ( newModel, Request.getUnitsByName model.companyName (incOrDec curPage) ReceivedUnits )



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
