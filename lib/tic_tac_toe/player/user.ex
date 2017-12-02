defmodule TicTacToe.Player.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicTacToe.Player.User
  alias TicTacToe.Playable.Game


  schema "users" do
    field :username, :string
    field :password_hash, :string
    field :password, :string

    many_to_many :games, Game, join_through: TicTacToe.UserGames

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password_hash])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end

  @doc """
    Used when creating a new user, will use bcrypt to hash password.
    Once password is hashed, casts password field to nil.
  """
  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
    |> cast(%{"password" => nil}, ~w(password), [])
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
