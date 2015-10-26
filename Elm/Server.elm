module Elm.Server where

import Signal

-- Boilerplate
import Html exposing (text)
main = text "main"

type alias StateObject =
    { id: String
    , x: Int
    , y: Int
    }

port receiveInput : Signal StateObject

port sendState : Signal String
port sendState = Signal.map toString receiveInput
