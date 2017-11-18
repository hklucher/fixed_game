defmodule TicTacToeWeb.Api.UserGamesView do
  use TicTacToeWeb, :view

  def render("show.json", %{user_game: user_game}) do
    %{id: user_game.id, game_id: user_game.game_id, user_id: user_game.user_id}
  end

  def render("error.json", %{error: error}) do
    %{error: error}
  end
end
