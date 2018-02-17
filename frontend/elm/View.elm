module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Model exposing (Model, Unit)
import PrettyPrint
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div
        [ class "container" ]
        [ div [ class "page" ]
            [ h1 [ class "header" ]
                [ text "Søk i Brønnøysundregistrene" ]
            , viewInputFields
            ]
        , viewTable model
        , viewNavigationButtons model
        ]


viewInputFields : Html Msg
viewInputFields =
    [ [ inputFieldOrgNumber
      , a [ class "glyphicon glyphicon-search", onClick OrgNumberButtonClicked ] []
      ]
        |> div [ class "input-item" ]
    , [ inputFieldCompanyName
      , a [ class "glyphicon glyphicon-search", onClick OrgNumberButtonClicked ] []
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


viewNavigationButtons : Model -> Html Msg
viewNavigationButtons model =
    (if List.length model.currentUnits > 0 then
        [ div [ class "page-number" ] [ text (toString model.currentPage) ]
        , span [ class "glyphicon glyphicon-chevron-left", onClick PreviousPage ] []
        , span [ class "glyphicon glyphicon-chevron-right", onClick NextPage ] []
        ]
     else
        []
    )
        |> div [ class "nav-buttons" ]


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
    , viewCell (PrettyPrint.organisationForm unit.organisationForm)
    , viewCell unit.unitAddress.postal
    ]
        |> tr []


viewHeader : Html Msg
viewHeader =
    [ viewHeaderCell "ORGANISASJONSNUMMER"
    , viewHeaderCell "NAVN"
    , viewHeaderCell "ORGANISASJONSFORM"
    , viewHeaderCell "POSTSTED"
    ]
        |> thead [ class "table-header" ]


viewCell : String -> Html Msg
viewCell str =
    td [] [ text str ]


viewHeaderCell : String -> Html Msg
viewHeaderCell str =
    th [] [ text str ]
