defmodule TitleIxWaivers.WaiverController do
  use TitleIxWaivers.Web, :controller

  alias TitleIxWaivers.Waiver

  def index(conn, _params) do
    waivers = Repo.all(Waiver)
    render(conn, "index.html", waivers: waivers)
  end

  def show(conn, %{"id" => id}) do
    waiver = Repo.get!(Waiver, id)
    render(conn, "show.html", waiver: waiver)
  end
end
