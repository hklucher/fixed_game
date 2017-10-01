defmodule Api.TicTacToeWeb.GameControllerTest do
  use TicTacToeWeb.ConnCase

  alias TicTacToe.Playable
  alias TicTacToe.Playable.Game

  @create_attrs %{board: %{}}
  @update_attrs %{board: %{}}
  @invalid_attrs %{board: nil}

  def fixture(:game) do
    {:ok, game} = Playable.create_game(@create_attrs)
    game
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
end
