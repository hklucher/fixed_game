defmodule TicTacToe.Playable.Board do
  @moduledoc """
  Will take in the jsonb board field from the Game resource and determine
  the game state.
  """

  @doc """
  Converts board to a 2-D list by 3 to serve as rows, will then check if
  any of these rows all have the same value. If that is the case, the function
  will return true. Otherwise, will return false.
  """
  def horizontally_won?(board) do
    board
    |> Map.values
    |> Enum.chunk(3)
    |> Enum.any? fn(row) -> length(row |> Enum.uniq) == 1 end
  end
end
