defmodule TicTacToeWeb.Api.GameController do
  use TicTacToeWeb, :controller

  action_fallback TicTacToeWeb.FallbackController

  def index(conn, _params) do
    games = TicTacToe.Playable.active_games()
    render(conn, "index.json", games: games)
  end

  def show(conn, %{"id" => id}) do
    game = TicTacToe.Playable.get_game!(id)
    render(conn, "game.json", %{game: game})
  end
end
