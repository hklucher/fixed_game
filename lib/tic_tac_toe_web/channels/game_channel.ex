defmodule TicTacToeWeb.GameChannel do
  use Phoenix.Channel
  alias TicTacToe.GamePresence
  alias TicTacToe.Playable.Board

  def join("games:" <> game_id, payload, socket) do
    game = TicTacToe.Playable.get_game!(game_id)
    send(self, {:after_join, payload["user_id"]})
    IO.inspect "Down there?"
    IO.inspect GamePresence.list("games:" <> game_id)
    {:ok, %{board: game.board}, assign(socket, :user_id, payload["user_id"])}
  end

  def handle_in("move", %{"board" => board, "game_id" => game_id}, socket) do
    broadcast!(socket, "move", %{board: board, victory: Board.won?(board)})
    game = TicTacToe.Playable.get_game!(game_id)
    {:ok, _} = TicTacToe.Playable.update_game(game, %{board: board})

    {:noreply, socket}
  end

  def handle_info({:after_join, user_id}, socket) do
    push socket, "presence_state", GamePresence.list(socket)
    {:ok, _} = GamePresence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:seconds))
    })

    user_count = length(socket |> GamePresence.list |> Map.keys)
    marker = if user_count == 2, do: "O", else: "X"

    broadcast(socket, "get_marker", %{marker: marker})

    {:noreply, socket}
  end
end
