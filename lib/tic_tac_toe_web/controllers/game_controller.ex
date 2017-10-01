defmodule TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  def new(conn, _params) do
    conn |> render "new.html"
  end
end
