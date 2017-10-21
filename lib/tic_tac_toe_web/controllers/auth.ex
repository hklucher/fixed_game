defmodule TicTacToeWeb.Auth do
  @moduledoc """
  Authentication functions to be used in a controller.
  """

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias TicTacToe.Player.User

  @doc """
  Login a user using Guardian
  """
  def login(conn, user) do
    conn |> Guardian.Plug.sign_in(user, :access)
  end

  @doc """
  Takes a connection, username & password and attempts to login a user.
  Upon failure will return a tuple beginning with :error, on success
  it will return a tuple beginning with :ok.
  If no user is found, will return a tuple with a :not_found reason
  """
  def login_by_username_and_pass(conn, username, pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(User, username: username)

    cond do
      user && checkpw(pass, user.password_hash) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end
end
