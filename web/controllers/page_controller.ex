defmodule TitleIxWaivers.PageController do
  use TitleIxWaivers.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
