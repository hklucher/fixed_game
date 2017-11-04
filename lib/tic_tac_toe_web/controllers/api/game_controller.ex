defmodule TicTacToeWeb.Api.GameController do
  use TicTacToeWeb, :controller

  action_fallback TicTacToeWeb.FallbackController

  def show(conn, %{"id" => id}) do
    game = TicTacToe.Playable.get_game!(id)
    render conn, "show.json", %{game: game}
  end
end
