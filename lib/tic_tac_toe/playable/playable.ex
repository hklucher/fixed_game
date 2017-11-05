defmodule TicTacToe.Playable do
  @moduledoc """
  The Playable context.
  """

  import Ecto.Query, warn: false
  alias TicTacToe.Repo

  alias TicTacToe.Playable.Game
  alias TicTacToe.Player.User

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Returns a list of games with only one player, ordered by inserted_at.
  """
  def active_games(limit \\ 100) do
    query = from g in Game, preload: :users, limit: ^limit

    query
    |> Repo.all()
    |> Enum.filter(fn(game) -> length(game.users) <= 1 end)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{source: %Game{}}

  """
  def change_game(%Game{} = game) do
    Game.changeset(game, %{})
  end

  @doc """
  Returns a List of all `user_games` that belong to the given user
  and game.
  """
  def user_games_by_user_and_game(%User{} = user, %Game{} = game) do
    Repo.all(
      from ug in TicTacToe.UserGames,
      where: ug.user_id == ^user.id,
      where: ug.game_id == ^game.id
    )
  end
end
