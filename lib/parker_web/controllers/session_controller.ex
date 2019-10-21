defmodule ParkerWeb.SessionController do
  use ParkerWeb, :controller

  alias Parker.Accounts
  alias Parker.Accounts.User

  action_fallback ParkerWeb.FallbackController


  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    Accounts.get_by_username(username)
    |> Accounts.Auth.pubAuth(password)
    |> put_login_response(conn)
  end

  defp put_login_response(authenticated, conn) do
    case authenticated do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> put_view(ParkerWeb.UserView)
        |> render("login.json", user: user)

      {:error, message} ->
        conn
        |> put_status(:error)
        |> put_view(ParkerWeb.UserView)
        |> render("invalid_login.json")
    end
  end
end
