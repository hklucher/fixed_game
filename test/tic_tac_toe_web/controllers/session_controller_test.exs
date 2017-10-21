defmodule TicTacToeWeb.SessionControllerTest do
  use TicTacToeWeb.ConnCase

  def session_params(attrs \\ %{}) do
    %{"session" => %{"username" => "username", "password" => "password"}}
  end

  describe "logging in with correct params" do
    test "populates a flash message", %{conn: conn} do
      conn = post(conn, session_path(conn, :create), session_params())
      flash = get_flash(conn)
      assert flash["info"] == "Logged In"
    end
  end

  describe "logging out" do
    test "populates a flash message", %{conn: conn} do
      conn = delete(conn, session_path(conn, :delete))
      flash = get_flash(conn)
      assert flash["info"] == "Successfully logged out."
    end

    test "redirects to root path", %{conn: conn} do
      conn = delete(conn, session_path(conn, :delete))
      assert redirected_to(conn, 302) =~ "/"
    end

    test "logs user out", %{conn: conn} do
      IO.inspect Guardian.Plug.current_resource(conn)
    end
  end
end
