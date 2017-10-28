defmodule TicTacToe.Playable.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicTacToe.Playable.Game
  alias TicTacToe.Player.User


  schema "games" do
    field :board, :map

    many_to_many :users, User, join_through: TicTacToe.UserGames

    timestamps()
  end

  @doc false
  def changeset(%Game{} = game, attrs \\ %{}) do
    game
    |> cast(attrs, [:board])
    |> validate_required([:board])
  end
end
