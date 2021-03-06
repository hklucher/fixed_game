defmodule TicTacToeWeb.UserControllerTest do
  use TicTacToeWeb.ConnCase

  alias TicTacToe.Player.User
  alias TicTacToe.Repo

  import Ecto.Query

  @create_attrs %{username: "username", password: "password"}
  @invalid_attrs %{username: "", password: ""}

  def fixture(:user) do
    {:ok, user} = Player.create_user(@create_attrs)
    user
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_path(conn, :new)
      assert html_response(conn, 200) =~ "Sign Up"
    end
  end

  describe "create user" do
    test "re renders the form when given invalid params", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert html_response(conn, 200) =~ "Sign Up"
    end

    test "redirects home when successful", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs
      assert redirected_to(conn) =~ "/"
    end

    test "should set the users password_hash", %{conn: conn} do
      post conn, user_path(conn, :create), user: @create_attrs
      user = Repo.one(from x in User, order_by: [desc: x.id], limit: 1)
      assert user.password != nil
    end
  end
end
