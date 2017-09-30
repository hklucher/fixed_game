defmodule TicTacToe.Token do
  use TicTacToeWeb, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:info, "You need to be logged in to do that.")
    |> redirect(to: session_path(conn, :new))
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "You need to be signed in to do that.")
    |> redirect(to: session_path(conn, :new))
  end
end
