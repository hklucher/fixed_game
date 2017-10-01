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
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: TicTacToe.Token
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TicTacToeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", GameController, :new
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/users", UserController, only: [:new, :create]
    resources "/games", GameController, only: [:new]
  end

  # Other scopes may use custom stacks.
   scope "/api", TicTacToeWeb do
     pipe_through :api
     resources "/games", Api.GameController, only: [:new]
   end
end
