defmodule TicTacToeWeb.SessionController do
  use TicTacToeWeb, :controller

  alias TicTacToe.Repo

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => password}}) do
    case TicTacToeWeb.Auth.login_by_username_and_pass(conn, user, password, repo: Repo) do
      {:ok, conn} ->
        logged_in_user = Guardian.Plug.current_resource(conn)
        conn |> put_flash(:info, "Logged In") |> redirect(to: "/")
      {:error, _reason, conn} -> 
        conn |> put_flash(:error, "Wrong username/password") |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn |> Guardian.Plug.sign_out |> redirect(to: "/")
  end
end
