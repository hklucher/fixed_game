defmodule TicTacToe.Playable.BoardTest do
  use TicTacToe.DataCase

  alias TicTacToe.Playable.Board

  import TicTacToe.BoardGenerator

  describe "horizontally_won?/1" do
    test "returns a boolean" do
      board = generate_board()
      result = Board.horizontally_won?(board)
      assert Enum.member?([true, false], result)
    end

    test "it returns true when X has won horizontally" do
      board = generate_board(:horizontal_victory, "X")
      assert Board.horizontally_won?(board)
    end

    test "it returns true when O has won horizontally" do
      board = generate_board(:horizontal_victory, "O")
      assert Board.horizontally_won?(board)
    end

    test "it returns false when no one has won horizontally" do
      board = generate_board()
      refute Board.horizontally_won?(board)
    end
  end
end
