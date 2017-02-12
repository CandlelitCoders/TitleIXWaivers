defmodule TitleIxWaivers.WaiverControllerTest do
  use TitleIxWaivers.ConnCase

  alias TitleIxWaivers.Waiver
  @valid_attrs %{date_granted: %{day: 17, month: 4, year: 2010}, date_requested: %{day: 17, month: 4, year: 2010}, name: "some content", state: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, waiver_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing waivers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, waiver_path(conn, :new)
    assert html_response(conn, 200) =~ "New waiver"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, waiver_path(conn, :create), waiver: @valid_attrs
    assert redirected_to(conn) == waiver_path(conn, :index)
    assert Repo.get_by(Waiver, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, waiver_path(conn, :create), waiver: @invalid_attrs
    assert html_response(conn, 200) =~ "New waiver"
  end

  test "shows chosen resource", %{conn: conn} do
    waiver = Repo.insert! %Waiver{}
    conn = get conn, waiver_path(conn, :show, waiver)
    assert html_response(conn, 200) =~ "Show waiver"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, waiver_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    waiver = Repo.insert! %Waiver{}
    conn = get conn, waiver_path(conn, :edit, waiver)
    assert html_response(conn, 200) =~ "Edit waiver"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    waiver = Repo.insert! %Waiver{}
    conn = put conn, waiver_path(conn, :update, waiver), waiver: @valid_attrs
    assert redirected_to(conn) == waiver_path(conn, :show, waiver)
    assert Repo.get_by(Waiver, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    waiver = Repo.insert! %Waiver{}
    conn = put conn, waiver_path(conn, :update, waiver), waiver: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit waiver"
  end

  test "deletes chosen resource", %{conn: conn} do
    waiver = Repo.insert! %Waiver{}
    conn = delete conn, waiver_path(conn, :delete, waiver)
    assert redirected_to(conn) == waiver_path(conn, :index)
    refute Repo.get(Waiver, waiver.id)
  end
end
