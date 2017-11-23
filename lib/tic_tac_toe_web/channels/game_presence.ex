defmodule TicTacToe.GamePresence do
  use Phoenix.Presence, otp_app: :my_app,
                      pubsub_server: TicTacToe.PubSub
end
