defmodule TicTacToeWeb.GameView do
  use TicTacToeWeb, :view
  alias TicTacToeWeb.GameView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id,
      board: game.board}
  end
end
