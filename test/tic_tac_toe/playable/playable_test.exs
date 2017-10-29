defmodule TicTacToe.PlayableTest do
  use TicTacToe.DataCase

  alias TicTacToe.Playable
  alias TicTacToe.UserGames

  describe "games" do
    alias TicTacToe.Playable.Game

    @valid_attrs %{board: %{}}
    @update_attrs %{board: %{}}
    @invalid_attrs %{board: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Playable.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Playable.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Playable.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Playable.create_game(@valid_attrs)
      assert game.board == %{}
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Playable.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, game} = Playable.update_game(game, @update_attrs)
      assert %Game{} = game
      assert game.board == %{}
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Playable.update_game(game, @invalid_attrs)
      assert game == Playable.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Playable.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Playable.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Playable.change_game(game)
    end

    test "user_games_by_user_and_game/2 should return user_games matching the user and game" do
      game = insert(:game)
      user = insert(:user)
      {:ok, user_game} = Repo.insert(UserGames.changeset(%UserGames{}, %{user_id: user.id, game_id: game.id}))
      results = Playable.user_games_by_user_and_game(user, game)

      assert Enum.member?(results, user_game)
    end
  end
end
