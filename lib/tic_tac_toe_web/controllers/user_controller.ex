defmodule TicTacToeWeb.UserController do
  use TicTacToeWeb, :controller
  alias TicTacToe.Player.User
  alias TicTacToe.Repo

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    changeset = User.changeset(%User{}, %{username: username, passsword: password})  
    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn |> redirect(to: "/")
      {:error, _changeset} ->
        render conn, "new.html"
      _ ->
        render conn, "new.html"
    end
  end
end
