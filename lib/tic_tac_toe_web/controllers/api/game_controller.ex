defmodule Api.TicTacToeWeb.GameController do
  use TicTacToeWeb, :controller

  action_fallback TicTacToeWeb.FallbackController
end


# BASICALLY THE PLAN IS THIS:
# On click of "New Game", create a new game.
# Associate the current user with this game
# When successful, redirect to the show page for that game
# Make a channel specific for this game
# Use Guardian authorization to make sure only players assigned to that game can access the page
