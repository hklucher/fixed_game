defmodule TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  import Bodyguard

  alias TicTacToe.Playable.Game
  alias TicTacToe.{UserGames, Repo}

  @doc """
  GET /games/:id
  Will find the Game given by the :id param. If not found, will return a 404 status.
  """
  def show(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    game = Repo.get(Game, id)

    case Bodyguard.permit(Game, :view_game, user, game) do
      :ok ->
        conn |> assign(:game_id, game.id) |> render("show.html")
      {:error, reason} ->
        conn |>  put_flash(:info, reason) |> redirect(to: game_path(conn, :new))
      _ ->
        conn |> redirect(to: game_path(conn, :new))
    end
  end

  @doc """
  GET /games/new
  Will render the "game/new" template.
  """
  def new(conn, _params) do
    render(conn, "new.html", changeset: Game.changeset(%Game{}))
  end

  @doc """
  POST /games 
  Takes no params, when hit will create a new row in the games table with a blank board.
  Will also create a user_games row with the created game id and the current users id.
  """
  def create(conn, _params) do
    changeset = Game.changeset(%Game{board: %{}})
    user = Guardian.Plug.current_resource(conn)


    case Repo.insert(changeset) do
      {:ok, changeset} ->
        association_changeset = UserGames.changeset(%UserGames{}, %{game_id: changeset.id, user_id: user.id})
        Repo.insert(association_changeset)
        conn |> redirect(to: game_path(conn, :show, changeset.id))
      _ ->
        render(conn, "new.html")
    end
  end
end
