defmodule TicTacToe.Repo.Migrations.AddPasswordToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :password, :string, virtual: true
    end
  end
end
