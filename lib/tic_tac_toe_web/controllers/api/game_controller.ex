defmodule Api.TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  action_fallback TicTacToeWeb.FallbackController
end
