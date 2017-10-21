// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

import React from "react"
import { render } from "react-dom"
import Board from "./Components/Board.js"
import Alert from "./Utilities/Alert.js"

// TODO: Move this to new game view
if (document.getElementById("new-game")) {
  render(
    <Board/>,
    document.getElementById("new-game")
  )
}

if (document.getElementById("alert-danger-mount")) {
  const element = document.getElementById("alert-danger-mount")
  const text = element.getAttribute('data-content')

  render (
    <Alert content={text} type="danger" />,
    document.getElementById(element.id)
  )
}

if (document.getElementById("alert-danger-mount")) {
  const element = document.getElementById("alert-info-mount")
  const text = element.getAttribute('data-content')

  render (
    <Alert content={text} type="info" />,
    document.getElementById(element.id)
  )
}
