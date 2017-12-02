defmodule TicTacToeWeb.Api.SessionController do
  use TicTacToeWeb, :controller

  alias TicTacToe.Player
  alias TicTacToe.Repo

  def create(conn, %{"username" => username, "password" => password}) do
    user = TicTacToe.Player.get_user_by_username!(username)

    case Comeonin.Bcrypt.check_pass(user, password) do
      {:ok, authenticated_user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(authenticated_user, :api) 
        render(conn, "user.json", %{user: user, token: jwt})
      {:error, reason} ->
        render(conn, "error.json", %{errors: [reason]})
    end
  end
end
