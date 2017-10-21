defmodule TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  def new(conn, _params) do
    conn 
    |> assign(:user_id, Guardian.Plug.current_resource(conn).id)
    |> render("new.html")
  end
end
