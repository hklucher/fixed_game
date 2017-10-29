defmodule TicTacToe.Repo.Migrations.CreateUserGames do
  use Ecto.Migration

  def change do
    create table(:user_games) do
      add :user_id, :integer
      add :game_id, :integer

      timestamps()
    end
  end
end
