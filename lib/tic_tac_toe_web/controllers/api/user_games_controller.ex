defmodule TicTacToeWeb.Api.UserGamesController do
  use TicTacToeWeb, :controller
  alias TicTacToe.UserGames

  action_fallback TicTacToeWeb.FallbackController

  @doc """
  POST /api/user_games
  Creates a new UserGames record. Returns id, game_id, and user_id in a JSON response.
  """
  def create(conn, %{"user_id" => user_id, "game_id" => game_id}) do
    changeset = UserGames.changeset(%UserGames{}, %{game_id: game_id, user_id: user_id})

    case TicTacToe.Repo.insert(changeset) do
      {:ok, changeset} ->
        render(conn, "show.json", %{user_game: changeset})
      {:error, reason} ->
        render(conn, "error.json", %{error: reason})
    end
  end
end
