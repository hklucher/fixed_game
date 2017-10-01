defmodule TicTacToe.BoardGenerator do
  @moduledoc """
  Generates boards for use in tests.
  """

  def generate_board() do
    generate_board(%{}, 0, "X")
  end

  def generate_board(:horizontal_victory, marker) do
    board = %{0 => marker, 1 => marker, 2 => marker}
    generate_board(board, 3, marker)
  end

  def generate_board(board, count, _) when count >= 9, do: board

  def generate_board(board, count, "X") do 
    generate_board(Map.put(board, count, "X"), count + 1, "O")
  end

  def generate_board(board, count, "O") do
    generate_board(Map.put(board, count, "O"), count + 1, "X")
  end
end
