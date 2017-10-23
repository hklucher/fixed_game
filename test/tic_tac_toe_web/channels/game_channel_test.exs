defmodule TicTacToeWeb.GameChannelTest do
  use TicTacToeWeb.ChannelCase
  alias TicTacToeWeb.GameChannel

  describe "the game channel with no connected users" do
    test "should broadcast a list of usernames" do
      user = insert(:user)
      username = user.username
      {:ok, _, socket} = socket("", %{}) |> subscribe_and_join(GameChannel, "game")
      assert_broadcast "update_players", %{users: [username]}
    end
  end
end
