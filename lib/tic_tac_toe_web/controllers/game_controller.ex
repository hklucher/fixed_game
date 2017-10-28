defmodule TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  alias TicTacToe.Playable.Game
  alias TicTacToe.Repo

  def show(conn, %{"id" => id}) do
    render(conn, "show.html")
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Game.changeset(%Game{}))
  end

  def create(conn, _params) do
    changeset = Game.changeset(%Game{board: %{}})

    case Repo.insert(changeset) do
      {:ok, changeset} ->
        conn |> redirect(to: game_path(conn, :show, changeset.id))
      _ ->
        render(conn, "new.html")
    end
  end
end
