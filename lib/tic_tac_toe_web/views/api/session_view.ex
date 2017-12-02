defmodule TicTacToeWeb.Api.SessionView do
  use TicTacToeWeb, :view

  def render("user.json", %{user: user, token: jwt_token}) do
    %{id: user.id, username: user.username, token: jwt_token}
  end

  def render("error.json", %{errors: errors}) do
    %{errors: errors}
  end
end
