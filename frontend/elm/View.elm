module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Input
import Model exposing (Model)
import Table
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    [ top
    , bottom model
    ]
        |> div [ class "container" ]


top : Html Msg
top =
    [ h1 [ class "header" ]
        [ text "Søk i Brønnøysundregistrene" ]
    , Input.viewInputFields
    ]
        |> div [ class "page-top" ]


bottom : Model -> Html Msg
bottom model =
    (if List.length model.currentUnits == 0 then
        []
     else
        [ Table.viewTable model
        , navigationButtons model
        ]
    )
        |> div [ class "page-bottom" ]


navigationButtons : Model -> Html Msg
navigationButtons model =
    (if List.length model.currentUnits > 0 then
        [ div [ class "page-number" ] [ text ("Side " ++ toString (model.currentPage + 1)) ]
        , a [ class "glyphicon glyphicon-chevron-left", onClick PreviousPage ] []
        , a [ class "glyphicon glyphicon-chevron-right", onClick NextPage ] []
        ]
     else
        []
    )
        |> div [ class "nav-buttons" ]
