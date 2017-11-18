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

for i <- 1..100 do
  TicTacToe.Repo.insert!(TicTacToe.Playable.Game.changeset(%TicTacToe.Playable.Game{}, %{board: %{}}))
end

IO.puts("Completed inserting games.")
