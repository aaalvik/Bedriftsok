module Validation exposing (..)


validOrgNumber : String -> ( Bool, Int )
validOrgNumber numStr =
    case ( String.toInt numStr, String.length numStr ) of
        ( Ok num, 9 ) ->
            ( True, num )

        _ ->
            ( False, -1 )
