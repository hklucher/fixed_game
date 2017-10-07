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

  describe "vertically_won?/1" do
    test "returns a boolean" do
      board = generate_board()
      result = Board.vertically_won?(board)
      assert Enum.member?([true, false], result)
    end

    test "returns false when not vertically won" do
      board = generate_board()
      refute Board.vertically_won?(board)
    end

    test "returns true when board has been vertically won by X" do
      board = generate_board(:vertical_victory, "X")
      assert Board.vertically_won?(board)
    end
  end

  describe "diagonally_won?/1" do
    test "returns a boolean" do
      board = generate_board()
      result = Board.diagonally_won?(board)
      assert Enum.member?([true, false], result)
    end

    test "given a board won diagonally (top left to bottom right), it returns true" do
      board = generate_board(:left_diagonal_victory, "X")
      assert Board.diagonally_won?(board)
    end

    test "given a board won diagonally (top right to bottom left), it returns true" do
      board = generate_board(:right_diagonal_victory, "O")
      assert Board.diagonally_won?(board)
    end
  end
end
