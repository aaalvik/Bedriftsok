module Main exposing (..)

import Html
import Model exposing (Model)
import Update exposing (Msg)
import View


main =
    Html.program { init = init, view = View.view, update = Update.update, subscriptions = Update.subscriptions }


init : ( Model, Cmd Msg )
init =
    ( Model "" [], Cmd.none )
