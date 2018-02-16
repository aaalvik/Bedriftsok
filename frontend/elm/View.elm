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
        [ class "container"
        , style [ ( "height", "100vh" ), ( "backgroundImage", "url(\"static/bg.jpg\"" ) ]
        ]
        [ div [ class "page" ]
            [ h1 [ class "header" ] [ text "Søk i enhetsregisteret" ]
            , inputFieldOrgNumber

            --, viewUnits model
            ]
        , viewTable model
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


viewTable : Model -> Html Msg
viewTable model =
    [ caption [] [ text "Tittel på tabellen" ]
    , viewHeader
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
    [ viewHeaderCell "Organisasjonsnummer"
    , viewHeaderCell "Navn"
    ]
        |> thead []


viewCell : String -> Html Msg
viewCell str =
    td [] [ text str ]


viewHeaderCell : String -> Html Msg
viewHeaderCell str =
    tr [] [ text str ]



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
