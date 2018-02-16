module Main exposing (..)

import Html
import Model exposing (Model, Unit)
import Update exposing (Msg)
import View


main =
    Html.program { init = init, view = View.view, update = Update.update, subscriptions = Update.subscriptions }


init : ( Model, Cmd Msg )
init =
    ( Model "" "" initUnits, Cmd.none )


initUnits =
    [ Unit 1 "Test1", Unit 2 "Test2" ]
