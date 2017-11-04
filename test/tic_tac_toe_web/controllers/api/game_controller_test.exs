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

  describe "GET show" do
    test "should respond with a 200 status", %{conn: conn} do
      game = insert(:game)
      conn = get(conn, api_game_path(conn, :show, game.id))
      assert conn.status == 200
    end

    test "should include the id returned from the game", %{conn: conn} do
      game = insert(:game)
      conn = get(conn, api_game_path(conn, :show, game.id))
      assert json_response(conn, 200) == %{"id" => game.id}
    end

    test "should include the board in the response", %{conn: conn} do
      game = insert(:game)
      conn = get(conn, api_game_path(conn, :show, game.id))
      response = json_response(conn, 200)
      assert Map.has_key?(response, "board")
    end
  end
end
