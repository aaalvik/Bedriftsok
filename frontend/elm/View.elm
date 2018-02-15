module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Model exposing (Model)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "container", style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ div [ class "page" ]
            [ h1 [ class "header" ] [ text "Søk i enhetsregisteret" ]

            --, showScores 5 model
            , inputFieldOrgNumber

            --, inputFieldScore
            ]
        ]


inputFieldOrgNumber : Html Msg
inputFieldOrgNumber =
    input
        [ class "input"
        , placeholder "Organisasjonsnummer"
        , onInput UpdateOrgNumberInput
        , onKeyDown KeyDownOrgNumber
        ]
        []



-- inputFieldCompanyName : Html Msg
-- inputFieldCompanyName =
--     input
--         [ class "input"
--         , placeholder "Navn på selskap"
--         , onInput UpdateCompanyNameInput
--         , onKeyDown KeyDownCompanyName
--         ]
--         []


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)



-- showScores : Int -> Model -> Html Msg
-- showScores num model =
--     let
--         top5 =
--             List.take num (List.sortBy .score model.scores)
--         makeScore name time =
--             div [ class "scores" ] [ div [ class "score-item" ] [ h1 [] [ text name ] ], div [ class "score-item" ] [ h1 [] [ text <| toString time ] ] ]
--         scores =
--             List.map (\{ name, score } -> makeScore name score) top5
--     in
--     div [ class "scores" ] scores
