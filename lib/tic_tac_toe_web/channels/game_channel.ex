defmodule TicTacToeWeb.GameChannel do
  use Phoenix.Channel

  def join("game", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("move", updated_board, socket) do
    broadcast!(socket, "move", updated_board)
    {:noreply, socket}
  end
end
