defmodule TicTacToe.Factory do
  use ExMachina.Ecto, repo: TicTacToe.Repo
  
  def user_factory do
    %TicTacToe.Player.User{
      username: "Johnny Ramone",
      password: "password",
      password_hash: Comeonin.Bcrypt.hashpwsalt("password"),
      games: [build(:game)]
    }
  end

  def game_factory do
    %TicTacToe.Playable.Game{board: %{}}
  end
end
