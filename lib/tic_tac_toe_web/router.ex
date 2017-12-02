defmodule TicTacToeWeb.Router do
  use TicTacToeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser_auth do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: TicTacToe.Token
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", TicTacToeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", GameController, :new
    resources "/sessions", SessionController, only: [:new, :create]

    # Don't autogenerate this route from Phoenix because it will assume we need an :id param.
    delete "/sessions", SessionController, :delete

    resources "/users", UserController, only: [:new, :create]
  end

  scope "/", TicTacToeWeb do
    pipe_through :browser_auth
    resources "/games", GameController, only: [:index, :new, :create, :show]
  end

  # Other scopes may use custom stacks.
   scope "/api", TicTacToeWeb, as: :api do
     pipe_through :api

     resources "/sessions", Api.SessionController, only: [:create]
     resources "/games", Api.GameController, only: [:index, :show, :update]
     resources "/user_games", Api.UserGamesController, only: [:create]
   end
end
