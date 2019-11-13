defmodule ParkerWeb.Router do
  use ParkerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ParkerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ParkerWeb do
    pipe_through :api

#    resources "/users", UserController, only: [:create, :new]
    post "/users/", UserController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    delete "/logout", SessionController, :logout
  end
end
