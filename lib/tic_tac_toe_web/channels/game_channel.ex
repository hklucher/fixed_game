defmodule TicTacToeWeb.GameChannel do
  use Phoenix.Channel
  alias TicTacToe.Presence
  alias TicTacToe.Playable.Board

  def join("games:" <> game_id, payload, socket) do
    game = TicTacToe.Playable.get_game!(game_id)
    {:ok, %{board: game.board}, assign(socket, :game, game)}
  end

  def handle_in("move", %{"board" => board, "game_id" => game_id}, socket) do
    broadcast!(socket, "move", %{board: board, victory: Board.won?(board)})
    game = TicTacToe.Playable.get_game!(game_id)
    # Check for a victory here after update.
    {:ok, _} = TicTacToe.Playable.update_game(game, %{board: board})

    # Typical response could look like:
    # {victory: "horizontal", board: {...}}

    {:noreply, socket}
  end

  def handle_in("get_marker", _params, socket) do
    user_ids = socket |> Presence.list |> Map.keys
    marker = if length(user_ids) == 1, do: "X", else: "O"
    broadcast(socket, "get_marker", %{marker: marker})
    {:noreply, socket}
  end

  # def handle_info(:after_join, socket) do
  #   push socket, "presence_state", Presence.list(socket)
  #   {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
  #     online_at: inspect(System.system_time(:seconds))
  #   })
  #   {:noreply, socket}
  # end
end
