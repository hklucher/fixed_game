defmodule TicTacToeWeb.GameControllerTest do
  use TicTacToeWeb.ConnCase

  describe "new game" do
    test "renders the template", %{conn: conn} do
      conn = get conn, game_path(conn, :new)
      assert html_response(conn, 200) =~ "New Game"
    end
  end
end
