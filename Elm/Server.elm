module Elm.Server where

import Signal
import List
import Dict

-- Boilerplate
import Html exposing (text)
main = text "main"

type alias ClientState =
    { id: String
    , x: Int
    , y: Int
    }

type alias Model =
    { clients : Dict.Dict String ClientState }

defaultModel = {clients = Dict.empty}

update: ClientState -> Model -> Model
update client  model =
    {model | clients <- Dict.insert client.id client model.clients } 

port receiveInput : Signal ClientState

serverState: Signal Model
serverState = Signal.foldp update defaultModel receiveInput

port sendState : Signal String
port sendState = Signal.map toString serverState
