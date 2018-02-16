module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Model exposing (Model, Unit)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div
        [ class "container" ]
        [ div [ class "page" ]
            [ h1 [ class "header" ]
                [ text "Søk i enhetsregisteret" ]
            , viewInputFields
            ]
        , viewTable model
        ]


viewInputFields : Html Msg
viewInputFields =
    [ inputFieldOrgNumber
    , inputFieldCompanyName
    ]
        |> div [ class "input-container" ]


inputFieldOrgNumber : Html Msg
inputFieldOrgNumber =
    input
        [ class "input"
        , placeholder "Organisasjonsnummer"
        , onInput UpdateOrgNumberInput
        , onKeyDown KeyDownOrgNumber
        ]
        []


inputFieldCompanyName : Html Msg
inputFieldCompanyName =
    input
        [ class "input"
        , placeholder "Navn på selskap"
        , onInput UpdateCompanyNameInput
        , onKeyDown KeyDownCompanyName
        ]
        []


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


viewTable : Model -> Html Msg
viewTable model =
    [ viewHeader
    , viewTableBody model
    ]
        |> table [ class "table" ]


viewTableBody : Model -> Html Msg
viewTableBody model =
    List.map viewRow model.currentUnits
        |> tbody []


viewRow : Unit -> Html Msg
viewRow unit =
    [ viewCell (toString unit.orgNumber)
    , viewCell unit.name
    ]
        |> tr []


viewHeader : Html Msg
viewHeader =
    [ viewHeaderCell "ORGANISASJONSNUMMER"
    , viewHeaderCell "NAVN"
    ]
        |> thead [ class "table-header" ]


viewCell : String -> Html Msg
viewCell str =
    td [] [ text str ]


viewHeaderCell : String -> Html Msg
viewHeaderCell str =
    th [] [ text str ]
