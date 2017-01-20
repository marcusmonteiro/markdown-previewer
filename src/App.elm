module App exposing (..)

import Html exposing (Html, a, div, footer,  h5, textarea, text)
import Html.Attributes exposing (class, for, id, href, placeholder)
import Html.Events exposing (onInput)
import Markdown exposing (toHtml)


type alias Model =
    { content : String
    }


init : ( Model, Cmd Msg )
init =
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
    div [class "container"]
        [ div [class "row"]
            [ h5 []
                [ a [href "https://github.com/marcusmonteiro/markdown-previewer"] [text "Markdown Previewer"]
                , text " by "
                , a [href "https://marcusmonteiro.github.io/"] [text "Marcus Monteiro"]
                ]
            ]
        , div [class "row"]
            [ div [class "input-field col s3"]
                [ textarea [class "materialize-textarea", placeholder "", onInput Change] []
                ]
            , div [class "col s9"]
                [ toHtml [class "flow-text"] model.content
                ]
            ]
        , div [class "row"]
            [footer []
                [ text "Project from "
                , a [href "https://www.freecodecamp.com/challenges/build-a-markdown-previewer"] [text "FreeCodeCamp"]
                ]
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
