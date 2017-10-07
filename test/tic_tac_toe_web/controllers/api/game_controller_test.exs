defmodule Api.TicTacToeWeb.GameControllerTest do
  use TicTacToeWeb.ConnCase

  alias TicTacToe.Playable

  @create_attrs %{board: %{}}

  def fixture(:game) do
    {:ok, game} = Playable.create_game(@create_attrs)
    game
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
end
