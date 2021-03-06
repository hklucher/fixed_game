defmodule TicTacToe.Playable.Board do
  @moduledoc """
  Provides functions for checking game state (e.g. victory, progress, loss, etc.)
  Functions take in a map representing a board, should be taken from the game tables board field.
  """

  @spec won?(map) :: boolean
  def won?(board) do
    # horizontally_won?(board) || vertically_won?(board) || diagonally_won?(board)
    horizontally_won?(board) || vertically_won?(board) || diagonally_won?(board)
  end

  @doc """
  Converts board to a 2-D list by 3 to serve as rows, will then check if
  any of these rows all have the same value. If that is the case, the function
  will return true. Otherwise, will return false.
  """
  @spec horizontally_won?(map) :: boolean
  def horizontally_won?(board) do
    board
    |> to_rows
    |> Enum.any?(fn(row) ->
      values_are_all_indentical?(row)
    end)
  end

  @doc """
  Converts board to a 2-D list of 3 to serve as rows. Will check
  each item at each index by index (0, 3) to see if any are all equal.
  If they are, return true. Otherwise, return false.
  """
  @spec vertically_won?(map) :: boolean
  def vertically_won?(board) do
    vertically_won?(to_rows(board), 0)
  end

  defp vertically_won?(_rows, 3), do: false

  defp vertically_won?(rows, index) do
    vertical_pattern = Enum.map(rows, fn(row) -> Enum.at(row, index) end)

    if values_are_all_indentical?(vertical_pattern) do
      true
    else
      vertically_won?(rows, index + 1)
    end
  end

  @doc """
  Assumes a 3x3 board, and will check if the values at any possible
  diagonal spots are all the same. If so, return true, otherwise, false.
  """
  @spec diagonally_won?(map) :: boolean
  def diagonally_won?(board) do
    diagonally_won?(board, ["0", "4", "8"]) || diagonally_won?(board, ["2", "4", "6"])
  end

  defp diagonally_won?(board, spots) do
    diagonal_values = board |> Map.take(spots) |> Map.values()
    values_are_all_indentical?(diagonal_values)
  end

  defp to_rows(board), do: board |> Map.values |> Enum.chunk(3)

  defp values_are_all_indentical?(row) do
    non_empty_spots = row |> Enum.filter(fn(piece) -> piece != "" end)
    length(non_empty_spots) == 3 && length(Enum.uniq(non_empty_spots)) == 1
  end
end
