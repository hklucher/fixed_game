defmodule TicTacToe.Playable.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicTacToe.Playable.Game


  schema "games" do
    field :board, :map

    timestamps()
  end

  @doc false
  def changeset(%Game{} = game, attrs) do
    game
    |> cast(attrs, [:board])
    |> validate_required([:board])
  end
end
