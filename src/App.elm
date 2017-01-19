module App exposing (..)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import Markdown exposing (toHtml)


type alias Model =
    { content : String
    }


init : String -> ( Model, Cmd Msg )
init path =
    ({content = ""}, Cmd.none)


type Msg
    = Change String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newContent ->
            ({model | content = newContent}, Cmd.none)


view : Model -> Html Msg
view model =
    div []
        [ input [placeholder "", onInput Change] []
        , div [] [toHtml [] model.content]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
