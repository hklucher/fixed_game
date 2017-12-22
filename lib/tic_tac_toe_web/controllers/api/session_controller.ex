defmodule TicTacToeWeb.Api.SessionController do
  @moduledoc false

  use TicTacToeWeb, :controller

  @doc """
  POST /api/sessions

  Takes username and password as params. Finds and authenticates
  the user against username and password. Responds with JSON
  of the user and a JSON web token.
  """
  def create(conn, %{"username" => username, "password" => password}) do
    user = TicTacToe.Player.get_user_by_username(username)

    case Comeonin.Bcrypt.check_pass(user, password) do
      {:ok, authenticated_user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(authenticated_user, :api) 
        render(conn, "user.json", %{user: user, token: jwt})
      {:error, reason} ->
        conn
        |> put_status(400)
        |> render("error.json", %{errors: [reason]})
    end
  end
end
