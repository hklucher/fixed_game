defmodule TicTacToeWeb.Api.UserGamesControllerTest do
  use TicTacToeWeb.ConnCase

  describe "POST create" do
    test "should respond with a 201 status", %{conn: conn} do
      game = insert(:game)
      user = insert(:user)
      conn = post(conn, api_user_games_path(conn, :create), %{"game_id" => game.id, "user_id" => user.id})
      assert conn.status == 200
    end
  end
end
