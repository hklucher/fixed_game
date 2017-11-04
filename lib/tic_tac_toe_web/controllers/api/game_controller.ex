defmodule TicTacToeWeb.Api.GameController do
  use TicTacToeWeb, :controller

  action_fallback TicTacToeWeb.FallbackController

  def show(conn, %{"id" => id}) do
    game = TicTacToe.Playable.get_game!(id)
    render(conn, "game.json", %{game: game})
  end
end
