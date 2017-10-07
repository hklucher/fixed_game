defmodule TicTacToe.Playable.Board do
  @moduledoc """
  Provides functions for checking game state (e.g. victory, progress, loss, etc.)
  Functions take in a map representing a board, should be taken from the game tables board field.
  """

  @doc """
  Converts board to a 2-D list by 3 to serve as rows, will then check if
  any of these rows all have the same value. If that is the case, the function
  will return true. Otherwise, will return false.
  """
  def horizontally_won?(board) do
    board |> to_rows |> Enum.any?(fn(row) -> length(row |> Enum.uniq) == 1 end)
  end

  @doc """
  Converts board to a 2-D list of 3 to serve as rows. Will check
  each item at each index by index (0, 3) to see if any are all equal.
  If they are, return true. Otherwise, return false.
  """
  def vertically_won?(board) do
    vertically_won?(to_rows(board), 0)
  end

  defp vertically_won?(_rows, 3), do: false

  defp vertically_won?(rows, index) do
    vertical_pattern = Enum.map(rows, fn(row) -> Enum.at(row, index) end)

    if length(Enum.uniq(vertical_pattern)) == 1 do
      true
    else
      vertically_won?(rows, index + 1)
    end
  end

  def diagonally_won?(board) do
    diagonally_won?(board, [0, 4, 8]) || diagonally_won?(board, [2, 4, 6])
  end

  defp diagonally_won?(board, spots) do
    diagonal_values = board |> Map.take(spots) |> Map.values()
    length(Enum.uniq(diagonal_values)) == 1
  end

  defp to_rows(board), do: board |> Map.values |> Enum.chunk(3)
end
