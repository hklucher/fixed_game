use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tic_tac_toe, TicTacToeWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tic_tac_toe, TicTacToe.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tic_tac_toe_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "TicTacToe",
  ttl: {30, :days},
  secret_key: "7qWZpFAxTXO0ONCEzW/CIcUCAxZv/MxkDDIs3/8idZnx7Me+196rjKYj3GtIA8qU",
  verify_issuer: true,
  error_handler: TicTacToe.AuthErrorHandler,
  serializer: TicTacToe.GuardianSerializer

# Configure hound for integration tests
config :hound, driver: "phantomjs"


