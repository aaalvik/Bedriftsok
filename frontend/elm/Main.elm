module Main exposing (..)

import Html
import Model exposing (Model)
import Request
import Update exposing (Msg)
import View


main =
    Html.beginnerProgram { model = Model 0, view = View.view, update = Update.update }



-- init : ( Model, Cmd Msg )
-- init =
--     ( Model 0, Cmd.none )
