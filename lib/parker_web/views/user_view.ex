defmodule ParkerWeb.UserView do
  use ParkerWeb, :view
  alias ParkerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("login.json", %{user: user}) do
    %{data: %{
         user: %{
           id: user.id,
           username: user.username
         }
      }
    }
  end

  def render("invalid_login.json", %{message: message}) do
    %{errors: %{message: message}}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username
    }
  end
end
