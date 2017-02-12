defmodule TitleIxWaivers.WaiverController do
  use TitleIxWaivers.Web, :controller

  alias TitleIxWaivers.Waiver

  def index(conn, _params) do
    query = from(w in Waiver, order_by: [w.state, w.name, w.date_requested, w.date_granted])
    waivers = Repo.all(query)
    render(conn, "index.html", waivers: waivers)
  end

  def show(conn, %{"id" => id}) do
    waiver = Repo.get!(Waiver, id)
    render(conn, "show.html", waiver: waiver)
  end
end
