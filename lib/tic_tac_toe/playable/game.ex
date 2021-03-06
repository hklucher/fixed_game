defmodule TicTacToe.Playable.Game do
  use Ecto.Schema

  import Ecto.Changeset

  alias TicTacToe.Playable.Game
  alias TicTacToe.Player.User

  @behaviour Bodyguard.Policy
  @timestamps_opts [
    type: Timex.Ecto.DateTime,
    autogenerate: {Timex.Ecto.DateTime, :autogenerate, []}
  ]
  @default_board %{
    "0" => "",
    "1" => "",
    "2" => "",
    "3" => "",
    "4" => "",
    "5" => "",
    "6" => "",
    "7" => "",
    "8" => ""
  }

  schema "games" do
    field :board, :map

    many_to_many :users, User, join_through: TicTacToe.UserGames

    timestamps()
  end

  @doc """
  Function used to determine permission to access a specific game.
  When a user_game row is found that belongs to both user & game,
  will return :ok. Otherwise, will return a tuple with :error and the reason.
  """
  def authorize(:view_game, user, game) do
    user_games = TicTacToe.Playable.user_games_by_user_and_game(user, game)

    if Enum.empty?(user_games) do
      {:error, "You don't have permission to view this"}
    else
      :ok
    end
  end

  @doc false
  def changeset(%Game{} = game, attrs \\ %{}) do
    game
    |> cast(attrs, [:board])
    |> validate_required([:board])
  end

  @doc """
  Changest used to create a Game for the first time. Initializes the board
  to an empty board.
  """
  def create_changeset(%Game{} = game, attrs \\ %{board: @default_board}) do
    game
    |> cast(attrs, [:board])
    |> validate_required([:board])
  end
end
