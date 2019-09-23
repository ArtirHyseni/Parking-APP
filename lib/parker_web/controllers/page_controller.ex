defmodule ParkerWeb.PageController do
  use ParkerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
