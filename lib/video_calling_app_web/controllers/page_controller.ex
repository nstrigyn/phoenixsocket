defmodule VideoCallingAppWeb.PageController do
  use VideoCallingAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
