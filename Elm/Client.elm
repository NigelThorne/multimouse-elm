module Elm.Client where

import Mouse
import Signal
import Html exposing (text)
import Random


main = Signal.map text receiveState

type alias StateObject =
    { id: String
    , x: Int
    , y: Int
    }

pack: Int -> Int -> Int -> StateObject
pack id x y =
    { id= toString id 
    , x= x
    , y= y
    }

countClick : Signal Int
countClick =
  Signal.foldp (\clk count -> count + 1) 0 Mouse.clicks


port receiveState : Signal String

port sendInput : Signal StateObject
port sendInput = Signal.map3 pack countClick Mouse.x Mouse.y
