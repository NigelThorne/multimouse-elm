module Elm.Client where

import Mouse
import Signal
import Html exposing (text)

main = Signal.map text receiveState

type alias StateObject =
    { id: String
    , x: Int
    , y: Int
    }

pack: Int -> Int -> StateObject
pack x y =
    { id= "client"
    , x= x
    , y= y
    }

port receiveState : Signal String

port sendInput : Signal StateObject
port sendInput = Signal.map2 pack Mouse.x Mouse.y
