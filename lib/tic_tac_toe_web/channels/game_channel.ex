require IEx

defmodule TicTacToeWeb.GameChannel do
  use Phoenix.Channel

  def join("game", _payload, socket) do
    {:ok, assign(socket, :marker, "X")}
  end

  def handle_in("move", updated_board, socket) do
    broadcast!(socket, "move", updated_board)
    {:noreply, socket}
  end

  def handle_in("get_marker", _params, socket) do
    broadcast(socket, "get_marker", %{marker: "X"})
    {:noreply, socket}
  end
end
