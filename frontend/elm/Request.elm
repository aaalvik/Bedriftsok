module Request exposing (..)

import Decode
import Http


globalUrl =
    "http://data.brreg.no/enhetsregisteret/enhet.json?"


maxPerPage =
    "6"



-- TEST ORG: 920440215


getUnitByOrgNumber orgNumber msg =
    let
        urlFilter =
            "&$filter=organisasjonsnummer eq '" ++ toString orgNumber ++ "'"

        url =
            globalUrl ++ "page=0&size=" ++ maxPerPage ++ urlFilter

        request =
            Http.get url Decode.units
    in
    Http.send msg request


getUnitsByName name pageNumber msg =
    let
        urlFilter =
            "&$filter=startswith(navn,'" ++ name ++ "')"

        url =
            globalUrl ++ "page=" ++ toString pageNumber ++ "&size=" ++ maxPerPage ++ urlFilter

        request =
            Http.get url Decode.units
    in
    Http.send msg request
