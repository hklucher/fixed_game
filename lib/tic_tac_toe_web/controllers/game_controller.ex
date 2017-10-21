defmodule TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  alias TicTacToe.Player.User

  def new(conn, _params) do
    case Guardian.Plug.current_resource(conn) do
      %User{} ->
        conn 
        |> assign(:user_id, Guardian.Plug.current_resource(conn).id)
        |> render("new.html")
      _ ->
        conn |> redirect(to: session_path(conn, :new))
    end
  end
end
