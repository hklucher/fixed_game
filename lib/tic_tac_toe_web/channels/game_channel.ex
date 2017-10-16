require IEx

defmodule TicTacToeWeb.GameChannel do
  use Phoenix.Channel
  alias TicTacToe.Presence

  def join("game", _payload, socket) do
    #send(self(), :after_join)
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

  def handle_info(:after_join, socket) do
    {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:seconds))
    })
    push socket, "presence_state", Presence.list(socket)
    {:noreply, socket}
  end
end
