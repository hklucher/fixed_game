defmodule TicTacToeWeb.SessionControllerTest do
  use TicTacToeWeb.ConnCase

  def valid_session_params(user) do
    %{"session" => %{"username" => user.username, "password" => user.password}}
  end

  def invalid_session_params do
    %{"session" => %{"username" => "not_a_user", "password" => "this_isnt_a_password_hash"}}
  end

  describe "logging in with correct params" do
    test "should populate a flash message", %{conn: conn} do
      user = insert(:user)
      conn = post(conn, session_path(conn, :create), valid_session_params(user))
      flash = get_flash(conn)
      assert flash["info"] == "Logged In"
    end

    test "should redirect the user", %{conn: conn} do
      user = insert(:user)
      conn = post(conn, session_path(conn, :create), valid_session_params(user))
      assert redirected_to(conn, 302) =~ "/"
    end

    test "should set the user as the current resource", %{conn: conn} do
      user = insert(:user)
      conn = post(conn, session_path(conn, :create), valid_session_params(user))
      assert Guardian.Plug.current_resource(conn) == user
    end
  end

  describe "logging in with incorrect params" do
    test "populates an error flash message", %{conn: conn} do
      conn = post(conn, session_path(conn, :create), invalid_session_params())
      flash = get_flash(conn)
      assert flash["error"]  == "Wrong username/password"
    end
  end

  describe "logging out" do
    test "should populate a flash message", %{conn: conn} do
      conn = delete(conn, session_path(conn, :delete))
      flash = get_flash(conn)
      assert flash["info"] == "Successfully logged out."
    end

    test "should redirect to root path", %{conn: conn} do
      conn = delete(conn, session_path(conn, :delete))
      assert redirected_to(conn, 302) =~ "/"
    end

    test "should log the user out", %{conn: conn} do
      conn = delete(conn, session_path(conn, :delete))
      assert Guardian.Plug.current_resource(conn) == nil
    end
  end
end
