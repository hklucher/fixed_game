defmodule TicTacToeWeb.SessionController do
  use TicTacToeWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
