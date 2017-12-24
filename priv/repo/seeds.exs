# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TicTacToe.Repo.insert!(%TicTacToe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

IO.puts("Inserting dummy games...")

user_changeset = TicTacToe.Player.User.changeset(%TicTacToe.Player.User{}, %{username: "test_user"})

{:ok, user} = TicTacToe.Repo.insert(user_changeset)

for i <- 1..100 do
  {:ok, game} = TicTacToe.Repo.insert(TicTacToe.Playable.Game.create_changeset(%TicTacToe.Playable.Game{}))

  user_game_changeset = TicTacToe.UserGames.changeset(%TicTacToe.UserGames{}, %{user_id: user.id, game_id: game.id})

  {:ok, _} = TicTacToe.Repo.insert(user_game_changeset)
end

IO.puts("Completed inserting games.")
