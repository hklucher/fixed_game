defmodule TicTacToeWeb.GameView do
  use TicTacToeWeb, :view
  import Scrivener.HTML
  alias TicTacToeWeb.GameView
  alias TicTacToe.Playable.Game

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

  @doc """
  Returns a formatted string as MM-DD-YYYY from a game's inserted_at.
  Returns a filler string upon failure to format date.
  """
  @spec formatted_insertion_date(Game.t) :: String.t
  def formatted_insertion_date(%Game{} = game) do
    case Timex.format(game.inserted_at, "{0M}-{0D}-{YYYY}") do
      {:ok, date_string} ->
        date_string
      {:error, _reason} ->
        "---"
    end
  end

  @doc """
  Returns a formatted time as Hour:Minute from a game's inserted_at. 
  Returns a filler string uppon failure to format date.
  """
  @spec formatted_insertion_date(Game.t) :: String.t
  def formatted_insertion_time(%Game{} = game) do
    case Timex.format(game.inserted_at, "%l:%M", :strftime) do
      {:ok, time_string} ->
        time_string
      {:error, _reason} ->
        "---"
    end
  end
end
