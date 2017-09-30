# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tic_tac_toe,
  ecto_repos: [TicTacToe.Repo]

# Configures the endpoint
config :tic_tac_toe, TicTacToeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KtUl+REL67sSSqGyAPHtcmy6ZXcdIpVNxrGRK8UKk6wveaBJ4kakV8bKyxCbmWNZ",
  render_errors: [view: TicTacToeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TicTacToe.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "TicTacToe",
  ttl: {30, :days},
  secret_key: System.get_env("TIC_TAC_TOE_GUARDIAN_SECRET_KEY"),
  verify_issuer: true,
  error_handler: TicTacToe.AuthErrorHandler



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
