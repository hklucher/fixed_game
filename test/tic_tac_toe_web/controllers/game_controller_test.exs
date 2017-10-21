defmodule TicTacToeWeb.GameControllerTest do
  use TicTacToeWeb.ConnCase

  # TODO: Should definitely extract login related functionality to a helper module.
  def valid_session_params(user) do
    %{"session" => %{"username" => user.username, "password" => user.password}}
  end

  describe "new game with a logged in user" do
    test "should render the template", %{conn: conn} do
      user = insert(:user)
      conn = post(conn, session_path(conn, :create), valid_session_params(user))
      conn = get conn, game_path(conn, :new)
      assert html_response(conn, 200) =~ "New Game"
    end
  end

  describe "new game with no logged in user "do
    test "should redirect to new session path", %{conn: conn} do
      conn = get(conn, game_path(conn, :new))
      assert redirected_to(conn, 302) =~ "/sessions/new"
    end
  end
end
