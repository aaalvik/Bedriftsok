module Table exposing (viewTable)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model, Unit)
import PrettyPrint


viewTable : Model -> Html msg
viewTable model =
    [ viewHeader
    , viewTableBody model
    ]
        |> table [ class "table" ]


viewTableBody : Model -> Html msg
viewTableBody model =
    List.map viewRow model.currentUnits
        |> tbody []


viewRow : Unit -> Html msg
viewRow unit =
    let
        rowClass =
            if unit.bankrupt then
                "bankrupt"
            else
                ""
    in
    [ viewCell (toString unit.orgNumber)
    , viewCell unit.name
    , viewCell (PrettyPrint.organisationForm unit.organisationForm)
    , viewCell unit.unitAddress.postal
    ]
        |> tr [ class rowClass ]


viewHeader : Html msg
viewHeader =
    [ viewHeaderCell "ORGANISASJONSNUMMER"
    , viewHeaderCell "NAVN"
    , viewHeaderCell "ORGANISASJONSFORM"
    , viewHeaderCell "POSTSTED"
    ]
        |> thead [ class "table-header" ]


viewCell : String -> Html msg
viewCell str =
    td [] [ text str ]


viewHeaderCell : String -> Html msg
viewHeaderCell str =
    th [] [ text str ]
