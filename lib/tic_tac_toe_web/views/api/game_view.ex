#TODO: Figure out what to do about this vs the regular GameView.

defmodule TicTacToeWeb.Api.GameView do
  use TicTacToeWeb, :view
  alias TicTacToeWeb.GameView

  def render("index.json", %{games: games}) do
    %{games: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{id: game.id, board: game.board}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id, board: game.board, victory: TicTacToe.Playable.Board.won?(game.board)}
  end
end
