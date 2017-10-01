defmodule TicTacToeWeb.UserController do
  use TicTacToeWeb, :controller
  alias TicTacToe.Player.User
  alias TicTacToe.Repo

  def new(conn, _params), do: render conn, "new.html"

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    changeset = User.registration_changeset(%User{}, %{username: username, password: password})
    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn |> redirect(to: "/")
      _ ->
        render conn, "new.html"
    end
  end
end
