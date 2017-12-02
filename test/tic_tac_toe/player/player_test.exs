defmodule TicTacToe.PlayerTest do
  use TicTacToe.DataCase

  alias TicTacToe.Player

  describe "users" do
    alias TicTacToe.Player.User

    @valid_attrs %{username: "some username"}
    @update_attrs %{username: "some updated username"}
    @invalid_attrs %{username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Player.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Player.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Player.get_user!(user.id) == user
    end

    test "get_user!/1 returns the user with the given username" do
      user = user_fixture()
      assert Player.get_user_by_username!(user.username) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Player.create_user(@valid_attrs)
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Player.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Player.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Player.update_user(user, @invalid_attrs)
      assert user == Player.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Player.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Player.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Player.change_user(user)
    end
  end
end
