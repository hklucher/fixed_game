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

  def generate_board(:vertical_victory, marker) do
    generate_board(%{0 => marker, 3 => marker, 6 => marker}, 0, marker)   
  end

  def generate_board(:left_diagonal_victory, marker) do
    board = %{0 => marker, 4 => marker, 8 => marker}
    generate_board(board, 1, marker)
  end

  def generate_board(:right_diagonal_victory, marker) do
    board = %{2 => marker, 4 => marker, 6 => marker}
    generate_board(board, 0, marker)
  end

  def generate_board(board, count, _) when count >= 9, do: board

  def generate_board(board, count, "X") do 
    new_board = board

    unless Map.has_key?(new_board, count) do
      new_board = Map.put(board, count, "X")
    end

    generate_board(new_board, count + 1, "O")
  end

  def generate_board(board, count, "O") do
    new_board = board

    unless Map.has_key?(new_board, count) do
      new_board = Map.put(board, count, "O")
    end

    generate_board(new_board, count + 1, "X")
  end
end
