defmodule TicTacToe.Player.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicTacToe.Player.User


  schema "users" do
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
