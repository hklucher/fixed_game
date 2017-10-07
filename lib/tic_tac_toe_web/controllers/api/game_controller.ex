defmodule Api.TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  alias TicTacToe.Playable
  alias TicTacToe.Playable.Game

  action_fallback TicTacToeWeb.FallbackController
end
