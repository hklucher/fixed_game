defmodule TicTacToe.UserGames do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicTacToe.UserGames


  schema "user_games" do
    field :game_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(%UserGames{} = user_games, attrs) do
    user_games
    |> cast(attrs, [:user_id, :game_id])
    |> validate_required([:user_id, :game_id])
  end
end
