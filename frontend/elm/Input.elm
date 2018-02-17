module Input exposing (viewInputFields)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (keyCode, on, onClick, onInput)
import Json.Decode as Json
import Update exposing (Msg(..))


viewInputFields : Html Msg
viewInputFields =
    [ [ inputFieldOrgNumber
      , a [ class "glyphicon glyphicon-search", onClick OrgNumberButtonClicked ] []
      ]
        |> div [ class "input-item" ]
    , [ inputFieldCompanyName
      , a [ class "glyphicon glyphicon-search", onClick CompanyNameButtonClicked ] []
      ]
        |> div [ class "input-item" ]
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
