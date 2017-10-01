defmodule TicTacToeWeb.PageController do
  use TicTacToeWeb, :controller
  def auth_error(conn, {type, reason}, _opts) do
    body = Poison.encode!(%{message: to_string(type)})
    send_resp(conn, 401, body)
  end


  def index(conn, _params) do
    render conn, "index.html"
  end
end
